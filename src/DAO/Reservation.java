package DAO;

/**
 * Created by Michał on 2016-01-14.
 */
public class Reservation {
    private Integer id;
    private Integer user;
    private Integer move;
    private Integer row;
    private Move moveObj;

    public Move getMoveObj() {
        return moveObj;
    }

    public void setMoveObj(Move moveObj) {
        this.moveObj = moveObj;
    }

    public Reservation(Integer id, Integer user, Integer move, Integer row, Integer place, Move moveObj) {
        this.id = id;
        this.user = user;
        this.move = move;
        this.row = row;
        this.place = place;
        this.moveObj = moveObj;
    }

    public Reservation(){}
    private Integer place;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getUser() {
        return user;
    }

    public void setUser(Integer user) {
        this.user = user;
    }

    public Integer getMove() {
        return move;
    }

    public void setMove(Integer move) {
        this.move = move;
    }

    public Integer getRow() {
        return row;
    }

    public void setRow(Integer row) {
        this.row = row;
    }

    public Integer getPlace() {
        return place;
    }

    public void setPlace(Integer place) {
        this.place = place;
    }

    public String getMoveTitle(){ return moveObj.getName();}

    public String getMoveDate(){ return moveObj.getDate();}

    public String getMoveTime(){ return moveObj.getTime();}


}
