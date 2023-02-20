package com.example.dogacat.util;

import java.io.File;
import java.text.DecimalFormat;
import java.util.Calendar;
import java.util.UUID;

import org.springframework.util.FileCopyUtils;

//... 가변사이즈 매개 변수 변수개수에 상관없이 가능
public class UploadFileUtils {
	static void makeDir(String uploadPath, String... paths) {
		if (new File(paths[paths.length - 1]).exists()) {
			return;
		}
		for (String path : paths) {
			File dirPath = new File(uploadPath + path);
			if (!dirPath.exists()) {
				dirPath.mkdir(); // 생성
			}
		}
	}

	static String calcPath(String upload_path) {
		Calendar cal = Calendar.getInstance();
		String year = "/" + cal.get(Calendar.YEAR);
		String month = year + "/" + new DecimalFormat("00").format(cal.get(Calendar.MONTH) + 1);
		String path = month + "/" + new DecimalFormat("00").format(cal.get(Calendar.DATE));
		makeDir(upload_path, year, month, path);
		return path;
	}

	public static String uploadFile(String uploadPath, String originalName, byte[] fileData) throws Exception {
		UUID uid = UUID.randomUUID(); // uuid 객체
		String filename = uid.toString() + "_" + originalName;
//		String path = calcPath(uploadPath);
		File target = new File(uploadPath, filename);
		FileCopyUtils.copy(fileData, target);
		String str = uploadPath + "/" + filename;
		return str;
	}
}
