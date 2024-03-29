package com.letslearn.Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.letslearn.Modal.Packages;

public class PackagesDao {
	private Connection con;
	private String query;
    private PreparedStatement pst;
    private ResultSet rs;

	public PackagesDao(Connection con) {
		this.con = con;
	}
	
	public int addPackages(Packages packages) {
		int result = 0;
  		try {
  			query="INSERT INTO packages (name,email,tel,packName,packType,price,discount)\r\n"
  					+ "VALUES (?,?,?,?,?,?,?);";
  			pst = this.con.prepareStatement(query);
            pst.setString(1,  packages.getName());
            pst.setString(2, packages.getEmail());
            pst.setString(3, packages.getTel());
            pst.setString(4, packages.getPackageName());
            pst.setString(5, packages.getPackType());
            pst.setString(6, packages.getPrice());
            pst.setString(7, packages.getDiscount());
            result=pst.executeUpdate();
  		}catch(Exception e) {
  			e.printStackTrace();
  		}
  		return result;
	}
	//get coupon id name
	public List<Packages> getAllPackagess(){
  		List<Packages> packages = new ArrayList<Packages>();
  		try {
  			query="select * from packages";
  			pst=this.con.prepareStatement(query);
  			rs=pst.executeQuery();
  			while(rs.next()) {
  				Packages cpn = new Packages("","","");
  				cpn.setPackageName(rs.getString("packName"));
  				cpn.setName(rs.getString("name"));
  				cpn.setEmail(rs.getString("email"));
  				cpn.setPackType(rs.getString("packType"));
  				cpn.setTel(rs.getString("tel"));
  				cpn.setPrice(rs.getString("price"));
  				cpn.setDiscount(rs.getString("discount"));
  				cpn.setTel(rs.getString("tel"));
  				cpn.setId(rs.getString("id"));
  				packages.add(cpn);
  				
  			}
  		}catch(Exception e) {
  			e.printStackTrace();
  		}
  		return packages;
  		
  	}
	
	public int deletePackages(String id) {
  		int result=0;
  		try {
  			query="DELETE FROM packages WHERE id=?;";
  			pst = this.con.prepareStatement(query);
            pst.setString(1,id);
      
            result=pst.executeUpdate();
  		}catch(Exception e) {
  			e.printStackTrace();
  		}
  		return result;
  	}
	
	//updating coupons
  	public int updatePackages(Packages packages) {
  		int result=0;
  		try {
  			query="UPDATE packages SET name = ?, packType= ? , packName=?,email=?,tel=?,price=?,discount=? WHERE id = ?;";
  			pst = this.con.prepareStatement(query);
  			 pst.setString(1,  packages.getName());
             pst.setString(2, packages.getPackType());
             pst.setString(3, packages.getPackageName());
             pst.setString(4, packages.getEmail());
             pst.setString(5, packages.getTel());
             pst.setString(6, packages.getPrice());
             pst.setString(7, packages.getDiscount());
             pst.setString(8, packages.getId());
            result=pst.executeUpdate();
  		}catch(Exception e) {
  			e.printStackTrace();
  		}
  		return result;
  	}

}
