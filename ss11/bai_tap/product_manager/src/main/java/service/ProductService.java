package service;

import model.Product;

import java.util.List;

public interface ProductService {
    List<Product> display();
    void addNew(Product product);
    void update( Product product);
    void remove(int id);
    void view(int id);
    List<Product> search(String name);
    Product searchByID(int id);
    void save(Product product);
}
