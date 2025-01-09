package business;

import java.util.concurrent.ThreadLocalRandom;

/**
 * Class that contains the methods to calculate the random numbers.
 * @author Hicham Naf
 * @version 4.0
 */
public class Calculs {
    //Aquesta funció és per tirar els daus.
    // rebem un string que pot tindre dos formats, dX, YdX.
    //utilitzem un if, si en el string que rebem a la primera posicio es una 'd', vol dir que
    // el seu format es dX i nomes hem de tirar un dau del valor X
    //En canvi si a la primera posicio del string no es una 'd' vol dir que hem de tirar multiples daus
    // i tenim el format YdX, en aquest cas fem un split de 'd' on obteim el valor Y que ens indica el
    //numero de daus que hem de tirar i el valr X que és el valor del dau.

    /**
     * Method that gets mulitiple dices and return all the values get.
     * @param dau String format of the dice.
     * @return an Array list of all the values.
     */
    public static int[] tirarDau(String dau){
        int dau2 = 0;
        int[] randomNum = {0,0,0};
        randomNum[0]=0;
        if('d' == dau.charAt(0)){
            dau = dau.replace("d", "");
            dau2 = Integer.parseInt(dau);
            randomNum[0] = ThreadLocalRandom.current().nextInt(1, dau2);
            return randomNum;
        }else{
            String[] dauA = dau.split("d");
            int nDaus = Integer.parseInt(dauA[0]);
            dau2 = Integer.parseInt(dauA[1]);
            for(int i=0; i<nDaus;++i){
                randomNum[i+1] = ThreadLocalRandom.current().nextInt(1, dau2);
                randomNum[0] = randomNum[0] + randomNum[i+1];
            }
            return randomNum;
        }


    }
    //Aquesta funció es exactament la mateixa que l'anterior pero en lloc de retornar-nos un array, ens retorna
    //un sol integer amb el resultat de les tirades.

    /**
     * Its the same as the previous method but it only returns a string of the total value of the dices. It's easier
     * to work with an Integer than with a list.
     * @param dau String of the dice.
     * @return an Integer that contains the total values of the dice trowed.
     */
    public static int tirarDau2(String dau){
        int dau2 = 0;
        int[] randomNum = {0,0,0};
        randomNum[0]=0;
        if('d' == dau.charAt(0)){
            dau = dau.replace("d", "");
            dau2 = Integer.parseInt(dau);
            if(dau2==1){
                return 1;
            }else{
            randomNum[0] = ThreadLocalRandom.current().nextInt(1, dau2);
            return randomNum[0];}
        }else{
            String[] dauA = dau.split("d");
            int nDaus = Integer.parseInt(dauA[0]);
            dau2 = Integer.parseInt(dauA[1]);
            for(int i=0; i<nDaus;++i){
                randomNum[i+1] = ThreadLocalRandom.current().nextInt(1, dau2);
                randomNum[0] = randomNum[0] + randomNum[i+1];
            }
            return randomNum[0];
        }
}}
