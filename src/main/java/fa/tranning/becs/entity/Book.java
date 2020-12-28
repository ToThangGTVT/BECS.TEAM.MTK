package fa.tranning.becs.entity;

import org.apache.lucene.analysis.core.LowerCaseFilterFactory;
import org.apache.lucene.analysis.standard.StandardFilterFactory;
import org.apache.lucene.analysis.standard.StandardTokenizerFactory;
import org.hibernate.search.annotations.Index;
import org.hibernate.search.annotations.*;

import javax.persistence.*;
import java.math.BigDecimal;
import java.util.List;

@Entity
@Indexed
@AnalyzerDef(name = "fedexTextAnalyzer",
        tokenizer = @TokenizerDef(factory = StandardTokenizerFactory.class),
        filters = {
                @TokenFilterDef(factory = LowerCaseFilterFactory.class),
                @TokenFilterDef(factory = StandardFilterFactory.class)
        })
public class Book {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @SortableField
    private int id;

    @Column(columnDefinition = "nvarchar(250)", length = 250)
    @Field(index=Index.YES, analyze=Analyze.YES, store=Store.NO)
    @Analyzer(definition = "fedexTextAnalyzer")
    private String title;

    @Column(unique = true)
    private String isbn;

    @Column(columnDefinition = "nvarchar(250)", length = 250)
    @Field(index=Index.YES, analyze=Analyze.YES, store=Store.NO)
    @Analyzer(definition = "fedexTextAnalyzer")
    private String author;

    @Column(columnDefinition = "nvarchar(250)", length = 250)
    @Field(index=Index.YES, analyze=Analyze.YES, store=Store.NO)
    @Analyzer(definition = "fedexTextAnalyzer")
    private String publisher;

    @Column(columnDefinition = "nvarchar(250)", length = 250)
    private String description;
    private BigDecimal price;
    private String image;
    private int quantity;
    private int pageNumber;

    @ManyToOne
    private Category category;

    @OneToMany(mappedBy = "book")
    private List<OrderDetail> orderDetail;

    public Book(){

    }

    public Book(int id, String title, String description, BigDecimal price, String image, int quantity, int pageNumber, String author, String publisher, String isbn, Category category) {
        this.id = id;
        this.title = title;
        this.description = description;
        this.price = price;
        this.image = image;
        this.quantity = quantity;
        this.pageNumber = pageNumber;
        this.author = author;
        this.publisher = publisher;
        this.isbn = isbn;
        this.category = category;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public String getPublisher() {
        return publisher;
    }

    public void setPublisher(String publisher) {
        this.publisher = publisher;
    }

    public String getIsbn() {
        return isbn;
    }

    public void setIsbn(String isbn) {
        this.isbn = isbn;
    }

    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
    }

    public List<OrderDetail> getOrderDetail() {
        return orderDetail;
    }

    public void setOrderDetail(List<OrderDetail> orderDetail) {
        this.orderDetail = orderDetail;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public BigDecimal getPrice() {
        return price;
    }

    public void setPrice(BigDecimal price) {
        this.price = price;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public int getPageNumber() {
        return pageNumber;
    }

    public void setPageNumber(int pageNumber) {
        this.pageNumber = pageNumber;
    }

}
