package services;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import UtilitiesDatabase.DatabaseUtil;
import beans.SupportBean;
import beans.UserBean;

public class SupportService implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 7966241859502950037L;
	
	private final String SELECT_SUPPORT = "SELECT * FROM support WHERE username=? AND password=?";
	private final String SELECT_BY_USERNAME = "SELECT * FROM user WHERE username=?";
	
	public SupportService() {
		
	}
	
	public SupportBean login(String username, String password) {
		SupportBean value = null;
		Connection connection = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			connection = DatabaseUtil.getConnection();
			Object[] values = {username, password};
			ps = DatabaseUtil.prepareStatement(connection, SELECT_SUPPORT, false, values);
			rs = ps.executeQuery();
			if (rs.next()) {
				value = new SupportBean(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4));
			}	
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			DatabaseUtil.closeAll(rs, ps, connection);
		}
		return value;
	}
	
	public UserBean getUserByUsername(String username) {
		UserBean value = null;
		Connection connection = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			connection = DatabaseUtil.getConnection();
			Object[] values = {username};
			ps = DatabaseUtil.prepareStatement(connection, SELECT_BY_USERNAME, false, values);
			rs = ps.executeQuery();
			if (rs.next()) {
				System.out.println("THIS WORKS HERE");
				value = new UserBean(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getByte(7));
			}
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			DatabaseUtil.closeAll(rs, ps, connection);
		}
		return value;
	}
}
