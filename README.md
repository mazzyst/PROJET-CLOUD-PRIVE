# PROJET-CLOUD-PRIVE
Collaborators: Samuel, Hamdi, Kaddour, Mohamed Amine

-le fichier inventory contient la liste de serveurs a provisionner.

-le dossier playbooks contient les play book a executer a travers un makefile.

-le dossier group_vars contient les variables utilisées dans les playbooks du dossier playbooks.

-le fichier vagrantfile et provision.sh serventt à lancer vagrant.

-Il faut générer génerer une paire de clé appelée "ansible_rsa" (public et privée), pour l'utiliser à la communication des serveurs en ssh:

     ssh-keygen

-il faut commencer par lancer vagrant: 

     vagrant up
     
-il faut se connecter sur la machine control:

     vagrant ssh control
     
-il faut acceder au repertoire "/src/install_infra".

-il faut executer le makefile comme suit:

        1- le fichier make pour installation des roles:
               make galaxy   (a ne pas faire , fait automatiquement lors du vagrant up) 
         
        2- le fichier make pour executer le playbook test:
               make test_play
