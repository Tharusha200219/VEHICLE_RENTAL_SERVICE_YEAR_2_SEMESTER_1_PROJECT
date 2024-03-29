package com.letslearn.Modal;

public class Packages extends User {
	private String id;
	private String packageName;
	private String packType;
	private String price;
	private String discount;
	private String tel;

	public Packages(String name, String email, String nic) {
		super(name, email, nic);
	}

	public Packages(String id,String name, String email, String nic, String packageName, String packType, String price,
			String discount, String tel) {
		super(name, email, nic);
		this.id = id;
		this.packageName = packageName;
		this.packType = packType;
		this.price = price;
		this.discount = discount;
		this.tel = tel;
	}
	
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPackageName() {
		return packageName;
	}

	public void setPackageName(String packageName) {
		this.packageName = packageName;
	}

	public String getPackType() {
		return packType;
	}

	public void setPackType(String packType) {
		this.packType = packType;
	}

	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}

	public String getDiscount() {
		return discount;
	}

	public void setDiscount(String discount) {
		this.discount = discount;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}
	

}
