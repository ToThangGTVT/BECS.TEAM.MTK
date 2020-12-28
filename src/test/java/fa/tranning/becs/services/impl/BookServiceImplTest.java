package fa.tranning.becs.services.impl;

import fa.tranning.becs.entity.Book;
import fa.tranning.becs.exception.ParamNotValidException;
import fa.tranning.becs.repository.BookRepository;
import fa.tranning.becs.repository.impl.BookRepositoyImpl;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.Mockito;
import org.mockito.MockitoAnnotations;
import org.mockito.exceptions.base.MockitoException;
import org.mockito.junit.MockitoJUnitRunner;

import java.util.ArrayList;
import java.util.List;

import static org.hamcrest.CoreMatchers.*;
import static org.mockito.Mockito.*;

import static org.junit.Assert.*;

@RunWith(MockitoJUnitRunner.class)
public class BookServiceImplTest {

    @Mock
    private BookRepositoyImpl bookRepository;

    @InjectMocks
    private BookServiceImpl bookService;

    @Before
    public void before(){
        MockitoAnnotations.initMocks(this);
    }

    @Test(expected = MockitoException.class)
    public void testSearchException1() throws ParamNotValidException, InterruptedException {
        when(bookService.search("",1,1)).thenThrow(ParamNotValidException.class);
    }

    @Test(expected = ParamNotValidException.class)
    public void testSearchException2() throws ParamNotValidException, InterruptedException {
        when(bookService.search("",-1,1)).thenThrow(ParamNotValidException.class);
    }

    @Test(expected = ParamNotValidException.class)
    public void testSearchException3() throws ParamNotValidException, InterruptedException {
        when(bookService.search("a" ,-1,1)).thenThrow(ParamNotValidException.class);
    }

    @Test
    public void testSearch1() throws InterruptedException, ParamNotValidException {
        List<Book> books = new ArrayList<>();
        for (int i = 0; i < 1; i++) {
            Book book = new Book();
            book.setTitle("a");
            books.add(book);
        }
        when(bookRepository.search("a",0, new String[]{"title"})).thenReturn(books);
        System.out.println(books);
        assertThat(bookService.search("a",1, 1), is(books));
    }

}
