package com.quicktion.web.util;

import org.springframework.stereotype.Component;

@Component
public class Util {
	public boolean str2Int(String str) {
		try {
			Integer.parseInt(str);
			return true;
		} catch (Exception e) {
			return false;
		} 
	}

	public int str2Int2(String str) {
		try {
			return Integer.parseInt(str);
		} catch (Exception e) {
			return 0;
		}
	}
	
}
