package com.spring_boot_final.metasumer.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.spring_boot_final.metasumer.dao.IProductDAO;
import com.spring_boot_final.metasumer.model.ProductVO;

  @Service
  public class ProductService implements IProductService {
  @Autowired
  @Qualifier("IProductDAO")
  IProductDAO dao;

  @Override
  public ArrayList<ProductVO> listAllProductByBizId(Integer bizId) {
    return dao.listAllProductByBizId(bizId);
  }
  
  @Override
  public ArrayList<ProductVO> listAllProduct() {
    return dao.listAllProduct(); // DAO에게서 받은 결과값을 Controller에게 반환
  }

  @Override
  public void insertProduct(ProductVO product) {
    dao.insertProduct(product);
  }

  @Override
  public void updateProduct(ProductVO product) {
    dao.updateProduct(product);
  }

  @Override
  public void deleteProduct(String prdNo) {
    dao.deleteProduct(prdNo);
  }

  @Override
  public ProductVO detailViewProduct(String prdNo) {
    return dao.detailViewProduct(prdNo);
  }
  
  @Override
    public ArrayList<ProductVO> getBestProduct() {
      return dao.getBestProduct();
    }
  
  @Override
    public ArrayList<ProductVO> getNewProduct() {
      return dao.getNewProduct();
    }
  
  @Override
    public ArrayList<ProductVO> listAllCategories() {
      return dao.listAllCategories();
    }

  @Override
    public ArrayList<ProductVO> getProductsByCategory(String category) {
      return dao.getProductsByCategory(category);
    }
}
