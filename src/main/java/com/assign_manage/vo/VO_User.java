/***********************************
 * 클래스 기능 : 사용자 정보 클래스
 * 작성자 : 이승헌
 * 작성일 : 2025.10.15
 **********************************/
package com.assign_manage.vo;

public class VO_User
{
	private String id;          //아이디
	private String pw;          //비밀번호
	private String user_name;   //이름
	private String user_class;  //등급
	private String gender;      //성별
	private String user_icon;   //프로필아이콘
	private String birth;       //생년월일
	private String tel;         //전화번호
	private String email;       //이메일
	private String join_date;   //가입일
	private String modify_date; //수정일
	private String leave_date;  //탈퇴일
	private String ip;          //ip
	
	//Getters
	public String getId()          { return id; }
	public String getPw()          { return pw; }
	public String getUser_name()   { return user_name; }
	public String getUser_class()  { return user_class; }
	public String getGender()      { return gender; }
	public String getUser_icon()   { return user_icon; }
	public String getBirth()       { return birth; }
	public String getTel()         { return tel; }
	public String getEmail()       { return email; }
	public String getJoin_date()   { return join_date; }
	public String getModify_date() { return modify_date; }
	public String getLeave_date()  { return leave_date; }
	public String getIp()          { return ip; }
	
	//Setters
	public void setId(String id)                   { this.id = id; }
	public void setPw(String pw)                   { this.pw = pw; }
	public void setUser_name(String user_name)     { this.user_name = user_name; }
	public void setUser_class(String user_class)   { this.user_class = user_class; }
	public void setGender(String gender)           { this.gender = gender; }
	public void setUser_icon(String user_icon)     { this.user_icon = user_icon; }
	public void setBirth(String birth)             { this.birth = birth; }
	public void setTel(String tel)                 { this.tel = tel; }
	public void setEmail(String email)             { this.email = email; }
	public void setJoin_date(String join_date)     { this.join_date = join_date; }
	public void setModify_date(String modify_date) { this.modify_date = modify_date; }
	public void setLeave_date(String leave_date)   { this.leave_date = leave_date; }
	public void setIp(String ip)                   { this.ip = ip; }
	
	public void showInnerData()
	{
		System.out.println("=====" + this.id + "=========================");
		System.out.println(this.id);
		System.out.println(this.pw);
		System.out.println(this.user_name);
		System.out.println(this.user_class);
		System.out.println(this.gender);
		System.out.println(this.user_icon);
		System.out.println(this.birth);
		System.out.println(this.tel);
		System.out.println(this.email);
		System.out.println(this.join_date);
		System.out.println(this.modify_date);
		System.out.println("===================================");
	}
}
