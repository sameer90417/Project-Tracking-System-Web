/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package project.tracking.system.entity;

/**
 *
 * @author hp
 */
public class IdName {
    private int id;
    private String name;

    public IdName(int id, String name) {
        this.id = id;
        this.name = name;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public IdName() {
    }

    @Override
    public String toString() {
        return "IdName{" + "id=" + id + ", name=" + name + '}';
    }
    
    
}
