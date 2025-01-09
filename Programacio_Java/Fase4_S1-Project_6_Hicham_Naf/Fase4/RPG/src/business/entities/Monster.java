package business.entities;
//Clase per fer les instancies dels monstres

/**
 * Class that represents the monster.
 *
 * @author Hicham Naf
 * @version 4.0
 */
public class Monster {
        private String name;
        private String challenge;
        private int experience;
        private int hitPoints;
        private int initiative;
        private String damageDice;
        private String damageType;

    /**
     * Constructor of the class monster.
     * @param name String that indicates the name of the monster
     * @param challenge String that indicates the class of the monster
     * @param experience Integer that indicates the experience amount that will be won if it's defeated.
     * @param hitPoints Integer that contains the  monster's life.
     * @param initiative Integer that indicates the initiative of the monster.
     * @param damageDice String that contains the dice to calculate the damage of the monster.
     * @param damageType String that contains the damage type of the monster.
     */
    public Monster(String name, String challenge, int experience, int hitPoints, int initiative, String damageDice, String damageType) {
        this.name = name;
        this.challenge = challenge;
        this.experience = experience;
        this.hitPoints = hitPoints;
        this.initiative = initiative;
        this.damageDice = damageDice;
        this.damageType = damageType;
    }

    /**
     * function that return the name of a monster (getter)
     * @return String that indicates monster name
     */
    public String getName() {
        return name;
    }

    /**
     * Method that returns the monster challenge
     * @return String that indicates monster challenge
     */

    public String getChallenge() {
        return challenge;
    }

    /**
     * Method that returns the experience
     * @return Integer that indicates the experience
     */
    public int getExperience() {
        return experience;
    }

    /**
     * Method that returns the hit Point
     * @return Integer that indicates teh hitPoint
     */
    public int getHitPoints() {
        return hitPoints;
    }

    /**
     * Method that returns the initiative
     * @return Integer that indicates the initiative
     */
    public int getInitiative() {
        return initiative;
    }

    /**
     * Method that returns the damage dice
     * @return String that indicates the damage Dice
     */
    public String getDamageDice() {
        return damageDice;
    }

    /**
     * Methood that returns the damage type
     * @return String that indicates the damage type.
     */
    public String getDamageType() {
        return damageType;
    }

}
