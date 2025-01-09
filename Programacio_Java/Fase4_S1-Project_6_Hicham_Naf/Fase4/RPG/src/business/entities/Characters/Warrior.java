package business.entities.Characters;

import business.entities.Character;
/**
 * Class that represents the character type "Warrior".
 *
 * @author Hicham Naf
 * @version 4.0
 */
public class Warrior extends Adventurer{
    /**
     * Constructor for the class warrior
     * @param name String that indicates the name of the character
     * @param player String that indicates the name of the player
     * @param xp Integer that indicates the experience of the character
     * @param body Integer that indicates the stat body
     * @param mind Integer that indicates the stat mind
     * @param spirit Integer that indicates the stat spirit
     */
    public Warrior(String name, String player, int xp, int body, int mind, int spirit) {
        super(name, player, xp, body, mind, spirit);
    }
    /**
     * Copy of the constructor for the class warrior
     * @param character instance of class Character
     */
    public Warrior(Character character) {
        super(character);
    }
    /**
     * getter that returns the name of the attack
     * @return String that returns the name of the attack
     */
    public String getAtackType(){
        return "Improved sword slash";
    };
    /**
     * Getter that returns the damage dice
     * @param targets Integer that indicates the number of oponents
     * @return String that indicates the damage dice
     */
    public String getDamage(int targets){
            return "d10";
    }
    /**
     * Method that is for receiving damage from the monsters
     * @param prob Integer the damage probability
     * @param damage Integer that contains the damage dealt
     * @param type String that contains the type of the monster
     */
    public void takeDamage(int prob, int damage, String type){
        if(prob==1){
        }else{
            if(type.equalsIgnoreCase(getType())){
                float d = damage;
                    damage= (int) Math.floor(d/2);
                }
        if(damage>getActualLife() ){
            setActualLife(0);
        }else{
            setActualLife(getActualLife() - damage);}
        }
    }
    /**
     * Method that is for upgrading the character class
     * @return this class bus can be diferent
     */
    public Character upgradeCharacterClass() {
        if (4 <= getLvl() && getLvl() <= 7) {
            return this;
        } else {
            return new Champion(this);
        }
    }
    /**
     * Method that returns if he changed class or not
     * @param class_ String that indicates the previeus class
     * @return String that indicates the actual class
     */
    public String classUp(String class_){
        String lvlup = getName()+" levels up. They are now lvl "+getLvl()+"!";
        if(class_.equals("Warrior")){
            return lvlup;}
        return lvlup + "\n"+getName() + " evolves to Warrior!\n";
    }
}
