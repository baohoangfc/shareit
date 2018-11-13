package library;

import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

import javax.servlet.http.Part;

public class StringLibrary {
	
	public static String md5(String str){
		String result = null;
		try {
			MessageDigest md = MessageDigest.getInstance("MD5");
			md.update(str.getBytes());
			BigInteger bigInteger = new BigInteger(1, md.digest());
			result = bigInteger.toString(16);
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public static String getFileName(final Part part) {
	    final String partHeader = part.getHeader("content-disposition");
	    for (String content : partHeader.split(";")) {
	        if (content.trim().startsWith("filename")) {
	            return content.substring(
	                    content.indexOf('=') + 1).trim().replace("\"", "");
	        }
	    }
	    return null;
	}
	
	public static String renameFile(String fileName) {
		String[] arrImg = fileName.split("\\.");
		String duoiFileImg = arrImg[arrImg.length - 1];
		String nameFile = "";
		for (int i = 0; i < (arrImg.length - 1); i++) {
			if (i == 0) {
				nameFile = arrImg[i];
			} else {
				nameFile += "-" + arrImg[i];
			}
		}
		nameFile = nameFile + "_" + System.nanoTime() + "." + duoiFileImg;
		return nameFile;
	}
	

}
