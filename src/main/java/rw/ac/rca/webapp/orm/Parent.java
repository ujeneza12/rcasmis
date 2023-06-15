package rw.ac.rca.webapp.orm;

import javax.persistence.*;

@Entity
@Table(name = "parent")
public class Parent extends Person {

    /**
     *
     */
    private static final long serialVersionUID = -8680703317249517930L;

    private String email;
    private String gender;

    public Parent() {
    }

    @ManyToOne
    @JoinColumn(name = "address_id")
    private Address address;

    @OneToOne
    @JoinColumn(name = "student_id")
    private Student student;

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public Address getAddress() {
        return address;
    }

    public void setAddress(Address address) {
        this.address = address;
    }

    public Student getStudent() {
        return student;
    }

    public void setStudent(Student student) {
        this.student = student;
    }
}