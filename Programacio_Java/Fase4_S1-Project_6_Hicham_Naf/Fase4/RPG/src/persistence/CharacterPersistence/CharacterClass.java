package persistence.CharacterPersistence;

import business.entities.Character;
import business.entities.Characters.*;
import com.google.gson.*;

import java.lang.reflect.Type;

/**
 * Class that contains the methods needed to serialize and deserialize a abstract class to adapt it to a proper format to can
 * save it in persistence.
 *
 * @author Hicham Naf
 * @version 4.0
 */

public class CharacterClass implements JsonDeserializer<Character>, JsonSerializer<Character>{
    /**
     * Method that deserialize a saved content to the class Character
     * @param json the element that we will deserialize
     * @param typeOfT the type
     * @param context json parameter needed
     * @return a list of all Character's deserialized
     */
    @Override
    public Character deserialize(JsonElement json, Type typeOfT, JsonDeserializationContext context) throws JsonParseException {
        JsonObject jsonObject = json.getAsJsonObject();

        String name = jsonObject.get("name").getAsString();
        String player = jsonObject.get("player").getAsString();
        int xp = jsonObject.get("xp").getAsInt();
        int body = jsonObject.get("body").getAsInt();
        int mind = jsonObject.get("mind").getAsInt();
        int spirit = jsonObject.get("spirit").getAsInt();
        String classe = jsonObject.get("class").getAsString();

        return switch (classe) {
            case "Adventurer" -> new Adventurer(name, player, xp, body, mind, spirit);
            case "Warrior" -> new Warrior(name, player, xp, body, mind, spirit);
            case "Champion" -> new Champion(name, player, xp, body, mind, spirit);
            case "Cleric" -> new Cleric(name, player, xp, body, mind, spirit);
            case "Paladin" -> new Paladin(name, player, xp, body, mind, spirit);
            default -> new Wizard(name, player, xp, body, mind, spirit);
        };
    }

    /**
     * method that convert the class in the json format to save it properly.
     * @param character instance of one character to save it
     * @param context json parameter needed
     * @param type is the type.
     * @return a json object with the proper format to save it in a file.
     */
    @Override
    public JsonElement serialize(Character character, Type type, JsonSerializationContext context) {
        JsonObject jsonObject = new JsonObject();
        jsonObject.add("name", context.serialize(character.getName()));
        jsonObject.add("player", context.serialize(character.getPlayer()));
        jsonObject.add("xp", context.serialize(character.getXp()));
        jsonObject.add("body", context.serialize(character.getBody()));
        jsonObject.add("mind", context.serialize(character.getMind()));
        jsonObject.add("spirit", context.serialize(character.getSpirit()));
        jsonObject.add("class", context.serialize(character.getClassName()));
        return jsonObject;
    }
}
