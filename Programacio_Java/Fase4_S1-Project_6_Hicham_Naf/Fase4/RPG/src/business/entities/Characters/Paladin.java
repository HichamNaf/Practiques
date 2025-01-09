package business.entities.Characters;

import business.Calculs;
import business.entities.Character;
import business.entities.GameEntities.CharacterGame;
import business.entities.GameEntities.MonsterG;

import java.util.ArrayList;
import java.util.concurrent.ThreadLocalRandom;
/**
 * Class that represents the character type "Paladin".
 *
 * @author Hicham Naf
 * @version 4.0
 */
public class Paladin extends Cleric{
    /**
     * Constructor for the class paladin
     * @param name String that indicates the name of the character
     * @param player String that indicates the name of the player
     * @param xp Integer that indicates the experience of the character
     * @param body Integer that indicates the stat body
     * @param mind Integer that indicates the stat mind
     * @param spirit Integer that indicates the stat spirit
     */
    public Paladin(String name, String player, int xp, int body, int mind, int spirit) {
        super(name, player, xp, body, mind, spirit);
    }
    /**
     * Copy of the constructor for the class paladin
     * @param character instance of class Character
     */
    public Paladin(Character character) {
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
        int mind= Calculs.tirarDau2("d3");

        for (CharacterGame character : party) {
            character.upMind(mind);
        }
        return getName() + " uses Blessing of good luck. Everyone’s Mind increases in "+mind+".";
    }
    /**
     * getter that returns the name of the attack
     * @return String that returns the name of the attack
     */
    public String getAtackType(){
        return "Never on my watch";
    }
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
    public String getDamage(int targets) {
        return "d8";
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
        int heal = damage+getMind();
        int index = 0;
        if(targets.size()>1){
            index=ThreadLocalRandom.current().nextInt(0, targets.size()-1);}

        if(party.get(0).getActualLife()>0&&party.get(0).getActualLife()<((party.get(0).getMaxLife())/2)){
            for (CharacterGame cgll:party) {
                healParty = healParty + ((healParty.equals("")) ? "" : " ,")+cgll.getName() ;
                cgll.heal(heal,true);
            }
            return "\n"+getName()+" uses Prayer of  healing. Heals "+heal+" hit points to "+healParty+".";}
        else {
            String type = targets.get(index).getDamageType();
            String name = targets.get(index).getName();
            String dead = targets.get(index).takeDamage(atack,damage,getType());
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
            if(type.equals(getType())){
                float d = damage;
                damage= (int) Math.floor(d/2);
            }

        if(damage>getActualLife() ){
            setActualLife(0);
        }else{
            setActualLife(getActualLife() - damage);}}
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
        if(class_.equals("Paladin")){
            return lvlup;}
        return lvlup+"\n"+getName() + " evolves to Paladin!\n";
    }
    /**
     * Method that make the rest action
     * @param cgl array list of all characters
     * @return String of the rest action
     */
    public String getRest(ArrayList<CharacterGame> cgl){
        int heal = Calculs.tirarDau2("d10")+getMind();
        String target ="";
        for (CharacterGame ccgl: cgl){
            ccgl.heal(heal,false);
            target = target + ((target.equals("")) ? "" : " ,")+ccgl.getName() ;
        }
        return String.format("%s uses Prayer of mass-healing. Heals %d hit points to %s",getName(),heal,target);
    }
}
