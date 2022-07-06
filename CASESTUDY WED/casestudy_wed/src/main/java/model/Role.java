package model;

public class Role {
    private int rolerID;
    private String name;

    public Role() {
    }

    public Role(int rolerID, String name) {
        this.rolerID = rolerID;
        this.name = name;
    }

    public int getRolerID() {
        return rolerID;
    }

    public void setRolerID(int rolerID) {
        this.rolerID = rolerID;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @Override
    public String toString() {
        return "Role{" +
                "rolerID=" + rolerID +
                ", name='" + name + '\'' +
                '}';
    }
}
