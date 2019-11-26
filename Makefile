test_play:
	ansible-playbook -v -i inventory playbooks/haproxy-book.yml playbooks/nfs-book.yml playbooks/mariadb-book.yml playbooks/wordpress-book.yml 

galaxy:
	ansible-galaxy install oefenweb.wordpress
	ansible-galaxy install geerlingguy.mysql
	ansible-galaxy install geerlingguy.php
	ansible-galaxy install geerlingguy.haproxy
	ansible-galaxy install geerlingguy.nfs
	ansible-galaxy install geerlingguy.apache
