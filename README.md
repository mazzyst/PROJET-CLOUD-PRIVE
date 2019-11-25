# PROJET-CLOUD-PRIVE
Collaborators: Samuel, Hamdi, Kaddour, Mohamed Amine

-le fichier inventory contient la liste de serveurs a provisionner.

-le dossier playbooks contient les play book a executer a travers un makefile.

-le dossier group_vars contient les variables utilisées dans les playbooks du dossier playbooks.

-le fichier vagrantfile et provision.sh serventt à lancer vagrant.

-les fichiers ansible_rsa et ansible_rsa.pub sont les clés ssh que vagrant va injecter dans les services pour assurer leurs communications en ssh:

-il faut commencer par lancer vagrant: 

     vagrant up
     
-il faut se connecter sur la machine control:

     vagrant ssh control
     
-il faut cloner le meme depot git a l'interieur de control, la prochaine etape est d'introduire cette etape dans un deuxieme provision (provision2.sh).

-il faut acceder au repertoire "PROJET-CLOUD-PRIVE".

-il faut executer le makefile comme suit:

        1- le fichier make pour installation des roles:
               make galaxy
         
        2- le fichier make pour executer le playbook test:
               make test_play
