package com.model2.mvc.service.user.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.ExceptionHandler;

import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.User;
import com.model2.mvc.service.user.UserDao;


//==> ȸ������ DAO CRUD ����
@Repository("userDaoImpl")
public class UserDaoImpl implements UserDao{
	
	///Field
	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	///Constructor
	public UserDaoImpl() {
		System.out.println(this.getClass());
	}

	///Method
	public void addUser(User user) throws Exception {
		sqlSession.insert("UserMapper.addUser", user);
		if(user.getKakaoId()!=null) {
			sqlSession.insert("UserMapper.addKakao", user);
		}
	}

	public User getUser(String userId) throws Exception {
		return sqlSession.selectOne("UserMapper.getUser", userId);
	}
	
	public void updateUser(User user) throws Exception {
		sqlSession.update("UserMapper.updateUser", user);
	}

	public List<User> getUserList(Search search) throws Exception {
		return sqlSession.selectList("UserMapper.getUserList", search);
	}

	// �Խ��� Page ó���� ���� ��ü Row(totalCount)  return
	public int getTotalCount(Search search) throws Exception {
		return sqlSession.selectOne("UserMapper.getTotalCount", search);
	}
	
	public void addCoupon(User user) throws Exception{
		sqlSession.insert("UserMapper.insertCoupon", user);
	}
	
	public void useCoupon(User user) throws Exception{
		sqlSession.update("UserMapper.updateCoupon", user);
	}
	
	public List<String> getAutoComplete(Search search) throws Exception{
		return sqlSession.selectList("UserMapper.getAutoComplete", search);
	}

	@Override
	public User checkDupliactionKakao(String kakaoId) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("UserMapper.getKakao", kakaoId);
	}

	@Override
	public User getUserKakao(String kakaoId) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("UserMapper.getUser2", kakaoId);
	}
	
}