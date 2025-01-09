package business.entities.Characters;

import business.Calculs;
import business.entities.Character;
import business.entities.GameEntities.CharacterGame;
import business.entities.GameEntities.MonsterG;

import java.util.ArrayList;
/**
 * Class that represents the character type "Cleric".
 *
 * @author Hicham Naf
 * @version 4.0
 */
public class Cleric extends Character {
    /**
     * Constructor for the class cleric
     * @param name String that indicates the name of the character
     * @param player String that indicates the name of the player
     * @param xp Integer that indicates the experience of the character
     * @param body Integer that indicates the stat body
     * @param mind Integer that indicates the stat mind
     * @param spirit Integer that indicates the stat spirit
     */
    public Cleric(String name, String player, int xp, int body, int mind, int spirit) {
        super(name, player, xp, body, mind, spirit);
    }
    /**
     * Copy of the constructor for the class cleric
     * @param character instance of class Character
     */
    public Cleric(Character character) {
        super(character);
    }
    /**
     * getter that returns the type of the attack
     * @return String that returns the type
     */
    public String getType(){
        return "Psychical";
    }
    /**
     * Method that make the passive action
     * @param party Array list of party members
     * @return String indicating the action performed
     */
    public String doPasive(ArrayList<CharacterGame> party){

        for (CharacterGame character : party) {
            character.upMind(1);
        }
        return getName() + " uses Prayer of good luck. Everyone’s Mind increases in +1.";
    }
    /**
     * Method that calculates the initiative
     */
    public void setRound(){
        int init= Calculs.tirarDau2(getInit());
        setRound(init+getSpirit());
    }
    /**
     * getter that returns the name of the attack
     * @return String that returns the name of the attack
     */
    public String getAtackType(){
        return "Not on my watch";
    }
    /**
     * Method that calculates the life
     * @return Integer that indicates the life
     */
    public int calculateMaxLife(){return (10 + getBody()) * getLvl(getXp());}
    /**
     * getter that returns the init dice
     * @return String that returns the init dice
     */
    public String getInit(){
        return "d10";
    }
    /**
     * Getter that returns the damage dice
     * @param targets Integer that indicates the number of oponents
     * @return String that indicates the damage dice
     */
    public String getDamage(int targets){
            return "d4";
    }
    /**
     * Method that make the attack action
     * @param atack Integer the hit probability
     * @param damage Integer the damage
     * @param targets Array list of all monsters oponents
     * @param party Array list of all the party
     * @return String of the atack
     */
    public String getAtack(int atack, int damage, ArrayList<MonsterG> targets, ArrayList<CharacterGame> party){
        String healParty="";
        int heal = Calculs.tirarDau2("d10")+getMind();
        if (party.get(0).getActualLife()>0&&party.get(0).getActualLife()<((party.get(0).getMaxLife())/2)){
            healParty = party.get(0).getName();
            party.get(0).heal(heal,false);
            return "\n"+getName()+" uses Prayer of  healing. Heals "+heal+" hit points to "+healParty+".";}

        else {
            String type = targets.get(0).getDamageType();
            String name = targets.get(0).getName();
            String dead = targets.get(0).takeDamage(atack,damage,getType());
            String atacker = "\n"+getName()+" attacks "+name+" with "+ getAtackType()+".";
            if(atack==1){
                return atacker+"\nFails and deals 0 "+ type + " damage.\n"+dead;
            }else if (atack==10){
                return atacker+"\nCritic hit and deals " + 2*damage + " "+ type+" damage.\n"+dead;
            } else{
                return atacker+"\nHits and deals " + damage + " "+ type+" damage.\n"+dead;
            }
        }
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
        if (1 <= getLvl() && getLvl() <= 4) {
            return this;
        } else {
            return new Paladin(this);
        }
    }
    /**
     * Method that returns if he changed class or not
     * @param class_ String that indicates the previeus class
     * @return String that indicates the actual class
     */
    public String classUp(String class_){
        String lvlup = getName()+" levels up. They are now lvl "+getLvl()+"!";
        return lvlup;
    }
    /**
     * Method that make the rest action
     * @param cgl array list of all characters
     * @return String of the rest action
     */
    public String getRest(ArrayList<CharacterGame> cgl){
        int heal = Calculs.tirarDau2("d10")+getMind();
        heal(heal,false);
        return String.format("%s uses Prayer of self-healing. Heals %d hit points.",getName(),heal);
    }
}
