/**
 *
 */
package fa.tranning.becs.controller.admin;

import fa.tranning.becs.dto.BookDto;
import fa.tranning.becs.dto.BookJsonResponse;
import fa.tranning.becs.entity.Book;
import fa.tranning.becs.entity.Category;
import fa.tranning.becs.services.BookSerivice;
import fa.tranning.becs.services.CategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

/**
 * @author USER
 *
 */
@Controller
@RequestMapping(value = "/admin/book")
public class BookController {

    @Autowired
    private BookSerivice bookSerivice;

    @Autowired
    private CategoryService categoryService;

    @Autowired
    private HttpServletRequest request;

    public BookController() {
        super();
    }

    @RequestMapping(value = "/manage", method = RequestMethod.GET)
    public ModelAndView showBookManagement() {
        ModelAndView view = new ModelAndView("admin/ManageBook");
        view.addObject("categories", categoryService.findAll());
        return view;
    }

    @RequestMapping(value = "/paging", method = RequestMethod.GET)
    public ModelAndView pagingBook(@RequestParam(value = "pageSize") int pageSize, @RequestParam(value = "pageNumber") int pageNumber,
                                   @RequestParam(value = "searchContent") String searchContent, @RequestParam(value = "order") String order) throws InterruptedException {
        System.out.println("Test::::" + pageSize + ":::" + pageNumber + ":::" + searchContent + ":::" + order);
        ModelAndView view = new ModelAndView("admin/book-paging");
        int numberOfBook;
        List<Book> books = new ArrayList<>();
        boolean resultOrder ="asc".equalsIgnoreCase(order);
        if("".equals(searchContent)){
            numberOfBook = bookSerivice.findPaging(pageSize, pageNumber, resultOrder , books);
        }else {
            numberOfBook = bookSerivice.findPaging(pageSize, pageNumber, searchContent, resultOrder, books);
        }
        System.out.println(books.size());
        view.addObject("books", books);
        view.addObject("pageNumber", pageNumber);
        view.addObject("numberOfPage", calculateNumberOfPage(pageSize,numberOfBook));
        return view;
    }

    @RequestMapping(value = "/add", method = RequestMethod.GET)
    public ModelAndView showAddBookForm() {

        ModelAndView view = new ModelAndView("admin/AddBook");
        view.addObject("categories", categoryService.findAll());
        return view;
    }

    @RequestMapping(value = "/add", method = RequestMethod.POST)
    @ResponseBody
    public BookJsonResponse addBook(@ModelAttribute @Valid BookDto bookDto, BindingResult bindingResult) {
        BookJsonResponse response = new BookJsonResponse();
        response.setValidated(true);
        List<String> errorMessage = new ArrayList<String>();
        if (bindingResult.hasErrors()) {
            // Get error message
            for (FieldError fieldError : bindingResult.getFieldErrors()) {
                errorMessage.add(fieldError.getDefaultMessage());
            }
            response.setValidated(false);
            response.setErrorMessages(errorMessage);
        } else {
            MultipartFile multipartFile = bookDto.getImage();
            Book book = new Book();
            bookDto.convertToBook(book);
            Category category = categoryService.findById(bookDto.getCategories());
            book.setCategory(category);
            if (!multipartFile.isEmpty()) {
                String relativePath = uploadImage(multipartFile);
                if (relativePath != null) {
                    book.setImage(relativePath);
                } else {
                    errorMessage.add("Something wrong! Cant save photo!");
                    response.setValidated(false);
                    response.setErrorMessages(errorMessage);
                    return response;
                }
            }
            int id = bookSerivice.create(book);
            if(id == 0){
                response.setValidated(false);
                errorMessage.add("Server Error!");
            }
        }
        return response;
    }

    @RequestMapping(value = "/edit", method = RequestMethod.POST)
    @ResponseBody
    public BookJsonResponse editBook(@ModelAttribute @Valid BookDto bookDto, BindingResult bindingResult){
        BookJsonResponse response = new BookJsonResponse();
        response.setValidated(true);
        List<String> errorMessage = new ArrayList<String>();
        if (bindingResult.hasErrors()) {
            // Get error message
            for (FieldError fieldError : bindingResult.getFieldErrors()) {
                errorMessage.add(fieldError.getDefaultMessage());
            }
            response.setValidated(false);
            response.setErrorMessages(errorMessage);
        } else {
            MultipartFile multipartFile = bookDto.getImage();
            System.out.println("Book Id to update::::" + bookDto.getId());
            Book book = bookSerivice.find(bookDto.getId());
            if(book == null){
                response.setValidated(false);
                errorMessage.add("Invalid Book Id!");
                return response;
            }
            bookDto.convertToBook(book);
            if (!multipartFile.isEmpty()) {
                String relativePath = uploadImage(multipartFile);
                if (relativePath != null) {
                    book.setImage(relativePath);
                } else {
                    errorMessage.add("Something wrong! Cant save photo!");
                    response.setValidated(false);
                    response.setErrorMessages(errorMessage);
                    return response;
                }
            }
            Category category = categoryService.findById(bookDto.getCategories());
            book.setCategory(category);
            System.out.println("Book to update::::" + book.toString());
            boolean rs = bookSerivice.update(book);
            System.out.println("Update rs::::" + rs);
            if(!rs){
                response.setValidated(false);
                errorMessage.add("Server Error!");
            }
        }
        return response;
    }

    private String uploadImage(MultipartFile multipartFile) {
        String relativePath = null;
        try {
            String uploadsDir = "/resources/upload/";
            String realPathtoUploads = request.getServletContext().getRealPath(uploadsDir);
            if (!new File(realPathtoUploads).exists()) {
                new File(realPathtoUploads).mkdir();
            }
            System.out.println("realPathtoUploads :::: " + realPathtoUploads);

            String orgName = multipartFile.getOriginalFilename();
            relativePath = System.currentTimeMillis() + orgName;
            String filePath = realPathtoUploads + relativePath;
            File dest = new File(filePath);
            multipartFile.transferTo(dest);
        } catch (IOException e) {
            System.out.println("ERROR::: IOException");
            return null;
        }
        return relativePath;
    }

    private int calculateNumberOfPage(int pageSize, int numberOfBook) {
        if (pageSize < 1) {
            pageSize = 5;
        }
        int temp = numberOfBook / pageSize;
        return numberOfBook % pageSize == 0 ? temp : temp + 1;
    }

}
