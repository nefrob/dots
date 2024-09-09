# Configure git defaults
[group('git')]
git-config EMAIL NAME="nefrob" EDITOR="code --wait":
    git config --global user.name {{ NAME }}
    git config --global user.email {{ EMAIL }}
    git config --global core.editor {{ EDITOR }}

# node

# Install a node version
[group('node')]
node-install VERSION="lts" SCOPE="global":
    asdf plugin add nodejs https://github.com/asdf-vm/asdf-nodejs.git
    asdf install nodejs {{ VERSION }}
    asdf {{ SCOPE }} nodejs {{ VERSION }}

# python

# Install a python version
[group('python')]
pyenv-install VERSION="3.12:latest" SCOPE="global":
    pyenv install {{ VERSION }}
    pyenv {{ SCOPE }} {{ VERSION }}

# List available python versions
[group('python')]
pyenv-list:
    pyenv install -l

# Create a python virtual environment
[group('python')]
python-venv PYTHON_VERSION VENV_NAME:
    pyenv virtualenv {{ PYTHON_VERSION }} {{ VENV_NAME }}
    pyenv local {{ VENV_NAME }}
