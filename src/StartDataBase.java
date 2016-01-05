import singleton.Move;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by Winiu on 31-12-2015.
 */
public class StartDataBase {
    public static void main(String[] args) {

        String myID ="1";
        String lastName = null;
        List<Move> moves = new ArrayList<>();
        System.out.println("sadasdsad");
        try {
            //lastName = new TestDatabase().lookUpFullname(myID);
            moves = Database.getMoves();
        }catch (SQLException e){
            System.err.println("dupa nie dziala");
            e.printStackTrace();
        }
        System.out.println(moves);

    }
}
