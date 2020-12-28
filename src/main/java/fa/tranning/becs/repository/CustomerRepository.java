package fa.tranning.becs.repository;

import fa.tranning.becs.entity.Customer;

import java.util.List;

public interface CustomerRepository {

    void save(Customer customer);

    Customer getByEmail(String email);

    List<Customer> getByEmailAndPassword(Customer customer);
}
