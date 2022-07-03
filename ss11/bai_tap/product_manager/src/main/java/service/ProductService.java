package service;

import model.Product;

import java.util.List;

public interface ProductService {
    List<Product> display();
    void addNew(Product product);
    void update( Product product);
    void remove(int id);
    void view(int id);

    Product searchByID(int id);
    void save(Product product);
}
