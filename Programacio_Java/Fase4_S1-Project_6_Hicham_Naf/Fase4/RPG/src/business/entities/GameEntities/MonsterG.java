package business.entities.GameEntities;

import business.entities.Monster;

import java.util.List;
//Clase que és una extencio de la clase Monster on hi afegim la vida i iniciativa, tambe implementa Comparable per poder
//ordenar un array d'aquestes instancies com es vulgui.

/**
 * Class that represents the monster in the game its an extension of the class Monster
 * @author Hicham Naf
 * @version 4.0
 */
public class MonsterG extends Monster implements Comparable<MonsterG> {
    private int maxLife;
    private int actualLife;
    private int round;
    private String sortBy;
    //Constructor

    /**
     * Constructor of the class MonsterG
     * @param name String that indicates the name of the monster
     * @param challenge String that indicates the class of the monster
     * @param experience Integer that indicates the experience amount that will be won if it's defeated.
     * @param hitPoints Integer that contains the  monster's life.
     * @param initiative Integer that indicates the initiative of the monster.
     * @param damageDice String that contains the dice to calculate the damage of the monster.
     * @param damageType String that contains the damage type of the monster.
     */
    public MonsterG(String name, String challenge, int experience, int hitPoints, int initiative, String damageDice, String damageType) {
        super(name, challenge, experience, hitPoints, initiative, damageDice, damageType);
        this.maxLife = hitPoints;
        this.actualLife = hitPoints;
        this.round = 0;
        this.sortBy= "r";
    }
    //Asigna la iniciativa del monstre

    /**
     * Method that asigns the initiative of the monster
     * @param round Integer that indicates the initiative
     */
    public void setRound(int round) {
        this.round = round + getInitiative();
    }
    //Asigna el turn d'atac del monstre

    /**
     * Method that asigns the attack turn
     * @param round Integer that indicates the attack turn
     */
    public void setRoundG(int round) {
        this.round = round;
    }
    //Comparable que ens ordena l'array d'instancies de monsterG segons dos maneres, igual que CharacterG

    /**
     * Method that sort the list that contains this class instances by two diferents orders, by attack round of life.
     * @param o the object to be compared.
     * @return Integer that indicates the position.
     */
    @Override
    public int compareTo(MonsterG o) {
        Integer a = this.round;
        Integer b = o.getRound();
        Integer c = this.actualLife;
        Integer d = o.getActualLife();
        if (this.sortBy.contains("r")){
            return b.compareTo(a);
        }else {
            if(this.actualLife==0){
                c=999;
            }
            if(o.getActualLife()==0){
                d=999;
            }
            return c.compareTo(d);
        }
    }

    /**
     * Setter fot the sortBy that indicates if this class will be sort by round or life
     * @param sortBy String that gets r if will be sorted by roun or l if it will be sorted by life.
     */
    public void setSortBy(String sortBy) {
        this.sortBy = sortBy;
    }

    /**
     * Getter that returns the actual life
     * @return Integer that indicates the actual life
     */

    public int getActualLife() {
        return actualLife;
    }

    /**
     * getter that returns the round
     * @return Integer that indicates the round.
     */
    public int getRound() {
        return round;
    }
    //per rebre mal, depen de la provabilitat i el dany que l'hi fan i si es boss i del mateix tipus de mal.

    /**
     * Method that reduces the monsters life based on the damage taken.
     * @param prob Integer that indicates the probability of hit
     * @param damage Integer that indicates the damage received
     * @param tipe String that indicates the type of the atacker.
     * @return String that returns empty if the monster still a life or the message that is dead.
     */
    public String takeDamage(int prob, int damage, String tipe){
        if(getChallenge().contains("Boss")&&getDamageType().contains(tipe)){
            float d= damage;
            damage = (int) Math.floor(d/2);
        }
        if(prob==1){
        }else if (prob==10){
            if(2*damage>this.actualLife ){
                this.actualLife=0;
                return getName()+" dies.\n";
            }else{
                this.actualLife = this.actualLife - 2*damage;}
        }else{
            if(damage>this.actualLife ){
                this.actualLife=0;
                return getName()+" dies.\n";
            }else{
                this.actualLife = this.actualLife - damage;}
            }
        return "";
        }
        //Retorna el text de a qui ataca i quan de mal fa

    /**
     * Method that returns the text of who will attack and the damage deal.
     * @param Target List of String of the targets,
     * @param Index Integer of the random index target that will be attacked it the monster isn't a boss
     * @param prob Integer the probability of the attack
     * @param damage Integer the damage dealt
     * @return String of the text for the monster attack.
     */
    public String getAtack(List<String> Target,Integer Index, int prob, int damage){
        String oponent = "";
        if(getChallenge().contains("Boss")){
            oponent = oponent + " "+Target.get(0);
            for (int i = 1; i <Target.size()-1 ; i++) {
                oponent = oponent + ", "+Target.get(i);
            }
            oponent = oponent + " and "+ Target.get(Target.size()-1);
        }else {
            oponent = Target.get(Index-1);
        }
        String atack = "\n"+getName()+" attacks "+oponent+".\n";
        if(prob==1){
            return atack+"Fails and deals 0 "+ getDamageType() + " damage.\n";
        } else if (prob==10){
            return atack+"Critic hit and deals " + 2*damage + " "+ getDamageType()+" damage.\n";
        }else{
            return atack+"Hits and deals " + damage + " "+ getDamageType()+" damage.\n";
        }
    }
}
