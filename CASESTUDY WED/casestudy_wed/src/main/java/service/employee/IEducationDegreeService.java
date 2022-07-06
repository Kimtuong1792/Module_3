package service.employee;

import model.CustomerType;
import model.EducationDegree;

import java.util.List;

public interface IEducationDegreeService {
    List<EducationDegree> selectAllEducationDegree();
}
