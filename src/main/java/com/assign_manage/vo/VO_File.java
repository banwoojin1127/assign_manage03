/***********************************
 * 클래스 기능 : 점부파일 정보 클래스
 * 작성자 : 문홍일
 * 작성일 : 2025.10.15
 **********************************/
package com.assign_manage.vo;

public class VO_File {

	public int file_no;	  		 //첨부파일번호
	public int report_no;        //과제물번호
	public String P_name; 		 //물리파일명
	public String f_name;        //논리파일명
	public String create_date;   //생성일
	public String delete_date;   //삭제일
	public long file_size; 		 //파일크기
	public String extension;  	 //확장자
	public String file_path;  	 //저장경로
	
	public int getFile_no()        { return file_no;     }
	public int getReport_no()      { return report_no;   }
	public String getP_name()      { return P_name;      }
	public String getF_name()      { return f_name;      }
	public String getCreate_date() { return create_date; }
	public String getDelete_date() { return delete_date; }
	public long getFile_size()      { return file_size;   }
	public String getExtension()   { return extension;   }
	public String getFile_path()   { return file_path;   }
	
	public void setFile_no(int file_no)            { this.file_no = file_no;         }
	public void setReport_no(int report_no)        { this.report_no = report_no;     }
	public void setP_name(String p_name)           { P_name = p_name;                }
	public void setF_name(String f_name)           { this.f_name = f_name;           }
	public void setCreate_date(String create_date) { this.create_date = create_date; }
	public void setDelete_date(String delete_date) { this.delete_date = delete_date; }
	public void setFile_size(long file_size)        { this.file_size = file_size;     }
	public void setExtension(String extension)     { this.extension = extension;     }
	public void setFile_path(String file_path)     { this.file_path = file_path;     }

}