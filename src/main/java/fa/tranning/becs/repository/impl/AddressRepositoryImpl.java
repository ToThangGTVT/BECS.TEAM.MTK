package fa.tranning.becs.repository.impl;

import fa.tranning.becs.entity.Address;
import fa.tranning.becs.repository.AddressRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.transaction.annotation.Transactional;

import java.io.Serializable;

@Repository
@EnableTransactionManagement
public class AddressRepositoryImpl implements AddressRepository {

    @Autowired
    private HibernateTemplate hbt;

    @Override
    @Transactional(value = "transactionManager")
    public Serializable save(Address address) {
        return hbt.save(address);
    }
}
