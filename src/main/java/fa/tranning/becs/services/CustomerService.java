package fa.tranning.becs.services;

import fa.tranning.becs.entity.Address;
import fa.tranning.becs.entity.Customer;
import fa.tranning.becs.exception.EmailAlreadyUseException;

public interface CustomerService {

    boolean save(Customer customer, Address address) throws EmailAlreadyUseException;
}
