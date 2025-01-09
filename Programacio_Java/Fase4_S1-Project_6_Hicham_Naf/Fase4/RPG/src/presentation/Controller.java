package presentation;

import business.AdventureManager;
import business.CharacterManager;
import business.GameListener;
import business.GameManager;
import business.entities.Character;

import java.util.ArrayList;
import java.util.List;

        /**
        **Controller for the user interface, talks to Menu and the diferent managers.
        **
        **@author Hicham Naf
        **@version 4.0
        **/

public class Controller implements GameListener {
    //El controller s'encarrega de passar la informacio entre el menu i els managers
    private final Menu menu;
    private final CharacterManager characterManager;
    private final AdventureManager adventureManager;
    private final GameManager gameManager;
    //Constructor de la classe

    /**
     * Controller constructor that gets parameters input
     *
     * @param menu instance of Menu, to talk and resive orders from the user
     * @param characterManager instance of the characterManager, to manage all related to get and create characters
     * @param adventureManager instance of the monsterManager, to manage all related to creating an aventure
     * @param gameManager instance of the adventureManager, to manage all related to playing a game
     */
    public Controller(Menu menu, CharacterManager characterManager, AdventureManager adventureManager
    , GameManager gameManager) {
        this.menu = menu;
        this.characterManager = characterManager;
        this.adventureManager = adventureManager;
        this.gameManager = gameManager;
    }

    /**
     * Main method of the controller, its function is show the menu and ask an option.
     */
    //Funcio que mostre el menu d'opcions i demana que es seleccioni una d'elles.
    public void run(){
        int option;
        do {
            if(characterManager.listAllCharacters("").size()<3){
                menu.showMessage(menu.SHOW_MENU_2);
            }else{
                menu.showMessage(menu.SHOW_MENU);
            }
            option = menu.askForAnOption("Your answer: ");
            if(!(characterManager.listAllCharacters("").size()<3&&option==4)){
                executeOption(option);
            }
        }while (option != 5);
        menu.showMessage(menu.EXIT);
    }

    /**
     * Method that gets an option from the method run and calls the method selected.
     * @param option is an integer that contains the number of the option that we will select in the menu showed.
     */
    // Aquesta funció reb la opcio que hem demanat en el run() i hi tenim un switch amb els diferents cases.
    private void executeOption(int option) {
            switch (option) {
                case 1:
                    //Cridem la funció per crear Charecters
                    createChar();
                    break;
                case 2:
                    //Cridem la funció per llistar Charecters
                    listChar();
                    break;
                case 3:
                    //Cridem la funció per crear Aventures
                    createAdventure();
                    break;
                case 4:
                    //Iniciar una aventura
                    startGame();
                default:
                    break;
            }}


    /**
     * This method function is creating the character using characterManager to create it.
     * @return a boolean that only function is exit the method, the information provided it's irrelevant.
     */
    //Aquesta funció ens retorna un valor boolea d'aquesta manera ens es més facil d'interrompre
    // la funcio en qualsevol moment que volguem.
    // La ideia prinsipal és anar guardant totes les dades en variables i
    // si aribem al final de tot que vol dir que tot ha anat be sense errors, ho guardem tot al json
    private boolean createChar(){
        //Primer demanem el nom del Charecter, si compleix amb les condicions ens retornara el nom de la
        // manera correcte, sino, ens retornara un string null.
        String a = menu.askForString(menu.ASK_NAME);
        //Aqui comprovem que el nom que ens retorna és null. Si ho és retornem false i finalitzem la funció
        // Sino vol dir que el format del nom és correcte i podem seguir.
        if (a==null){
            return false;
        }
        //Ara mirem si aquest nom ja esta registrat en el json. com en el cas anterior, si existeix finaltzem
        //la funcio i indiquem que ja existeix, sino podem seguir.
        if (characterManager.findName(a)){
            menu.showMessage(menu.NAME_EXIST);
            return false;
        }
        //Ara demanem el nom del jugador, aquest no te cap restriccio aixi que no hem de comprovar res.
        String b = menu.askForStr(String.format(menu.WELCOME,a));
        // ara demanem l'experiencia que volem.
        menu.showMessage(menu.ASK_EXP);
        // El valor que volem ha d'estar entre [1-10].
        int c = menu.askForInteger("Incorrect level",1,10);
        //Mostrem el nivell que s'ha seleccionat
        menu.showMessage(String.format(menu.LVL_MSG,c));
        //ara tirem 3 daus per a les 3 estadistiques.
        int[] d = characterManager.tirarDau();
        int[] e = characterManager.tirarDau();
        int[] f = characterManager.tirarDau();
        //Mostrem els valors que ens han sortit al tirar els daus
        menu.showMessage(String.format(menu.SHOW_STATES,d[0],d[1],d[2],e[0],e[1],e[2],f[0],f[1],f[2]));
        //calculem les estadistiques a partir dels valors que ens han donat els daus.
        d[0]= characterManager.generateStadistics(d[0]);
        e[0]= characterManager.generateStadistics(e[0]);
        f[0]= characterManager.generateStadistics(f[0]);
        //mostrem les estadistiques.
        menu.showMessage(String.format(menu.SHOW_STATES_2,d[0],e[0],f[0]));
        //Demanem quina Clase és el personatge
        menu.showMessage("\nTavern keeper: “Looking good!”\n" +
                "“And, lastly, ?”\n");
        String g = "";
        String gg = "";
        //Demanem  una de les 3 clases, si no ens introdueix la clase correctament es tornara a demanar fins que
        // sigui correcte
        while (g=="") {
            g = menu.askForString("\n-> Enter the character’s initial class [Adventurer, Cleric, Wizard]: ");
            if(g==null){
                g="";
            }
            //cridem una funcio del manager que ens mira si el personatge evoluciona o no.
            gg = characterManager.calcClass(g,c);
            if(gg.equalsIgnoreCase("")){
                menu.showMessage("Invalid class");
                g="";
            }else {
                menu.showMessage("\nTavern keeper: “Any decent party needs one of those.”\n"
                        );
                //si la clase que ens retorna el manager és diferen al que s'ha introduit vol dir que ha evolucionat
                if (!gg.equalsIgnoreCase(g)){
                    menu.showMessage("\"“I guess that means you’re a "+gg+ " by now, nice!”\n");
                }

            }
        }
        //Ara creem el nou personatge amb les dades anteriors.
        characterManager.createCharacter(a,b,c,d[0],e[0],f[0],gg);

        //Mostrem un misatge indicant que s'ha creat correctament i finalitzem la funcio.
        menu.showMessage(String.format(menu.CHARACTER_CREATED,a));
        return true;
    }

    /**
     * Method that lists all characters and if is needed delete it, uses characterManager and Menu to get information
     * from the user.
     * @return a boolean, as the previous method it's only propose it's break the method when needed.
     */
    //En aquesta funció llistem els Characters
    private boolean listChar(){
        //Aquest string l'utilitzarem per anar acomulant els Characters que mostrarem per consola.
        String lists = "";
        // Creem un arrayList que és on hi anirem guardant els noms dels Characters.
        List<String> list = new ArrayList<>();
        // Demanem el nom del "player".
        String name =menu.askForStr(menu.ASK_NAME_LIST);
        //Busquem en el json els characters d'aquest player, si el nom que ens han introduit és "",
        // ens retornara tots els characters.
        list = characterManager.listAllCharacters(name);
        //Si la llista esta buida vol dir que no hi ha cap personatge i finalitzem.
        if(list.size()==0){
            menu.showMessage(menu.NO_PLAYER);
            return false;}
        else {
            //Si en canvi si que hi ha minim un character, printem el seguent comentari.
            menu.showMessage(menu.COMENT_1);
            // I fem un bucle on en el string lists anem llistant els characters.
            for(int i = 0; i < list.size(); ++i){
                //Creem un index que l'utilitzem per llistar els characters en la string lists.
                int index = i + 1;
                //Per llistar els characters, en la string lists, la string lists l'utilitzem com un acomulador
                // on hi anem guardant els characters amb un index al davant.
                lists = lists + " "+index + ". " + list.get(i) + "\n";}
            // Despres de finalitzar el for hi afegim una ulitma linea que es la opcio 0 i la pregunta
            // de quin character es vol seleccionar.
            lists=lists+"\n 0. Back\n\nWho would you like to meet [0.."+list.size()+"]:";}
        //El seguent integer és on hi guardem la opcio que s'escull, en el cas de que es seleccioni una
        //opcio que estigui fora del rang, ens retorna un 0 i l'int pasara a valdre -1.
        int ans = (menu.askForInteger("Incorrect value, try again: ",0,list.size(), lists))-1;
        //Si l'ans val -1 vol dir que s'ha seleccionat la opcio back o un index incorrecte, i en aquest cas
        //surtim de la funció
        if (ans==-1){
            return false;
        } else{
            //en el cas de que es seleccioni un character, mostrem un misatge on apareix el nom del personatge seleccionat
            // i totes les seves dades
            menu.showMessage(String.format(menu.SHOW_STATES_3,list.get(ans),characterManager.getAllData(list.get(ans))));}
        // Llavors demanem que ens introdueixi el seu nom per a eliminar-lo
        menu.showMessage(menu.DELETE);
        //per a poder eliminar-lo s'ha d'introduir correctament el seu nom, si s'introduiex incorrectament 3 cops no l'esborrem
        // per aquest motiu hem utlitzar un for que com a maxim demana el nom 3 cops, si el nom introduit
        // cuincideix amb el del personatge es procedieix a esborrar-lo, si el nom introduit es "" es finalitza la funcio
        // si s'introduix malament 3 cops es finalitza la funcio sense esborrar el personatge.
        for(int i=0; i<3; ++i){
            name = (menu.askForStr(String.format(menu.DELETE_2,list.get(ans))));
            if(name.equalsIgnoreCase(list.get(ans))){
                characterManager.removeCharacter(list.get(ans));
                menu.showMessage(String.format(menu.DELETE_3,list.get(ans)));
                return false;
            } else if (name=="") {
                return false;}
            menu.showMessage("Incorrect name");}
        return false;
    }


    /**
     * This Method creates the adventure and uses adventureManager to create it.
     * @return a boolean only to break the method easily, it's information is irrelevant.
     */
    // La seguent funció es per crear aventures, com en el cas de crear charecters, aqui anem guardan
    // tota la informació en variables i arrays i al final de tot la guardem al json.
    private boolean createAdventure(){
        // Demanem el nom de l'aventura
        String name = menu.askForStr(menu.NAME_ADVENTURE);
        // Si el nom ja existeix, surtim de la funció
        if (adventureManager.findName(name)){
            menu.showMessage(menu.NAME_EXIST);
            return false;
        }
        // Si el nom es unic, procedim a crear unes variables que ens servian mes endevant
        int en= 0;
        int boss = 0;
        int aen= 1;
        int x=0;
        int option = 0;
        // Creem un array de 2 dimencions on hi guardem els monstres que tenim en el json
        // Hi guardem 3 informacions en el primer index que depenen del segon index que aquest te una dimensio de 3
        // Quan el segon index val 0, en l'index 1 hi tenim els noms dels monstres, quan
        // val 1, hi tenim el tipus i quan val 2, hi tindrem les quantitats que per defete ara tots son 0.
        // Com que l'array l'hem declarat com a string la quantitat la guardem en aquest format.
        String[][] data = adventureManager.listMonster();
        //Tot seguit construim el string que ens serveix per llistar els monstres.
        String moList = "\n";
        for (int a=0; a <data.length;++a){
            moList= moList + (a+1)+". " +data[a][0]+ " ("+data[a][1]+")\n";
        }
        String monster = "";
        //Demanem quants encounters te l'aventura, aixo ho fem 3 cops, si s'introduix incorrectament 3 cops
        //finalitzem la funcio. Si l'encounter introduit és correcte seguim.
        menu.showMessage(menu.ASK_ENCOUNTERS);
        for (int i=0; i<3; ++i){
            en = menu.askForInteger("Invalid encounters",1,4,menu.ASK_ENCOUNTERS_2);
            if (en != 0){
                i=3;
            }
            if ( i==2 && en == 0){
                return false;
            }}
        //Tot seguit creem un array de 3 dimensions, on en el primer index
        //hi guardarem el nom del monstre, el tipus i la quantitat. Com es guarda aquesta informacio
        // depen del segon index, quan aquest segon val 0, en el primer index hi trovarem els noms,
        //  quan val 1, hi trovarem el tipus, i quan val 2 hi trovarem la quantitat.
        // El terser index depen dels encounters que hi te en combat.
        String[][][] finaldata = new String[data.length][3][en];
        menu.showMessage(String.format(menu.SHOW_ENCOUNTERS,en));
        //Fem un bucle on anem demanats els monstres
        do{
            x=0;
            monster = "";
            int number=0;
            //Mostrem quin encounter estem que depen de la variable en que val 1 al prinsipi i que anem augmentant
            // cada cop que abancem amb els encounters
            menu.showMessage(String.format(menu.ACTUAL_ENCOUNTER,aen,en));
            // Fem un bucle on mirem a l'array data si hi ha algun monstre amb una quantitat diferent a 0,
            // Si hi ha, en la string monster hi guardem el nom i la quantitat, aquesta string actua com un acomulador
            // i sumem un 1 a la variable x que actua com a index d'aquest acomulador i l'utilitzem mes endevant.
            for (int a=0; a < data.length;++a){
                if (data[a][2] != "0"){
                    monster = monster +(x+1)+". " +data[a][0]+" (x" +data[a][2]+")\n";
                    x++;
                }
            }
            //Despres mirem si la variable x val 0 que vol dir que en el for anterior no hem trovat cap quantitat
            // de monstres i printem el missatge EMPTY, en el cas contrari que es que tenim un monstre minim
            // printem el string monster.
            if (x==0){
                menu.showMessage(menu.EMPTY);
            }else{
                menu.showMessage(monster);
            }
            //Llavors demanem una opcio, afegir, eliminar o contiuar.
            menu.showMessage(menu.ADVENTURE_OPTIONS);
            //s'ha de seleccionar una d'aquestes opcions, no es continuara fins que la opció que
            // s'intridueix sigui correcte
            do {
                option = menu.askForInteger("Incorrect Option", 1, 3, menu.ADVENTURE_OPTIONS_2);
            }while (option==0);
            //Una vegata tenim la opcio utilitzem un switch
            switch (option) {
                case 1:
                    //En el cas de afegir un monstre a la llista, primer llistem tots els monstres
                    boss=0;
                    menu.showMessage(moList);
                    //Despres demanem que ens seleccioni un, si la seleccio no esta dintre del rang, fem break
                    int mo =menu.askForInteger("Incorrect Option",1,data.length,"\nChoose a monster to add [1.."+data.length+"]:")-1;
                    if (mo==-1){
                        break;
                    }
                    //Mirem si el monstre que ens ha seleccionat es un boss i si a la llista ja hi ha un
                    //En el cas afirmatiu fem break, si no tenim un boss a la llista o no ens ha seleccionat un boss
                    //procedim
                    if (data[mo][1].contains("Boss")){
                        for (int a=1; a< data.length;a++){
                            if (data[a][1].contains("Boss")&& data[a][2]!="0"){
                                menu.showMessage("There are a Boss already\n");
                                boss=1;
                            }
                        }
                    }
                    if(boss==1){
                        break;
                    }
                    //Demanem quants volem afegur
                    int ma = menu.askForAnOption("How many "+data[mo][0]+" do you want to add: ");
                    //Si el monstre seleccionat es un boss i es vol afegir més d'un fem break
                    if (data[mo][1].contains("Boss")&&ma>1){
                        menu.showMessage("Can't have more t'han one Boss");
                        break;
                    }
                    //Utilitzem un try catch pel fet de que volem cambiar la quantitat del monstre que tenim a l'array
                    //a Integer podria produir-se un error en la conversió, no hauria. i li sumem la quantitat introduida
                    try{
                         number= Integer.parseInt(data[mo][2]) + ma;
                    }
                    catch (NumberFormatException ex){
                        ex.printStackTrace();
                    }
                    // Si l'hi sumem una quantitat diferent a 0 guardem la suma total en l'array. I fem break perque ja
                    //hem acabat
                    if(ma!=0){
                        data[mo][2]= Integer.toString(number);}
                    break;
                case 2:
                    //En aquest cas eliminem un monstre de la llista creada
                    if(x==0){
                        //Si la llista esta buida no hi podem fer res
                        menu.showMessage("No monsters to remove\n");
                        break;
                    }
                    //De la llista que tenim actualment demanem quin monstre es vol eliminar,
                    //aprofitem la variable x te tindra el valor de monstres diferents guardats
                    int dindex = menu.askForInteger("incorrect option",1,x,"-> Which monster do you want to delete: ");
                    //Si s'introduix un valor incorrecte break.
                    if (dindex==0){
                        break;
                    }
                    //Llavors, sobre l'array data busquem els monstres que volem eliminar i cambiem la quantitat que
                    //hi teniem a 0.
                    for (int a=1; a< data.length;a++){
                        if (data[a][2]!="0"){
                            if (x==1){
                                data[a][2]="0";
                                break;
                            }else{
                                x--;
                            }
                        }
                    }
                    break;
                case 3:
                    //En aquest cas volem avançar amb l'aventura i el que fem és guardar els monstres que tenen una quantitat
                    //diferent a 0 a l'array finaldata i tornar a deixar a 0 totes les quantitats de l'arrat data.
                    for(int a=0; a< data.length;a++){
                        if(data[a][2]!="0"){
                            finaldata[a][0][aen-1]=data[a][0];
                            finaldata[a][1][aen-1]=data[a][1];
                            finaldata[a][2][aen-1]=data[a][2];
                            data[a][2]="0";
                        }
                    }
                    //Augmentem a 1 el valor de l'encounter actual
                    aen++;
                    break;
                default:
                    break;}
        //Ens mantenim en aquest Do fins que l'encounter actual sigui mes gran al total.
        }while (aen<=en);
        //Finalment guardem l'aventura.
        adventureManager.createAdventure(name,en,finaldata);
        return false;
    }

    /**
     * Method that gets all the information needed to start a game, and then pas it to GameManager to play it
     * @return a boolean to break the method.
     */
    private boolean startGame(){
        //Misatge que ens indica que s'esta iniciant una aventura
        menu.showMessage(menu.ADVENTURE_MSG);
        //Llegim totes les aventures que tenim guardades i les mostrem
        ArrayList<String> adventures = adventureManager.getAdventures();
        for (int i = 0; i < adventures.size(); i++) {
            menu.showMessage((i+1) + ". " + adventures.get(i)+"\n");
        }
        //Es demana que se seleccioni una aventura, si l'aventura que s'indica no està dintre del rang demanat
        //Es retornara al menu principal
        int ans = (menu.askForInteger("Incorrect value",0,adventures.size(), menu.ASK_ADVENTURE))-1;
        if (ans==-1){
            return false;
        }
        //Utilitzem la funcio del characterManager per a que ens retorni tots els personatges
        List<String> list2 = characterManager.listAllCharacters("");
        int maxParty=5;
        //Pot pasar que tinguem menys de 5 personatges creats, per evitar futurs problemes, el rang maxim de personatges
        //a afegir a la parti sera igual a els que tenim disponibles, si tenim 5 o mes llavors si que podrem seleccionar
        //5 com a maxim.
        if (list2.size()<5){
            maxParty=list2.size();
        }
        //Si el numero de membres no cuincideix amb el demanat tornem al menu principal
        int ch = menu.askForInteger("Incorrect value", 3,maxParty,String.format(menu.ASK_CHARACTERS,adventures.get(ans),maxParty));
        if (ch==0){
            return false;
        }
        menu.showMessage(String.format(menu.ASK_CHARACTERS_2,ch));

        String charList = "";
        for(int i = 0; i < list2.size(); ++i){
            //Per llistar els characters, en el string charList l'utilitzem com un acomulador
            // on hi anem guardant els characters amb un index al davant.
            charList = charList + " "+(i+1) + ". " + list2.get(i) + "\n";}
        //Aquest array es fa servir per acomular els noms dels personatges que formaran part de la party
        List<String> party = new ArrayList<>();
        //Inicialitzem l'array part amb tants Empty's com el nobre de personatges que han de formar part a la party
        for (int i = 0; i < ch; i++) {
            party.add("Empty");
        }
        //Aqui anem afegint els personatges a la party fins que estigui plena
        for (int i = 0; i < party.size(); i++) {
            menu.showMessage(String.format(menu.ASK_PARTY,(i+1),ch));
            for (int j = 0; j < ch; j++) {
                menu.showMessage(" "+(j+1)+". "+ party.get(j)+"\n");
            }
            menu.showMessage(menu.ASK_PARTY_2+charList+"\n");
            int ch2 = (menu.askForInteger("Invalid choice",0,list2.size(), String.format(menu.ASK_MEMBER,(i+1))))-1;
            if(ch2==-1){
                i--;
            }else if(party.contains(list2.get(ch2))) {
                menu.showMessage("Character already exists in the party");
                i--;}
            else{
            party.set(i,list2.get(ch2));}
        }
        menu.showMessage(String.format(menu.ASK_PARTY,ch,ch));
        for (int i = 0; i < party.size() ; i++) {
            menu.showMessage(" "+(i+1)+". "+ party.get(i)+"\n");
        }
        ArrayList<Character> CGL= new ArrayList<>();
        for (int i = 0; i < party.size() ; i++) {
            CGL.add(characterManager.getCharacter(party.get(i)));
        }

        //Mostrem misatge de que s'inicialitze l'aventura
        menu.showMessage(String.format(menu.END_MEMBER,adventures.get(ans)));
        //Finalment cridel el gameManager pasant-li la party i l'aventura que volem.
        menu.showMessage(gameManager.iniciarAventura( CGL, adventures.get(ans)));
        return false;
    }
    //Aquesta funció serveix per mostrar tot lo que esta pasant en el gameManager, aqui el controller fa de listener
    //mitjançant l'interpreter GameListener

    /**
     *Method that gets all the events that are happening in during the game and show it to the user throw menu.
     * @param msg a string that contains the information that we need to show to the user.
     */
    @Override
    public void notifyGameEvents(String msg) {
        menu.showMessage(msg);
    }
}



