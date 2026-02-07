package com.hostel.dao;

import java.util.List;

import com.hostel.model.Student;

public interface StudentDAOInterface {

    String registerStudent(Student s);

    boolean login(String username, String password);

    Student getStudentByUsername(String username);

    boolean updateStudent(Student s);

    boolean deleteStudent(String username);
    
    List<Student> getAllStudents();
}
