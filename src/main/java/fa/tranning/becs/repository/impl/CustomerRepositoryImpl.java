package fa.tranning.becs.repository.impl;

import fa.tranning.becs.entity.Customer;
import fa.tranning.becs.repository.CustomerRepository;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;
import java.util.List;

@Repository
@EnableTransactionManagement
public class CustomerRepositoryImpl implements CustomerRepository {

    @Autowired
    private HibernateTemplate hibernateTemplate;


    @PersistenceContext(unitName = "localContainerEntityManagerFactoryBean")
    private EntityManager em;

    @Override
    @Transactional(value = "transactionManager")
    public void save(Customer customer) {
        System.out.println(customer);
        hibernateTemplate.save(customer);
    }

    @Override
    public Customer getByEmail(String email) {

        CriteriaBuilder cb = em.getCriteriaBuilder();
        CriteriaQuery<Customer> cq = cb.createQuery(Customer.class);
        Root<Customer> root = cq.from(Customer.class);
        cq.select(root).where(cb.equal(root.get("email"), email));
        List<Customer> customerList = em.createQuery(cq).getResultList();

        if (customerList.isEmpty()) {
            return null;
        } else {
            return customerList.get(0);
        }
    }


    @Override
    @Transactional(value = "transactionManager")
    public List<Customer> getByEmailAndPassword(Customer customer) {
        //       cách khác sử dụng hibernate template
//        List<Customer> listCustomer = hibernateTemplate.findByExample(customer);
//        System.out.println(listCustomer);
        SessionFactory sFactory = hibernateTemplate.getSessionFactory();
        Session session = sFactory.getCurrentSession();
        Query query = session.createQuery("from Customer where email=:email and password=:password");
        query.setParameter("email", customer.getEmail());
        query.setParameter("password", customer.getPassword());
        List<Customer> listCustomer = query.list();
        return listCustomer;
    }
}
