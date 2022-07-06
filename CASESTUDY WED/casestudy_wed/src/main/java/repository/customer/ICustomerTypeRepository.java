package repository.customer;

import model.CustomerType;

import java.util.List;

public interface ICustomerTypeRepository {
    List<CustomerType> selectAllCustomerType();
}
