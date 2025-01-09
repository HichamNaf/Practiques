package business.entities.Characters;

import business.Calculs;
import business.entities.Character;
import business.entities.GameEntities.CharacterGame;
import business.entities.GameEntities.MonsterG;

import java.util.ArrayList;
/**
 * Class that represents the character type "Wizard".
 *
 * @author Hicham Naf
 * @version 4.0
 */
public class Wizard extends Character {
    /**
     * Constructor for the class wizard
     * @param name String that indicates the name of the character
     * @param player String that indicates the name of the player
     * @param xp Integer that indicates the experience of the character
     * @param body Integer that indicates the stat body
     * @param mind Integer that indicates the stat mind
     * @param spirit Integer that indicates the stat spirit
     */
    public Wizard(String name, String player, int xp, int body, int mind, int spirit) {
        super(name, player, xp, body, mind, spirit);
    }
    /**
     * getter that returns the type of the attack
     * @return String that returns the type
     */
    public String getType(){
        return "Magical";
    }
    /**
     * Method that make the passive action
     * @param party Array list of party members
     * @return String indicating the action performed
     */
    public String doPasive(ArrayList<CharacterGame> party){
        int shield = (Calculs.tirarDau2("d6") + getMind()) * getLvl(getXp());
        setShield(shield);
        return getName() + " uses Mage shield. Shield recharges to " + shield + ".";
    }
    /**
     * Method that calculates the initiative
     */
    public void setRound(){
        int init= Calculs.tirarDau2(getInit());
        setRound(init+getMind());
    }
    /**
     * getter that returns the name of the attack
     * @return String that returns the name of the attack
     */
    public String getAtackType(){
        return "Fireball";
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
        return "d20";
    }
    /**
     * Getter that returns the damage dice
     * @param targets Integer that indicates the number of oponents
     * @return String that indicates the damage dice
     */
    public String getDamage(int targets){
            if (targets<3){
                return "d6";}
            else {
                return "d4";}
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
        int oponents =0;
        damage=damage+getMind();
        String type = getType();
        String atackType = "Arcane missile";
        String name="";
        String dead="";
        String atacker;
        for(MonsterG monst:targets){
            if(monst.getActualLife()!=0){
                oponents++;
            }
        }
        if(oponents>=3){
            atackType = getAtackType();
            for (int k = 0; k < oponents; k++) {
                dead= dead + targets.get(k).takeDamage(atack,damage,getType());
                name= name + ((name.equals("")) ? "" : " ,")+targets.get(k).getName() ;
            }
        }
        else {
            name = targets.get(oponents-1).getName();
            dead = targets.get(oponents-1).takeDamage(atack,damage,getType());}
            atacker = "\n"+getName()+" attacks "+name+" with "+ getAtackType()+".";
            if(atack==1){
                return atacker+"\nFails and deals 0 "+ type + " damage.\n"+dead;
            }else if (atack==10){
                return atacker+"\nCritic hit and deals " + 2*damage + " "+ type+" damage.\n"+dead;
            } else{
                return atacker+"\nHits and deals " + damage + " "+ type+" damage.\n"+dead;
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
                damage= (damage>getLvl(getXp())) ? damage-getLvl(getXp()) : 0;
            }

            if(damage>getShield()){
                damage = damage - getShield();
                setShield(0);
            }else {
                setShield(getShield() - damage);
                damage = 0;
            }
        if(damage>getActualLife() ){
            setActualLife(0);
        }else{
            setActualLife(getActualLife() - damage);}
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
        return String.format("%s is reading a book.",getName());
    }

}
