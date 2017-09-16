package com.coderslab.controller;

import com.coderslab.dao.ProductDao;
import com.coderslab.entity.Product;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class ProductController {

    @Autowired
    private ProductDao productDao;

    @Autowired
    private Product product;

    @RequestMapping("/")
    public String loadFirstPage(ModelMap modelMap, HttpServletRequest request) {
        List<Product> products = productDao.getAllProduct();
        modelMap.addAttribute("products", products);
        modelMap.addAttribute("sm", request.getParameter("sm"));
        modelMap.addAttribute("em", request.getParameter("em"));
        return "index";
    }

    @RequestMapping(value = "/addProduct", method = RequestMethod.POST)
    public String saveProduct(ModelMap modelMap, HttpServletRequest request) {
        product = new Product();
        product.setPname(request.getParameter("pname"));
        product.setPrice(Double.parseDouble(request.getParameter("price")));
        product.setQty(Integer.parseInt(request.getParameter("qty")));
        boolean status = productDao.saveProduct(product);
        if (status) {
            modelMap.addAttribute("sm", "Product Saved Successfully");
        } else {
            modelMap.addAttribute("em", "Product not Saved");
        }
        return "redirect:/";
    }

    @RequestMapping(value = "/editProduct/{id}", method = RequestMethod.GET)
    public String editPage(@PathVariable("id") String id, ModelMap modelMap) {
        product = productDao.getProduct(Integer.parseInt(id));
        modelMap.addAttribute("product", product);
        modelMap.addAttribute("products", productDao.getAllProduct());
        return "index";
    }

    @RequestMapping(value = "/updateProduct", method = RequestMethod.POST)
    public String updateProduct(ModelMap modelMap, HttpServletRequest request) {
        product = new Product();
        product.setPid(Integer.parseInt(request.getParameter("pid")));
        product.setPname(request.getParameter("pname"));
        product.setPrice(Double.parseDouble(request.getParameter("price")));
        product.setQty(Integer.parseInt(request.getParameter("qty")));
        boolean status = productDao.updateProduct(product);
        if (status) {
            modelMap.addAttribute("sm", "Product Info Update Successfully");
        } else {
            modelMap.addAttribute("em", "Product Info Not Update");
        }

        return "redirect:/";
    }

    @RequestMapping(value = "deleteProduct/{id}", method = RequestMethod.GET)
    public String deleteProduct(@PathVariable("id") String id, ModelMap modelMap, HttpServletRequest request) {

        Product p = new Product();
        p.setPid(Integer.parseInt(id));

        boolean status = productDao.deleteProduct(p);
        if (status) {
            modelMap.addAttribute("sm", "Student Info deleted Successfully");
        } else {
            modelMap.addAttribute("em", "Student Info Not deleted");
        }
        return "redirect:/";
    }

}
