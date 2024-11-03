package resources.utils;

import net.datafaker.Faker;

public class DataGenerator {
    
    static Faker faker = new Faker();
    public static String getRandomInteger(int size){
        return faker.number().digits(size);
    }

    public static String getFullName(){
        return faker.name().fullName();
    }
    
}
