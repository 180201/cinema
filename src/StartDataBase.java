import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 * Created by Winiu on 31-12-2015.
 */
public class StartDataBase {
    public static void main(String[] args) {

        String myID ="1";
        String lastName = null;

        System.out.println("sadasdsad");
        try {
            //lastName = new TestDatabase().lookUpFullname(myID);
            lastName = Database.login("aa", "aa");
        }catch (SQLException e){
            System.err.println("dupa nie dziala");
            e.printStackTrace();
        }
        System.out.println(lastName);

    }
}
