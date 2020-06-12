package com.model2.mvc.common;


//==>����Ʈȭ���� �𵨸�(�߻�ȭ/ĸ��ȭ)�� Bean 
public class Search {
	
	///Field
	private int currentPage;
	private String searchCondition;
	private String searchKeyword;
	private int pageSize;
	//==> ����Ʈȭ�� currentPage�� �ش��ϴ� ȸ�������� ROWNUM ��� SELECT ���� �߰��� Field 
	//==> UserMapper.xml �� 
	//==> <select  id="getUserList"  parameterType="search"	resultMap="userSelectMap">
	//==> ����
	private int endRowNum;
	private int startRowNum;
	//�߰����
	private String sorting;
	private int searchKeyword1;
	private int searchKeyword2;
	private boolean priceSearch;
	
	///Constructor
	public Search() {
	}
	
	///Method
	public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int paseSize) {
		this.pageSize = paseSize;
	}
	
	public String getSorting() {
		return sorting;
	}

	public void setSorting(String sorting) {
		this.sorting = sorting;
	}

	public int getSearchKeyword1() {
		return searchKeyword1;
	}

	public void setSearchKeyword1(int searchKeyword1) {
		this.searchKeyword1 = searchKeyword1;
	}

	public int getSearchKeyword2() {
		return searchKeyword2;
	}

	public void setSearchKeyword2(int searchKeyword2) {
		this.searchKeyword2 = searchKeyword2;
	}

	public boolean isPriceSearch() {
		return priceSearch;
	}

	public void setPriceSearch(boolean priceSearch) {
		this.priceSearch = priceSearch;
	}

	public int getCurrentPage() {
		return currentPage;
	}
	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public String getSearchCondition() {
		return searchCondition;
	}
	public void setSearchCondition(String searchCondition) {
		this.searchCondition = searchCondition;
	}
	
	public String getSearchKeyword() {
		return searchKeyword;
	}
	public void setSearchKeyword(String searchKeyword) {
		this.searchKeyword = searchKeyword;
	}
	
	//==> Select Query �� ROWNUM ������ �� 
	public int getEndRowNum() {
		return getCurrentPage()*getPageSize();
	}
	//==> Select Query �� ROWNUM ���� ��
	public int getStartRowNum() {
		return (getCurrentPage()-1)*getPageSize()+1;
	}

	@Override
	public String toString() {
		return "Search [currentPage=" + currentPage + ", searchCondition=" + searchCondition + ", searchKeyword="
				+ searchKeyword + ", pageSize=" + pageSize + ", endRowNum=" + getCurrentPage()*getPageSize() + ", startRowNum=" + ((getCurrentPage()-1)*getPageSize()+1)
				+ ", sorting=" + sorting + ", searchKeyword1=" + searchKeyword1 + ", searchKeyword2=" + searchKeyword2
				+ ", priceSearch=" + priceSearch + "]";
	}


}