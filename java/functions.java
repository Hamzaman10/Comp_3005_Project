import java.sql.*;
import java.util.ArrayList;
import java.util.Random;
import java.util.Scanner;
import java.math.BigInteger;

public class functions {
    private static final String user = null;
    private static final String password = null;
    private static final String database = null;
    private static Statement statement;
    private static Connection connection;
    private static Integer accountInfo;
    private static String account_name;
    private static Integer addressId;
    private static long cardNumber;
    private static ArrayList<String> bookList;
    private static int price;
    private static int amount;

    static {
        try {
            connection = DriverManager.getConnection("jdbc:postgresql://localhost:5432/" + database, user, password);
            statement = connection.createStatement();

        } catch (SQLException sqle) {
            sqle.printStackTrace();
        }
    }

    public static boolean checkLogin(String username, String password){
        try{
            ResultSet resultSet = statement.executeQuery("Select * from account_details where account_type = 'regular' AND account_name ='" + username + "'");
            System.out.println(resultSet);
            while (resultSet.next()){
                if (password.equals(resultSet.getString("password"))){
                    account_name = resultSet.getString("account_name");
                    System.out.println("login successful");
                    getAccountInfo(username);
                    return true;
                }
                else{return false;}
            }
        }
        catch (SQLException sqle){
            sqle.printStackTrace();
        }
        return false;
    }


    public static boolean checkEmployeeLogin(String username, String password) {
        try{
            ResultSet resultSet = statement.executeQuery("Select password from account_details where account_type = 'admin' AND account_name ='" + username + "'");
            while (resultSet.next()){
                if (password.equals(resultSet.getString("password"))){
                    System.out.println("login successful");
                    return true;
                }
                else{return false;}
            }
        }
        catch (SQLException sqle){
            sqle.printStackTrace();
        }
        return false;
    }

    public static void getAccountInfo(String username){
        try{
            ResultSet resultSet = statement.executeQuery("Select account_id from account_main natural join account_details where account_name ='" + username + "'");
            System.out.println(resultSet);
            while (resultSet.next()){
                accountInfo = resultSet.getInt("account_id");
            }
        }
        catch (SQLException sqle){
            sqle.printStackTrace();
        }
    }

    public static boolean fillDetails(String username, String password,String accountType, String firstname, String lastname, String email, BigInteger phoneNumber) {
        String query = "INSERT INTO account_details values('%s', '%s', '%s', '%s', '%s', '%s', '%s')";
        String sql = String.format(query, username, password, accountType, firstname, lastname, email, phoneNumber);
        try{
            int resultSet = statement.executeUpdate(sql);
            if(resultSet > 0){
                account_name = username;
                return true;
            }
            else {
                System.out.println("Sorry, someone may already have this username, please try again");
                return false;
            }
        }
        catch (SQLException sqle){
            sqle.printStackTrace();
        }
        return false;
    }

    public static boolean fillAddress(int address_id, String address_type, String post_code, String street_name, int Street_number, String province){
        String query = "INSERT INTO address values('%s', '%s', '%s', '%s', '%s', '%s')";
        String sql = String.format(query,address_id, address_type, post_code, street_name, Street_number, province);
        try{
            int resultSet = statement.executeUpdate(sql);
            if(resultSet > 0){
                addressId = address_id;
                return true;
            }
            else {
                System.out.println("Please input again");
                return false;
            }
        }
        catch (SQLException sqle){
            sqle.printStackTrace();
        }
        return false;
    }

    public static boolean fillBankingInfo(long cardNum, String exp_date, int cvv_num){
        String query = "INSERT INTO banking_info values('%s', '%s', '%s')";
        String sql = String.format(query, cardNum, exp_date, cvv_num);
        try{
            int resultSet = statement.executeUpdate(sql);
            if(resultSet > 0){
                cardNumber = cardNum;
                return true;
            }
            else {
                System.out.println("Please input again");
                return false;
            }
        }
        catch (SQLException sqle){
            sqle.printStackTrace();
        }
        return false;
    }

    public static void buildAccount(int id){
        String query = "INSERT INTO account_main values('%s', '%s', '%s', '%s')";
        String sql = String.format(query, id, account_name, addressId, cardNumber);
        try{
            int resultSet = statement.executeUpdate(sql);
            if(resultSet > 0){
                System.out.println("Account succesfully made");
            }
            else{

            }
        }
        catch (SQLException sqle){
            sqle.printStackTrace();
        }
    }

    public static Integer getAccount() {
        return accountInfo;
    }

    public static void searchByName(String name) {
        bookList = new ArrayList<>();
        try{
            ResultSet resultSet = statement.executeQuery("Select book_name from book where book_name ='" + name + "'");
            while (resultSet.next()){
                String bookName = resultSet.getString("book_name");
                bookList.add(bookName);
                printBooks();
            }
        }
        catch (SQLException sqle){
            sqle.printStackTrace();
        }
    }


    public static void searchByAuthor(String first, String second) {
        bookList = new ArrayList<>();
        try{
            ResultSet resultSet = statement.executeQuery("Select book_name from book natural join written_by natural join author where first_name='" + first + "' AND last_name = '" + second + "'");
            while (resultSet.next()){
                String bookName = resultSet.getString("book_name");
                bookList.add(bookName);
            }
            printBooks();
        }
        catch (SQLException sqle){
            sqle.printStackTrace();
        }
    }

    public static void searchByISBN(int isbn) {
        bookList = new ArrayList<>();
        try{
            ResultSet resultSet = statement.executeQuery("Select book_name from book where isbn ='" + isbn + "'");
            while (resultSet.next()){
                String bookName = resultSet.getString("book_name");
                bookList.add(bookName);
                printBooks();
            }
        }
        catch (SQLException sqle){
            sqle.printStackTrace();
        }
    }

    public static void searchByGenre(String genre) {
    }

    public static void bookInfoName(int input) {
        try{
            ResultSet resultSet = statement.executeQuery("Select * from book where book_name ='" + bookList.get(input-1) + "'");
            while (resultSet.next()){
                System.out.println("ISBN: " + resultSet.getString("isbn"));
                System.out.println("Book Name: " + resultSet.getString("book_name"));
                System.out.println("Price " + resultSet.getString("price"));
                System.out.println("Number Of Pages: " + resultSet.getString("number_of_pages"));
                System.out.println("Stock available: " + resultSet.getString("quantity"));
            }
            ResultSet resultSet2 = statement.executeQuery("Select first_name, last_name from author natural join written_by natural join book where book_name ='" + bookList.get(input-1) + "'");
            while(resultSet2.next()){
                System.out.println("Author Name: " + resultSet2.getString("first_name") +" " + resultSet2.getString("last_name"));
            }
            ResultSet resultSet3 = statement.executeQuery("Select publisher_name from publisher_books natural join book where book_name ='" + bookList.get(input-1) + "'");
            while(resultSet3.next()){
                System.out.println("Publisher Name: " + resultSet3.getString("publisher_name"));
            }
        }
        catch (SQLException sqle){
            sqle.printStackTrace();
        }
    }

    public static void addBook(int input) {
        try{
            ResultSet resultSet = statement.executeQuery("Select * from book where book_name ='" + bookList.get(input-1) + "'");
            int price = 0;
            int amount = 0;
            String isbn = null;
            while (resultSet.next()){
                price = Integer.parseInt(resultSet.getString("price"));
                isbn = resultSet.getString("isbn");
            }

            ResultSet resultSet2 = statement.executeQuery("Select * from basket_amount where basket_owner ='" + account_name + "'");
            while (resultSet2.next()){
                price += resultSet2.getInt("price");
                amount = Integer.parseInt(resultSet2.getString("amount_added"));
                amount++;
            }

            if(resultSet2.next() == false){
                Statement stmt = connection.createStatement();
                stmt.executeUpdate("UPDATE basket_amount " + "set price = " + price + "where basket_owner ='" + account_name + "'");
                stmt.executeUpdate("UPDATE basket_amount " + "set amount_added = " + amount + "where basket_owner ='" + account_name + "'");
                System.out.println("Database updated successfully ");
               // Random rand = new Random();
                //int id = rand.nextInt(1000);
               // String order_id = null;
               // String query2 = "INSERT INTO basket_main values('%s', '%s','%s','%s','%s')";
               // String sql2 = String.format(query2, id, account_name, accountInfo, order_id, isbn);
              //  int resultset4 = statement.executeUpdate(sql2);
               // if(resultset4>0){
               //     System.out.println("added to cart");
              //  }
            }
            else{
               // String query = "INSERT INTO basket_amount values('%s', '%s','%s')";
               // String sql = String.format(query, account_name, price, 1);
               // int resultset5 = statement.executeUpdate(sql);
               // Random rand = new Random();
               // int id = rand.nextInt(1000);
              //  String order_id = null;
              //  String query2 = "INSERT INTO basket_main values('%s', '%s','%s', '%s', '%s')";
              //  String sql2 = String.format(query2, id, account_name, accountInfo, order_id, isbn);
               // int resultset6 = statement.executeUpdate(sql2);
              //  if((resultset5 & resultset6) > 0){
               //     System.out.println("added to cart");
              //  }


            }
        }
        catch (SQLException sqle){
            sqle.printStackTrace();
        }
    }

    public static void createEmployee(int id) {
        String query = "INSERT INTO account_main values('%s', '%s')";
        String sql = String.format(query, id, account_name);
        try{
            int resultSet = statement.executeUpdate(sql);
            if(resultSet > 0){
                System.out.println("Account succesfully made");
            }
            else{

            }
        }
        catch (SQLException sqle){
            sqle.printStackTrace();
        }

    }

    public static boolean newBooks(String ISBN, String book_name, int price, int number_of_pages, int quantity, int royalities, String genre, int warehouse_id, int author_id, String first_name, String last_name, String email, BigInteger aPhone_number) {
        String query = "INSERT INTO book values('%s', '%s', '%s', '%s', '%s', '%s', '%s')";
        String sql = String.format(query, ISBN, book_name, price, number_of_pages, quantity, royalities, genre);

        String p = "6478921414";
        BigInteger phone = new BigInteger(p);

        String wareN = "torontohouse";
        String wareL = "toronto";

        String query2 = "INSERT INTO warehouse values('%s', '%s', '%s', '%s', '%s')";
        String sql2 = String.format(query2, warehouse_id, wareN, phone, wareL, ISBN);

        String query3 = "INSERT INTO author values('%s', '%s', '%s', '%s', '%s')";
        String sql3 = String.format(query3, author_id, email, first_name, last_name, aPhone_number);

        try{
            int resultSet = statement.executeUpdate(sql);
            int resultSet2 = statement.executeUpdate(sql2);
            int resultSet3 = statement.executeUpdate(sql3);

            if(resultSet > 0 & resultSet2 > 0 & resultSet3 > 0){
                return true;
            }
            else {
                System.out.println("Please input again");
                return false;
            }
        }
        catch (SQLException sqle){
            sqle.printStackTrace();
        }
        return false;
    }

    private static void printBooks() {
        for (int i = 0; i < bookList.size();i++)
        {
            System.out.println(i+1+ ": " + bookList.get(i));
        }
    }

}
