#!/usr/bin/env python
import sys
lines = []
for l in sys.stdin.readlines():
    if 'new file' in l or 'modified' in l or 'deleted' in l:
        lines.append(' '.join(l.strip().split()))
sys.stdout.write('; '.join(lines))
