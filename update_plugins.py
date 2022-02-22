try:
    import concurrent.futures as futures
except ImportError:
    try:
        import futures
    except ImportError:
        futures = None

import re
import zipfile
import shutil
import tempfile
import requests

from os import path

# --- Globals ----------------------------------------------
PLUGINS = """
vim-yankstack https://github.com/maxbrunsfeld/vim-yankstack
ack.vim https://github.com/mileszs/ack.vim
bufexplorer https://github.com/jlanzarotta/bufexplorer
ctrlp.vim https://github.com/ctrlpvim/ctrlp.vim
open_file_under_cursor.vim https://github.com/amix/open_file_under_cursor.vim
tlib https://github.com/tomtom/tlib_vim
vim-addon-mw-utils https://github.com/MarcWeber/vim-addon-mw-utils
vim-indent-object https://github.com/michaeljsmith/vim-indent-object
vim-pyte https://github.com/therubymug/vim-pyte
vim-multiple-cursors https://github.com/terryma/vim-multiple-cursors
vim-rhubarb https://github.com/tpope/vim-rhubarb
vim-commentary https://github.com/tpope/vim-commentary
lightline.vim https://github.com/itchyny/lightline.vim
vim-abolish https://github.com/tpope/vim-abolish
vim-gist https://github.com/mattn/vim-gist
mru.vim https://github.com/vim-scripts/mru.vim
editorconfig-vim https://github.com/editorconfig/editorconfig-vim
""".strip()

# vim-snipmate https://github.com/garbas/vim-snipmate
#goyo.vim https://github.com/junegunn/goyo.vim
#vim-zenroom2 https://github.com/amix/vim-zenroom2
#dracula https://github.com/dracula/vim
# mayansmoke https://github.com/vim-scripts/mayansmoke
#gruvbox https://github.com/morhetz/gruvbox
#vim-gitgutter https://github.com/airblade/vim-gitgutter
#vim-markdown https://github.com/plasticboy/vim-markdown
#vim-colors-solarized https://github.com/altercation/vim-colors-solarized
GITHUB_ZIP = "%s/archive/master.zip"

SOURCE_DIR = path.join(path.dirname(__file__), "sources_non_forked")


def download_extract_replace(plugin_name, zip_path, temp_dir, source_dir):
    temp_zip_path = path.join(temp_dir, plugin_name)

    # Download and extract file in temp dir
    req = requests.get(zip_path)
    open(temp_zip_path, "wb").write(req.content)

    zip_f = zipfile.ZipFile(temp_zip_path)
    zip_f.extractall(temp_dir)

    content_disp = req.headers.get("Content-Disposition")
    filename = re.findall("filename=(.+).zip", content_disp)[0]
    plugin_temp_path = path.join(temp_dir, path.join(temp_dir, filename))

    # Remove the current plugin and replace it with the extracted
    plugin_dest_path = path.join(source_dir, plugin_name)

    try:
        shutil.rmtree(plugin_dest_path)
    except OSError:
        pass

    shutil.move(plugin_temp_path, plugin_dest_path)
    print("Updated {0}".format(plugin_name))


def update(plugin):
    name, github_url = plugin.split(" ")
    zip_path = GITHUB_ZIP % github_url
    try:
        download_extract_replace(name, zip_path, temp_directory, SOURCE_DIR)
    except Exception as exp:
        print("Could not update {}. Error was: {}".format(name, str(exp)))


if __name__ == "__main__":
    temp_directory = tempfile.mkdtemp()

    try:
        if futures:
            with futures.ThreadPoolExecutor(16) as executor:
                executor.map(update, PLUGINS.splitlines())
        else:
            [update(x) for x in PLUGINS.splitlines()]
    finally:
        shutil.rmtree(temp_directory)
