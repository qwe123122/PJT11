package com.model2.mvc.web.product;

import java.io.File;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.model2.mvc.common.Page;
import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Product;
import com.model2.mvc.service.product.ProductService;


//==> ��ǰ���� Controller
@Controller
@RequestMapping("/product/*")
public class ProductController {
	
	///Field
	@Autowired
	@Qualifier("productServiceImpl")
	private ProductService productService;
	//setter Method ���� ����
	
	@Value("#{commonProperties['pageUnit']}")
	//@Value("#{commonProperties['pageUnit'] ?: 3}")
	int pageUnit;
	
	@Value("#{commonProperties['pageSize']}")
	//@Value("#{commonProperties['pageSize'] ?: 2}")
	int pageSize;
	
	@Value("#{commonProperties['path']}")
	private String path;
		
	public ProductController(){
		System.out.println(this.getClass());
	}
	
	@RequestMapping(value="/addProduct", method=RequestMethod.GET)
	public String addProduct() throws Exception{
		System.out.println("/product/addProduct : GET");
		
		return "redirect:/product/addProductView.jsp";
	}
	
	@RequestMapping(value="/addProduct", method=RequestMethod.POST)
    public String addProduct(@ModelAttribute("product") Product product, MultipartHttpServletRequest multipartHttpServletRequest) throws Exception{
       
		System.out.println("/product/addProduct : POST");
		
		//���ε� ���� �����
		//String path = "C:\\Users\\USER\\git\\11.Model2MVCShop\\11.Model2MVCShop\\WebContent\\images\\uploadFiles";
		
		List<MultipartFile> fileList = multipartHttpServletRequest.getFiles("fileNameForReal");
		String finalFileName = "";
        for (MultipartFile multiFile : fileList) {
            String originalFileName = multiFile.getOriginalFilename(); // ���� ���� ��
            finalFileName += originalFileName+",";
			File serverFile = new File(path + File.separator + originalFileName);
			multiFile.transferTo(serverFile);
        }
		finalFileName = finalFileName.substring(0, finalFileName.lastIndexOf(","));
		product.setFileName(finalFileName);

		productService.addProduct(product);
		return "forward:/product/addProduct.jsp";
    }
	
	@RequestMapping("/getProduct")
	public String getProduct(@RequestParam("prodNo") int prodNo, @RequestParam(value="menu", required=false)
	String menu, @CookieValue(value="history", required=false) Cookie cookie, HttpServletResponse response, Model model) 
			throws Exception{
		System.out.println("/product/getProduct");
		
		model.addAttribute("product", productService.getProduct(prodNo));
		
		//CookieValue String���� �޾��� �� 
//		if(cookie!=null) {	
//			Cookie cookieee = new Cookie("history", cookie+","+new Integer(prodNo).toString());
//			cookieee.setPath("/");
//			response.addCookie(cookieee);
//		}else {
//			Cookie cookieee = new Cookie("history", new Integer(prodNo).toString());
//			cookieee.setPath("/");
//			response.addCookie(cookieee);
//		}
		
		//CookieValue Cookie�� �޾��� ��
		if(cookie!=null) {
			if( !(cookie.getValue().contains(new Integer(prodNo).toString())) ){
				cookie.setValue(cookie.getValue()+","+new Integer(prodNo).toString());
				cookie.setPath("/");
			}
			response.addCookie(cookie);
		}else {
			Cookie doNotHaveCookie = new Cookie("history", new Integer(prodNo).toString());
			doNotHaveCookie.setPath("/");
			response.addCookie(doNotHaveCookie);
		}
		
		if(menu!=null && menu.equals("manage")) {
			return "forward:/product/updateProductView.jsp?menu=manage";
		}else {
			return "forward:/product/getProduct.jsp";
		}
	}
	 
	@RequestMapping(value="/updateProduct", method=RequestMethod.GET)
	public String updateProduct() throws Exception{
		System.out.println("/product/updateProduct : GET");	
		
		return "forward:/product/updateProductView.jsp";
	}
	
	@RequestMapping(value="/updateProduct", method=RequestMethod.POST)
	public String updateProduct(@ModelAttribute("product") Product product, MultipartHttpServletRequest multipartHttpServletRequest) throws Exception{
		System.out.println("/product/updateProduct : POST");
		//String path = "C:\\Users\\USER\\git\\11.Model2MVCShop\\11.Model2MVCShop\\WebContent\\images\\uploadFiles";
		
		List<MultipartFile> fileList = multipartHttpServletRequest.getFiles("fileNameForReal");
		String finalFileName = "";
        for (MultipartFile multiFile : fileList) {
            String originalFileName = multiFile.getOriginalFilename(); // ���� ���� ��
            if(!originalFileName.equals("")) {
	            finalFileName += originalFileName+",";
				File serverFile = new File(path + File.separator + originalFileName);
				multiFile.transferTo(serverFile);
            }
        }
        if(finalFileName.contains(",")) {
			finalFileName = finalFileName.substring(0, finalFileName.lastIndexOf(","));
			product.setFileName(finalFileName);
        }
		productService.updateProduct(product);
		
		return "redirect:/product/getProduct?prodNo="+product.getProdNo();
	}
	
	@RequestMapping("/deleteProduct")
	public String deleteProduct(@RequestParam("prodNo") int prodNo) throws Exception{
		System.out.println("/product/deleteProduct");
		
		productService.deleteProduct(prodNo);
		
		return "redirect:/product/listProduct?menu=manage";
	}
	
	@RequestMapping("/listProduct")
	public String listProduct(@ModelAttribute("search") Search search, Model model) throws Exception{
		System.out.println("/listProduct");
		
		if(search.getCurrentPage() ==0 ){
			search.setCurrentPage(1);
		}
		if(search.getSearchKeyword1()!=0 || search.getSearchKeyword2()!=0) {
			search.setPriceSearch(true);
		}else {
			search.setPriceSearch(false);
		}
		search.setPageSize(pageSize);
		
		System.out.println("~~~~~~~~~~~~~~~ModelAttribute Search:"+search);
		
		Map<String, Object> map = productService.getProductList(search);
		
		Page resultPage = new Page( search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
		System.out.println(resultPage);
		
		model.addAttribute("list", map.get("list"));
		model.addAttribute("resultPage", resultPage);
		model.addAttribute("search", search);

		return "forward:/product/listProduct.jsp";
	}
	
	@ExceptionHandler(value=Exception.class)
	public String error(Exception e) throws Exception{
		e.printStackTrace();
		return e.getMessage();
	}
}