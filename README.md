# PROJET-CLOUD-PRIVE
Collaborators: Samuel, Hamdi, Kaddour, Mohamed Amine

- Le fichier inventory contient la liste de serveurs à provisionner.

- Le dossier playbooks contient les playbooks à executer à travers un makefile.

- Le dossier group_vars contient les variables utilisées dans les playbooks du dossier playbooks.

- Le fichier vagrantfile et provision.sh serventt à lancer vagrant.

- Il faut générer génerer une paire de clé appelée "ansible_rsa" (public et privée), qui sert à la communication entre les serveurs en   ssh:

     ssh-keygen

- Il faut commencer par lancer vagrant: 

     vagrant up
     
- Il faut se connecter sur la machine control:

     vagrant ssh control
     
- Il faut acceder au repertoire "/src/install_infra".

- Il faut executer le makefile comme suit:

        1- le fichier make pour installation des roles:
               make galaxy   (a ne pas faire , fait automatiquement lors du vagrant up) 
         
        2- le fichier make pour executer le playbook test:
               make test_play
