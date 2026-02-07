package com.hostel.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.hostel.model.Student;
import com.hostel.utility.DBConnection;

public class StudentDAOImpl implements StudentDAOInterface {

	@Override
	public String registerStudent(Student s) {
		String sql = "INSERT INTO students(name,username,email,password) VALUES(?,?,?,?)";
		try (Connection con = DBConnection.getConnection(); PreparedStatement ps = con.prepareStatement(sql)) {

			ps.setString(1, s.getName());
			ps.setString(2, s.getUsername());
			ps.setString(3, s.getEmail());
			ps.setString(4, s.getPassword());
			ps.executeUpdate();
			return "success";

		} catch (Exception e) {
			e.printStackTrace();
		}
		return "fail";
	}

	@Override
	public boolean login(String username, String password) {
		String sql = "SELECT * FROM students WHERE username=? AND password=?";
		try (Connection con = DBConnection.getConnection(); PreparedStatement ps = con.prepareStatement(sql)) {

			ps.setString(1, username);
			ps.setString(2, password);
			ResultSet rs = ps.executeQuery();
			return rs.next();

		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}

	@Override
	public Student getStudentByUsername(String username) {
		String sql = "SELECT * FROM students WHERE username=?";
		Student s = null;

		try (Connection con = DBConnection.getConnection(); PreparedStatement ps = con.prepareStatement(sql)) {

			ps.setString(1, username);
			ResultSet rs = ps.executeQuery();

			if (rs.next()) {
				s = new Student();
				s.setName(rs.getString("name"));
				s.setUsername(rs.getString("username"));
				s.setEmail(rs.getString("email"));
				s.setPassword(rs.getString("password"));
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return s;
	}

	@Override
	public boolean updateStudent(Student s) {

	    String sql;

	    if (s.getPassword() != null) {
	        sql = "UPDATE students SET name=?, email=?, password=? WHERE username=?";
	    } else {
	        sql = "UPDATE students SET name=?, email=? WHERE username=?";
	    }

	    try (Connection con = DBConnection.getConnection();
	         PreparedStatement ps = con.prepareStatement(sql)) {

	        ps.setString(1, s.getName());
	        ps.setString(2, s.getEmail());

	        if (s.getPassword() != null) {
	            ps.setString(3, s.getPassword());
	            ps.setString(4, s.getUsername());
	        } else {
	            ps.setString(3, s.getUsername());
	        }

	        return ps.executeUpdate() > 0;

	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return false;
	}


	@Override
	public boolean deleteStudent(String username) {
		String sql = "DELETE FROM students WHERE username=?";
		try (Connection con = DBConnection.getConnection(); PreparedStatement ps = con.prepareStatement(sql)) {

			ps.setString(1, username);
			return ps.executeUpdate() > 0;

		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}

	public List<Student> getAllStudents() {
		List<Student> list = new ArrayList<>();
		String sql = "SELECT * FROM students";

		try (Connection con = DBConnection.getConnection();
				PreparedStatement ps = con.prepareStatement(sql);
				ResultSet rs = ps.executeQuery()) {

			while (rs.next()) {
				Student s = new Student();
				s.setId(rs.getInt("id"));
				s.setName(rs.getString("name"));
				s.setUsername(rs.getString("username"));
				s.setEmail(rs.getString("email"));
				list.add(s);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	 public Student getPlayerById(int id) {

	        Student s = null;
	        String sql = "SELECT * FROM students WHERE id=?";

	        try (Connection con = DBConnection.getConnection();
	             PreparedStatement ps = con.prepareStatement(sql)) {

	            ps.setInt(1, id);
	            ResultSet rs = ps.executeQuery();

	            if (rs.next()) {
	                s = new Student();
	                s.setId(rs.getInt("id"));
	                s.setName(rs.getString("name"));
	                s.setUsername(rs.getString("username"));
	                s.setEmail(rs.getString("email"));
	            }

	        } catch (Exception e) {
	            e.printStackTrace();
	        }

	        return s;
	    }

	    // ✏ UPDATE PLAYER
	    public void updatePlayer(Student s) {

	        String sql = "UPDATE students SET name=?, username=?, email=? WHERE id=?";

	        try (Connection con = DBConnection.getConnection();
	             PreparedStatement ps = con.prepareStatement(sql)) {

	            ps.setString(1, s.getName());
	            ps.setString(2, s.getUsername());
	            ps.setString(3, s.getEmail());
	            ps.setInt(4, s.getId());

	            ps.executeUpdate();

	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	    }

	    // 🗑 DELETE PLAYER
	    public void deletePlayer(int id) {

	        String sql = "DELETE FROM students WHERE id=?";

	        try (Connection con = DBConnection.getConnection();
	             PreparedStatement ps = con.prepareStatement(sql)) {

	            ps.setInt(1, id);
	            ps.executeUpdate();

	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	    }
}
