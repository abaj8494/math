#!/usr/bin/env python3
"""
Split Donald Cohn's *Measure Theory (2nd ed.)* into 21 printable parts:
1) Title page + Preface + Contents + Introduction
2-11) Chapters 1..10
12-19) Appendices A..H
20) References
21) Index of notation + Index (combined)

Usage:
    python split_cohn_measure_theory.py "/path/to/Measure Theory (2nd ed.) - Cohn, Donald L._5990.pdf" ./cohn_splits

Deps:
    pip install pypdf  # (or PyPDF2 as fallback)
"""

import os
import re
import sys
from typing import Dict, List, Tuple

def load_reader(pdf_path):
    try:
        from pypdf import PdfReader  # preferred
    except Exception:
        from PyPDF2 import PdfReader  # fallback
    return PdfReader(pdf_path)

def extract_texts(reader) -> List[str]:
    texts = []
    for i in range(len(reader.pages)):
        try:
            txt = reader.pages[i].extract_text() or ""
        except Exception:
            txt = ""
        texts.append(txt)
    return texts

def find_heading_after(texts: List[str], heading: str, start_from: int) -> int:
    """Find the first page >= start_from with a line exactly equal to `heading`.
       If not found, fall back to substring search.
    """
    num_pages = len(texts)
    pattern = re.compile(rf"^{re.escape(heading)}\s*$", re.MULTILINE)
    for i in range(start_from, num_pages):
        if pattern.search(texts[i]):
            return i
    for i in range(start_from, num_pages):
        if heading in texts[i]:
            return i
    return -1

def detect_anchor_pages(texts: List[str]) -> Dict[str, int]:
    # Order exactly as table of contents
    order = [
        "Introduction",
        "1 Measures",
        "2 Functions and Integrals",
        "3 Convergence",
        "4 Signed and Complex Measures",
        "5 Product Measures",
        "6 Differentiation",
        "7 Measures on Locally Compact Spaces",
        "8 Polish Spaces and Analytic Sets",
        "9 Haar Measure",
        "10 Probability",
        "A Notation and Set Theory",
        "B Algebra and Basic Facts About R and C",
        "C Calculus and Topology in R",
        "D Topological Spaces and Metric Spaces",
        "E The Bochner Integral",
        "F Liftings",
        "G The Banach–Tarski Paradox",
        "H The Henstock–Kurzweil and McShane Integrals",
        "References",
        "Index of notation",
        "Index",
    ]
    anchors: Dict[str, int] = {}
    start_from = 0
    for h in order:
        p = find_heading_after(texts, h, start_from)
        anchors[h] = p if p >= 0 else None
        if p >= 0:
            start_from = p + 1

    # The OCR sometimes mangles “R and C” on Appendix B pages; if not found,
    # scan the window between A and C for a line starting with "B".
    if anchors.get("B Algebra and Basic Facts About R and C") is None:
        a = anchors.get("A Notation and Set Theory")
        c = anchors.get("C Calculus and Topology in R")
        if a is not None and c is not None:
            for i in range(a, c):
                # Check early lines for a heading that begins with "Appendix B" or just "B"
                lines = [ln.strip() for ln in (texts[i] or "").splitlines()[:20]]
                if any(re.match(r"^(Appendix\s+)?B\b", ln) for ln in lines):
                    anchors["B Algebra and Basic Facts About R and C"] = i
                    break
    return anchors

def build_sections(anchors: Dict[str, int], total_pages: int) -> List[Tuple[str, int, int]]:
    """Return list of (output_name, start_page, end_page) inclusive, zero-based pages."""
    # Define logical groups
    chapters = [
        "1 Measures",
        "2 Functions and Integrals",
        "3 Convergence",
        "4 Signed and Complex Measures",
        "5 Product Measures",
        "6 Differentiation",
        "7 Measures on Locally Compact Spaces",
        "8 Polish Spaces and Analytic Sets",
        "9 Haar Measure",
        "10 Probability",
    ]
    appendices = [
        "A Notation and Set Theory",
        "B Algebra and Basic Facts About R and C",
        "C Calculus and Topology in R",
        "D Topological Spaces and Metric Spaces",
        "E The Bochner Integral",
        "F Liftings",
        "G The Banach–Tarski Paradox",
        "H The Henstock–Kurzweil and McShane Integrals",
    ]
    master = chapters + appendices + ["References", "Index of notation", "Index"]

    # 1) Frontmatter + Introduction
    ch1_start = anchors["1 Measures"]
    if ch1_start is None:
        raise RuntimeError("Could not locate '1 Measures' start page.")
    sections: List[Tuple[str, int, int]] = [("01_frontmatter_introduction", 0, ch1_start - 1)]

    # Helper to compute end page from next anchor
    def end_before(next_keys, after_key):
        for nk in next_keys:
            p = anchors.get(nk)
            if p is not None:
                return p - 1
        return total_pages - 1

    # Chapters 1..10
    for key in chapters:
        start = anchors.get(key)
        if start is None:
            raise RuntimeError(f"Could not locate start for {key}")
        idx = master.index(key)
        end = end_before(master[idx+1:], key)
        num = int(key.split()[0])
        name = f"{num:02d}_chapter_{num}"
        sections.append((name, start, end))

    # Appendices A..H
    for key in appendices:
        start = anchors.get(key)
        if start is None:
            raise RuntimeError(f"Could not locate start for {key}")
        idx = master.index(key)
        end = end_before(master[idx+1:], key)
        letter = key.split()[0]  # 'A'..'H'
        # Prefix indices so overall list ends up at 21 files; frontmatter is 01, chapters 01..10,
        # appendices 12..19 (after 10 chapters), then 20 refs, 21 indexes.
        # Here we compute the ordinal: 12 for A, ..., 19 for H
        ordinal = 10 + (ord(letter) - ord('A')) + 2
        name = f"{ordinal:02d}_appendix_{letter.lower()}"
        sections.append((name, start, end))

    # References
    ref_start = anchors.get("References")
    if ref_start is None:
        raise RuntimeError("Could not locate 'References'")
    idx_notation = anchors.get("Index of notation")
    ref_end = (idx_notation - 1) if idx_notation is not None else (total_pages - 1)
    sections.append(("20_references", ref_start, ref_end))

    # Index of notation + Index combined
    idx_not = anchors.get("Index of notation")
    if idx_not is None:
        raise RuntimeError("Could not locate 'Index of notation'")
    sections.append(("21_indexes", idx_not, total_pages - 1))

    assert len(sections) == 21, f"Expected 21 outputs, got {len(sections)}"
    return sections

def write_sections(reader, sections: List[Tuple[str, int, int]], out_dir: str):
    os.makedirs(out_dir, exist_ok=True)
    try:
        from pypdf import PdfWriter
    except Exception:
        from PyPDF2 import PdfWriter
    written = []
    for name, start, end in sections:
        writer = PdfWriter()
        for p in range(start, end + 1):
            writer.add_page(reader.pages[p])
        out_path = os.path.join(out_dir, f"{name}.pdf")
        with open(out_path, "wb") as f:
            writer.write(f)
        written.append(out_path)
    return written

def main():
    if len(sys.argv) < 3:
        print("Usage: python split_cohn_measure_theory.py INPUT.pdf OUTPUT_DIR")
        sys.exit(1)
    pdf_path = sys.argv[1]
    out_dir  = sys.argv[2]

    reader = load_reader(pdf_path)
    texts = extract_texts(reader)

    def adjust_anchor_offsets(anchors: dict) -> dict:
      """Shift all anchors back by one page (title leaf) to fix off-by-one
      caused by low-text title pages. Clamp at 0. Skip shifting the very first
      page of the book if present (e.g., if any anchor is at page 0)."""
      adj = anchors.copy()
      # Determine a safe minimum page to avoid going negative.
      MIN_PAGE = 0
      # Shift all known keys that resolved to a page >= 0
      for k, v in list(adj.items()):
          if isinstance(v, int) and v > MIN_PAGE:
              adj[k] = v - 1
      return adj

    import re

    def heading_present_on_page(text: str, heading: str) -> bool:
        """True if a line equals the heading."""
        if not text:
            return False
        return re.search(rf"(?m)^{re.escape(heading)}\s*$", text) is not None

    def nudge_anchor_forward_if_needed(texts, anchors, key):
        """
        If the exact heading isn't on anchors[key] but is on the next page,
        move the anchor forward by 1. This fixes early anchors.
        """
        p = anchors.get(key)
        if not isinstance(p, int) or p < 0 or p >= len(texts):
            return
        if heading_present_on_page(texts[p], key):
            return
        if p + 1 < len(texts) and heading_present_on_page(texts[p + 1], key):
            anchors[key] = p + 1

    anchors = detect_anchor_pages(texts)
    anchors = adjust_anchor_offsets(anchors)  # your “shift back by 1” for chapters/appendices

# Fix early anchors on trailing sections:
    for key in ["References", "Index of notation", "Index"]:
        nudge_anchor_forward_if_needed(texts, anchors, key)

    sections = build_sections(anchors, len(reader.pages))

    # sanity print
    print("Detected anchors:")
    for k, v in anchors.items():
        print(f"  {k:50s} -> {v}")

    sections = build_sections(anchors, len(reader.pages))
    written = write_sections(reader, sections, out_dir)

    print("\nWrote files:")
    for w in written:
        print(" ", w)

if __name__ == "__main__":
    main()

