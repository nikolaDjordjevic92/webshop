package com.webshop.spring.model;

import java.math.BigDecimal;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
//import javax.validation.constraints.NotNull;
//import javax.validation.constraints.Size;

@Entity
@Table(name="products")
public class Product {
	
	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
//	@NotNull
//    @Size(min=3, max=49)
    @Column(name = "name", nullable = false)
	private String name;
    
	@Column(name = "price", nullable = true)
	private BigDecimal price;
	
	@ManyToOne
	@JoinColumn(name="category_id")
	private Category category;
	
	@Column(name="picture_uri")
	private String pictureUri;
	
	@Column(name="quantity")
	private Integer quantity;
	
	public Integer getQuantity() {
		return quantity;
	}
	public void setQuantity(Integer quantity) {
		this.quantity = quantity;
	}
	public String getPictureUri() {
		return pictureUri;
	}
	public void setPictureUri(String pictureUri) {
		this.pictureUri = pictureUri;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public BigDecimal getPrice() {
		return price;
	}
	public void setPrice(BigDecimal price) {
		this.price = price;
	}
	public Category getCategory() {
		return category;
	}
	public void setCategory(Category category) {
		this.category = category;
	}
	
	public Product() {
		super();
	}
	
	public Product(int id, String name, BigDecimal price,Integer quantity) {
		super();
		this.id = id;
		this.name = name;
		this.price = price;
		this.quantity = quantity;
	}
}
