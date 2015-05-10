flags = ( '-Wall -Wextra -Werror -std=c99 -x c -I .'.split()
        + '-isystem /usr/include -isystem /usr/lib/clang/3.5.1/include'.split()
        + ['-I/usr/include/libevdev-1.0/libevdev/', '-I/usr/include/libbsd'])

def FlagsForFile(filename, **kw):
    return {
            'flags' : flags,
            'do_cache': True
    }
