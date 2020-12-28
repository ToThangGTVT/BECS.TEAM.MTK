package fa.tranning.becs.dto;

import java.math.BigDecimal;

public class Cart {
    private int id;
    private String title;
    private int quantity;
    private int quantityBuy;
    private String image;
    private BigDecimal priceBook;
    private BigDecimal priceTotal;

    public Cart() {

    }

    public Cart(int id, String title, int quantity,int quantityBuy, String image, BigDecimal priceBook, BigDecimal priceTotal) {
        this.id = id;
        this.title = title;
        this.quantity = quantity;
        this.quantityBuy=quantityBuy;
        this.image = image;
        this.priceBook = priceBook;
        this.priceTotal = priceTotal;

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

    public int getQuantity() {
        return quantity;
    }
    public int getQuantityBuy() {
        return quantityBuy;
    }

    public void setQuantityBuy(int quantityBuy) {
        this.quantityBuy = quantityBuy;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public BigDecimal getPriceBook() {
        return priceBook;
    }

    public void setPriceBook(BigDecimal priceBook) {
        this.priceBook = priceBook;
    }

    public BigDecimal getPriceTotal() {
        return priceTotal;
    }

    public void setPriceTotal(BigDecimal priceTotal) {
        this.priceTotal = priceTotal;
    }

    @Override
    public String toString() {
        return "Cart{" +
                "id=" + id +
                ", title='" + title + '\'' +
                ", quantity=" + quantity +
                ", quantityBuy=" + quantityBuy +
                ", image='" + image + '\'' +
                ", priceBook=" + priceBook +
                ", priceTotal=" + priceTotal +
                '}';
    }
}
