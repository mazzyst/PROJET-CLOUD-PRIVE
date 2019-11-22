test_play:
	ansible-playbook -v -i inventory wordpress-book.yml mariadb-book.yml  

galaxy:
	ansible-galaxy install adfinis-sygroup.mariadb
	ansible-galaxy install makarenalabs.wordpress
	ansible-galaxy install geerlingguy.haproxy
	ansible-galaxy install geerlingguy.nfs
