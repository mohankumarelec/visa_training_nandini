package com.visa.prj.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.visa.prj.dao.ProductDao;
import com.visa.prj.entity.Product;

@Service
public class OrderService {
	@Autowired
	private ProductDao productDao;
	
	public void addProduct(Product p) {
		productDao.addProduct(p);
	}
	
	public List<Product> getProducts() {
		return productDao.getProducts();
	}
	
	public Product getProduct(int id) {
		return productDao.getProduct(id);
	}
}
