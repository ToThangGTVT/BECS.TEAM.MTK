package fa.tranning.becs.repository;

import fa.tranning.becs.entity.Address;

import java.io.Serializable;

public interface AddressRepository {

    Serializable save(Address address);
}
