import os
import re


def vox_completer(prefix, line, begidx, endidx, ctx):
    """
    Completes xonsh's `vox` virtual environment manager
    """
    to_list_when = ['vox activate', 'vox remove']
    if any(case == line.strip() for case in to_list_when):
        environments = $(vox list).splitlines()[1:]
        return set(environments)
    is_beginning = line.startswith('vox') and (len(line.split()) < 3 and not line.endswith(' '))
    if is_beginning:
        all_commands = re.findall('vox (\w+)', $(vox --help))
        return set(all_commands)

completer add 'vox' vox_completer "start"
