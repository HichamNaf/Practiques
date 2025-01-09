En el document inclou el simulador gazebo amb el robot robobo que nomes s'ha d'executar pero si s'hagues d'instalar els pasos a seguir estan en el seguent enllaç:
	https://github.com/mintforpeople/robobo-gazebo-simulator/blob/master/README.md



1. Obrir una terminal i establir un master amb la seguent comanda
	$ roscore
2. Obrir una altre terminal i executar el node del turtlesim
	$ rosrun turtlesim turtlesim_node
3. Obrir una altre terminal i executar el simulador gazebo que te un model del robot robobo
per a fer-ho primer em d'entrar en la direcció del workspace on tenim instalat el gazebo
llavors executar-lo	
	$ cd practica_ws/
	$ roslaunch robobo_gazebo robobo.launch
4. No es necesari pero podem executar rqt_graph per veure tots els nodes
	$ rqt_graph
5.Ara que tot esta preparat, nomes falta executar el programa .py que te els topics
primer hem de obrir una altre terminal, anar a la direccio del programa i executar-lo des d'alla(es pot executar directament des del workspace pero a mi no em va)
	$ cd practica_ws/src/turtle_controller/scripts/
	$ python3 turtle_node.py
