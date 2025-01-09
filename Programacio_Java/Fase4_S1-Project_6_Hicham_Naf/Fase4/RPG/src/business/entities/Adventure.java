package business.entities;

import java.util.ArrayList;

/**
 * Class that represents an adventure
 * @author Hicham Naf
 * @version 4.0
 */

public class Adventure {
    private String name;
    private int encounters;
    private ArrayList<AdventureMonster> monster;
    //Clase per fer les instancies de les aventures, te un array format per la classe AdventureMonsters

    /**
     * Constructor of the class adventure
     * @param name String that contains the name of the adventure
     * @param encounters Integer that contains the total encounters
     * @param monster Array list of AdventureMonster
     */
    public Adventure(String name, int encounters, ArrayList<AdventureMonster> monster){
        this.name = name;
        this.encounters = encounters;
        this.monster = monster;
    }

    /**
     * getter of the adventure name
     * @return String of the name
     */

    public String getName() {
        return name;
    }

    /**
     * getter of the number of encounters
     * @return Integer of the encounters
     */
    public int getEncounters() {
        return encounters;
    }

    /**
     * geter of the Array list of adventure Monsters
     * @return Array list of adventure Monster.
     */
    public ArrayList<AdventureMonster> getMonster() {
        return monster;
    }
}
