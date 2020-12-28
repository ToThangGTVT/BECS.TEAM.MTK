package fa.tranning.becs.services.impl;

import fa.tranning.becs.dto.CategoryInfo;
import fa.tranning.becs.entity.Category;
import fa.tranning.becs.exception.ParamNotValidException;
import fa.tranning.becs.repository.BookRepository;
import fa.tranning.becs.repository.CategoryRepository;
import fa.tranning.becs.services.CategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class CategoryServiceImpl implements CategoryService {
    @Autowired
    private HibernateTemplate hibernateTemplate;

    @Autowired
    private CategoryRepository categoryRepository;

    @Autowired
    private BookRepository bookRepository;

    @Override
    public List<CategoryInfo> getAll() {

        List<Object[]> categoryList = categoryRepository.getAll();
        List<CategoryInfo> categoryInfos = new ArrayList<>();

        for (Object[] o : categoryList) {
            CategoryInfo categoryInfo = new CategoryInfo();
            categoryInfo.setCount((Long) o[0]);
            Category category = new Category();
            category.setId((int) o[2]);
            category.setName((String) o[1]);
            categoryInfo.setCategory(category);
            categoryInfos.add(categoryInfo);
        }

        return categoryInfos;
    }

    @Override
    public List<Category> findAll() {
        return categoryRepository.findAll();
    }

    @Override
    public long countBookByCategory(String categoryStr) throws ParamNotValidException {
        if (!categoryStr.contains("-")) {
            throw new ParamNotValidException();
        }
        int idCategory = Integer.parseInt(categoryStr.split("-")[1]);
        Category category = categoryRepository.getById(idCategory);
        return categoryRepository.countBookByCategory(category);
    }

    @Override
    public Category findById(int id) {
        return categoryRepository.getById(id);
    }

    @Override
    public Category findById(String categoryStr) throws ParamNotValidException {
        if (!categoryStr.contains("-")) {
            throw new ParamNotValidException();
        }
        int idCategory = Integer.parseInt(categoryStr.split("-")[1]);
        return categoryRepository.getById(idCategory);
    }


}
