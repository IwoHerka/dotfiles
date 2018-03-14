#!/usr/bin/env python
import sys

lines = []
for line in sys.stdin.readlines():
    if 'new file' in line or 'modified' in line or 'deleted' in line:
        lines.append(' '.join(line.strip().split()))

msg = '; '.join(lines)

print(msg)
