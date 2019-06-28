# file: htdigest.py
import sys
from hashlib import md5

class Options(object):
    pass

def main(opts):
    ht5 = lambda x: md5(':'.join(x)).hexdigest()
    htpwd = ':'.join((opts.user, opts.realm,
                     ht5((opts.user, opts.realm, opts.pwd))))
    print htpwd


if __name__ == '__main__':

    usage = '''
usage: python htdigest.py --user USER --pwd PASSWORD [--realm REALM]
'''

    opts = Options()
    for o in ['--user', '--pwd', '--realm']:
        try:
            setattr(opts, o.replace('--',''), sys.argv[sys.argv.index(o)+1])
        except ValueError:
            pass
        except IndexError:
            pass
    opts.realm = getattr(opts, 'realm', 'default_realm')

    if not hasattr(opts, 'user') or not hasattr(opts, 'pwd'):
        print("[ERROR] must supply both a username and password")
        print(usage)
        exit(1)

    main(opts)
