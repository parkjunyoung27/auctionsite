package com.quicktion.web.util;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import org.springframework.stereotype.Component;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.multipart.MultipartFile;

//파일 저장하는 클래스 
@Component
public class FileSave {
	//String에서 제공하는 fileCopyUtile을 이용해서 파일 저장하기
	public String save(String realPath, MultipartFile files) throws IOException{ 
		File file = new File(realPath);
		
		if(!file.exists()) {
			file.mkdir();//디렉토리 하나
			file.mkdirs();//자기 경로 갈때까지 다 만들어주는것 //부모 폴더까지 생성
		}
		
		//UUID
		String fileName = UUID.randomUUID().toString(); //겹칠수없는 파일이름 생성
		fileName = fileName + "_"+files.getOriginalFilename(); // 파일명과 결합
		System.out.println("만들어진 fileName : " + fileName);
		
		//파일 올리기
		//부모 추상 경로 이름과 자식 경로 이름 문자열에서 새 File 인스턴스를 만듭니다.
		//부모가 null이면 지정된 자식 경로 이름 문자열에서 단일 인수 File 생성자를 호출하는 것처럼 새 File 인스턴스가 생성됩니다.
		//그렇지 않으면 상위 추상 경로 이름을 사용하여 디렉토리를 나타내고 하위 경로 이름 문자열을 사용하여 디렉토리 또는 파일을 나타냅니다. 
		
		file = new File(file, fileName); //(부모추상경로,자식경로)
		//주어진 바이트 배열 file에 복사
		FileCopyUtils.copy(files.getBytes(), file);
		
		return fileName;
	}
	
	
	
}
