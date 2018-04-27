from __future__ import print_function
import os, sys
from stat import S_ISDIR, S_ISREG, ST_MODE


HOME = '/home/siegmeyer/'
DOTDIR = HOME + 'dotfiles/'


name = lambda f: f.split('/')[-1]


def walktree(top, callback):
    for f in os.listdir(top):
        pathname = os.path.join(top, f)
        mode = os.stat(pathname)[ST_MODE]

        if S_ISDIR(mode):
            walktree(pathname, callback)
        elif S_ISREG(mode):
            callback(pathname)
        else:
            print('Skipping {}'.format(pathname))


def remove(pathname):
    if os.path.exists(pathname):
        os.remove(pathname)
    elif os.path.islink(pathname):
        os.unlink(pathname)
    elif not os.path.exists(pathname.replace(name(pathname), '')):
        os.makedirs(pathname.replace(name(pathname), ''))


def linkdot(f):
    pathname = '{}.{}'.format(HOME, name(f))
    print(f + ' -> ' + pathname)
    remove(pathname)
    os.symlink(f, pathname)


def linkconf(f):
    pathname = HOME + '.' + f.replace(DOTDIR, '')
    print(name(f) + ' -> ' + pathname)
    remove(pathname)
    os.symlink(f, pathname)


if __name__ == '__main__':
    walktree(DOTDIR + 'linked/', linkdot)
    walktree(DOTDIR + 'config/', linkconf)
