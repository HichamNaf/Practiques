package business;
import business.entities.Character;
import business.entities.GameEntities.CharacterGame;
import business.entities.GameEntities.MonsterG;
import java.util.*;

/**
 *Class that do all related to playing a game.
 *
 * @author Hicham Naf
 * @version 4.0
 */
public class GameManager {
    //El gameManager s'encarrega de tota la gestio de l'aventura. Fa servir els dos altres managers i te un listener
    //per a comunicar-se amb el Controller i dir-li tot el que esta pasant dintre de l'aventura.
    private CharacterManager characterManager;
    private AdventureManager adventureManager;
    private  GameListener listener;

    //Consturctor del GameManager, aquest GameManager utlilitza els altres dos Managers.

    /**
     * Constructor of the GameManager gets the other two managers to load the game and monsters, and get the Party characters and save the experience.
     * @param characterManager instance of characterManager to get the characters needed from persistence.
     * @param adventureManager instance of adventureManager to get the adventure and monsters from persistence.
     */
    public GameManager(CharacterManager characterManager, AdventureManager adventureManager){

        this.characterManager = characterManager;
        this.adventureManager = adventureManager;
        listener = null;

    }
    //Afegim un listener a la clase

    /**
     * Method that creates the listener of this game that is the Controller.
     * @param listener saves the GameListener to talk with the Controller.
     */
    public void addListener(GameListener listener) {
        this.listener = listener;
    }
    //Alguns strings principals
    String PREPARATION_STAGE = "---------------------\n\n\n-------------------------\n" +
            "*** Preparation stage ***\n" +
            "-------------------------\n";
    String ROLLING = "\n\nRolling initiative...\n";
    String COMBAT_STAGE = "\n\n--------------------\n" +
            "*** Combat stage ***\n" +
            "--------------------\n";
    String ROUND = "\nRound %d:\nParty:\n";
    String SHORT_REST = "\n\n------------------------\n" +
            "*** Short rest stage ***\n" +
            "------------------------\n";
    String GAIN_EXP = "\n%s gains %d xp.";
    String END_ADVENTURE_SUCCES = "\n\n Congratulations, your party completed “%s”\n";
    String END_ADVENTURE_FAIL= "\nTavern keeper: “Lad, wake up. Yes, your party fell unconscious.”\n"+
            "“Don’t worry, you are safe back at the Tavern.”\n\n";
    //Funcio que s'encarrega de l'aventura, reb la party i l'aventura que han de completar.

    /**
     * Method that starts the adventure and do all the game from start to the end. It only needs a list of the characters
     * that will play the game, and the name of the adventure. At the end will save the experience gained in persistence.
     * @param party an ArrayList of all the characters that will play the game.
     * @param aventura a String that contains the name of the game.
     * @return a String that don't have anything relevant. it can be void, actually.
     */
    public String iniciarAventura(ArrayList<Character> party , String aventura){
        //En l'anterior fase utilitzava un acomulador per notificar lo que ha pasat, en aquesta fase tot pasa per la
        //interficie
        String acomulador = "";
        //Crear un arraylist que tindra tota la party
        ArrayList<CharacterGame> CGL= new ArrayList<>();
        CGL.addAll(party);
        for (CharacterGame cgl:CGL){
            cgl.setStartLife();

        }
        //Mirem quants encounters te l'aventura actual.
        int encounters = adventureManager.getEncounters(aventura);
        //La ideia general és comensar amb un bucle gran que comensa amb la primera aventura i quan aquesta acaba
        //incrementa en 1 fins arribar a la ultima, ja que en totes les aventures es fa el mateix.
        for (int i = 0; i < encounters ; i++) {
            //Aquest integer hi vaic acomulant l'experiencia total dels monstres que hi ha en cada encounter
            //quan s'acaba un encounter amb tots els monstres derotats, aquesta experiencia se suma a tots els personatges.
            int totalExp=0;
            //Crear l'array list que conte tots els monstres de l'aventura i encounter que toca.
            List<MonsterG> MMGL = adventureManager.getMonsters(aventura, i+1);
            ArrayList<MonsterG>MGL= new ArrayList<>(MMGL);
            //matriu amb els monstres i quantitats
            String[][] monsters = adventureManager.monstersQuantity(aventura, i+1);
            //sempre que vulguem mostrar alguna cosa cridem l'interpreter i li notifica al controller
            listener.notifyGameEvents("\n\n---------------------\nStarting Encounter "+(i+1)+":\n");
            //Mostrar els monstres i les quantitats.
            for (int j = 0; j < monsters.length; j++) {
                listener.notifyGameEvents(" - "+monsters[j][1]+"x "+monsters[j][0]+"\n");
            }
            listener.notifyGameEvents(PREPARATION_STAGE);
            //Amb aquest for els personatges utilitzen les seves pasives.
            //Algunes pasives tenen efectes en arrea així que he utilitzar la funcio forEach que em permet
            //fer un set a totes les clases sense la necesitat de fer un for i fer el set un per un.
            for (CharacterGame cgl: CGL){
                listener.notifyGameEvents(cgl.doPasive(CGL)+"\n");
            }
            listener.notifyGameEvents(ROLLING);
            //Calcular les iniciatives de tots
            int initiative;
            for (CharacterGame cgl: CGL){
                cgl.setRound();
                cgl.setSortBy("r");
            }
            for (MonsterG mgl: MGL){
                initiative = Calculs.tirarDau2("d12");
                mgl.setRound(initiative);
                totalExp=totalExp+mgl.getExperience();
            }
            //Amb aquest Sort el que faic és ordenar els dos arrays per ordre d'iniciativa, de mes gran a més petit.
            Collections.sort(CGL);
            Collections.sort(MGL);
            int in = 0;
            int lastMo= 0;
            int round = 0;
            //Ara que tinc totes les iniciatives, el que faic en aquest for és asignar l'ordre en el que han d'atacar,
            //si dos iniciatives son iguales dono prioritat als personatges i no els monstres.
            //És una mica complicat esplicar el funcionament pero la ideia general del que he fet
            // és fer un bucle de l'array list dels monstres comensant pel primer fins a l'ultim i comparar
            //la seva inciativa amb tota l'array de personatges, si la iniciativa del personatge és mes gran doncs se li asigna
            //el valor de round i despres s'incrementa.
            //Per a que funcioni correctament és important que els dos arrays estiguin ordenats en ordre de iniciativa.
            //Mentres s'asignen les rondes aprofitu per canviar la variable sortBy per poder ordenar en funcio de la vida actual.
            for (MonsterG mgl: MGL){
                //Crear variables necesaries
                int in2 = 0;
                int in3 = 0;
                //Si numero de personatges és més gran que variable in
                if(in<=CGL.size()){

                for (CharacterGame cgl: CGL){

                    if(in2>=in) {

                        if ((cgl.getRound() >= mgl.getRound())) {
                            listener.notifyGameEvents(String.format(" - %d\t\t %s\n",cgl.getRound(),cgl.getName()));
                            cgl.setRoundG(round);
                            cgl.setSortBy("l");
                            round=round+1;
                            in=in+1;
                        } else {
                            listener.notifyGameEvents(String.format(" - %d\t\t %s\n",mgl.getRound(),mgl.getName()));
                            in3 =1;
                            mgl.setRoundG(round);
                            mgl.setSortBy("l");
                            round=round+1;
                            break;
                        }
                    }
                    in2=in2+1;
                    }
                }
                if(in3==0){
                    listener.notifyGameEvents(String.format(" - %d\t\t %s\n",mgl.getRound(),mgl.getName()));
                    mgl.setRoundG(round);
                    mgl.setSortBy("l");
                    round=round+1;
                }
                lastMo++;
                if(lastMo==MGL.size()){
                    in2=0;
                    for (CharacterGame cgl: CGL){
                        if(in2>=in) {
                                listener.notifyGameEvents(String.format(" - %d\t\t %s\n",cgl.getRound(),cgl.getName()));
                                cgl.setRoundG(round);
                                cgl.setSortBy("l");
                                round=round+1;}
                    in2++;}
                }
                }
            listener.notifyGameEvents(COMBAT_STAGE);

            round = 1;
            //Ara que tots tenen un ordre d'atac definit, utilitzu un while true que dura fins que els personatges
            //guanyin o perdin
            while (true){
                listener.notifyGameEvents(String.format(ROUND,round));
                //Mostrar les vides dels personatges
                for(CharacterGame cgl: CGL){
                    listener.notifyGameEvents(cgl.getLife());
                }
                //La ideia general d'aquest bucle és utilitzar una variable j, que és compararà amb l'ordre d'atac
                //de tots, qui tingui el mateix i estigui viu vol dir que l'hi toca atacar.
                for (int j = 0; j < CGL.size()+MGL.size(); j++) {
                    List<String> Targets = new ArrayList<String>();
                    List<String> TargetsParty = new ArrayList<String>();
                    int atack;
                    int damage;
                    Collections.sort(MGL);
                    Collections.sort(CGL);
                    for (CharacterGame cgl: CGL) {
                        Targets.clear();
                        if(j==cgl.getRound() && cgl.getActualLife()>0){
                            if(MGL.get(0).getActualLife()!=0){
                                for(MonsterG mgl: MGL){
                                    //Acomulem els monstres vius en la llista Target per fer atacs en area
                                    if(mgl.getActualLife()!=0){
                                    Targets.add(mgl.getName());}else{break;}
                                }
                                atack = Calculs.tirarDau2("d10");
                                damage = Calculs.tirarDau2(cgl.getDamage(Targets.size()));
                                listener.notifyGameEvents(cgl.getAtack(atack,damage,MGL,CGL));}}}
                    for (MonsterG mgl: MGL) {
                        if(j==mgl.getRound() && mgl.getActualLife()>0){
                            if(CGL.get(0).getActualLife()!=0){
                                atack = Calculs.tirarDau2("d10");
                                damage = Calculs.tirarDau2(mgl.getDamageDice());
                                    int lifeChar=0;
                                    Targets.clear();
                                    for(CharacterGame cgl: CGL){
                                        if(cgl.getActualLife()>0){
                                            lifeChar++;
                                            Targets.add(cgl.getName());
                                        }
                                    }
                                        int CharAtack = Calculs.tirarDau2("d"+lifeChar);
                                        listener.notifyGameEvents(mgl.getAtack(Targets, CharAtack,atack,damage));
                                        if(mgl.getChallenge().equalsIgnoreCase("Boss")){
                                            for (int k = 0; k < Targets.size(); k++) {
                                                CGL.get(k).takeDamage(atack,damage,mgl.getDamageType());
                                                if(CGL.get(k).getActualLife()==0){

                                                    listener.notifyGameEvents(CGL.get(k).getName()+" dies.\n");
                                                }
                                            }
                                        }else {
                                        CGL.get(CharAtack-1).takeDamage(atack,damage,mgl.getDamageType());
                                        if(CGL.get(CharAtack-1).getActualLife()==0){

                                            listener.notifyGameEvents(CGL.get(CharAtack-1).getName()+" dies.\n");
                                        }}
                        }
                    }
                }
            }
                //Quan s'acaba una ronda d'atacs ordenem les arrays per ordre de vida
                listener.notifyGameEvents("\nEnd of round "+round+". \n");
                round++;
                Collections.sort(CGL);
                Collections.sort(MGL);
                //Si el primer personatge de l'array te 0 de vida vol dir que tota la party esta inconcient,
                //ja que el primer sempre és qui te menys vida de tots i no esta inconcient.
                if(CGL.get(0).getActualLife()==0){
                    listener.notifyGameEvents(END_ADVENTURE_FAIL);
                    for(CharacterGame cgl: CGL){
                        characterManager.saveExperience(cgl.getName(),cgl.getXp());
                    }
                    return acomulador;
                }//Si no és el cas, comprovem ara si el primer monstre te 0 de vida, si és el cas acabem l'encounter,
                //sinó comensem una altre ronda.
                if(MGL.get(0).getActualLife()==0){
                    listener.notifyGameEvents("All enemies are defeated.");
                    break;
                }
            }
            //Quan s'acaba l'encounter es fa el short rest.
            listener.notifyGameEvents(SHORT_REST);
            //En aquest bucle sels hi afegeix l'experiencia guanyada en aquest encounter i es mira si pujen de nivell i
            //si evolucionen.
            for(CharacterGame cgl: CGL){
                int actlvl= cgl.getLvl();

                String actClass = cgl.getClassName();
                cgl.gainExp(totalExp);
                int nextlvl= cgl.getLvl();
                listener.notifyGameEvents(String.format(GAIN_EXP,cgl.getName(),totalExp));
                if (actlvl!=nextlvl){
                    cgl = cgl.upgradeCharacterClass();
                    listener.notifyGameEvents(cgl.classUp(actClass));
                }
            }
            listener.notifyGameEvents("\n\n");
            //Despres de guanyar experiencia, en aquesta part es fan les havilitats, si estan inconcients no fan res.
            for(CharacterGame cgl: CGL){
                if(cgl.getActualLife()!=0){
                    listener.notifyGameEvents("\n"+cgl.getRest(CGL));
                }
                else{
                    listener.notifyGameEvents("\n"+cgl.getName()+ " is unconscious");
                }
            }
    }
        //Finalment quan s'han acabat tots els encounters i han derotat a tots els monstres, en aquest for és guarda
        //l'experiencia guanyada.
        for(CharacterGame cgl: CGL){
            characterManager.saveExperience(cgl.getName(),cgl.getXp());
        }
        listener.notifyGameEvents(String.format(END_ADVENTURE_SUCCES,aventura));
        //Ara que he utilitzat un interpreter la variable acomulador esta buida i nomes em serveix per tornar al menu principal
        return acomulador;
}}
