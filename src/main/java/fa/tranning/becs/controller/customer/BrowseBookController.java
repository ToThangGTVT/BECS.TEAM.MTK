package fa.tranning.becs.controller.customer;

import fa.tranning.becs.dto.BookDto;
import fa.tranning.becs.dto.ParamIndex;
import fa.tranning.becs.entity.Book;
import fa.tranning.becs.exception.CategoryNotFound;
import fa.tranning.becs.exception.ParamNotValidException;
import fa.tranning.becs.services.BookSerivice;
import fa.tranning.becs.services.CategoryService;
import fa.tranning.becs.utility.Common;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.lang.reflect.Field;
import java.util.List;

@Controller
public class BrowseBookController {

    @Autowired
    private BookSerivice bookSerivice;

    @Autowired
    private CategoryService categoryService;

    @GetMapping(value = "/")
    private ModelAndView showHome(@RequestParam(name = "category", required = false) String categoryStr,
                                  @RequestParam(name = "page", required = false) Integer index)
            throws ParamNotValidException {

        ModelAndView mav = new ModelAndView();

        int indexFirst;
        if (index == null) {
            indexFirst = 1;
        } else {
            indexFirst = index;
        }


        List<Book> bookList = bookSerivice.getAll(indexFirst);
        mav.addObject("bookList", bookList);
        mav.addObject("countBook", bookSerivice.count());
        mav.addObject("pageNum", indexFirst);
        mav.addObject("categoryList", categoryService.getAll());
        long countBook = bookSerivice.count();
        if (countBook%12 == 0){
            mav.addObject("maxPage", bookSerivice.count()/12);
        } else {
            mav.addObject("maxPage", bookSerivice.count()/12+1);
        }
        mav.setViewName("customer/index");
        return mav;
    }

    @GetMapping(value = "/category/{category}")
    private ModelAndView showHomeCategory(@PathVariable(name = "category", required = false) String categoryStr,
                                          @RequestParam(name = "page", required = false) Integer index)
            throws ParamNotValidException, CategoryNotFound {

        ModelAndView mav = new ModelAndView();

        int indexFirst;
        if (index == null) {
            indexFirst = 1;
        } else {
            indexFirst = index;
        }

        mav.addObject("bookList", bookSerivice.getAllByCategory(categoryStr, indexFirst));
        mav.addObject("countBook", categoryService.countBookByCategory(categoryStr));
        mav.addObject("category", categoryService.findById(categoryStr));
        mav.addObject("pageNum", indexFirst);
        mav.addObject("categoryList", categoryService.getAll());

        mav.setViewName("customer/indexCategory");
        return mav;
    }

    @PostMapping(value = "/api/info/book", produces = "application/json")
    private @ResponseBody
    BookDto showInfo(@Param("id") String id) {
        BookDto bookDto = new BookDto();
        int idInt = Integer.parseInt(id);
        Book book = bookSerivice.find(idInt);
        BeanUtils.copyProperties(book, bookDto);
        bookDto.setImageView(book.getImage());
        return bookDto;
    }

    @GetMapping(value = "/search")
    private ModelAndView searchBook(@RequestParam("title") String search,
                                    ParamIndex index)
            throws InterruptedException, IllegalAccessException, ParamNotValidException {

        ModelAndView mav = new ModelAndView();

        int indexFirst = 1;

        for (Field field : ParamIndex.class.getDeclaredFields()) {
            field.setAccessible(true);
            Object o = field.get(index);
            if (o != null) {
                indexFirst = (int) o;
            }
        }

        for (int i = 0; i < 4; i++) {
            mav.addObject(Common.JSP_NAME_ATR_TAB[i], bookSerivice.search(search, indexFirst, i));
        }

        mav.addObject("categoryList", categoryService.getAll());
        mav.addObject("qSearch", search);

        // tổng số kết quả theo từ khóa
        mav.addObject("countBookSearchAll", bookSerivice.countSearchAll());
        mav.addObject("countBookSearchTitle", bookSerivice.countSearchTitle());
        mav.addObject("countBookSearchAuthor", bookSerivice.countSearchAuthor());
        mav.addObject("countBookSearchPublisher", bookSerivice.countSearchPublisher());
        mav.addObject("pageNum", indexFirst);
        mav.setViewName("customer/indexSearch");
        return mav;
    }

    @ExceptionHandler(value = ParamNotValidException.class)
    private ModelAndView handleParamNotValid() {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("redirect:/");
        return mav;
    }

    @ExceptionHandler(value = NumberFormatException.class)
    private ModelAndView handleParamCategoryNotValid() {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("customer/ExceptionCategoryNotfound");
        return mav;
    }



}
