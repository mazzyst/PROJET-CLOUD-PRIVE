#!/bin/sh

set -e
set -u

HOSTNAME="$(hostname)"

export DEBIAN_FRONTEND=noninteractive

apt-get update
apt-get install -y \
    apt-transport-https \
    ca-certificates \
    git \
    curl \
    wget \
    vim \
    gnupg2 \
    python3 \
    software-properties-common \
    w3m

  if [ "$HOSTNAME" = "control" ]; then
	apt-get install -y \
		ansible \
	    build-essential
	

	# J'ajoute les deux clefs sur le noeud de controle
	mkdir -p /root/.ssh
	cp /vagrant/ansible_rsa /home/vagrant/.ssh/ansible_rsa
	cp /vagrant/ansible_rsa.pub /home/vagrant/.ssh/ansible_rsa.pub
	chmod 0600 /home/vagrant/.ssh/*_rsa # ICI
	chown -R vagrant:vagrant /home/vagrant/.ssh

	sed -i \
		-e '/## BEGIN PROVISION/,/## END PROVISION/d' \
		/home/vagrant/.bashrc
	cat >> /home/vagrant/.bashrc <<-MARK
	## BEGIN PROVISION
	eval \$(ssh-agent -s)
	ssh-add ~/.ssh/ansible_rsa
	## END PROVISION
	MARK
	
	cat > /home/vagrant/.ssh/config <<-MARK          #indiquer a ssh d'utiliser cette clé et pas d'autres pour se connecter sur les differents serveurs
	Host *.infra
        IdentityFile ~/.ssh/ansible_rsa
        User root
MARK

	
	
#	cat >> /etc/hosts <<MARK
#    ## BEGIN PROVISION
#    192.168.50.250      control
#    192.168.50.10       s0.infra
#    192.168.50.20       s1.infra
#    192.168.50.30       s2.infra
#    192.168.50.40       s3.infra
#    192.168.50.50       s4.infra 
    ## END PROVISION
#MARK

fi

sed -i \
	-e '/^## BEGIN PROVISION/,/^## END PROVISION/d' \
	/etc/hosts
	
cat > /etc/hosts <<MARK
# BEGIN PROVISION
192.168.50.250      control
192.168.50.10       s0.infra	devops.com	devsec.com	devsecops.com
192.168.50.20       s1.infra
192.168.50.30       s2.infra
192.168.50.40       s3.infra
192.168.50.50       s4.infra
# END PROVISION
MARK
#cat > /etc/resolv.conf <<MARK

#servername 192.168.50.10
#servername 1.1.1.1
#MARK


# J'autorise la clef sur tous les serveurs
mkdir -p /root/.ssh
cat /vagrant/ansible_rsa.pub >> /root/.ssh/authorized_keys

# Je vire les duplicata (potentiellement gênant pour SSH)
sort -u /root/.ssh/authorized_keys > /root/.ssh/authorized_keys.tmp
mv /root/.ssh/authorized_keys.tmp /root/.ssh/authorized_keys

# Je corrige les permissions
touch /root/.ssh/config
chmod 0600 /root/.ssh/*
chmod 0644 /root/.ssh/config
chmod 0700 /root/.ssh


if [ "$HOSTNAME" = "control" ]; then
    rm -rf /home/src 
    mkdir -p /home/vagrant/src
    mkdir -p /home/vagrant/src/install_infra_classique
    cp /vagrant/Makefile /home/vagrant/src/install_infra_classique/Makefile
    cp /vagrant/inventory /home/vagrant/src/install_infra_classique/inventory
    cp -r /vagrant/group_vars /home/vagrant/src/install_infra_classique/group_vars/
    cp -r /vagrant/playbooks /home/vagrant/src/install_infra_classique/playbooks/
    chown -R vagrant:vagrant /home/vagrant/src
    
    su vagrant -c "ssh-keyscan s0.infra >> ~/.ssh/known_hosts"
    su vagrant -c "ssh-keyscan s1.infra >> ~/.ssh/known_hosts"
    su vagrant -c "ssh-keyscan s2.infra >> ~/.ssh/known_hosts"
    su vagrant -c "ssh-keyscan s3.infra >> ~/.ssh/known_hosts"
    su vagrant -c "ssh-keyscan s4.infra >> ~/.ssh/known_hosts"
    
#    su vagrant -c "sudo ssh-keyscan s0.infra >> /etc/ssh/ssh_known_hosts"
#    su vagrant -c "sudo ssh-keyscan s1.infra >> /etc/ssh/ssh_known_hosts"
#    su vagrant -c "sudo ssh-keyscan s2.infra >> /etc/ssh/ssh_known_hosts"
#    su vagrant -c "sudo ssh-keyscan s3.infra >> /etc/ssh/ssh_known_hosts"
#    su vagrant -c "sudo ssh-keyscan s4.infra >> /etc/ssh/ssh_known_hosts"
    #cd src/install_infra_classique
    su -l vagrant -c "cd src/install_infra_classique && make galaxy"         #-l veut dire mettre l'environement de l'utilisateur vagrant at ps de root
    su -l vagrant -c "cd src/install_infra_classique && make test_play"
    
    

fi


echo "SUCCESS."

