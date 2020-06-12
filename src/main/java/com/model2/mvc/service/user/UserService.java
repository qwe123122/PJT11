package com.model2.mvc.service.user;

import java.util.List;
import java.util.Map;

import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.User;


//==> ȸ���������� ������ ���� �߻�ȭ/ĸ��ȭ�� Service  Interface Definition  
public interface UserService {
	
	// ȸ������
	public void addUser(User user) throws Exception;
	
	// ������Ȯ�� / �α���
	public User getUser(String userId) throws Exception;
	
	//īī�� �ߺ�Ȯ��
	public User checkDuplicationKakao(String kakaoId) throws Exception;
	
	//īī�� �α���.
	public User getUserKakao(String kakaoId) throws Exception;
	
	// ȸ����������Ʈ 
	public Map<String , Object> getUserList(Search search) throws Exception;
	
	// ȸ����������
	public void updateUser(User user) throws Exception;
	
	// ȸ�� ID �ߺ� Ȯ��
	public boolean checkDuplication(String userId) throws Exception;
	
	//���� �߱�
	public void addCoupon(String couponId, User user) throws Exception;
	
	//autoComplete
	public List<String> autoCompleteUser(Search search) throws Exception;
}