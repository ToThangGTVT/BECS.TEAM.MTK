package fa.tranning.becs.services.impl;

import fa.tranning.becs.dto.Cart;
import fa.tranning.becs.entity.Book;
import fa.tranning.becs.entity.Category;
import fa.tranning.becs.exception.CategoryNotFound;
import fa.tranning.becs.exception.ParamNotValidException;
import fa.tranning.becs.repository.BookRepository;
import fa.tranning.becs.repository.CategoryRepository;
import fa.tranning.becs.services.BookSerivice;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.util.List;
import java.util.stream.Collectors;

@Service
public class BookServiceImpl implements BookSerivice {

    private BookRepository bookRepository;

    private CategoryRepository categoryRepository;

    @Autowired
    public BookServiceImpl(BookRepository bookRepository, CategoryRepository categoryRepository) {
        this.bookRepository = bookRepository;
        this.categoryRepository = categoryRepository;
    }

    private int countSearchPublisher;
    private int countSearchAll;
    private int countSearchTitle;
    private int countSearchAuthor;


    @Override
    public List<Book> findAll() {
        // TODO Auto-generated method stub
        return null;
    }

    @Override
    public int findPaging(int recordNumber, int pageNumber, String searchContent, boolean order, List<Book> books) throws InterruptedException {
        return bookRepository.findPaging(recordNumber, pageNumber, searchContent, order, books);
    }

    @Override
    public int findPaging(int recordNumber, int pageNumber, boolean order, List<Book> books) throws InterruptedException {
        return bookRepository.findPaging(recordNumber, pageNumber, order, books);
    }

    @Override
    public Book find(int id) {
        return bookRepository.getBookById(id);
    }


    @Override
    public boolean update(Book book) {

        return bookRepository.update(book);
    }

    @Override
    public int create(Book book) {
        return bookRepository.create(book);
    }

    @Override
    public long countBook() {
        return bookRepository.count();
    }

    @Override
    public List<Book> getAll(int indexFirst) {
        return bookRepository.getAll(12 * (indexFirst - 1), 12);
    }


    public Book getBookById(int id) {
        return bookRepository.getBookById(id);
    }

    @Override
    public boolean getCartConvertFromBook(int id, List<Cart> listCart, int quantityAddMore) {
        boolean result = false;
        List<Cart> listCartFound = listCart.stream().filter(cart -> cart.getId() == id).collect(Collectors.toList());
        if (listCartFound != null && listCartFound.size() > 0) {
            Cart cart = listCartFound.get(0);
            int totalQuantityToBuy = cart.getQuantityBuy() + quantityAddMore;
            if (totalQuantityToBuy <= cart.getQuantity() && totalQuantityToBuy > 0) {
                cart.setQuantityBuy(totalQuantityToBuy);
                cart.setPriceTotal(
                        cart.getPriceBook().multiply(
                                BigDecimal.valueOf(cart.getQuantityBuy())));
                result = true;
            }
        } else {
            Cart cartBook = bookRepository.getCartConvertFromBook(id);
            if (cartBook != null && cartBook.getQuantity() > 0) {
                result = true;
                listCart.add(cartBook);
            }
        }
        return result;
    }

    public void checkCartQuantity(List<Cart> listCart) {

    }

    @Override
    public long count() {
        return bookRepository.count();
    }

    @Override
    public List<Book> getAllByCategory(String categoryStr, int indexFirst) throws CategoryNotFound {
        if (!categoryStr.contains("-")) {
            throw new CategoryNotFound();
        }

        int idCategory = Integer.parseInt(categoryStr.split("-")[1]);
        Category category = categoryRepository.getById(idCategory);
        if (category == null){
            throw new CategoryNotFound();
        }

        return bookRepository.getAllByCategory(category, 12 * (indexFirst - 1));
    }

    @Override
    public List<Book> search(String str, int indexFirst, int method) throws InterruptedException, ParamNotValidException {

        if (str == null | indexFirst < 0 | str.isEmpty()) {
            throw new ParamNotValidException();
        }
        List<Book> books;
        switch (method) {
            case 0:
                books = bookRepository.search(str, 12 * (indexFirst - 1), new String[]{"title", "publisher", "author"});
                this.countSearchAll = bookRepository.getCountSearch();
                return books;
            case 1:
                books = bookRepository.search(str, 12 * (indexFirst - 1), new String[]{"title"});
                this.countSearchTitle = bookRepository.getCountSearch();
                return books;
            case 2:
                books = bookRepository.search(str, 12 * (indexFirst - 1), new String[]{"author"});
                this.countSearchAuthor = bookRepository.getCountSearch();
                return books;
            case 3:
                books = bookRepository.search(str, 12 * (indexFirst - 1), new String[]{"publisher"});
                this.countSearchPublisher = bookRepository.getCountSearch();
                return books;
            default:
                return null;
        }
    }

    @Override
    public int countSearchAll() {
        return this.countSearchAll;
    }

    @Override
    public int countSearchTitle() {
        return this.countSearchTitle;
    }

    @Override
    public int countSearchAuthor() {
        return this.countSearchAuthor;
    }

    @Override
    public int countSearchPublisher() {
        return this.countSearchPublisher;
    }


}
