package business;

import business.entities.Adventure;
import business.entities.AdventureMonster;
import business.entities.GameEntities.MonsterG;
import business.entities.Monster;
import persistence.AdventureDAO;
import persistence.AdventureDAOGSON;
import persistence.MonsterDAO;
import persistence.MonstersDAOGSON;

import java.util.ArrayList;
import java.util.List;

/**
 * Class that contains all the method needed related to manage an adventure.
 *
 * @author Hicham Naf
 * @version 4.0
 */
public class AdventureManager {
    private AdventureDAO adventureDAO;
    private MonsterDAO monstersDAO;
    //Consturctor de l'AdventureManager, aquest manager utlilitza els dos DAO de monstres i adventures.

    /**
     * Constructor that creates the DAO needed to create and read adventures and monsters
     * @param adventureDAO instance of class adventureDAO
     * @param monstersDAO instance of class monsterDAO
     */
    public AdventureManager(AdventureDAO adventureDAO, MonsterDAO monstersDAO){

        this.adventureDAO = adventureDAO;
        this.monstersDAO = monstersDAO;
    }
    //Aquesta funcio serveix per crear una aventura

    /**
     * Method that creates an adventure in the percistence, it needs the name of the adventure, the number of encounters
     * and a matrix that contains the monsters name, numbers and what encounter will be.
     * @param adventure String that contains the name of the encounter
     * @param encounters Integer that contanins the number of encounters of the game
     * @param monster Matrix that contains the monsters, they number and what encounter will be.
     */
    public void createAdventure(String adventure, int encounters, String[][][] monster){
        //Creem un array de la clase AdventureMonster
        List<AdventureMonster> mL = new ArrayList<>();

        AdventureMonster aM = new AdventureMonster(0, "", "", 0);
        //Llavors anme guardant els monstres de l'arry monster en aquest array de classes
        for (int i = 0; i < monster.length; ++i) {
                for(int k = 0; k < monster[i][0].length; ++k) {
                    if(monster[i][2][k]!=null){
                        aM = new AdventureMonster(k+1,monster[i][0][k],monster[i][1][k],Integer.parseInt(monster[i][2][k]));
                        mL.add(aM);
                    }
                }
        }
        //Finalment guardem tot en una classe Adventure
        Adventure adventures = new Adventure(adventure, encounters, (ArrayList<AdventureMonster>) mL);
        //I ho guardem al json
        adventureDAO.createAdventure(adventures);
    }
    //Aquesta funcio la utilitzem per obtenir els monstres que hi han al json monstres

    /**
     * Method that I use to get all the monsters from persistence .
     * @return String matrix that contains the name of the monster, and they challenge.
     */
    public String[][] listMonster(){
        //Primer guardem els monstres del json en un array de clases.
        Monster[] monstersList = monstersDAO.readAll();
        //Creem un array amb la longitut del total de monstres que tenim
        String data[][] = new String[monstersList.length][3];
        int i = 0;
        //En aquest array hi guardem el nom del monstre, el tipus i la quantitat que per defecte és 0.
        for (Monster monster : monstersList) {
            data[i][0] = monster.getName();
            data[i][1] = monster.getChallenge();
            data[i][2] = "0";
            i++;
        }
        return data;
    }
    //L'utilitzem per buscar el nom d'una aventura en el json.

    /**
     * Method that search an adventure name in persistence
     * @param name String name of the adventure
     * @return boolean, true if the name exists or false if not.
     */
    public boolean findName(String name){
        Adventure[] advList = adventureDAO.readAll();
        if (advList==null){
            return false;
        }
        for (Adventure adv : advList) {
            if (name.equalsIgnoreCase(adv.getName())){
                return true;
            }
        }
        return false;
    }

    /**
     * Method that return an Array list of the names of the adventures saved.
     * @return Array list of all the names of the daventures in persistence.
     */
    public ArrayList<String> getAdventures(){
        Adventure[] advList = adventureDAO.readAll();
        ArrayList<String> list = new ArrayList<>();
        for (Adventure adv : advList) {
            list.add(adv.getName());
        }
        return list;
    }
    //Aquesta funcio ens serveix per llistar tots els monstres d'un encounter a un array
    //Primer llagim json d'aventures i ho guardem en un array
    //Despres busquem en aquesta llista busquem l'aventura amb el nom que ens interesa
    //Despres extrellem l'array de AdventureMonstrer d'aquesta aventura
    // En aquesta llista de monstres, un per un, primer extrellem la quantitat de monstres que necesitem d'aquest tipus
    // i la guardem en una variable, llavors fem un bucle amb la llista de monstres del json monsters.json
    // i si el nom del monstre que volem coinsideix amb el de la llista de monstres i també l'encounter, guardem
    // el total de monstres que volem en la llista  MGL que és la que retornarem al final

    /**
     * Method that gets the name of the adventure and the encounter, and return a list of the monsters that are in the
     * encounter.
     * @param adventure String name of the adventure
     * @param encounter Integer number of the encounter
     * @return List of MonsterG that contains all the monsters.
     */
    public List<MonsterG> getMonsters(String adventure, int encounter) {
        List<MonsterG> MGL = new ArrayList<>();
        Monster[] ML = monstersDAO.readAll();
        Adventure[] AllAdv = adventureDAO.readAll();
        for (Adventure adv : AllAdv) {
            if (adventure.equalsIgnoreCase(adv.getName())) {
                List<AdventureMonster> mL = adv.getMonster();
                for (AdventureMonster monst : mL) {
                    int q = monst.getQuantity();
                    for (Monster monstL : ML) {
                        if (monstL.getName().equals(monst.getName()) && monst.getEncounter() == encounter) {
                            for (int i = 0; i < q; i++) {
                                MonsterG M = new MonsterG(monstL.getName(), monstL.getChallenge(), monstL.getExperience(), monstL.getHitPoints(),
                                        monstL.getInitiative(), monstL.getDamageDice(), monstL.getDamageType());
                                MGL.add(M);
                            }
                        }
                    }
                }
            }
        }
        return MGL;
    }
    //Funcio que ens retorna el numero d'encounters que te l'aventura que li demanem.

    /**
     * Method that gets the name of one adventure and returns the number of encounters that they have.
     * @param name String name of the adventure
     * @return Integer number of the adventure encounters.
     */
        public int getEncounters(String name){
            Adventure[] AllAdv = adventureDAO.readAll();
            for (Adventure adv : AllAdv) {
                if (name.equalsIgnoreCase(adv.getName())){
                    return adv.getEncounters();
                }
        }
            return 0;
    }
    //Funció que retorna una matriu dels monstres i les quantitats d'una aventura i encounter en especific.

    /**
     * Method that gets the name of an adventure and one especific encounter and return all the names of the monsters
     * an the quantity.
     * @param adventure String name of the adventure
     * @param encounter Integer the encounter
     * @return Matrix that contains the name of the monsters and the quantity.
     */
    public String[][] monstersQuantity(String adventure, int encounter){

        Adventure[] AllAdv = adventureDAO.readAll();
        List<String> monsters= new ArrayList<>();
        List<String> quantity = new ArrayList<>();
        for (Adventure adv : AllAdv) {
            if (adventure.equalsIgnoreCase(adv.getName())){
                List<AdventureMonster> mL = adv.getMonster();
                for (AdventureMonster monst : mL) {
                    if(monst.getEncounter()==encounter){
                        monsters.add(monst.getName());
                        quantity.add(Integer.toString(monst.getQuantity()));
                    }
                }
                }
                }
        String[][] mo = new String[monsters.size()][2];
        for (int i = 0; i < monsters.size(); i++) {
            mo[i][0] = monsters.get(i);
            mo[i][1] = quantity.get(i);
            }
        return mo;
    }

    }

