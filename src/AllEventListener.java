

import javax.swing.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;


public class AllEventListener implements ActionListener {

    private ActionEvent al;
    private branch b;
    public JFrame mainframe;

    public AllEventListener (branch b, JFrame mainframe) {
        this.b = b;
        this.mainframe = mainframe;
    }

    @Override
    public void actionPerformed(ActionEvent e)  {
        this.al = e;

        if (this.al.getActionCommand().equals("Login as StoreManager")) {
            try {
                Statement statement = this.b.con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
                ResultSet rs = statement.executeQuery("SELECT Name from CONTAINS");
                System.out.println(rs);
                do {
                    System.out.println(rs.getString("Name"));
                } while (rs.next());
            }
            catch (SQLException ex) {
                System.out.println("Message: " + ex.getMessage());
                System.exit(-1);
            }
        }

    }
}
