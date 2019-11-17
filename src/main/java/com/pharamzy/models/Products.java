package com.pharamzy.models;

import java.sql.Date;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.hibernate.annotations.OnDelete;
import org.hibernate.annotations.OnDeleteAction;

@Entity
@Table(name="products")
public class Products {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	int p_id;
	
	String p_name;
	float p_price;
	float p_weight;
	String p_description;
	String p_image;
	Date p_mnf_date;
	Date p_exp_date;
	int p_stock;
	
	@ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name="cat_id",nullable=false)
	@OnDelete(action = OnDeleteAction.CASCADE)
    Category category_id;

	public int getP_id() {
		return p_id;
	}

	public void setP_id(int p_id) {
		this.p_id = p_id;
	}

	public String getP_name() {
		return p_name;
	}

	public void setP_name(String p_name) {
		this.p_name = p_name;
	}

	public float getP_price() {
		return p_price;
	}

	public void setP_price(float p_price) {
		this.p_price = p_price;
	}

	public float getP_weight() {
		return p_weight;
	}

	public void setP_weight(float p_weight) {
		this.p_weight = p_weight;
	}

	public String getP_description() {
		return p_description;
	}

	public void setP_description(String p_description) {
		this.p_description = p_description;
	}

	public String getP_image() {
		return p_image;
	}

	public void setP_image(String p_image) {
		this.p_image = p_image;
	}

	public Date getP_mnf_date() {
		return p_mnf_date;
	}

	public void setP_mnf_date(Date p_mnf_date) {
		this.p_mnf_date = p_mnf_date;
	}

	public Date getP_exp_date() {
		return p_exp_date;
	}

	public void setP_exp_date(Date p_exp_date) {
		this.p_exp_date = p_exp_date;
	}

	public int getP_stock() {
		return p_stock;
	}

	public void setP_stock(int p_stock) {
		this.p_stock = p_stock;
	}

	public Category getCategory_id() {
		return category_id;
	}

	public void setCategory_id(Category cat_id) {
		this.category_id = cat_id;
	}
	
    
	
	
}
