package repository.employee;

import model.CustomerType;
import model.User;

import java.util.List;

public interface IUserRepository {
    List<User> selectAllUser();
}
