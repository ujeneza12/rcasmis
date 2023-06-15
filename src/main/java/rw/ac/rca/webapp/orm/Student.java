package rw.ac.rca.webapp.orm;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import javax.persistence.*;

@Entity
@Table(name = "student")
public class Student extends Person implements Serializable {

	/**
	 *
	 */
	private static final long serialVersionUID = -8680703317249517930L;

	private String email;
	private String gender;

	@ManyToOne
	@JoinColumn(name = "address_id")

	private Address address;


	public Student() {
	}

	public Student(String firstName, String lastName, Date dateOfBirth, String email, String gender,String phoneNumber,Address address){
		this.setFirstName(firstName);
		this.setLastName(lastName);
		this.setDateOfBirth(dateOfBirth);
		this.email=email;
		this.gender=gender;
		this.address=address;
		this.setPhoneNumber(phoneNumber);
	}

	@OneToMany(cascade= CascadeType.ALL, fetch = FetchType.EAGER, mappedBy = "student")
	private List<Enrol> enrols;


	public Student(int studentid) {
		this.setId(studentid);
	}


	public List<Enrol> getEnrols() {
		return enrols;
	}
	public void setEnrollments(List<Enrol> enrols) {
		this.enrols = enrols;
	}

	public Address getAddress() {
		return address;
	}
	public void setAddress(Address address_id) {
		this.address = address;
	}

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


}