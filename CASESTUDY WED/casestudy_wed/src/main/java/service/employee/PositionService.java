package service.employee;

import model.Position;
import repository.employee.IPositionRepository;
import repository.employee.PositionRepository;

import java.util.List;

public class PositionService implements IPositionService{
    private final IPositionRepository positionRepository = new PositionRepository();
    @Override
    public List<Position> selectAllPosition() {
        return positionRepository.selectAllPosition();
    }
}
