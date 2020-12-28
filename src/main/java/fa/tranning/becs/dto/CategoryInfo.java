package fa.tranning.becs.dto;

import fa.tranning.becs.entity.Category;

public class CategoryInfo {

    private Category category;
    private Long count;

    public Long getCount() {
        return count;
    }

    public void setCount(Long count) {
        this.count = count;
    }

    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
    }
}
