package com.semi.zipcode.model;
import java.sql.SQLException;
import java.util.List;

public class ZipcodeService {

	private ZipcodeDAO zipService;
	
	public ZipcodeService() {
		zipService=new ZipcodeDAO();
	}
	
	public List<ZipcodeVO> selectZipcode(String dong) throws SQLException{
		return zipService.selectZipcode(dong);
	}

}
