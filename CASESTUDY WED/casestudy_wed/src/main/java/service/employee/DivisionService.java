package service.employee;

import model.Division;
import repository.employee.DivisionRepository;
import repository.employee.IDivisionRepository;

import java.util.List;

public class DivisionService implements IDivisionService {
    private final IDivisionRepository divisionRepository = new DivisionRepository();
    @Override
    public List<Division> selectAllDivision() {
        return divisionRepository.selectAllDivision();
    }
}
