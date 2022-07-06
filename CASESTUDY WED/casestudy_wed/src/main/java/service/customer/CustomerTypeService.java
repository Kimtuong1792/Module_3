package service.customer;

import model.CustomerType;
import repository.customer.CustomerTypeRepository;
import repository.customer.ICustomerTypeRepository;

import java.util.List;

public class CustomerTypeService implements ICustomerType {
    private final ICustomerTypeRepository customerTypeRepository = new CustomerTypeRepository();
    @Override
    public List<CustomerType> selectAllCustomerType() {

        return customerTypeRepository.selectAllCustomerType();
    }
}
