package fa.tranning.becs.entity;

import javax.persistence.*;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;

@Entity
@Table(name = "address")
public class Address {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @Column(columnDefinition = "nvarchar(250)", length = 250)
    @NotEmpty(message = "State is mandatory")
    private String state;

    @Column(columnDefinition = "nvarchar(250)", length = 250)
    @NotEmpty(message = "Zip is mandatory")
    private String zip;

    @Column(columnDefinition = "nvarchar(250)", length = 250)
    @NotEmpty(message = "Distric is mandatory")
    private String distric;

    @Column(columnDefinition = "nvarchar(250)", length = 250)
    @NotEmpty(message = "Address Detail is mandatory")
    private String addressDetail;

    public Address(int id, String state, String zip, String distric, String addressDetail) {
        this.id = id;
        this.state = state;
        this.zip = zip;
        this.distric = distric;
        this.addressDetail = addressDetail;
    }

    public Address(){

    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

    public String getDistric() {
        return distric;
    }

    public void setDistric(String distric) {
        this.distric = distric;
    }

    public String getAddressDetail() {
        return addressDetail;
    }

    public void setAddressDetail(String addressDetail) {
        this.addressDetail = addressDetail;
    }

    public String getZip() {
        return zip;
    }

    public void setZip(String zip) {
        this.zip = zip;
    }
}

