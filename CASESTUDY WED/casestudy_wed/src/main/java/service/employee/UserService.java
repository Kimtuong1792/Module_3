package service.employee;

import model.User;
import repository.employee.IUserRepository;
import repository.employee.UserRepository;

import java.util.List;

public class UserService implements IUserService {
    private final IUserRepository userRepository = new UserRepository();
    @Override
    public List<User> selectAllUser() {
        return userRepository.selectAllUser();
    }
}
