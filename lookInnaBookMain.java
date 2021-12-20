import java.util.Random;
import java.util.Scanner;
import java.math.BigInteger;
public class lookInnaBookMain {
    Scanner enter;
    Random rand;

    public void initialize(){
        System.out.println("welcome to LookInnaBook bookstore! Please login" +'\n' +
                "please select one of the following" +'\n' +
                "Login " +'\n'+
                "Create Account" +'\n'+
                "Employee Login" +'\n' +
                "Create Employee Account" +'\n' +
                "Enter Input: ");
        enter = new Scanner(System.in);
        String input = enter.nextLine();
        signIn(input);
    }

    public void signIn(String input){
        switch (input){
            case "Login":
                login();
                break;
            case "Create Account":
                createAccount();
                break;
            case "Employee Login":
                employeeLogin();
                break;
            case "Create Employee Account":
                createEmployeeAccount();
                break;
        }
    }

    public void login() {
        System.out.println("please enter your user name: ");
        Scanner username = new Scanner(System.in);
        String user = username.nextLine();
        System.out.println("please enter your password: ");
        Scanner password = new Scanner(System.in);
        String pass = password.nextLine();
        boolean check = functions.checkLogin(user, pass);
        if(check){
            promptTasks();
        }
        else {
            System.out.println("incorrect username or password, please try again");
            login();
        }
    }

    public void createAccount() {

        inputAccountInfo("regular");
        inputAddressinfo("shipping");
        inputBankingInfo();
        rand = new Random();
        int id = rand.nextInt(1000);
        functions.buildAccount(id);
        promptTasks();
    }



    public void employeeLogin() {
        System.out.println("please enter your user name: ");
        Scanner username = new Scanner(System.in);
        String user = username.nextLine();
        System.out.println("please enter your password: ");
        Scanner password = new Scanner(System.in);
        String pass = password.nextLine();
        boolean check = functions.checkEmployeeLogin(user, pass);
        if(check){
            promptEmployeetasks();
        }
        else {
            System.out.println("incorrect username or password, please try again");
            login();
        }
    }


    public void createEmployeeAccount() {
        inputAccountInfo("admin");
        rand = new Random();
        int id = rand.nextInt(1000);
        functions.createEmployee(id);
        promptEmployeetasks();
    }



    private void promptEmployeetasks() {

        System.out.println("Welcome back! what would you like to do?" +'\n' +
                "you can add books or delete them" +'\n' +
                "Add" +'\n'+
                "Delete" +'\n'+
                "Enter Input: ");
        Scanner enter = new Scanner(System.in);
        String input = enter.nextLine();
        tasks(input);


    }

    private void inputAccountInfo(String accountType) {
        System.out.println("we will now create your account, please enter a unique username");
        Scanner username = new Scanner(System.in);
        String user = username.nextLine();

        System.out.println("please enter a password");
        Scanner password = new Scanner(System.in);
        String pass = password.nextLine();

        System.out.println("please enter your first name");
        Scanner firstName = new Scanner(System.in);
        String first = firstName.nextLine();

        System.out.println("please enter your last name");
        Scanner lastName = new Scanner(System.in);
        String last = lastName.nextLine();

        System.out.println("please enter your email");
        Scanner emailInput = new Scanner(System.in);
        String email = emailInput.nextLine();

        System.out.println("please enter your phone number");
        Scanner phone = new Scanner(System.in);
        //int phoneNumber = Integer.parseInt(phone.nextLine());
        BigInteger phone_num = new BigInteger(phone.nextLine());

        if(functions.fillDetails(user, pass, accountType, first, last,email, phone_num)){
            System.out.println("successfully inputted account details");
        }
        else{
            System.out.println("try again");
            inputAccountInfo(accountType);
        }
    }

    private void inputAddressinfo(String addressType) {

        rand = new Random();
        int address_id = rand.nextInt(1000);

        System.out.println("input shipping address");

        System.out.println("please input your postal code without any spaces");
        Scanner postalCode = new Scanner(System.in);
        String postal = postalCode.nextLine();

        System.out.println("please input your street name");
        Scanner streetName = new Scanner(System.in);
        String street = streetName.nextLine();

        System.out.println("please input your street number");
        Scanner streetNum = new Scanner(System.in);
        int number = Integer.parseInt(streetNum.nextLine());

        System.out.println("please input your province");
        Scanner provinceInput = new Scanner(System.in);
        String province = provinceInput.nextLine();

        if (functions.fillAddress(address_id, addressType, postal, street, number, province)){
            System.out.println("successfully inputted shipping Address");

        }
        else{
            System.out.println("try again");
            inputAccountInfo(addressType);
        }

    }

    private void inputBankingInfo() {

        System.out.println("We will now ask for your banking information");

        System.out.println("please input your 8 digit credit card number without any spaces");
        Scanner cardNumber = new Scanner(System.in);
        int card = Integer.parseInt(cardNumber.nextLine());
        System.out.println(card);

        System.out.println("please enter your cards expiration date in the forf XXXX-XX-XX");
        Scanner expirationDate = new Scanner(System.in);
        String date = expirationDate.nextLine();

        System.out.println("please enter the 3 digit CVV on the back of your card");
        Scanner cvvNum = new Scanner(System.in);
        int cvv = Integer.parseInt(cvvNum.nextLine());


        if(functions.fillBankingInfo(card, date, cvv)){
            System.out.println("successfully inputted card information");
        }
        else{
            System.out.println("try again");
            inputBankingInfo();
        }

    }

    private void promptTasks() {
        System.out.println("Welcome back! what would you like to do?" +'\n' +
                "you may checkout or search by the following" +'\n' +
                "Name" +'\n'+
                "Author" +'\n'+
                "ISBN" +'\n' +
                "Genre" +'\n' +
                "Checkout" +'\n' +
                "Enter Input: ");
        Scanner enter = new Scanner(System.in);
        String input = enter.nextLine();
        tasks(input);

    }

    public void tasks(String tasks){
        switch (tasks){
            case "Name":
                System.out.println("input book name");
                Scanner Name = new Scanner(System.in);
                String name = Name.nextLine();
                functions.searchByName(name);

                System.out.println("If you'd like specific info on a book, enter its corresponding number, to go back enter 'back'");
                bookInfoName();
                break;
            case "Author":
                System.out.println("input authors first name");
                Scanner Author = new Scanner(System.in);
                String first = Author.nextLine();
                System.out.println("input authors first name");
                Scanner AuthorSecond = new Scanner(System.in);
                String second = AuthorSecond.nextLine();
                functions.searchByAuthor(first, second);

                System.out.println("If you'd like specific info on a book, enter its corresponding number, to go back enter 'back'");
                bookInfoName();
                break;
            case "ISBN":
                System.out.println("input ISBN");
                Scanner ISBN = new Scanner(System.in);
                int isbn = Integer.parseInt(ISBN.nextLine());
                functions.searchByISBN(isbn);

                System.out.println("If you'd like specific info on a book, enter its corresponding number, to go back enter 'back'");
                bookInfoName();
                break;
            case "Genre":
                System.out.println("input Genre");
                Scanner Genre = new Scanner(System.in);
                String genre = Genre.nextLine();
                functions.searchByGenre(genre);
                break;
            case "Checkout":
                System.out.println("input Genre");
                Scanner Checkout = new Scanner(System.in);
                String checkout = Checkout.nextLine();
                System.out.println();
                break;
            case "Add":
                addNewBook();
                break;
    }
    }

    private void bookInfoName() {
        Scanner enter = new Scanner(System.in);
        int input = Integer.parseInt(enter.nextLine());
        functions.bookInfoName(input);

        System.out.println("Would you like to add this book to your card? enter 'Yes' to proceed or 'No' to return to the menu:");
        Scanner decision = new Scanner(System.in);
        String in = decision.nextLine();
        bookDecision(in, input);

    }

    private void bookDecision(String decision, int input) {
        switch (decision){
            case "Yes":
                functions.addBook(input);
                break;
            case "No":
                promptTasks();
                break;
        }
    }

    private void addNewBook() {
        rand = new Random();
        int warehouse_id = rand.nextInt(1000);

        rand = new Random();
        int author_id = rand.nextInt(1000);

        System.out.println("What is the 5 character ISBN?");
        Scanner ISBNs = new Scanner(System.in);
        String ISBN = ISBNs.nextLine();

        System.out.println("What is the book name?");
        Scanner book_name = new Scanner(System.in);
        String name = book_name.nextLine();

        System.out.println("What is the price?");
        Scanner price_value = new Scanner(System.in);
        int price = Integer.parseInt(price_value.nextLine());

        System.out.println("What is the number of pages (in numbers)?");
        Scanner numP = new Scanner(System.in);
        int num = Integer.parseInt(numP.nextLine());

        System.out.println("What is the quantity of books?");
        Scanner q = new Scanner(System.in);
        int quantity = Integer.parseInt(q.nextLine());

        System.out.println("What is the royalities?");
        Scanner r = new Scanner(System.in);
        int royalities= Integer.parseInt(r.nextLine());

        System.out.println("What is the genre of the book?");
        Scanner g = new Scanner(System.in);
        String genre = g.nextLine();

        System.out.println("What is the author's first_name?");
        Scanner f = new Scanner(System.in);
        String first_name = f.nextLine();

        System.out.println("What is the author's last_name?");
        Scanner l = new Scanner(System.in);
        String last_name = l.nextLine();

        System.out.println("What is the author's email?");
        Scanner e = new Scanner(System.in);
        String email = e.nextLine();

        System.out.println("What is the author's phone number?");
        Scanner pn = new Scanner(System.in);
        BigInteger aPhone_num= new BigInteger(pn.nextLine());


        if(functions.newBooks(ISBN, name, price, num, quantity, royalities, genre, warehouse_id, author_id, first_name, last_name, email,aPhone_num)){
            System.out.println("successfully inputted book information");
        }
        else{
            System.out.println("try again");
            inputBankingInfo();
        }
    }



    public static void main(String[] args) {
        lookInnaBookMain lookInnaBookMain = new lookInnaBookMain();
        lookInnaBookMain.initialize();
    }


}
