/*******************************
 * 클래스 기능 : Controller_Common과 DB사이의 처리
 * 작성자 : 반우진
 * 작성일 : 2025-10-15
 *******************************/

package com.assign_manage.repository;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.assign_manage.vo.*;

@Repository
public class Repository_Common
{
	@Autowired
	private SqlSession session;
	
	private static final String namespace = "common";
	
	// 회원 가입
	// return true : 가입 성공, false : 가입 실패
	public boolean Join(VO_User voU)
	{
		// ID, Tel, Email 중복 있습니까?
		if(CheckID(voU.getId()) == true || CheckTel(voU.getTel()) == true || CheckEmail(voU.getEmail()) == true)
		{
			return false;
		}
		// ID, Tel, Email 중복 없습니다.
		session.insert(namespace + ".join", voU);
		
		return true;
	}
	
	// ID, Tel, Email 중복 검사
	// return true : 중복 있음, false : 중복 없음
	public boolean CheckID(String id)
	{
		int total = session.selectOne(namespace + ".checkID", id);
		if(total > 0)
		{
			return true;
		}
		
		return false;
	}
	public boolean CheckTel(String tel)
	{
		int total = session.selectOne(namespace + ".checkTel", tel);
		if(total > 0)
		{
			return true;
		}
		
		return false;
	}
	public boolean CheckEmail(String email)
	{
		int total = session.selectOne(namespace + ".checkEmail", email);
		if(total > 0)
		{
			return true;
		}
		
		return false;
	}
	
	// 로그인 검사
	// return VO_User : 로그인 성공, null : 로그인 실패
	public VO_User Login(String id,String pw)
	{
		VO_User uVO = new VO_User();
		uVO.setId(id);
		uVO.setPw(pw);
		
		uVO = session.selectOne(namespace + ".login",uVO);
		return uVO;
	}
	
	// ID 찾기
	// return String id : 찾기 성공, null : 찾기 실패
	public String idFind(String user_name, String tel)
	{
		VO_User uVO = new VO_User();
		uVO.setUser_name(user_name);
		uVO.setTel(tel);
		
		String id = session.selectOne(namespace + ".idFind",uVO);
		
		return id;
	}
	
	// PW 찾기
	// return true : 변경 성공, false : 변경 실패
	public String pwFind(String user_name, String tel)
	{
		VO_User uVO = new VO_User();
		uVO.setUser_name(user_name);
		uVO.setTel(tel);
		
		String id = session.selectOne(namespace + ".idFind",uVO);
		
		return id;
	}
}
