test_play:
	ansible-playbook -v -i inventory playbooks/dnsmasq-book.yml playbooks/mariadb-book.yml playbooks/haproxy-book.yml playbooks/nfs-book.yml playbooks/wordpress-book.yml 

galaxy:
	ansible-galaxy install oefenweb.wordpress
	ansible-galaxy install adfinis-sygroup.mariadb
	ansible-galaxy install geerlingguy.php
	ansible-galaxy install geerlingguy.haproxy
	ansible-galaxy install geerlingguy.nfs
	ansible-galaxy install geerlingguy.apache
	ansible-galaxy install oefenweb.dnsmasq
