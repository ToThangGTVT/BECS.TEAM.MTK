package fa.tranning.becs.services.impl;

import fa.tranning.becs.entity.Address;
import fa.tranning.becs.repository.AddressRepository;
import fa.tranning.becs.services.AddressService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.io.Serializable;

@Service
public class AddressServiceImpl implements AddressService {

    @Autowired
    private AddressRepository addressRepository;

    @Override
    public Serializable save(Address address) {
        return addressRepository.save(address);
    }
}
