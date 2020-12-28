package fa.tranning.becs.services;

import fa.tranning.becs.dto.CategoryInfo;
import fa.tranning.becs.entity.Category;
import fa.tranning.becs.exception.ParamNotValidException;

import java.util.List;

public interface CategoryService {

    List<CategoryInfo> getAll();

    List<Category> findAll();

    long countBookByCategory(String categoryStr) throws ParamNotValidException;

    Category findById(int id);

    Category findById(String categoryStr) throws ParamNotValidException;

}
