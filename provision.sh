#add /usr/local/bin to PATH
echo "export PATH=$PATH:/usr/local/bin" > /etc/profile.d/local_bin.sh

source /etc/profile.d/local_bin.sh

#install and setup virtualenv and virtualenvwrapper
pip3 install virtualenv
pip3 install virtualenvwrapper

mkdir -p /home/vagrant/Envs

echo "export WORKON_HOME=/home/vagrant/Envs" > /etc/profile.d/virtualenv.sh
echo "export VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python3.4" >> /etc/profile.d/virtualenv.sh
echo "source /usr/local/bin/virtualenvwrapper.sh" >> /etc/profile.d/virtualenv.sh

source /etc/profile.d/virtualenv.sh

#create a virtualenv for the flaskapp1
cd /vagrant/flaskapp1

mkvirtualenv flaskapp1

pip install -r requirements.txt

deactivate

#create a virtualenv for the flaskapp1
cd /vagrant/flaskapp2

mkvirtualenv flaskapp2

pip install -r requirements.txt

deactivate

#install development tools
yum groupinstall -y "Development Tools"

#install and setup supervisor. Supervisor currently only works in python 2 so I am using pip rather than pip3.
pip install supervisor

cd /vagrant

mkdir /vagrant/logs

supervisord

#set up some supervisorctl aliases
echo "alias start='supervisorctl start'" >> /etc/profile.d/supervisorctl.sh
echo "alias stop='supervisorctl stop'" >> /etc/profile.d/supervisorctl.sh
echo "alias restart='supervisorctl restart'" >> /etc/profile.d/supervisorctl.sh
echo "alias status='supervisorctl status'" >> /etc/profile.d/supervisorctl.sh

source /etc/profile.d/supervisorctl.sh
