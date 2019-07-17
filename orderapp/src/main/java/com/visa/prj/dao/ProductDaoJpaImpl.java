package com.visa.prj.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.visa.prj.entity.Product;
@Repository
public class ProductDaoJpaImpl implements ProductDao {

	@Override
	public void addProduct(Product p) {
		System.out.println("Product added!!!");
	}

	@Override
	public List<Product> getProducts() {
		return null;
	}

	@Override
	public Product getProduct(int id) {
		return null;
	}

}
