package DAO;

/**
 * Created by Michał on 2015-12-25.
 */
public class User {
    private static User user;
    private Integer id;
    private String name;

    private String password;

     public static User getInstance(){
        return user;
    }
    public static void createInstance(Integer id, String name){
        user = new User();
        user.id = id;
        user.name = name;
    }
    public User (){}
    public Integer getId() {
        return id;
    }

    public void setId(Integer Id) {
        this.id = id;
    }

    public String getName() {return name;}

    public void setName(String name) {
        this.name = name;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
}
