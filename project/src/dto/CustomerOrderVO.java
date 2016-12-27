package dto;

import java.sql.Timestamp;

public class CustomerOrderVO {
	private int customerorder_number;
	private String customerorder_id;
	private String customerorder_name;
	private String customerorder_subject;
	private String customerorder_content;
	private String customerorder_file;
	private int customerorder_re_ref;
	private int customerorder_re_lev;
	private int customerorder_re_seq;
	private int customerorder_readcount;
	private Timestamp customerorder_regdate;
	public int getCustomerorder_number() {
		return customerorder_number;
	}
	public void setCustomerorder_number(int customerorder_number) {
		this.customerorder_number = customerorder_number;
	}
	public String getCustomerorder_id() {
		return customerorder_id;
	}
	public void setCustomerorder_id(String customerorder_id) {
		this.customerorder_id = customerorder_id;
	}
	public String getCustomerorder_name() {
		return customerorder_name;
	}
	public void setCustomerorder_name(String customerorder_name) {
		this.customerorder_name = customerorder_name;
	}
	public String getCustomerorder_subject() {
		return customerorder_subject;
	}
	public void setCustomerorder_subject(String customerorder_subject) {
		this.customerorder_subject = customerorder_subject;
	}
	public String getCustomerorder_content() {
		return customerorder_content;
	}
	public void setCustomerorder_content(String customerorder_content) {
		this.customerorder_content = customerorder_content;
	}
	public String getCustomerorder_file() {
		return customerorder_file;
	}
	public void setCustomerorder_file(String customerorder_file) {
		this.customerorder_file = customerorder_file;
	}
	public int getCustomerorder_re_ref() {
		return customerorder_re_ref;
	}
	public void setCustomerorder_re_ref(int customerorder_re_ref) {
		this.customerorder_re_ref = customerorder_re_ref;
	}
	public int getCustomerorder_re_lev() {
		return customerorder_re_lev;
	}
	public void setCustomerorder_re_lev(int customerorder_re_lev) {
		this.customerorder_re_lev = customerorder_re_lev;
	}
	public int getCustomerorder_re_seq() {
		return customerorder_re_seq;
	}
	public void setCustomerorder_re_seq(int customerorder_re_seq) {
		this.customerorder_re_seq = customerorder_re_seq;
	}
	public int getCustomerorder_readcount() {
		return customerorder_readcount;
	}
	public void setCustomerorder_readcount(int customerorder_readcount) {
		this.customerorder_readcount = customerorder_readcount;
	}
	public Timestamp getCustomerorder_regdate() {
		return customerorder_regdate;
	}
	public void setCustomerorder_regdate(Timestamp customerorder_regdate) {
		this.customerorder_regdate = customerorder_regdate;
	}
	@Override
	public String toString() {
		return "CustomerOrderVO [customerorder_number=" + customerorder_number + ", customerorder_id="
				+ customerorder_id + ", customerorder_name=" + customerorder_name + ", customerorder_subject="
				+ customerorder_subject + ", customerorder_content=" + customerorder_content + ", customerorder_file="
				+ customerorder_file + ", customerorder_re_ref=" + customerorder_re_ref + ", customerorder_re_lev="
				+ customerorder_re_lev + ", customerorder_re_seq=" + customerorder_re_seq + ", customerorder_readcount="
				+ customerorder_readcount + ", customerorder_regdate=" + customerorder_regdate + "]";
	}
}
