package com.chao.util;

import java.io.File;
import java.util.UUID;

import org.springframework.web.multipart.MultipartFile;

public class FileUpAndDown {

	//删除文件的方法
	public static boolean  deleteFile( String name){
		
		boolean boo = false;
		File file = new File("F:/images/"+name);
		
		if(file.exists() && file.isFile()){
			boo = file.delete();
		}
		return boo;
	}
	
	//上传文件方法
	public static String upFile(MultipartFile file){
		
		String newName = null;
		
		try {
			//防止 重名 文件被覆盖
			String uuid = UUID.randomUUID().toString();
			//获取原始文件名
			String oldName = file.getOriginalFilename();
			//截取文件后缀名
			String hzName = oldName.substring(oldName.indexOf("."));
			//得到新文件名
			newName = uuid + hzName;
			file.transferTo(new File("F:/images/"+newName));
			
		} catch (Exception e) {
			newName = null;
			e.printStackTrace();
		}
		
		return newName;
	} 
	
}
