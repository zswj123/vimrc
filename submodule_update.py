import os

MY_PLUGINS = './my_plugins'

os.system('rm -rf %s/jedi-vim' % MY_PLUGINS)
os.system('git clone https://github.com/davidhalter/jedi-vim %s/jedi-vim' % MY_PLUGINS)

os.system('rm -rf %s/syntastic' % MY_PLUGINS)
os.system('git clone https://github.com/vim-syntastic/syntastic %s/syntastic' % MY_PLUGINS)

os.system('rm -rf %s/tsuquyomi' % MY_PLUGINS)
os.system('git clone https://github.com/Quramy/tsuquyomi %s/tsuquyomi' % MY_PLUGINS)

os.system('rm -rf %s/vim-autoformat' % MY_PLUGINS)
os.system('git clone https://github.com/Chiel92/vim-autoformat %s/vim-autoformat' % MY_PLUGINS)

os.system('rm -rf %s/tagbar' % MY_PLUGINS)
os.system('git clone https://github.com/majutsushi/tagbar %s/tagbar' % MY_PLUGINS)

os.system('rm -rf %s/typescript-vim' % MY_PLUGINS)
os.system('git clone https://github.com/leafgarland/typescript-vim %s/typescript-vim' % MY_PLUGINS)
