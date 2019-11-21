# PROJET-CLOUD-PRIVE
Collaborators: Samuel, Hamdi, Kaddour, Mohamed Amine

-le fichier inventory contient la liste de serveurs a provisionner.

-le fichier test.yml contient le play book a executer
-le dossier group_vars contient les variables utilisée
-le fichier vagrantfile et provision pour lancer vagrant

-il faut commencer par lancer vagrant: 
     vagrant up
-il faut se connecter sur la machine control:
     vagrant ssh control
     
le Makefile a executer a partir de la machine control




=============il faut executer:=================
   1-le fichier make pour installation des roles:
         make galaxy
         
   2- le fichier make pour executer le playbook test:
           make test_play
