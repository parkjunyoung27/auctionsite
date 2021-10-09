package com.quicktion.service;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.quicktion.dao.IndexDAO;


@Service("indexService")
public class IndexServiceImpl {
	
	@Autowired
	private IndexDAO indexDAO;
	

}
