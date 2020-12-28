package fa.tranning.becs.entity;

import fa.tranning.becs.utility.RegexUtitlity;
import fa.tranning.becs.validate.GroupLoginValidate;

import javax.persistence.*;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Pattern;
import java.util.Date;
import java.util.List;

@Entity
@Table(name = "tblOrder")
public class Order {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    private Date orderDate;

    private Integer status;

    @OneToOne(mappedBy = "order")
    @JoinColumn(name = "order_id")
    private Invoice invoice;

    @ManyToOne
    private Promotion promotion;

    @Column(columnDefinition = "nvarchar(250)", length = 250)
    private String firstName;

    @Column(columnDefinition = "nvarchar(250)", length = 250)
    private String lastName;
    private String email;
    private String phone;

    @Column(columnDefinition = "nvarchar(250)", length = 250)
    private String state;
    private String zip;

    @Column(columnDefinition = "nvarchar(250)", length = 250)
    private String distric;

    @Column(columnDefinition = "nvarchar(250)", length = 250)
    private String addressDetail;

    @OneToMany(mappedBy = "order")
    private List<OrderDetail> listOrderDetail;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Date getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(Date orderDate) {
        this.orderDate = orderDate;
    }

    public Integer getStutus() {
        return status;
    }

    public void setStutus(Integer stutus) {
        this.status = stutus;
    }

    public Invoice getInvoice() {
        return invoice;
    }

    public void setInvoice(Invoice invoice) {
        this.invoice = invoice;
    }

    public Promotion getPromotion() {
        return promotion;
    }

    public void setPromotion(Promotion promotion) {
        this.promotion = promotion;
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

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

    public String getZip() {
        return zip;
    }

    public void setZip(String zip) {
        this.zip = zip;
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

    public List<OrderDetail> getListOrderDetail() {
        return listOrderDetail;
    }

    public void setListOrderDetail(List<OrderDetail> listOrderDetail) {
        this.listOrderDetail = listOrderDetail;
    }
}
