package fa.tranning.becs.repository.impl;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import javax.persistence.TypedQuery;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;
import javax.swing.*;

import fa.tranning.becs.dto.Cart;
import fa.tranning.becs.entity.Category;
import org.apache.lucene.search.Sort;
import org.apache.lucene.search.SortField;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.search.jpa.FullTextEntityManager;
import org.hibernate.search.jpa.FullTextQuery;
import org.hibernate.search.jpa.Search;
import org.hibernate.search.query.dsl.QueryBuilder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.transaction.annotation.Transactional;

import fa.tranning.becs.entity.Book;
import fa.tranning.becs.entity.Customer;
import fa.tranning.becs.repository.BookRepository;

@Repository
@EnableTransactionManagement
public class BookRepositoyImpl implements BookRepository {

	@Autowired
	private HibernateTemplate hibernateTemplate;

	@PersistenceContext(unitName = "localContainerEntityManagerFactoryBean")
	private EntityManager em;
	private int countSearch;

	@Override
	@Transactional(value = "transactionManager")
	public List<Book> findAll() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	@Transactional(value = "transactionManager")
	public int findPaging(int pageSize, int pageNumber,  boolean order, List<Book> books) throws InterruptedException {
		int firstResult = (pageNumber-1)*pageSize;
		FullTextEntityManager fullTextEntityManager = Search.getFullTextEntityManager(em);
		fullTextEntityManager.createIndexer().startAndWait();
		QueryBuilder queryBuilder = fullTextEntityManager
				.getSearchFactory()
				.buildQueryBuilder()
				.forEntity(Book.class)
				.get();

		org.apache.lucene.search.Query query = queryBuilder.all().createQuery();

		FullTextQuery bookQuery = fullTextEntityManager
				.createFullTextQuery(query, Book.class);
		int numberOfBook = bookQuery.getResultSize();
		Sort sort;
		if(order){
			sort = queryBuilder.sort().byField("id").asc().createSort();
		}else {
			sort = queryBuilder.sort().byField("id").asc().createSort();
		}
		bookQuery.setSort(sort);
		bookQuery.setFirstResult(firstResult);
		bookQuery.setMaxResults(pageSize);
		List<Book> list = bookQuery.getResultList();
		for(Book book : list){
			books.add(book);
		}
		return numberOfBook;
	}

	@Override
	@Transactional(value = "transactionManager")
	public int findPaging(int pageSize, int pageNumber, String searchContent, boolean order, List<Book> books) throws InterruptedException {
		int firstResult = (pageNumber-1)*pageSize;
		FullTextEntityManager fullTextEntityManager = Search.getFullTextEntityManager(em);
		fullTextEntityManager.createIndexer().startAndWait();
		QueryBuilder queryBuilder = fullTextEntityManager
				.getSearchFactory()
				.buildQueryBuilder()
				.forEntity(Book.class)
				.get();

		org.apache.lucene.search.Query query = queryBuilder
				.keyword()
				.onFields("title", "publisher", "author")
				.matching(searchContent)
				.createQuery();

		FullTextQuery bookQuery = fullTextEntityManager
				.createFullTextQuery(query, Book.class);
		int numberOfBook = bookQuery.getResultSize();
		Sort sort;

		if(order){
			sort = queryBuilder.sort().byField("id", SortField.Type.INT).asc().createSort();
		}else {
			sort = queryBuilder.sort().byField("id", SortField.Type.INT).asc().createSort();
		}
		bookQuery.setSort(sort);
		bookQuery.setFirstResult(firstResult);
		bookQuery.setMaxResults(pageSize);
		List<Book> list = bookQuery.getResultList();
		for(Book book : list){
			books.add(book);
		}
		return numberOfBook;
	}

	@Override
	@Transactional(value = "transactionManager")
	public Book find(int id) {
		// TODO Auto-generated method stub
		return null;
	}


    @Override
	@Transactional(value = "transactionManager")
    public boolean update(Book book) {
		try {
			hibernateTemplate.update(book);
			return true;
		} catch (Exception e) {
			return false;
		}
    }

	@Override
	@Transactional(value = "transactionManager")
	public int create(Book book) {
		return (int) hibernateTemplate.save(book);
	}

    @Override
    public Long countBook() {
        return null;
    }

    @Override
    @Transactional(value = "transactionManager")
    public Book getBookById(int id) {
        SessionFactory sFactory = hibernateTemplate.getSessionFactory();
        Session session = sFactory.getCurrentSession();
        Book book = session.get(Book.class, id);
        return book;
    }

    @Override
    @Transactional(value = "transactionManager")
    public List<Book> search(String str, int indexFirst, String[] method) throws InterruptedException {
        FullTextEntityManager fullTextEntityManager = Search.getFullTextEntityManager(em);

        fullTextEntityManager.createIndexer().startAndWait();
        QueryBuilder queryBuilder = fullTextEntityManager
                .getSearchFactory()
                .buildQueryBuilder()
                .forEntity(Book.class)
                .get();
        org.apache.lucene.search.Query query = queryBuilder
                .keyword()
                .onFields(method)
                .matching(str)
                .createQuery();
        FullTextQuery bookQuery = fullTextEntityManager
                .createFullTextQuery(query, Book.class);

        this.countSearch = bookQuery.getResultSize();

        bookQuery.setFirstResult(indexFirst);
        bookQuery.setMaxResults(12);

        List<Book> bookList = bookQuery.getResultList();
        return bookList;
    }

    @Override
    public List<Book> getAll(int indexFirst, int maxResults) {

        CriteriaBuilder cb = em.getCriteriaBuilder();
        CriteriaQuery<Book> cq = cb.createQuery(Book.class);
        Root<Book> root = cq.from(Book.class);
        cq.select(root);
        cq.orderBy(cb.desc(root.get("id")));
        Query query = em.createQuery(cq);

        query.setFirstResult(indexFirst);
        query.setMaxResults(maxResults);

        List<Book> bookList = query.getResultList();

        return bookList;
    }

	@Override
	public int countByCategory(Category category) {
		CriteriaBuilder cb = em.getCriteriaBuilder();
		CriteriaQuery<Book> cq = cb.createQuery(Book.class);
		Root<Book> root = cq.from(Book.class);
		cq.select(root.get("id")).where(cb.equal(root.get("category"), category));
		return em.createQuery(cq).getResultList().size();
	}

    @Override
    public long count() {
        CriteriaBuilder cb = em.getCriteriaBuilder();
        CriteriaQuery<Long> cq = cb.createQuery(Long.class);
        Root<Book> root = cq.from(Book.class);
        cq.select(cb.count(root));
        return em.createQuery(cq).getSingleResult();
    }

	@Override
	public List<Book> getAllByCategory(Category category, int indexFirst) {
		CriteriaBuilder cb = em.getCriteriaBuilder();
		CriteriaQuery<Book> cq = cb.createQuery(Book.class);
		Root<Book> root = cq.from(Book.class);
		cq.select(root).where(cb.equal(root.get("category"), category));

		Query query = em.createQuery(cq);
		query.setFirstResult(indexFirst);
		query.setMaxResults(12);

		return query.getResultList();
	}

	@Override
	@Transactional(value = "transactionManager")
	public Cart getCartConvertFromBook(int id) {
		SessionFactory sFactory = hibernateTemplate.getSessionFactory();
		Session session = sFactory.getCurrentSession();
		Book book = session.get(Book.class, id);
		Cart cart = null;
		if (book != null) {
			cart = new Cart(book.getId(), book.getTitle(), book.getQuantity(),1,
					book.getImage(), book.getPrice(), book.getPrice());
		}
		return cart;
	}

	public int getCountSearch() {
		return this.countSearch;
	}
}
