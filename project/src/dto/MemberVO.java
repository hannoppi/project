package dto;

import java.sql.Timestamp;

public class MemberVO {
	private String member_name;
	private String member_id;
	private String member_password;
	private String member_birthday;
	private String member_postcode;
	private String member_address;
	private String member_tel;
	private String member_phone;
	private String member_email;
	private int member_admin;
	private Timestamp member_regdate;
	public String getMember_name() {
		return member_name;
	}
	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public String getMember_password() {
		return member_password;
	}
	public void setMember_password(String member_password) {
		this.member_password = member_password;
	}
	public String getMember_birthday() {
		return member_birthday;
	}
	public void setMember_birthday(String member_birthday) {
		this.member_birthday = member_birthday;
	}
	public String getMember_postcode() {
		return member_postcode;
	}
	public void setMember_postcode(String member_postcode) {
		this.member_postcode = member_postcode;
	}
	public String getMember_address() {
		return member_address;
	}
	public void setMember_address(String member_address) {
		this.member_address = member_address;
	}
	public String getMember_tel() {
		return member_tel;
	}
	public void setMember_tel(String member_tel) {
		this.member_tel = member_tel;
	}
	public String getMember_phone() {
		return member_phone;
	}
	public void setMember_phone(String member_phone) {
		this.member_phone = member_phone;
	}
	public String getMember_email() {
		return member_email;
	}
	public void setMember_email(String member_email) {
		this.member_email = member_email;
	}
	public int getMember_admin() {
		return member_admin;
	}
	public void setMember_admin(int member_admin) {
		this.member_admin = member_admin;
	}
	public Timestamp getMember_regdate() {
		return member_regdate;
	}
	public void setMember_regdate(Timestamp member_regdate) {
		this.member_regdate = member_regdate;
	}
	@Override
	public String toString() {
		return "MemberVO [member_name=" + member_name + ", member_id=" + member_id + ", member_password="
				+ member_password + ", member_birthday=" + member_birthday + ", member_postcode=" + member_postcode
				+ ", member_address=" + member_address + ", member_tel=" + member_tel + ", member_phone=" + member_phone
				+ ", member_email=" + member_email + ", member_admin=" + member_admin + ", member_regdate="
				+ member_regdate + "]";
	}
}
