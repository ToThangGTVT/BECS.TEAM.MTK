package fa.tranning.becs.services.impl;

import fa.tranning.becs.entity.Address;
import fa.tranning.becs.entity.Customer;
import fa.tranning.becs.exception.EmailAlreadyUseException;
import fa.tranning.becs.repository.AddressRepository;
import fa.tranning.becs.repository.CustomerRepository;
import fa.tranning.becs.repository.impl.CustomerRepositoryImpl;
import fa.tranning.becs.services.CustomerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CustomerServiceImpl implements CustomerService {

    @Autowired
    private CustomerRepository customerRepository;

    @Autowired
    private AddressRepository addressRepository;

    @Override
    public boolean save(Customer customer, Address address) throws EmailAlreadyUseException {
        if (customerRepository.getByEmail(customer.getEmail()) == null) {
            addressRepository.save(address);
            customer.setAddress(address);
            customerRepository.save(customer);
            return true;
        }
        throw new EmailAlreadyUseException();
    }
    public Customer checkLoginSuccess(Customer customer) {
        List<Customer> listCustomer =  customerRepository.
                getByEmailAndPassword(customer);
        Customer result=null;
        if(listCustomer!=null && listCustomer.size()>0){
            result=listCustomer.get(0);
        }
        return result;
    }
}
