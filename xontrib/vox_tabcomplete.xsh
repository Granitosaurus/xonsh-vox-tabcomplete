import os
import re


def vox_completer(prefix, line, begidx, endidx, ctx):
    """
    Completes xonsh's `vox` virtual environment manager
    """
    if not line.startswith('vox'):
        return
    if (len(line.split()) > 1 and line.endswith(' ')) or len(line.split()) > 2:
        # "vox new " -> no complete (note space)
        return
    to_list_when = ['vox activate', 'vox remove']
    if any(case == line.strip() for case in to_list_when):
        environments = $(vox list).splitlines()[1:]
        return set(environments)

    all_commands = re.findall('vox (\w+)', $(vox --help))
    if prefix in all_commands:
        # "vox new" -> suggest replacing new with other command (note no space)
        return all_commands, len(prefix)
    elif prefix:
        # "vox n" -> suggest "new"
        return [c for c in all_commands if prefix in c], len(prefix)
    return set(all_commands)

#add to list of completers
__xonsh_completers__['vox'] = vox_completer
#bump to top of list (otherwise bash completion interferes)
__xonsh_completers__.move_to_end('vox', last=False)
