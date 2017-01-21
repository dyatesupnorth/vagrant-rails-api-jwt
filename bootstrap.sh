sudo apt-get update
sudo apt-get install git -y
sudo /usr/sbin/update-locale LANG=en_US.UTF-8 LC_ALL=en_US.UTF-8
# postgres
echo "deb http://apt.postgresql.org/pub/repos/apt/ precise-pgdg main " | sudo tee -a /etc/apt/sources.list.d/pgdg.list
sudo wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -
sudo apt-get update
sudo apt-get install -y postgresql-9.3 libpq-dev
echo '# "local" is for Unix domain socket connections only
local   all             all                                  trust
# IPv4 local connections:
host    all             all             0.0.0.0/0            trust
# IPv6 local connections:
host    all             all             ::/0                 trust' | sudo tee /etc/postgresql/9.3/main/pg_hba.conf
sudo sed -i "s/#listen_addresses = 'localhost'/listen_addresses = '*'/g" /etc/postgresql/9.3/main/postgresql.conf
sudo /etc/init.d/postgresql restart
sudo su - postgres -c 'createuser -s vagrant'
sudo mkdir -p /usr/local/pgsql/data
sudo chown postgres:postgres /usr/local/pgsql/data

sudo -u postgres /usr/lib/postgresql/9.1/bin/initdb -D /usr/local/pgsql/data
sudo -u postgres -c 'createuser -s vagrant'

psql -U postgres -c "ALTER ROLE vagrant CREATEDB"

echo 'creating db'

createdb sample_db



sudo apt-get install curl -y
curl -sSL https://get.rvm.io | bash


source /home/vagrant/.rvm/scripts/rvm
echo 'which rvm'
which rvm

rvm install 2.3
gem install bundler
sudo apt-get install nodejs


echo 'All Done. Postgres needs setting up , refer to https://github.com/dyatesupnorth/vagrant-rails-api-jwt'
