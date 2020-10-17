package test;
import java.io.File;
import java.sql.*;
import org.w3c.dom.Document;
import org.w3c.dom.NodeList;
import org.w3c.dom.Node;
import org.w3c.dom.Element;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

public class JDBC_Application {
    public static void main(String args[]) {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        }
        catch(ClassNotFoundException e) {
            System .out.println("Class not found at all  "+ e);
        }

        int no_of_rows = 0;
 
        try {
            DocumentBuilderFactory docBuilderFactory =
                    DocumentBuilderFactory.newInstance();
            DocumentBuilder docBuilder =
                    docBuilderFactory.newDocumentBuilder();
            Document doc = docBuilder.parse(new File("C:\\Users\\Badrish\\OneDrive\\Desktop\\XML\\bank.xml"));
            doc.getDocumentElement().normalize();
            String tablename=
                    "bank";
            NodeList listOfCustomers = doc.getElementsByTagName("custdetails");
            System.out.println(listOfCustomers.getLength());
            Connection con = DriverManager.getConnection
            		("jdbc:mysql://localhost:3306/demoprj","root",
                            "Cse@5791");
//            String dbDriver = "com.mysql.cj.jdbc.Driver"; 
//    		String dbURL = "jdbc:mysql:// localhost:3306/"; 
//    		// Database name to access 
//    		String dbName = "demoprj"; 
//    		String dbUsername = "root"; 
//    		String dbPassword = "Cse@5791"; 

//    		Class.forName(dbDriver); 
//    		Connection con = DriverManager.getConnection(dbURL + dbName, 
//    													dbUsername, 
//    													dbPassword); 
//    		System.out.println("Success");

            Statement stmt = con.createStatement();
            for (int i = 0; i < listOfCustomers.getLength(); i++) {
                Node customer = listOfCustomers.item(i);
                    Element custElement = (Element) customer;
//                    		System.out.println(custElement.getElementsByTagName("custid").item(0).getTextContent());
                           String custid= custElement.getElementsByTagName("custid").item(0).getTextContent();
                           String custname= custElement.getElementsByTagName("custname").item(0).getTextContent();
                           String custage=custElement.getElementsByTagName("custage").item(0).getTextContent();
                            String custgen=custElement.getElementsByTagName("custgen").item(0).getTextContent();
                            String custadd= custElement.getElementsByTagName("custadd").item(0).getTextContent();
                            String custbranch= custElement.getElementsByTagName("custbranch").item(0).getTextContent();
//                            System.out.println(custid);

                            String SQL_QUERY= "INSERT INTO "+tablename+ " VALUES ('"+
                                    custid+"','"+
                                    custname+"','"+
                                    custage+"','"+
                                    custgen+"','"+
                                    custadd+"','"+
                                    custbranch+"')";

                            System.out.println(SQL_QUERY);
                            stmt.executeUpdate(SQL_QUERY);

            }
            System.out.println("Inserted records into the table...");
        }
        catch(Exception e)
        {
            System.out.println(e.getLocalizedMessage()+"--");
        }
    }
}
