package net.product.db;

public class productBean {
	//<td>��ǰ�ڵ�</td><td>�̹���</td><td>��ǰ����</td><td>����</td><td>��ǰ���űݾ�</td><td>�ֹ�ó������</td><td>���/��ȯ/��ǰ</td>
	
	private String code;
	private String infomation;
	private int num;
	private int price;
	private String condition;
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getInfomation() {
		return infomation;
	}
	public void setInfomation(String infomation) {
		this.infomation = infomation;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getCondition() {
		return condition;
	}
	public void setCondition(String condition) {
		this.condition = condition;
	}
	
}
