/**
 *
 */
package fa.tranning.becs.dto;

import java.math.BigDecimal;

import javax.validation.constraints.*;

import fa.tranning.becs.entity.Book;
import fa.tranning.becs.entity.Category;
import org.springframework.web.multipart.MultipartFile;

/**
 * @author USER
 *
 */
public class BookDto {
    private int id;
    @Size(min = 1, max = 255, message = "Book's title is from 1 to 255 character")
    private String title;
    @Pattern(regexp = "^\\d+-\\d+-\\d+-\\d+$", message ="ISBN's format eg: {numbers}-{numbers}-{numbers}-{numbers}")
    private String isbn;
    @Size(max = 255, message = "Author name must less then 255 character")
    private String author;
    @Size(max = 255, message = "Publisher name must less then 255 character")
    private String publisher;
    @Size(max = 1000, message = "Description must less then 1000 character")
    private String description;
    private MultipartFile image;
    private String imageView;
    @Min(value = 0, message = "Price must not be less than 0")
    @Max(value = 1000, message = "Price must not greater than 1000$")
    private BigDecimal price;
    @Min(value = 0, message = "Category id error")
    private int categories;
    @Min(value = 0, message = "Quantity must not be less than 0")
    @Max(value = 1000, message = "Quantity number must not greater than 1000")
    private int quantity;
    @Min(value = 0, message = "Page Number must not be less than 0")
    @Max(value = 10000, message = "Page Number must not greater than 10000")
    private int pageNumber;
    private Category category;

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getIsbn() {
        return isbn;
    }

    public void setIsbn(String isbn) {
        this.isbn = isbn;
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

    public MultipartFile getImage() {
        return image;
    }

    public void setImage(MultipartFile image) {
        this.image = image;
    }

    public int getCategories() {
        return categories;
    }

    public void setCategories(int categories) {
        this.categories = categories;
    }

    public String getImageView() {
        return imageView;
    }

    public void setImageView(String imageView) {
        this.imageView = imageView;
    }
    @Override
    public String toString() {
        return "BookDto [title=" + title + ", isbn=" + isbn + ", author=" + author + ", publisher=" + publisher
                + ", description=" + description + ", price=" + price + ", quantity=" + quantity
                + ", pageNumber=" + pageNumber + "]";
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
    }

    public void convertToBook(Book book) {
        book.setId(id);
        book.setTitle(title);
        book.setIsbn(isbn);
        book.setAuthor(author);
        book.setPublisher(publisher);
        book.setDescription(description);
        book.setPrice(price);
        book.setQuantity(quantity);
        book.setPageNumber(pageNumber);
    }


}
