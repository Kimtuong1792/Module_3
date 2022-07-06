package repository.employee;

import model.CustomerType;
import model.EducationDegree;

import java.util.List;

public interface IEducationDegreeRepository {
    List<EducationDegree> selectAllEducationDegree();
}
