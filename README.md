# PROJET-CLOUD-PRIVE
Collaborators: Samuel, Hamdi, Kaddour, Mohamed Amine

-le fichier inventory contient la liste de serveurs a provisionner.

-le fichier test.yml contient le play book a executer.

-le dossier group_vars contient les variables utilisées (deux fichiers: un pour wordpress et l'autre pour mariadb).

-le fichier vagrantfile et provision.sh sert à lancer vagrant.

-Créer la paire de clefs SSH :

     ssh-keygen

-il faut commencer par lancer vagrant: 

     vagrant up
     
-il faut se connecter sur la machine control:

     vagrant ssh control
     
-il faut cloner le meme depot git a l'interieur de control, la prochaine etape et d'introduire cette etape dans un deuxieme provision (provision2.sh).

-il faut acceder au repertoire "PROJET-CLOUD-PRIVE".

-il faut execute le makefile comme suit:

        1- le fichier make pour installation des roles:
               make galaxy
         
        2- le fichier make pour executer le playbook test:
               make test_play
