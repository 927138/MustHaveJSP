package el;

public class MyElClass {

	public String getGender(String number) {
		String gender = "";
		
		int index = number.indexOf('-') + 1;
		if(number.charAt(index) == '1' || number.charAt(index) == '3') {
			gender = "남자";
		}else if(number.charAt(index) == '2' || number.charAt(index) == '4') {
			gender = "여자";
		}else {
			gender = "주민번호 오류";
		}
		
		return gender;
	}
	
	
	public static boolean isNumber(String number) {
		
		for(int i=0; i<number.length(); i++) {
			if(number.charAt(i) - '0' < 0 || number.charAt(i) - '0' > 9) 
				return false; 
		}
		
		return true;
	}
	
	
	public static String showGugudan(int number) {
		StringBuilder sb = new StringBuilder();
		
		sb.append("<table border='1'>");
		
		for(int i=2; i<=number; i++) {
			sb.append("<tr>");
			for(int j=1; j<10; j++) {
				sb.append("<td>");
				sb.append(i).append(" * ").append(j).append(" = ").append(i*j);
				sb.append("</td>");
			}
			sb.append("</tr>");
		}
		sb.append("</table>");
		
		return sb.toString();
	}
}
