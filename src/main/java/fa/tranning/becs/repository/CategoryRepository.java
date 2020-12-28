package fa.tranning.becs.repository;

import fa.tranning.becs.dto.CategoryInfo;
import fa.tranning.becs.entity.Category;

import java.util.List;

public interface CategoryRepository {

    List<Object[]> getAll();

    Category getById(int id);

    List<Category> findAll();

    long countBookByCategory(Category category);
}
