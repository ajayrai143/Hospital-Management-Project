package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.entity.User;

public class UserDao {

	private Connection conn;

	public UserDao(Connection conn) {
		super();
		this.conn = conn;
	}

	public boolean register(User u) {

		boolean f = false;

		try {
			String sql = "insert into user_details(fullname,email,password) values(?,?,?)";

			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, u.getFullname());
			ps.setString(2, u.getEmail());
			ps.setString(3, u.getPassword());

			int i=ps.executeUpdate();

			if(i==1) {
				f=true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}


		return f;
	}

	public User login(String email, String password) {

		User u=null;
		try {
			String str = "select * from user_details where email=? and password=?";
			PreparedStatement ps = conn.prepareStatement(str);
			ps.setString(1, email);
			ps.setString(2, password);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				u=new User();
				u.setId(rs.getInt(1));
				u.setFullname(rs.getString(2));
				u.setEmail(rs.getString(3));
				u.setPassword(rs.getString(4));

			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return u;
	}

	public boolean checkOldPassword(int id, String oldPassword) {

		boolean f= false;

		try {
			String sql = "select * from user_details where id = ? and password=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, id);
			ps.setString(2, oldPassword);

			ResultSet rs = ps.executeQuery();
			System.out.println(rs);
			while(rs.next()) {
				System.out.println(rs);
				f=true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}
	public boolean changePassword(int id, String newPassword) {

		boolean f= false;

		try {
			String sql = "update user_details set password=? where id = ?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(2, id);
			ps.setString(1, newPassword);

			int i = ps.executeUpdate();
			if(i==1) {
				f=true;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;

	}


}
