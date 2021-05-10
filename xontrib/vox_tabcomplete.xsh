import re


def _vox_completer(prefix, line, begidx, endidx, ctx):
    """
    Completes xonsh's `vox` virtual environment manager
    """
    if not line.startswith('vox'):
        return
    to_list_when = ['vox activate ', 'vox remove ']
    if any(c in line for c in to_list_when):
        all_envs = $(vox list).splitlines()[1:]
        env_prefix = line.split(" ")[-1]
        return set( env for env in all_envs if env.startswith(env_prefix) )

    if (len(line.split()) > 1 and line.endswith(' ')) or len(line.split()) > 2:
        # "vox new " -> complete flags if any
        command = line.strip().split()[-1]
        flags = set(re.findall(r'(--\w+)', $(vox @(command) --help)))
        return flags, len(prefix)

    all_commands = re.findall(r'\n    (\w+)', $(vox --help))
    if prefix in all_commands:
        # "vox new" -> suggest replacing new with other command (note no space)
        return all_commands, len(prefix)
    elif prefix:
        # "vox n" -> suggest "new"
        return [c for c in all_commands if c.startswith(prefix)], len(prefix)
    return set(all_commands)

#add to list of completers
completer add vox _vox_completer start
__all__ = []
