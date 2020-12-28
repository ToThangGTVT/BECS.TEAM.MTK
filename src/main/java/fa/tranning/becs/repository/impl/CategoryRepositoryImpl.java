package fa.tranning.becs.repository.impl;

import fa.tranning.becs.entity.Book;
import fa.tranning.becs.entity.Category;
import fa.tranning.becs.repository.CategoryRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.EnableTransactionManagement;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Join;
import javax.persistence.criteria.Root;
import java.util.List;

@Repository
@EnableTransactionManagement
public class CategoryRepositoryImpl implements CategoryRepository {

    @Autowired
    private HibernateTemplate hibernateTemplate;

    @PersistenceContext(unitName = "localContainerEntityManagerFactoryBean")
    private EntityManager em;

    @Override
    public List<Object[]> getAll() {
        CriteriaBuilder cb = em.getCriteriaBuilder();
        CriteriaQuery<Object[]> cq = cb.createQuery(Object[].class);
        Root<Book> root = cq.from(Book.class);

        Join<Book, Category> join = root.join("category");
        cq.multiselect(cb.count(root), join.get("name"), join.get("id"));
        cq.groupBy(join.get("name"), join.get("id"));

        return em.createQuery(cq).getResultList();
    }

    @Override
    public Category getById(int id) {
        return hibernateTemplate.get(Category.class, id);
    }

    @Override
    public List<Category> findAll() {
        return hibernateTemplate.loadAll(Category.class);
    }

    @Override
    public long countBookByCategory(Category category) {
        CriteriaBuilder cb = em.getCriteriaBuilder();
        CriteriaQuery<Long> cq = cb.createQuery(Long.class);
        Root<Book> root = cq.from(Book.class);
        cq.select(cb.count(root)).where(cb.equal(root.get("category"), category));
        return em.createQuery(cq).getSingleResult();
    }
}
