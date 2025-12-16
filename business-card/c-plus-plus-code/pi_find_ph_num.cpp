// g++ -O3 -std=c++17 pi_find_ph_num.cpp -o pi_find
// Usage: ./pi_find [file] [num]
// Example: ./pi_find /dev/stdin/0412121212
// Note: -r flag is also supported for range: -r 8 before the [file] argument
//
// Results:
// z5362216@katana3:.../scratch/z5362216 $ unzip -p pi_dec_1t_01.zip | ./pi_find /dev/stdin 04XXXXXXXX
// Found at digit #4592438290 after the decimal.
//
// Get the pi file from:
// wget -c --tries=100 --retry-connrefused \
     https://archive.org/download/pi_dec_1t/pi_dec_1t_01.zip


#include <fstream>
#include <iostream>
#include <vector>
#include <deque>
#include <cctype>
#include <cstring>

static void usage() {
    std::cerr <<
    "usage: pi_find [-r N] [-i] <file|-> <pattern>\n"
    "       -r N   show N digits of context before and after the match\n"
    "       -i     include the leading integer part (count the initial '3')\n"
    "       <file> any pathname, or '-' (or /dev/stdin) for stdin\n";
    std::exit(1);
}

/* ----------- minimal KMP helpers ------------------ */
static std::vector<int> build_lps(const std::string& pat) {
    std::vector<int> lps(pat.size());
    for (size_t i = 1, len = 0; i < pat.size();) {
        if (pat[i] == pat[len]) lps[i++] = ++len;
        else if (len) len = lps[len - 1];
        else lps[i++] = 0;
    }
    return lps;
}

/* -------------------------------------------------- */
int main(int argc, char* argv[])
{
    /* ---- parse flags ---- */
    size_t range = 0;
    bool include_integer = false;
    int arg = 1;
    while (arg < argc && argv[arg][0] == '-') {
        if (!std::strcmp(argv[arg], "-r")) {
            if (++arg >= argc) usage();
            range = std::stoul(argv[arg++]);
        } else if (!std::strcmp(argv[arg], "-i")) {
            include_integer = true; ++arg;
        } else if (!std::strcmp(argv[arg], "--")) { ++arg; break; }
        else usage();
    }
    if (argc - arg != 2) usage();

    const std::string file = argv[arg++];
    const std::string pattern = argv[arg];
    if (pattern.empty() || pattern.find_first_not_of("0123456789") != std::string::npos)
        usage();

    /* ---- open stream ---- */
    std::ifstream fin;
    std::istream* in = nullptr;
    if (file == "-" || file == "/dev/stdin") in = &std::cin;
    else { fin.open(file, std::ios::binary); if (!fin) { perror(file.c_str()); return 1; } in = &fin; }

    const auto lps = build_lps(pattern);
    std::deque<char> prev;                     // ring for context-before
    size_t j = 0;                              // KMP state
    std::uint64_t pos = 0;                     // digit index (after decimal)
    bool seen_dot = false, skipped_first = !include_integer;

    auto push_prev = [&](char d){
        prev.push_back(d);
        size_t keep = pattern.size() - 1 + range;   // minimum we need
        if (prev.size() > keep) prev.pop_front();
    };

    int ch;
    while ((ch = in->get()) != EOF)
    {
        if (ch == '.' && !seen_dot) {          // drop everything up to first '.'
            seen_dot = true;
            continue;
        }
        if (!std::isdigit(ch)) continue;
        if (!seen_dot && skipped_first) {      // skip the leading '3'
            skipped_first = false;
            continue;
        }

        char digit = static_cast<char>(ch);
        ++pos;
        push_prev(digit);

        while (j && digit != pattern[j]) j = lps[j - 1];
        j += (digit == pattern[j]);
        if (j == pattern.size()) {
            // match ends at current pos
            std::uint64_t start_idx = pos - pattern.size() + 1;

            /* ---- gather context ---- */
            std::string before, after;
            // 'before': take last 'range' digits before the match start
            size_t to_copy = std::min(range, prev.size() - (pattern.size() - 1));
            before.assign(prev.end() - (pattern.size() - 1) - to_copy,
                          prev.end() - (pattern.size() - 1));

            // 'after': read forward up to 'range' more digits
            while (after.size() < range && (ch = in->get()) != EOF) {
                if (!std::isdigit(ch)) continue;
                after.push_back(static_cast<char>(ch));
            }

            /* ---- report ---- */
            if (range)
                std::cout << before << '[' << pattern << ']' << after << '\n';
            std::cout << "Found at digit #" << start_idx
                      << " after the decimal.\n";
            return 0;
        }
    }

    std::cout << "Pattern not found in supplied stream.\n";
    return 0;
}

