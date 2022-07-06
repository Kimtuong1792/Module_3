package service.employee;

import model.EducationDegree;
import repository.employee.EducationDegreeRepository;
import repository.employee.IEducationDegreeRepository;

import java.util.List;

public class EducationDegreeService implements IEducationDegreeService {
    private final IEducationDegreeRepository educationDegreeRepository = new EducationDegreeRepository();
    @Override
    public List<EducationDegree> selectAllEducationDegree() {
        return educationDegreeRepository.selectAllEducationDegree();
    }
}
