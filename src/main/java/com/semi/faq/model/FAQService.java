package com.semi.faq.model;

import java.sql.SQLException;
import java.util.List;

public class FAQService {
	private FAQDAO faqDao;
	
	public FAQService() {
		faqDao = new FAQDAO();
	}
	
	public List<FAQVO> selectBest5() throws SQLException {
		return faqDao.selectBest5();
	}
	
	public List<FAQVO> selectBy(String faqCategory, String search) throws SQLException {
		return faqDao.selectBy(faqCategory, search);
	}
	
	
}//