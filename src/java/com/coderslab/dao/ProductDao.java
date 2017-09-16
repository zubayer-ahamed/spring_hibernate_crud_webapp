
package com.coderslab.dao;

import com.coderslab.entity.Product;
import java.util.List;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository
@Transactional
public class ProductDao {
    
    @Autowired
    private SessionFactory sessionFactory;

    public SessionFactory getSessionFactory() {
        return sessionFactory;
    }

    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }
    
    public List<Product> getAllProduct(){
        return getSessionFactory().getCurrentSession().createQuery("from Product").list();
    }
    
    public Product getProduct(int id) {
        return (Product) sessionFactory.getCurrentSession().get(Product.class, id);
    }

    public boolean saveProduct(Product product) {
        sessionFactory.getCurrentSession().save(product);
        return true;
    }

    public boolean updateProduct(Product product) {
        sessionFactory.getCurrentSession().update(product);
        return true;
    }

    public boolean deleteProduct(Product product) {
        sessionFactory.getCurrentSession().delete(product);
        return true;
    }
    
}
