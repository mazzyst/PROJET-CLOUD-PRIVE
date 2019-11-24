test_play:
	ansible-playbook -v -i inventory playbooks/wordpress-book.yml playbooks/mariadb-book.yml  

galaxy:
	ansible-galaxy install oefenweb.wordpress
	ansible-galaxy install geerlingguy.mysql
	ansible-galaxy install geerlingguy.php
	ansible-galaxy install geerlingguy.haproxy
	ansible-galaxy install geerlingguy.nfs
