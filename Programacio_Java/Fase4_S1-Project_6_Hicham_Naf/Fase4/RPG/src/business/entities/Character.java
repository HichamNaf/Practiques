package business.entities;

import business.entities.GameEntities.CharacterGame;

/**
 * Class that represent a character
 *
 * @author Hicham Naf
 * @version 4.0
 */
public abstract class Character extends CharacterGame {
    private final String player;
    private int body;
    private int mind;
    private int spirit;
    //En el json hem de guardar una variable anomenada class, pero no la podem utilitzar directament així
    //que he utilitzat el SerializeName per a poder utilitzar aquest nom.


    //Constructor del Character

    /**
     * Character constructor
     * @param name String that indicates the name of the character
     * @param player String that indicates the name of the player
     * @param xp Integer that indicates the experience of the character
     * @param body Integer that indicates the stat body
     * @param mind Integer that indicates the stat mind
     * @param spirit Integer that indicates the stat spirit
     */
    public Character(String name, String player, int xp, int body, int mind, int spirit) {
        super(name, xp);
        this.player = player;
        this.body = body;
        this.mind = mind;
        this.spirit = spirit;
    }

    /**
     * Copy of constructor of the class character.
     * @param character the character that we need to copy
     */
    public Character(Character character) {
        super(character);
        this.player = character.player;
        this.body = character.body;
        this.mind = character.mind;
        this.spirit = character.spirit;
    }

    /**
     * getter that return the players name
     * @return String that indicates the players name
     */
    public String getPlayer() {
        return player;
    }
    /**
     * getter that return the stat body
     * @return Integer that indicates the character body
     */
    public int getBody() {
        return body;
    }
    /**
     * getter that return the stat mind
     * @return Integer that indicates the character mind
     */
    public int getMind() {
        return mind;
    }
    /**
     * getter that return the stat spirit
     * @return Integer that indicates the character spirit
     */
    public int getSpirit() {
        return spirit;
    }
    /**
     * getter that return the character class name
     * @return String that indicates the class name
     */
    public String getClassName() {
        return getClass().getSimpleName();
    }

    /***
     * Method that returns a string that indicates all de character information
     * @return String that contains all the information
     */
    public String getAllData(){
        int lvl = getLvl(getXp());
        String data = String.format("" +
                "* Name:   %s\n" +
                "* Player: %s\n" +
                "* Class:  %s\n" +
                "* Level:  %d\n" +
                "* XP:     %d\n" +
                "* Body:   %+d\n" +
                "* Mind:   %+d\n" +
                "* Spirit: %+d\n",getName(),player,getClassName(),lvl,getXp(),body,mind,spirit);
        return data;
    }

    /**
     * Method that calculate the level
     * @param xp Integer that contains the experience
     * @return Integer The level according to this experience
     */
    public int getLvl(int xp){
        String xps;
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
     * Method that adds one spirit.
     */
    public void upSpirit(){
        this.spirit++;
    }

    /**
     * Method that adds an amount to the stat mind
     * @param mind Integer that indicates the amount that we will add to the current mind.
     */
    public void upMind(int mind){
        this.mind=this.mind+mind;
    }

    /**
     * Method that upgrades the actual class and return it.
     * @return the instance of the class uppgraded.
     */

    public Character upgradeCharacterClass() {
        return this;
    }

}
