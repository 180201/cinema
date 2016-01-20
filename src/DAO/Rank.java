package DAO;

/**
 * Created by Winiu on 20-01-2016.
 */
public class Rank {
    private static Rank ourInstance = new Rank();

    public static Rank getInstance() {
        return ourInstance;
    }

    private String userRank;

    public String getUserRank() {
        return userRank;
    }

    public void setUserRank(String userRank) {
        this.userRank = userRank;
    }

    public String getAdminRank() {
        return adminRank;
    }

    public void setAdminRank(String adminRank) {
        this.adminRank = adminRank;
    }

    public String getCashierRank() {
        return cashierRank;
    }

    public void setCashierRank(String cashierRank) {
        this.cashierRank = cashierRank;
    }

    private String adminRank;
    private String cashierRank;

    public Rank(String adminRank, String userRank, String cashierRank) {
        this.adminRank = adminRank;
        this.userRank = userRank;
        this.cashierRank = cashierRank;
    }

    public Rank(){}

}
