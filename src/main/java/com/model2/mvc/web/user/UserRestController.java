package com.model2.mvc.web.user;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.model2.mvc.common.Page;
import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.User;
import com.model2.mvc.service.user.UserService;


//==> ȸ������ RestController
@RestController
@RequestMapping("/user/*")
public class UserRestController {
	
	///Field
	@Autowired
	@Qualifier("userServiceImpl")
	private UserService userService;
	//setter Method ���� ����
	
	@Value("#{commonProperties['pageUnit']}")
	int pageUnit;
	@Value("#{commonProperties['pageSize']}")
	int pageSize;
		
	public UserRestController(){
		System.out.println(this.getClass());
	}
	
	@RequestMapping("/json/addCoupon")
	public Map addCoupon(@RequestParam("couponId") String couponId, HttpSession session) throws Exception{
		System.out.println("/user/addCoupon");
			
		User user = (User)session.getAttribute("user");
		System.out.println("addCoupon user : "+ user);
		userService.addCoupon(couponId, user);
		
		User newCouponUser = userService.getUser(((User)session.getAttribute("user")).getUserId());
		session.setAttribute("user", newCouponUser);
		
		Map map = new HashMap();
		if(newCouponUser.getCoupon().getDiscountCoupon10().equals("1")) {
			map.put("message", "ok");
		}else if(newCouponUser.getCoupon().getDiscountCoupon10().equals("0")) {
			map.put("message", "already");
		}else {
			map.put("message", "no good");
		}
		
		return map;
	}
	
	@RequestMapping( value="json/getUser/{userId}", method=RequestMethod.GET )
	public User getUser( @PathVariable String userId ) throws Exception{
		
		System.out.println("/user/json/getUser : GET");
		
		//Business Logic
		return userService.getUser(userId);
	}

	@RequestMapping( value="json/login", method=RequestMethod.POST )
	public User login(	@RequestBody User user,
									HttpSession session ) throws Exception{
	
		System.out.println("/user/json/login : POST");
		//Business Logic
		System.out.println("::"+user);
		User dbUser=null;
		dbUser=userService.getUser(user.getUserId());
		System.out.println("dbUser : "+dbUser);
		if(dbUser!=null && user.getPassword().equals(dbUser.getPassword())){
			System.out.println("��й�ȣ ��ġ");
			session.setAttribute("user", dbUser);
			return dbUser;
		}else if(dbUser!=null && !(user.getPassword().equals(dbUser.getPassword()))) {
			System.out.println("��й�ȣ�� �߸� �Է��� ���");
			return user;
		}else{
			System.out.println("���̵���� �߸� �Է��� ���");
			return new User();
		}
	}
	
	//������ ���� ȭ�� �����ֱ�(������ �ʿ�)
	@RequestMapping( value="json/updateUser/{userId}", method=RequestMethod.GET )
	public User updateUser( @PathVariable String userId) throws Exception{

		System.out.println("/user/json/updateUser/{userId} : GET");
		//Business Logic
		User user = userService.getUser(userId);

		return user;
	}
	
	//������ ���� �� �� ���� ���� �����ֱ�(������ �ʿ�)
	@RequestMapping( value="json/updateUser/{userId}", method=RequestMethod.POST )
	public User updateUser( @RequestBody User user, @PathVariable String userId) throws Exception{

		System.out.println("/user/json/updateUser/{userId} : POST");
		//Business Logic
		System.out.println("@RequestBody User user : "+user);
		
		user.setUserId(userId);
		userService.updateUser(user);

		return userService.getUser(userId);
	}
	
	//ȸ������) DB�� user���� ���ϱ�
	@RequestMapping( value="json/addUser", method=RequestMethod.POST )
	public User addUser( @RequestBody User user, HttpServletResponse response ) throws Exception {

		System.out.println("/user/json/addUser : POST");
		//Business Logic
		userService.addUser(user);
		return userService.getUser(user.getUserId());
	}
	
	@RequestMapping( value="json/logout", method=RequestMethod.GET )
	public Map logout(HttpSession session ) throws Exception{
		
		System.out.println("/user/json/logout : POST");
		
		session.invalidate();
		
		Map<String, String> map = new HashMap<>();
		map.put("message", "�α׾ƿ� �Ǿ����ϴ�.");
		return map;
	}
	
	//ID �ߺ�Ȯ��
	@RequestMapping( value="json/checkDuplication/{userId}", method=RequestMethod.POST )
	public Map checkDuplication( @PathVariable String userId) throws Exception{
		
		System.out.println("/user/json/checkDuplication : POST");
		//Business Logic
		boolean result=userService.checkDuplication(userId);
		// Model �� View ����
		Map<String, String> map = new HashMap<>();
		if(result) {
			map.put("message", "ok");
		}else {
			map.put("message", "no good");
		}

		return map;
	}
	
	//īī��ID �ߺ�Ȯ��
	@RequestMapping( value="json/checkKakao/{kakaoId}", method=RequestMethod.POST )
	public Map checkKakao( @PathVariable String kakaoId) throws Exception{
		
		System.out.println("/user/json/checkKakao : POST");
		//Business Logic
		User dbKakaoUser=userService.checkDuplicationKakao(kakaoId);
		Map<String, String> map = new HashMap<>();
		if(dbKakaoUser==null) {
			map.put("message", "ok");
		}else {
			map.put("message", "no good");
		}

		return map;
	}
	
	@RequestMapping( value="json/listUser", method=RequestMethod.POST)
	public Map listUser(@RequestBody Search search) throws Exception{
		
		System.out.println("/user/json/listUser");
		
		if(search.getCurrentPage() ==0 ){
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
		
		// Business logic ����
		Map<String , Object> map=userService.getUserList(search);
		
		Page resultPage = new Page( search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
		System.out.println(resultPage);
		
		Map<String, Object> returnMap = new HashMap<String, Object>();
		returnMap.put("list", map.get("list"));
		returnMap.put("resultPage", resultPage);
		returnMap.put("search", search);
		
		return returnMap;
	}
	
	@RequestMapping(value="json/autoCompleteUser")
	public List autoCompleteUser(@RequestBody Search search) throws Exception{
		System.out.println("/user/json/autoCompleteUser");
		
		if(search.getCurrentPage() ==0 ){
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
		
		// Business logic ����
		List<String> list=userService.autoCompleteUser(search);
		
		return list;
	}
	
	@ExceptionHandler(value=Exception.class)
	public String error(Exception e) throws Exception{
		e.printStackTrace();
		return e.getMessage();
	}
}