import DAO.Move;
import DAO.Reservation;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by Winiu on 31-12-2015.
 */
public class StartDataBase {
    public static void main(String[] args) {

        String myID ="9";
        int id=30;
        String lastName = null;
        Reservation reservation = null;
        List<Reservation> moves = new ArrayList<>();
   //     System.out.println("sadasdsad");
        try {
            moves = Database.getPlace(myID);
      //      Database.deleteReservation(id);
            reservation= Database.getOneReservation(id);
        }catch (SQLException e){
            System.err.println("dupa nie dziala");
            e.printStackTrace();
        }
        System.out.println(moves);

    }
}
