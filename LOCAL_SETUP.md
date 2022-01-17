# Ubuntu in WSL Local Machine Setup

## Install Postgres
```bash
sudo apt update
sudo apt install postgresql postgresql-contrib
sudo service postgresql start
sudo -u postgres -i
createuser -s <yourusername>
sudo apt-get install libpq-dev
```

## Install webpack
```bash
sudo apt install nodejs
sudo apt install npm
sudo npm install --global yarn
npm install webpack
```

## Install Ruby
```bash
sudo apt install git curl libssl-dev libreadline-dev zlib1g-dev autoconf bison build-essential libyaml-dev libreadline-dev libncurses5-dev libffi-dev libgdbm-dev
curl -fsSL https://github.com/rbenv/rbenv-installer/raw/HEAD/bin/rbenv-installer | bash
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(rbenv init -)"' >> ~/.bashrc
exec $SHELL
rbenv install 3.0.3
bundle install
```

## Install Chrome for System Tests
```bash
sudo apt update && sudo apt -y upgrade && sudo apt -y autoremove
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo apt -y install ./google-chrome-stable_current_amd64.deb
```