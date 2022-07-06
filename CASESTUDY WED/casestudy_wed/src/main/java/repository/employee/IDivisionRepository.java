package repository.employee;

import model.CustomerType;
import model.Division;

import java.util.List;

public interface IDivisionRepository {
    List<Division> selectAllDivision();
}
