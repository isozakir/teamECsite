package jp.co.internous.node.model.form;

import java.io.Serializable;

public class SearchForm implements Serializable{
	
	private static final long serialVersionUID = -1408151499677903692L;
	
	private String productName;
	private long categoryId;
	
	public String getProductName() {
		return productName;
	}
	
	public void setProductName(String productName) {
		this.productName = productName;
	}
	
	public long getCategoryId() {
		return categoryId;
	}
	
	public void setCategoryId(long categoryId) {
		this.categoryId = categoryId;
	}
	

}
