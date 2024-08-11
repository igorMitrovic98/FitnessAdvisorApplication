package beans;

import java.io.Serializable;


import java.util.Date;

public class MessageBean implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 967331115079287588L;
	private Integer id;
	private String content;
	private Byte seen;
	private Date dateTime;
	private String senderName;
	private String receiverName;
	
	public MessageBean() {
		
	}

	public MessageBean(Integer id, String content, Byte seen, Date dateTime, String senderName,
			String receiverName) {
		super();
		this.id = id;
		this.content = content;
		this.seen = seen;
		this.dateTime = dateTime;
		this.senderName = senderName;
		this.receiverName = receiverName;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Byte getSeen() {
		return seen;
	}

	public void setSeen(Byte seen) {
		this.seen = seen;
	}

	public Date getDateTime() {
		return dateTime;
	}

	public void setDateTime(Date dateTime) {
		this.dateTime = dateTime;
	}

	public String getSenderName() {
		return senderName;
	}

	public void setSenderName(String senderName) {
		this.senderName = senderName;
	}

	public String getReceiverName() {
		return receiverName;
	}

	public void setReceiverName(String receiverName) {
		this.receiverName = receiverName;
	}
	
	
	
}
