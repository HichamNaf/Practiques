package business.entities;
//Clase que pertany a Adventure que guarda la informacio dels monstres que participen en l'aventura

/**
 * Class that form part of the class Adventure that save the information of the monsters inthe encounter.
 * @author Hicham Naf
 * @version 4.0
 */
public class AdventureMonster {
    private int encounter;
    private String name;
    private String challenge;
    private int quantity;

    /**
     * Constructor of the class AdventureMonster
     * @param encounter Integer that indicates the actual encounter
     * @param name String that indicates the name of the monster
     * @param challenge String that indicates the class of the monster
     * @param quantity Integer that indicates the quantity of this monster in the encounter.
     */

    public AdventureMonster(int encounter, String name, String challenge, int quantity) {
        this.encounter = encounter;
        this.name = name;
        this.challenge = challenge;
        this.quantity = quantity;
    }

    /**
     * getter for the actual encounter
     * @return Integer that indicates the encounter
     */

    public int getEncounter() {
        return encounter;
    }

    /**
     * getter for the monster name
     * @return String that indicates the name of the monster
     */
    public String getName() {
        return name;
    }

    /**
     * getter for the monster quantity
     * @return Integer that indicates the quantity of the monster.
     */
    public int getQuantity() {
        return quantity;
    }




}
