import java.sql.*;
import java.io.*;

public class simplejdbc {
  public static void main(String[] args)
      throws SQLException, ClassNotFoundException {
	  String userSelection,query;
	  
    // Load the JDBC driver
	try {
		Class.forName("com.mysql.jdbc.Driver");
		System.out.println("Loaded");
	} catch (ClassNotFoundException e) {
		System.out.println("Could not find the driver!");
	}
    // Connect to a database
	Connection connection = null;
	try {
	    connection = DriverManager.getConnection
	      ("jdbc:mysql://localhost/university?useSSL=false" , "root", "123456");
	    System.out.println("Database connected");
	} catch (SQLException e) {
		System.out.println("An error occured while connecting to the database.");
	}
    // Create a statement
    Statement statement = connection.createStatement();
    
    // Execute a statement
    ResultSet resultSet;
    
    userSelection = readEntry();
    while (userSelection.charAt(0) != 'q') {
    	switch (userSelection.charAt(0)) {
    	case 'a':
    		query = "SELECT title FROM course;";
    		resultSet = statement.executeQuery(query);
    		DisplayAllTitles(resultSet);
    		break;
    	case 'b':
    		query = "SELECT dept_name FROM department";
    		resultSet = statement.executeQuery(query);
    		DisplayAllDepartments(resultSet);
    		break;
    	case 'c':
    		query = "SELECT section_id, section.course_id, title FROM section JOIN course ON section.course_id = course.course_id";
    		resultSet = statement.executeQuery(query);
    		DisplayAllSections(resultSet);
    		break;
    	case 'd':
    		query = "SELECT section_id, course_id FROM section WHERE term_id = 'SP13'";
    		resultSet = statement.executeQuery(query);
    		DisplaySpringSections(resultSet);
    		break;
    	case 'e':
    		query = "SELECT last_name, first_name, major_desc FROM student JOIN major ON student.major_id = major.major_id";
    		resultSet = statement.executeQuery(query);
    		DisplayStudents(resultSet);
    		break;
    	case 'q':
    	default:
    		return;
    	}
    	userSelection = readEntry();
    }
    System.out.println("Goodbye!");
   /* ResultSet resultSet = statement.executeQuery
      ("select fname from employee where ssn = '111111100'"); */

    // Iterate through the result and print the employee names
   /* while (resultSet.next())
      System.out.println(resultSet.getString(1) + "\t");
   */
    // Close the connection
    statement.close();
    connection.close();
  }
  
  public static void DisplayOptions() {
	  System.out.println("               QUERY OPTIONS           ");
	  System.out.println("(a) Display the titles of all courses");
	  System.out.println("(b) Display the list of all departments");
	  System.out.println("(c) Display the secion ID, course ID, and course title for all sections");
	  System.out.println("(d) Display all coursre sections offered in Spring 2013.");
	  System.out.println("(e) Display names of students and their majors");
	  System.out.println("(q) Quit");
	  System.out.println("Type in your option: ");
  }
  
  public static String readEntry() {
	  try {
		  StringBuffer buffer = new StringBuffer();
		  DisplayOptions();
		  System.out.flush();
		  
		  int c = System.in.read();
		  while (c != '\n' && c != -1) {
			  buffer.append((char)c);
			  c = System.in.read();
		  }
		  return buffer.toString().trim();
	  } catch (IOException e) {
		  return "";
	  }
  }
  
  public static void DisplayAllTitles(ResultSet resultSet) throws SQLException {
	  //display formatted string with titles of all courses
	  String title;
	  System.out.println("The Titles of All Courses\n");
	  System.out.println("--------------------------\n");
	  while (resultSet.next()) {
		  title = resultSet.getString(1);
		  System.out.println(title);
	  }
  }
  
  public static void DisplayAllDepartments(ResultSet resultSet) throws SQLException {
	  String department;
	  System.out.println("The List of All Departments\n");
	  System.out.println("----------------------------\n");
	  while (resultSet.next()){
		  department = resultSet.getString(1);
		  System.out.println(department);
	  }
  }
  
  public static void DisplayAllSections(ResultSet resultSet) throws SQLException {
	  //display section id, course id, and course title of all sections
	  int sectionId;
	  String courseId, title;
	  String toShow = "";
	  toShow = String.format("%1$-10s %2$10s %3$10s", "Section ID", "Course ID", "Title" ) + "\n";
	  
	  while (resultSet.next()) {
		  sectionId = resultSet.getInt(1);
		  courseId = resultSet.getString(2);
		  title = resultSet.getString(3);
		  toShow += String.format("%1$-10s %2$s %3$10s", sectionId, courseId,title) + "\n";
	  }
	  System.out.println(toShow);
  }
  
  public static void DisplaySpringSections(ResultSet resultSet) throws SQLException {
	  int sectionId;
	  String courseId;
	  String toShow = String.format("%1$-10s %2$10s", "Section Id", "Course Id") + "\n";
	  
	  while (resultSet.next()) {
		  sectionId = resultSet.getInt(1);
		  courseId = resultSet.getString(2);
		  toShow += String.format("%1$-10s %2$10s", sectionId, courseId) + "\n";
	  }
	  System.out.println(toShow);
  }
  
  public static void DisplayStudents(ResultSet resultSet) throws SQLException {
	  String lastName, firstName, major, toShow;
	  toShow = String.format("%1$-10s %2$10s %3$10s", "Last Name", "First name", "Major") + "\n";
	  
	  while (resultSet.next()) {
		  lastName = resultSet.getString(1);
		  firstName = resultSet.getString(2);
		  major = resultSet.getString(3);
		  toShow += String.format("%1$-10s %2$10s %3$10s", lastName, firstName, major) + "\n";
	  }
	  System.out.println(toShow);
  }
}