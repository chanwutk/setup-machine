from os import system, getcwd
from os.path import expanduser, join

def setup():
    home_dir = expanduser("~")

    # install oh-my-zsh
    system('sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"')

    # install zsh-autosuggestions
    system(f'git clone https://github.com/zsh-users/zsh-autosuggestions {join(home_dir, ".oh-my-zsh/custom/plugins/zsh-autosuggestions")}')

    # install zsh-syntax-highlighting
    system(f'git clone https://github.com/zsh-users/zsh-syntax-highlighting.git {join(home_dir, ".oh-my-zsh/custom/plugins/zsh-syntax-highlighting")}')

    # enable plugins and theme
    zshrc_path = join(home_dir, ".zshrc")
    with open(zshrc_path) as f:
        content = f.readlines()

    ZSH_THEME_KEY = "ZSH_THEME"
    PLUGINS_KEY = "plugins"
    with open(zshrc_path, "w+") as f:
        for line in content:
            tokens = line.split("=", 2)
            key = tokens[0]
            if key == PLUGINS_KEY:
                replacement = f'{PLUGINS_KEY}=(git zsh-autosuggestions zsh-syntax-highlighting)\n'
            else:
                replacement = line
            f.write(replacement)


if __name__ == "__main__":
    setup()
