package fa.tranning.becs.entity;

import fa.tranning.becs.validate.GroupLoginValidate;
import org.hibernate.validator.constraints.Length;
import org.springframework.format.annotation.NumberFormat;

import javax.persistence.*;
import javax.validation.Valid;
import javax.validation.constraints.*;
import java.util.List;

@Entity
@Table(name = "customer")
public class Customer {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @Column(columnDefinition = "nvarchar(250)", length = 250)
    @NotEmpty(message = "First name is mandatory")
    @Length(min = 1, max = 80)
    private String firstName;

    @Column(columnDefinition = "nvarchar(250)", length = 250)
    @NotEmpty(message = "Last name is mandatory")
    @Length(min = 1, max = 80)
    private String lastName;

    @NotEmpty(message = "{cus.email.empty}",groups = GroupLoginValidate.class)
//    @Pattern(regexp = "(([a-z-A-Z]+\\w+[a-zA-Z0-9]+[@][a-z-A-Z]+\\w+[a-zA-Z0-9][.][a-z-A-Z]+\\w+[a-zA-Z0-9])([.][a-z-A-Z]+\\w+[a-zA-Z0-9])?)",message = "{cus.email.pattern}",groups = GroupLoginValidate.class)
    @Email
    @Length(max = 100)
    private String email;

    @NotEmpty(message = "{cus.password.empty}",groups = GroupLoginValidate.class)
    @Pattern(regexp = "\\w{5,10}",message = "{cus.password.pattern}",groups = GroupLoginValidate.class)
    private String password;

    @NotEmpty(message = "Phone is mandatory")
    @Pattern(regexp = "^[0-9]+")
    @Length(min = 8, max = 15)
    private String phone;

    @OneToOne
    @JoinColumn
    @Valid
    private Address address;

    public Customer() {

    }

    public Customer(int id, String firstName, String lastName, String addressDetail, String district, String email, String password, String city, String state, String phone) {
        this.id = id;
        this.firstName = firstName;
        this.lastName = lastName;
        this.email = email;
        this.password = password;
        this.phone = phone;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public Address getAddress() {
        return address;
    }

    public void setAddress(Address address) {
        this.address = address;
    }


}
