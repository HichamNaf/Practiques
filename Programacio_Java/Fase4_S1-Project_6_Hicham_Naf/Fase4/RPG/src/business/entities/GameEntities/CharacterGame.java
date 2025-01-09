package business.entities.GameEntities;

import business.entities.Character;

import java.util.ArrayList;

/**
 * Abstract Class that that represents the character in the game
 * @author Hicham Naf
 * @version 4.0
 */
public abstract class CharacterGame implements Comparable<CharacterGame> {

    private String name;
    private int xp;
    private int shield;
    private int maxLife;
    private int actualLife;
    private int round;
    private String sortBy;

    /**
     * Constructor of the characterGame class
     * @param name String that contains the character name
     * @param xp Integer that contains the experience
     */
    public CharacterGame(String name, int xp) {
        this.name = name;
        this.xp = xp;
    }


    /**
     * Copy constructor of the class Contender.
     * @param characterGame contender to copy
     */
    public CharacterGame(CharacterGame characterGame) {

        this.name = characterGame.name;
        this.xp = characterGame.xp;
        this.round = characterGame.round;
        this.sortBy = "r";
        this.maxLife= calculateMaxLife();
        this.actualLife = calculateMaxLife();
    }

    /**
     * getter that returns the name
     * @return String that contains the name
     */
    public  String getName(){return name;}

    /**
     * getter that returns the experience
     * @return Integer that indicates the experience
     */

    public int getXp(){return xp;}

    /**
     * getter that returns the player name
     * @return String that indicates the player name
     */
    public abstract String getPlayer();

    /**
     * Method that is for receiving damage from the monsters
     * @param prob Integer the damage probability
     * @param damage Integer that contains the damage dealt
     * @param type String that contains the type of the monster
     */
    public abstract void takeDamage(int prob, int damage, String type);

    /**
     * getter that returns the round
     * @return Integer that indicates the round
     */
    public int getRound(){return round;}

    /**
     * getter that returns the actual life
     * @return Integer that indicates the actual life
     */
    public int getActualLife(){return actualLife;}
    /**
     * getter that returns the maximum life
     * @return Integer that indicates the maximum life
     */
    public int getMaxLife(){return maxLife;}
    /**
     * getter that returns the shield
     * @return Integer that indicates the shield
     */
    public int getShield(){return shield;}
    /**
     * setter that setts the shield
     * @param shield Integer shield quantity
     */
    public void setShield(int shield){
        this.shield=shield;
    }
    /**
     * setter that setts the actual life
     * @param life Integer that indicates the actual life
     */
    public void setActualLife(int life){this.actualLife=life;}

    /**
     * getter that returns the stat body
     * @return Integer that indicates the body
     */
    public abstract int getBody();
    /**
     * getter that returns the Type
     * @return String that indicates the Type
     */
    public abstract String getType();
    /**
     * getter that returns the attack type
     * @return String that indicates the atack type
     */
    public abstract String getAtackType();
    /**
     * getter that returns the stat mind
     * @return Integer that indicates the stat mind
     */
    public abstract int getMind();
    /**
     * getter that returns the stat spirit
     * @return Integer that indicates the spirit
     */

    public abstract int getSpirit();
    /**
     * getter that returns the Class name
     * @return String that indicates the Class name
     */

    public abstract String getClassName();
    /**
     * getter that returns all data
     * @return String that indicates all datta
     */
    public abstract String getAllData();
    /**
     * getter that returns the init
     * @return String that indicates init
     */
    public abstract String getInit();
    /**
     * Method that calculates the maximum life
     * @return Integer that indicates the life max
     */
    public abstract int calculateMaxLife();
    /**
     * Method that make the character passive
     * @param CGL Array list of party members
     * @return String that returns the text of the pasive made
     */

    public abstract String doPasive(ArrayList<CharacterGame> CGL);
    /**
     * Method that increment the spirit
     */
    public abstract void upSpirit();

    /**
     * Method that increment the spirit
     * @param mind Integer of amount mind to increment
     */

    public abstract void upMind(int mind);

    /**
     * Method that sort the list that contains this class instances by two diferents orders, by attack round of life.
     * @param o the object to be compared.
     * @return Integer that indicates the position.
     */

    public int compareTo(CharacterGame o) {
        Integer a = this.round;
        Integer b = o.getRound();
        Integer c = this.actualLife;
        Integer d = o.getActualLife();
        if (this.sortBy.contains("r")){
            return b.compareTo(a);
        }else {
            if(this.actualLife==0){
                c=9999;
            }
            if(o.getActualLife()==0){
                d=9999;
            }
            return c.compareTo(d);
        }
    }

    /**
     * setter to set the round
     */
    public abstract void setRound();

    /**
     * Method to set the number of the round
     * @param round Integer that indicates the round
     */
    public void setRound(int round){
        this.round=round;
    }
    //Igual que l'anterior pero per quan vulgui asignar l'ordre d'atac, no se li suma res.
    /**
     * Method to set the number of the round of atack
     * @param round Integer that indicates the round of atack
     */
    public void setRoundG(int round) {
        this.round = round;
    }
    //funcio que em permet canviar la manera d'ordenar l'array

    /**
     * Setter fot the sortBy that indicates if this class will be sort by round or life
     * @param sortBy String that gets r if will be sorted by roun or l if it will be sorted by life.
     */
    public void setSortBy(String sortBy) {
        this.sortBy = sortBy;
    }

    /**
     * Method that construct the string format of character life
     * @return String that indicates the actual life
     */
    public String getLife(){
        return String.format("- %s\t\t\t %d / %d hit points %s\n",getName(),actualLife,maxLife,(shield>0) ? "(Shield: "+shield+")" : "");
    }

    /**
     * getter that returns the dice of the damage
     * @param targets Integer that indicates the number of oponents
     * @return String the dice of damage
     */
    public abstract String getDamage(int targets);

    /**
     * Method that make the attack action
     * @param atack Integer the hit probability
     * @param damage Integer the damage
     * @param MGL Array list of all monsters oponents
     * @param CGL Array list of all the party
     * @return String of the atack
     */
    public abstract String getAtack(int atack, int damage, ArrayList<MonsterG> MGL, ArrayList<CharacterGame> CGL);

    /**
     * Method to heal the character
     * @param heal Integer of quantity of healing
     * @param overheal boolean that indicates if its overheal
     */
    public void heal(int heal,boolean overheal){
        int actLife =actualLife+heal;
        if (actLife>maxLife&&!overheal){
            actualLife=maxLife;
        }else {
            actualLife=actLife;
        }
    }

    /**
     * method that returns the level of the character
     * @return Integer that indicates the level
     */

    public int getLvl() {
        String xps;
        int xp = this.xp;
        for (int i=1;i<10;++i){
            xps= Integer.toString(xp);
            if (xps.length()<3){
                return i;
            }else{
                xp= xp-100;
            }

        }
        return 10;
    }

    /**
     * Method for the character that adds experience
     * @param gainExp Integer that indicates the experience to add.
     */
    public void gainExp(int gainExp){
        int actLvl = getLvl();
        xp= xp+gainExp;
        int nextLvl = getLvl();
        if(actLvl!=nextLvl){
            maxLife = calculateMaxLife();
            actualLife = maxLife;
        }
    }

    /**
     * Method that is for upgrading the character class
     * @return this class bus can be diferent
     */
    public abstract Character upgradeCharacterClass();

    /**
     * Method that returns if he changed class or not
     * @param class_ String that indicates the previeus class
     * @return String that indicates the actual class
     */
    public abstract String classUp(String class_);

    /**
     * Method that make the rest action
     * @param cgl array list of all characters
     * @return String of the rest action
     */
    public abstract String getRest(ArrayList<CharacterGame> cgl);

    /**
     * Method that sets the start life
     */
    public void setStartLife(){
        maxLife=calculateMaxLife();
        actualLife=getMaxLife();
    }

    /**
     * Setter for the experience
     * @param xp Integer experience
     */

    public void setXp(int xp) {
        this.xp=xp;
    }
}

