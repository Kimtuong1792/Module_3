package repository.employee;

import model.CustomerType;
import model.Position;

import java.util.List;

public interface IPositionRepository {
    List<Position> selectAllPosition();
}
