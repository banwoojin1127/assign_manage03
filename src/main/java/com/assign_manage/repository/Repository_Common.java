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
	
	
}
