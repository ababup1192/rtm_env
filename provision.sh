# Remove files

# Install packges
apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys B97B0AFCAA1A47F044F244A07FCC7D46ACCC4CF8
echo "deb http://apt.postgresql.org/pub/repos/apt/ precise-pgdg main" > /etc/apt/sources.list.d/pgdg.list
apt-get update && apt-get install -y software-properties-common
add-apt-repository ppa:git-core/ppa && add-apt-repository ppa:pi-rho/dev && add-apt-repository ppa:hrg/daily
apt-get update && apt-get install -y openssh-server zsh vim git curl autoconf tar wget \
    zlib1g-dev build-essential libssl-dev libreadline-dev libyaml-dev libsqlite3-dev \
    sqlite3 libxml2-dev libxslt1-dev libcurl4-openssl-dev \
    software-properties-common \
    choreonoid libcnoid-dev openrtm-aist openrtm-aist-dev doxygen \
    libpq-dev python-software-properties \
    libffi-dev tmux python-software-properties

# Change shell to zsh
chsh -s /bin/zsh vagrant

su - vagrant -c "curl https://raw.githubusercontent.com/Shougo/neobundle.vim/master/bin/install.sh | sh"
su - vagrant -c "git clone --recursive https://github.com/sorin-ionescu/prezto.git /home/vagrant/.zprezto && \
  git clone https://github.com/ababup1192/dotfiles.git /tmp/dotfiles && \
  cp -r /tmp/dotfiles/.??* /home/vagrant"
rm -rf /var/tmp/dotfiles

# Install ruby
su - vagrant -c "git clone git://github.com/sstephenson/rbenv.git /home/vagrant/.rbenv && \
    git clone git://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build && \
    exec /bin/zsh"

su - vagrant -c "rbenv install 2.0.0-p643 && rbenv global 2.0.0-p643"
echo "gem: --no-ri --no-rdoc" > ~/.gemrc

su - vagrant -c "gem install bundler rubocop refe2 && bitclust setup"




