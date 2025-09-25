"""#!/usr/bin/env python3
Reorder PDF pages into booklet (2-up, duplex) imposition.
Each output file is ready to print double-sided and fold into a stapled pamphlet.

import sys, os
from math import ceil
from PyPDF2 import PdfReader, PdfWriter  # or use pypdf

def impose_booklet(input_pdf, output_pdf):
    reader = PdfReader(input_pdf)
    total = len(reader.pages)
    # round up to nearest multiple of 4
    N = int(ceil(total / 4.0) * 4)
    writer = PdfWriter()

    def add_page_or_blank(idx):
        if 0 <= idx < total:
            writer.add_page(reader.pages[idx])
        else:
            # blank filler
            from PyPDF2.pdf import PageObject
            w = reader.pages[0].mediabox.width
            h = reader.pages[0].mediabox.height
            writer.add_blank_page(width=w, height=h)

    # Build booklet imposition
    left, right = 0, N - 1
    while left < right:
        # front side
        add_page_or_blank(right)
        add_page_or_blank(left)
        # back side
        add_page_or_blank(left + 1)
        add_page_or_blank(right - 1)
        left += 2
        right -= 2

    with open(output_pdf, "wb") as f:
        writer.write(f)
    print(f"Booklet written: {output_pdf}")

if __name__ == "__main__":
    if len(sys.argv) < 3:
        print("Usage: python make_booklet.py input.pdf output.pdf")
        sys.exit(1)
    impose_booklet(sys.argv[1], sys.argv[2])

"""
"""
#!/usr/bin/env python3
Reorder PDF pages into booklet (2-up, duplex) imposition.
Each output file is ready to print double-sided and fold into a stapled pamphlet.
"""

import sys, os
from math import ceil
from pypdf import PdfReader, PdfWriter

def impose_booklet(input_pdf, output_pdf):
    reader = PdfReader(input_pdf)
    total = len(reader.pages)
    # round up to nearest multiple of 4
    N = int(ceil(total / 4.0) * 4)
    writer = PdfWriter()

    def add_page_or_blank(idx):
        if 0 <= idx < total:
            writer.add_page(reader.pages[idx])
        else:
            # blank filler
            from pypdf.generic import RectangleObject
            w = reader.pages[0].mediabox.width
            h = reader.pages[0].mediabox.height
            writer.add_blank_page(width=w, height=h)

    # Build booklet imposition
    left, right = 0, N - 1
    while left < right:
        # front side
        add_page_or_blank(right)
        add_page_or_blank(left)
        # back side
        add_page_or_blank(left + 1)
        add_page_or_blank(right - 1)
        left += 2
        right -= 2

    with open(output_pdf, "wb") as f:
        writer.write(f)
    print(f"Booklet written: {output_pdf}")

if __name__ == "__main__":
    if len(sys.argv) < 3:
        print("Usage: python make_booklet.py input.pdf output.pdf")
        sys.exit(1)
    impose_booklet(sys.argv[1], sys.argv[2])
