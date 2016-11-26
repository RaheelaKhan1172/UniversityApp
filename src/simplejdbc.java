import java.sql.*;

public class simplejdbc {
  public static void main(String[] args)
      throws SQLException, ClassNotFoundException {
    // Load the JDBC driver
    Class.forName("com.mysql.jdbc.Driver");
    System.out.println("Driver loaded");

    // Connect to a database
    Connection connection = DriverManager.getConnection
      ("jdbc:mysql://localhost/company?useSSL=false" , "root", "123456");
    System.out.println("Database connected");

    // Create a statement
    Statement statement = connection.createStatement();

    // Execute a statement
    ResultSet resultSet = statement.executeQuery
      ("select fname from employee where ssn = '111111100'");

    // Iterate through the result and print the employee names
    while (resultSet.next())
      System.out.println(resultSet.getString(1) + "\t");

    // Close the connection
    connection.close();
  }
}