package repository.IMPL;

import model.Product;
import repository.IProductRepository;

import java.util.ArrayList;
import java.util.List;

public class ProductRepository implements IProductRepository {
    private static List<Product> productList = new ArrayList<>();


    static {
        productList.add(new Product(1, "iphone", 1000, "smartphone", "apple"));
        productList.add(new Product(2, "samsung", 500, "smartphone", "Samsung"));
        productList.add(new Product(3, "Nokia", 200, "smartphone", "Nokia"));
        productList.add(new Product(4, "Oppo", 600, "smartphone", "OPPo"));
        productList.add(new Product(5, "xiaomi", 1000, "smartphone", "Xiaomi"));
        productList.add(new Product(6, "iphone11", 2000, "smartphobe", "apple"));
    }

    @Override
    public List<Product> findAll() {
        return productList;
    }

    @Override
    public void save(Product product) {
        productList.add(product);
    }

    @Override
    public Product findById(int id) {
        return productList.get(id);
    }

    @Override
    public void update(int id, Product product) {
        productList.add( product);
    }

    @Override
    public void remove(int id) {
        productList.remove(id);
    }

    @Override
    public List<Product> search(String name) {
        List<Product> searchList = new ArrayList<>();
        for (Product item :
                productList) {
            if (item.getName().contains(name)){
                searchList.add(item);
            }
        }
        return searchList;
    }

    @Override
    public Product searchByID(int id) {

            return productList.get(id);
    }
}
