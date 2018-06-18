/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package restaurantapp;

import java.sql.BatchUpdateException;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.time.Instant;
import java.util.ArrayList;
import java.util.Arrays;
import javax.swing.JOptionPane;
import javax.swing.JTable;

/**
 *
 * @author Kshitij
 */
public class PlaceOrder extends javax.swing.JPanel {
     private dbConnectorMain db;
    private StringBuffer cid = null;
    private Admin a;
    /**
     * Creates new form Orders
     */
    public PlaceOrder(dbConnectorMain db, Admin a) {
        initComponents();
        this.db = db;
        this.a = a;
        
                customer.setText(Integer.toString(this.a.getIdGenerator().getNext("cid")));
                order.setText(Integer.toString(this.a.getIdGenerator().getNext("oid")));
                store.setText(Integer.toString(this.a.getIdGenerator().getNext("sid")));
                 long time = Instant.now().toEpochMilli();
                 orderTime.setText(Integer.toString((int) time));
                 
                 this.addFoodItemsToDropDown();
                 
//                 String[] options = {"pet", "cat"};
    }
    
    public void addFoodItemsToDropDown() {
         foodOptions.removeAllItems();
                 ResultSet rs = this.db.readQueryAndReturnData("select title from foodItemOffers2 where sid = "
                         + store.getText());
                 
                 ArrayList<String> items = new ArrayList<String>();
                 
                 try {
                      while(rs.next()) {
                        items.add(rs.getString("title"));
                       }
                      
                      if (!items.isEmpty()) {
                                for (String s : items) {
                             foodOptions.addItem(s);
                         }
                      } else {
                          JOptionPane j = new JOptionPane();
                            j.showMessageDialog(null,
                              "Warning: Either current store does not exist or current store does not contain any food items", "Warning Massage",
                              JOptionPane.WARNING_MESSAGE);
     
                      }
                 
                   
                    
              
                 } catch (SQLException ex) {
                     System.out.println("Message: " + ex.getMessage());
//                  System.exit(-1);
                 }
    }

    /**
     * This method is called from within the constructor to initialize the form.
     * WARNING: Do NOT modify this code. The content of this method is always
     * regenerated by the Form Editor.
     */
    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        popupMenu1 = new java.awt.PopupMenu();
        jLabel1 = new javax.swing.JLabel();
        jLabel2 = new javax.swing.JLabel();
        jLabel3 = new javax.swing.JLabel();
        jLabel4 = new javax.swing.JLabel();
        order = new javax.swing.JTextField();
        customer = new javax.swing.JTextField();
        jLabel5 = new javax.swing.JLabel();
        store = new javax.swing.JTextField();
        jLabel6 = new javax.swing.JLabel();
        orderTime = new javax.swing.JTextField();
        jButton1 = new javax.swing.JButton();
        foodOptions = new javax.swing.JComboBox<>();

        popupMenu1.setLabel("popupMenu1");
        popupMenu1.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                popupMenu1ActionPerformed(evt);
            }
        });

        jLabel1.setText("Place An Order");

        jLabel2.setText("OrderID");

        jLabel3.setText("Customer ID");

        jLabel4.setText("Food Title");

        jLabel5.setText("Store ID");

        store.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                storeActionPerformed(evt);
            }
        });
        store.addPropertyChangeListener(new java.beans.PropertyChangeListener() {
            public void propertyChange(java.beans.PropertyChangeEvent evt) {
                storePropertyChange(evt);
            }
        });
        store.addKeyListener(new java.awt.event.KeyAdapter() {
            public void keyReleased(java.awt.event.KeyEvent evt) {
                storeKeyReleased(evt);
            }
            public void keyTyped(java.awt.event.KeyEvent evt) {
                storeKeyTyped(evt);
            }
        });

        jLabel6.setText("Order TIme");

        jButton1.setText("Place Order");
        jButton1.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jButton1ActionPerformed(evt);
            }
        });

        foodOptions.setModel(new javax.swing.DefaultComboBoxModel<>(new String[] { "Item 1", "Item 2", "Item 3", "Item 4" }));
        foodOptions.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                foodOptionsActionPerformed(evt);
            }
        });

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(this);
        this.setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(layout.createSequentialGroup()
                        .addGap(261, 261, 261)
                        .addComponent(jLabel1))
                    .addGroup(layout.createSequentialGroup()
                        .addGap(153, 153, 153)
                        .addComponent(jButton1))
                    .addGroup(layout.createSequentialGroup()
                        .addGap(62, 62, 62)
                        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addComponent(jLabel2)
                            .addComponent(jLabel3)
                            .addComponent(jLabel6)
                            .addComponent(jLabel5)
                            .addComponent(jLabel4))
                        .addGap(36, 36, 36)
                        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING, false)
                            .addComponent(orderTime, javax.swing.GroupLayout.DEFAULT_SIZE, 90, Short.MAX_VALUE)
                            .addComponent(store)
                            .addComponent(customer)
                            .addComponent(order)
                            .addComponent(foodOptions, 0, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))))
                .addContainerGap(324, Short.MAX_VALUE))
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addGap(27, 27, 27)
                .addComponent(jLabel1)
                .addGap(24, 24, 24)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jLabel2)
                    .addComponent(order, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addGap(18, 18, 18)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jLabel3)
                    .addComponent(customer, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addGap(20, 20, 20)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jLabel4)
                    .addComponent(foodOptions, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addGap(24, 24, 24)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jLabel5)
                    .addComponent(store, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addGap(28, 28, 28)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jLabel6)
                    .addComponent(orderTime, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addGap(64, 64, 64)
                .addComponent(jButton1)
                .addContainerGap(98, Short.MAX_VALUE))
        );
    }// </editor-fold>//GEN-END:initComponents

    private void jButton1ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButton1ActionPerformed
        // TODO add your handling code here:
        // Method to add and save to database
        
          try {
              this.db.con.setAutoCommit(false);
//                Statement statement = this.db.con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_UPDATABLE);
                PreparedStatement ps = this.db.con.prepareStatement("insert into OrderFullfillsAndPlaces values (?,?,?,?)");

//                ps.setInt(1, this.a.getIdGenerator().getNext("oid"));
//                ps.setInt(2, this.a.getIdGenerator().getNext("sid"));
//                ps.setInt(3, this.a.getIdGenerator().getNext("cid"));
                ps.setInt(1, Integer.parseInt(order.getText()));
                ps.setInt(2, Integer.parseInt(store.getText()));
                ps.setInt(3, Integer.parseInt(customer.getText()));
                ps.setInt(4, Integer.parseInt(orderTime.getText()));
                ps.execute();
                this.db.con.commit();
                
             
                
                PreparedStatement ps2 = this.db.con.prepareStatement("insert into Contains values (?,?)");
                ps2.setInt(1, Integer.parseInt(order.getText()));
                String selectedFood = String.valueOf(foodOptions.getSelectedItem());
                System.out.println("select fid from foodItemOffers2 where title = '"
                        + selectedFood + "'");
                
                ResultSet correspondingFid = this.db.readQueryAndReturnData("select fid from foodItemOffers2 where title = '"
                        + selectedFood + "'");
                if (correspondingFid.next()) {
                    System.out.println(correspondingFid.getInt("fid"));
                    ps2.setInt(2, correspondingFid.getInt("fid"));
                    ps2.execute();
                    this.db.con.commit();
                } else {
                    System.out.println("Current chosen title does not having a corresponding fid in the table");
                }

                
//                 // It creates and displays the table
//                 JTable resultTable = new JTable(Admin.buildTableModel(rs));
//                 ArrayList<String> columnNames = new ArrayList<String>(
//                         Arrays.asList("Message ID", "Subject", "Content", "Message Time", "Store Name"));
//                 
//                 Admin.modifyColumnNames(resultTable, columnNames);
//                 jScrollPane1.setViewportView(resultTable);

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
    }//GEN-LAST:event_jButton1ActionPerformed

    private void popupMenu1ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_popupMenu1ActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_popupMenu1ActionPerformed

    private void foodOptionsActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_foodOptionsActionPerformed
        // TODO add your handling code here:
        
    }//GEN-LAST:event_foodOptionsActionPerformed

    private void storeActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_storeActionPerformed
        // TODO add your handling code here:
        
        this.addFoodItemsToDropDown();
    }//GEN-LAST:event_storeActionPerformed

    private void storePropertyChange(java.beans.PropertyChangeEvent evt) {//GEN-FIRST:event_storePropertyChange
        // TODO add your handling code here:

    }//GEN-LAST:event_storePropertyChange

    private void storeKeyTyped(java.awt.event.KeyEvent evt) {//GEN-FIRST:event_storeKeyTyped
        // TODO add your handling code here:
                       

    }//GEN-LAST:event_storeKeyTyped

    private void storeKeyReleased(java.awt.event.KeyEvent evt) {//GEN-FIRST:event_storeKeyReleased
        // TODO add your handling code here:
         this.addFoodItemsToDropDown();
                        try {
                            Integer.parseInt(store.getText());
                          } catch (NumberFormatException ex) {
                              store.setText("1");
                          }
    }//GEN-LAST:event_storeKeyReleased


    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JTextField customer;
    private javax.swing.JComboBox<String> foodOptions;
    private javax.swing.JButton jButton1;
    private javax.swing.JLabel jLabel1;
    private javax.swing.JLabel jLabel2;
    private javax.swing.JLabel jLabel3;
    private javax.swing.JLabel jLabel4;
    private javax.swing.JLabel jLabel5;
    private javax.swing.JLabel jLabel6;
    private javax.swing.JTextField order;
    private javax.swing.JTextField orderTime;
    private java.awt.PopupMenu popupMenu1;
    private javax.swing.JTextField store;
    // End of variables declaration//GEN-END:variables
}
