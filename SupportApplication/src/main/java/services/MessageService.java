package services;

import java.io.Serializable;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import UtilitiesDatabase.DatabaseUtil;
import beans.MessageBean;

public class MessageService implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -1755994282590557301L;
	
	private final String SELECT_ALL = "SELECT * FROM message WHERE receiver_name='support' AND seen=0";
	private final String UPDATE_BY_ID = "UPDATE message SET seen=1 WHERE id=?";
	private final String SELECT_BY_ID = "SELECT * FROM message WHERE id=?";
	private final String SELECT_BY_CONTENT = "SELECT * FROM message WHERE seen=0 AND receiver_name='support' AND LOWER(message.content) LIKE LOWER(concat('%', ?,'%'))";
	
	
	public List<MessageBean> getAllMessages() {
		
		List<MessageBean> messages = new ArrayList<>();
		Connection connection = null;
		Statement s = null;
		ResultSet rs = null;
		try {
			connection = DatabaseUtil.getConnection();
			s = connection.createStatement();
			rs = s.executeQuery(SELECT_ALL);
			while(rs.next()) {
				messages.add(new MessageBean(rs.getInt(1), rs.getString(2), rs.getByte(3), rs.getDate(4),rs.getString(5),rs.getString(6)));
			}	
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			DatabaseUtil.closeAll(rs, s, connection);
		}
		return messages;
	}
	
	public int updateById(Integer id) {
		int value = 0;
		Connection connection = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			connection = DatabaseUtil.getConnection();
			Object[] values = {id};
			ps = DatabaseUtil.prepareStatement(connection, UPDATE_BY_ID, false, values);
			value = ps.executeUpdate();
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			DatabaseUtil.closeAll(rs, ps, connection);
		}
		return id;
	}
	
	public MessageBean getMessageById(Integer id) {
		MessageBean value = null;
		Connection connection = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			connection = DatabaseUtil.getConnection();
			Object[] values = {id};
			ps = DatabaseUtil.prepareStatement(connection, SELECT_BY_ID, false, values);
			rs = ps.executeQuery();
			if (rs.next()) {
				value = new MessageBean(rs.getInt(1), rs.getString(2), rs.getByte(3), rs.getDate(4),rs.getString(5),rs.getString(6));
			}
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			DatabaseUtil.closeAll(rs, ps, connection);
		}
		return value;
	}
	
	public List<MessageBean> getByContent(String content) {
		List<MessageBean> messages = new ArrayList<>();
		Connection connection = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			connection = DatabaseUtil.getConnection();
			Object[] values = {content};
			ps = DatabaseUtil.prepareStatement(connection, SELECT_BY_CONTENT, false, values);
			rs = ps.executeQuery();
			while(rs.next()) {
				messages.add(new MessageBean(rs.getInt(1), rs.getString(2), rs.getByte(3), rs.getDate(4),rs.getString(5),rs.getString(6)));
			}
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			DatabaseUtil.closeAll(rs, ps, connection);
		}
		return messages;
	}
	
}
