package fa.tranning.becs.services.impl;

import fa.tranning.becs.repository.impl.AddressRepositoryImpl;
import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.Mockito;
import org.mockito.MockitoAnnotations;
import org.mockito.junit.MockitoJUnitRunner;

@RunWith(MockitoJUnitRunner.class)
public class AddressServiceImplTest {

    @Mock
    private AddressRepositoryImpl addressRepository;

    @InjectMocks
    private AddressServiceImpl addressService;

    @Before
    public void before() {
        MockitoAnnotations.initMocks(this);
    }

    @Test
    public void testSave() {
        Mockito.when(addressRepository.save(Mockito.any())).thenReturn(1);
        Assert.assertEquals(addressService.save(Mockito.any()), 1);
    }

}
