/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package restaurantapp;

// We need to import the java.sql package to use JDBC
import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.WindowAdapter;
import java.awt.event.WindowEvent;
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.sql.BatchUpdateException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Arrays;

// for reading from the command line
// for the login window


/*
 * This class implements the connection to the db
 */

/**
 *
 * @author w0k0b
 */
public class dbConnectorMain {
     // command line reader
    private BufferedReader in = new BufferedReader(new InputStreamReader(System.in));

    public Connection con;
    public Admin welcomeScreen;
    public boolean quit = false;
    
    
    public dbConnectorMain () {
         try
        {
            // Load the Oracle JDBC driver
            DriverManager.registerDriver(new oracle.jdbc.driver.OracleDriver());
            // may be oracle.jdbc.driver.OracleDriver as of Oracle 11g
            connect("ora_w7h0b", "a35169151");
            showMenu();
        }
        catch (SQLException ex)
        {
            System.out.println("Message: " + ex.getMessage());
            System.exit(-1);
        }
    }
    
    public void setQuit(boolean value) {
        this.quit = value;
    }
    
    
     /*
     * connects to Oracle database named ug using user supplied username and password
     */
    private boolean connect(String username, String password)
    {
        String connectURL = "jdbc:oracle:thin:@localhost:1522:ug";
        boolean connected = false;


        try
        {
            con = DriverManager.getConnection(connectURL,username,password);

            System.out.println("\nConnected to Oracle!");
            connected = true;
        }
        catch (SQLException ex)
        {
            System.out.println("Message: " + ex.getMessage());
        }

        return connected;
    }
    
    private void showMenu()
    {


        try {
            // disable auto commit mode
            con.setAutoCommit(false);
            this.welcomeScreen = Admin.getInstance(this);
            this.welcomeScreen.initializeWelcomeScreen();
            

            while (!this.quit) {
//                mainFrame = new JFrame("Welcome to THE restaurant");
//                JButton storeManagerOption = new JButton("Login as StoreManager");
//                JButton customeroption = new JButton("Login as Customer");


//                JPanel contentPane = new JPanel();
//                mainFrame.setContentPane(contentPane);


                // layout components using the GridBag layout manager

//                GridBagLayout gb = new GridBagLayout();
//                GridBagConstraints c = new GridBagConstraints();
//
//                contentPane.setLayout(gb);
//                contentPane.setBorder(BorderFactory.createEmptyBorder(50, 50, 50, 50));
//
//                //place store manager button
//                c.gridwidth = GridBagConstraints.REMAINDER;
//                c.insets = new Insets(5, 10, 10, 10);
//                c.anchor = GridBagConstraints.CENTER;
//                gb.setConstraints(storeManagerOption, c);
//                contentPane.add(storeManagerOption);
//
//                // register button with action event handler
//                AllEventListener al = new AllEventListener(this, this.mainFrame);
//                storeManagerOption.addActionListener(al);


                // anonymous inner class for closing the window
//                mainFrame.addWindowListener(new WindowAdapter()
//                {
//                    public void windowClosing(WindowEvent e)
//                    {
//                        System.exit(0);
//                    }
//                });

                // size the window to obtain a best fit for the components
//                mainFrame.pack();
//
//                // center the frame
//                Dimension d = mainFrame.getToolkit().getScreenSize();
//                Rectangle r = mainFrame.getBounds();
//                mainFrame.setLocation( (d.width - r.width)/2, (d.height - r.height)/2 );
//
//                // make the window visible
//                mainFrame.setVisible(true);

            }

            this.con.close();
            System.out.println("\nGood Bye!\n\n");
            System.exit(0);


        }
        catch (SQLException ex)
        {
                System.out.println("Message: " + ex.getMessage());
        }
        
    }
    
     public static void main(String args[])
    {
        dbConnectorMain db = new dbConnectorMain();
    }
     
     public void readQueryAndUpdateUI (String sql, ArrayList<String> columnNames, JScrollPane panel) {
         try {
                Statement statement = this.con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_UPDATABLE);
                ResultSet rs = statement.executeQuery(sql);
                
                 // It creates and displays the table
                 JTable resultTable = new JTable(Admin.buildTableModel(rs));
                 ArrayList<String> columns = columnNames;
                 
                 Admin.modifyColumnNames(resultTable, columns);
                 panel.setViewportView(resultTable);

         }
            catch (SQLException ex) {
                System.out.println("Message: " + ex.getMessage());
//                System.exit(-1);
            }
     }
     
     public ResultSet readQueryAndReturnData (String sql) {
         ResultSet rs = null;
         try {
                Statement statement = this.con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_UPDATABLE);
                rs = statement.executeQuery(sql);
                
                 // It creates and displays the table
//                 resultTable = new JTable(Admin.buildTableModel(rs));
                

         }
            catch (SQLException ex) {
                System.out.println("Message: " + ex.getMessage());
//                System.exit(-1);
            }
        return rs;
     }
     
     public void insertQuery(String[] values, String tableName) {
         try {
              this.con.setAutoCommit(false);
              StringBuffer str = new StringBuffer();
              str.append("insert into "
                      + tableName
                      + " values (");
              for (int i=0; i< values.length; i++) {
                  if (i == (values.length - 1)) {
                      str.append("?)");
                  } else {
                       str.append("?, ");
                  }
              }
              PreparedStatement ps = this.con.prepareStatement(str.toString());

//                ps.setInt(1, this.a.getIdGenerator().getNext("oid"));
//                ps.setInt(2, this.a.getIdGenerator().getNext("sid"));
//                ps.setInt(3, this.a.getIdGenerator().getNext("cid"));
                for (int j = 1; j<= values.length; j++) {
                    try {
                        ps.setInt(j, Integer.parseInt(values[j]));
                    } catch (NumberFormatException n) {
                        ps.setString(j, values[j]);
                    }
                }
                
                ps.execute();
                this.con.commit();

         }
          catch (BatchUpdateException ex)
            {
              System.out.println("Message: " + ex.getMessage());
              int[] updateCounts = ex.getUpdateCounts();
              System.out.println("Update Counts:");
              for (int i = 0; i < updateCounts.length; i++)
              {
                 System.out.println(updateCounts[i]);
              }
            }
            catch (SQLException ex2) {
                System.out.println("Message: " + ex2.getMessage());
//                System.exit(-1);
            }
     }


}