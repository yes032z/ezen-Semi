package com.semi.orderdetail.model;

import java.sql.SQLException;
import java.util.List;

import com.semi.view.model.ViewVO;

public class OrderdetailService {
	private OrderdetailDAO orderdetailDao;
	
	public OrderdetailService() {
		orderdetailDao=new OrderdetailDAO();
	}
	//마이페이지> 주문 조회
	public List<ViewVO> selectAll(String id, String startDate,String lastDate) throws SQLException{
		return orderdetailDao.selectAll(id, startDate, lastDate);
	}
	
	
}
