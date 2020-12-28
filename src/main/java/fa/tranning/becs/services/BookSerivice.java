package fa.tranning.becs.services;

import java.util.List;

import fa.tranning.becs.dto.Cart;
import fa.tranning.becs.entity.Book;
import fa.tranning.becs.entity.Category;
import fa.tranning.becs.exception.CategoryNotFound;
import fa.tranning.becs.exception.ParamNotValidException;
import fa.tranning.becs.entity.Category;

public interface BookSerivice {
    List<Book> findAll();

    int findPaging(int recordNumber, int pageNumber, String searchContent, boolean order, List<Book> books) throws InterruptedException;

    int findPaging(int recordNumber, int pageNumber, boolean order, List<Book> books ) throws InterruptedException;

    Book find(int id);

    boolean update(Book book);

    int create(Book book);

    long countBook();

    // ThangTQ18

    List<Book> getAll(int indexFirst);

    long count();

    List<Book> getAllByCategory(String categoryStr, int indexFirst) throws ParamNotValidException, CategoryNotFound;

    List<Book> search(String str, int indexFirst, int method) throws InterruptedException, ParamNotValidException;

    int countSearchAll();

    int countSearchTitle();

    boolean getCartConvertFromBook(int id, List<Cart> listCart, int quantityAddMore);

    int countSearchAuthor();

    int countSearchPublisher();

    Book getBookById(int id);
}
