/***********************************
 * Ŭ���� ��� : ������ ���� Ŭ����
 * �ۼ��� : ���ϴ�
 * �ۼ��� : 2025.10.15
 **********************************/
package com.assign_manage.vo;

public class VO_Report
{
	private int report_no;   //��������ȣ
	private int assign_no;   //������ȣ
	private int id;          //���̵�
	private int report_note; //���⳻��
	private int create_date; //������
	private int delete_date; //������
	
	public int getReport_no()   { return report_no;   }
	public int getAssign_no()   { return assign_no;   }
	public int getId()          { return id;          }
	public int getReport_note() { return report_note; }
	public int getCreate_date() { return create_date; }
	public int getDelete_date() { return delete_date; }
	
	public void setReport_no(int report_no)     { this.report_no   = report_no;   }
	public void setAssign_no(int assign_no)     { this.assign_no   = assign_no;   }
	public void setId(int id)                   { this.id          = id;          }
	public void setReport_note(int report_note) { this.report_note = report_note; }
	public void setCreate_date(int create_date) { this.create_date = create_date; }
	public void setDelete_date(int delete_date) { this.delete_date = delete_date; }

}