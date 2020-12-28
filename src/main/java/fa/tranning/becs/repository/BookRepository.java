package fa.tranning.becs.repository;

import java.util.List;

import fa.tranning.becs.dto.Cart;
import fa.tranning.becs.entity.Book;
import fa.tranning.becs.entity.Category;

public interface BookRepository {
    List<Book> findAll();

    int findPaging(int pageSize, int pageNumber, String searchContent, boolean order, List<Book> books) throws InterruptedException;

    int findPaging(int pageSize, int pageNumber, boolean order, List<Book> books) throws InterruptedException;

    Book find(int id);

    boolean update(Book book);

    int create(Book book);

    Long countBook();

    public Cart getCartConvertFromBook(int id);


    // ThangTQ18
    List<Book> getAll(int indexFirst, int maxResults);

    int countByCategory(Category category);

    long count();

    List<Book> getAllByCategory(Category category, int indexFirst);

    Book getBookById(int id);

    List<Book> search(String str, int indexFirst, String[] method) throws InterruptedException;
//
//	List<Book> searchByTitle(String title, int indexFirst) throws InterruptedException;
//
//	List<Book> searchByAuthor(String author, int indexFirst) throws InterruptedException;
//
//	List<Book> searchByPublisher(String publisher, int indexFirst) throws InterruptedException;

    int getCountSearch();
}
