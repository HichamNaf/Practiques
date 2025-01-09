package business.entities.Characters;

import business.entities.Character;
import business.entities.GameEntities.CharacterGame;

import java.util.ArrayList;
/**
 * Class that represents the character type "Champion".
 *
 * @author Hicham Naf
 * @version 4.0
 */
public class Champion extends Warrior{
    /**
     * Constructor for the class champion
     * @param name String that indicates the name of the character
     * @param player String that indicates the name of the player
     * @param xp Integer that indicates the experience of the character
     * @param body Integer that indicates the stat body
     * @param mind Integer that indicates the stat mind
     * @param spirit Integer that indicates the stat spirit
     */
    public Champion(String name, String player, int xp, int body, int mind, int spirit) {
        super(name, player, xp, body, mind, spirit);
    }
    /**
     * Copy of the constructor for the class champion
     * @param character instance of class Character
     */
    public Champion(Character character) {
        super(character);
    }
    /**
     * Method that calculates the life
     * @return Integer that indicates the life
     */
    public int calculateMaxLife(){return ((10 + getBody()) * getLvl(getXp()))+getBody()*getLvl(getXp());}

    /**
     * Method that make the passive action
     * @param party Array list of party members
     * @return String indicating the action performed
     */
    public String doPasive(ArrayList<CharacterGame> party){
        for (CharacterGame character : party) {
            character.upSpirit();
        }
        return getName() + " uses Motivational speech. Everyone’s Spirit increases in +1.";
    }
    /**
     * Method that is for upgrading the character class
     * @return this class bus can be diferent
     */
    public Character upgradeCharacterClass() {
        return this;
    }
    /**
     * Method that returns if he changed class or not
     * @param class_ String that indicates the previeus class
     * @return String that indicates the actual class
     */
    public String classUp(String class_){
        String lvlup = getName()+" levels up. They are now lvl "+getLvl()+"!";
        if(class_.equals("Champion")){
        return lvlup;}
        return lvlup + getName() + " evolves to Champion!\n";
    }
    /**
     * Method that make the rest action
     * @param cgl array list of all characters
     * @return String of the rest action
     */
    public String getRest(ArrayList<CharacterGame> cgl){
        heal(9999,false);
        return String.format("%s uses Improved Bandage time. Heals max hit points.",getName());
    }

}
