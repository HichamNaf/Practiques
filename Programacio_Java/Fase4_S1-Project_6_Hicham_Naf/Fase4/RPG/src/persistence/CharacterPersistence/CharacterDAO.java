package persistence.CharacterPersistence;

import business.entities.Character;

import java.util.List;

//Aquest interpreter carrega les funcions per poder llegir dels fichers json o la API.
/**
 * Interface that calls the method to read and write files on api or json, depend of the classe loaded.
 *
 */
public interface CharacterDAO {
    /**
     *method that write a list of characters.
     * @param character a list of type character to write in the persistence.
     */
    void writeAll(List<Character> character);

    /**
     * Method that returns a array of all characters saved.
     * @return array list of all characters.
     */
    Character[] readAll();

    /**
     * Method that save a unic character in the persistence.
     * @param character a instance of one character that we need to save.
     */
    void createCharacter(Character character);

    /**
     * Method that delete a character from persistence.
     * @param ind gets a integer of the index of the character that we need to delete.
     */
    void removeCharacter(int ind);
}
