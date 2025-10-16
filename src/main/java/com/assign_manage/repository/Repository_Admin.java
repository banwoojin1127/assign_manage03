package com.assign_manage.repository;

import org.springframework.stereotype.Repository;

@Repository
public class Repository_Admin
{
	//✔ 유효성 검사(사용자 입력 검증 / 서버 데이터 처리 전 검증 / 데이터베이스 저장 전 검사 / 파일 업로드 시 / 프로그래밍 내부 로직에서)
	
	//✔ 관리자 > 사용자 관리
	// 사용자 관리 - 검색(공백X, 입력 길이 제한, 특수문자/금지어 필터링) (등급/아이디/이름/성별)
	
	
	
	
	
	
	//✔ 관리자 > 교사 등록 처리
	// 교사 등록
	// 아이디 : null / 중복 / 아이디는 5~20자의 영문 소문자, 숫자와 특수기호(_),(-) 제한 조건 <<<-특수문자로 통일
	// 비밀번호 : null / 비밀번호: 8~16자의 영문 대/소문자, 숫자, 특수문자 제한 조건
	// 비밀번호 확인 : 비밀번호와 일치하는지 
	// 이메일 : null / 중복 / 특수문자 금지 / 이메일 형식 제한조건 <<-직접 입력하는 칸 추가
	// 이름 : null
	// 생년월일 : null / 8자리 숫자만 / 잘못된 생년월일 형식 9999.99.99 등
	// 성별 : null
	// 전화번호 : null / 중복 / 11자리 숫자만 010 - 0000 - 0000
	
	// 교사 등록 클릭시 등급 처리 : 1(교사)
	// 교사 등록 시 DB에 Insert into 처리
	
	// 사용자 조회에서 이름을 클릭시 사용자 상세보기로 이동
	// 사용자 상세보기 수정
	// 비밀번호 : null / 비밀번호: 8~16자의 영문 대/소문자, 숫자, 특수문자 제한 조건
	// 이메일 : null / 중복 / 특수문자 금지 / 이메일 형식 제한조건 <<-직접 입력하는 칸 추가 (dropbox)
		
	
	// 회원 탈퇴
	// 탈퇴일 not null > 탈퇴한 회원
	
	
	//✔ 관리자 > 강의 관리
	// 강의 관리 - 검색(공백X, 입력 길이 제한, 특수문자/금지어 필터링) (전체/강의명/교사)
	
	// 강의 편집, 삭제(리스트에 추가된 강의를 편집 삭제) 
	// 편집은 이 페이지 내에서, 삭제는 체크박스(전체 선택 혹은 부분 선택)으로 삭제
	// 체크 박스를 선택X 삭제 > 삭제할 행을 선택해주세요(경고창)
	// 체크 박스를 선택O 삭제 > 삭제하시겠습니까?(경고창) 삭제 처리
	
	// 강의 생성 누르면 상단에 행이 title행과 context행이 생성되고 추가를 누르면 상단 행 아래도 하나씩 추가 번호도 추가되는 형식
	// 강의 제거도 삭제와 마찬가지 로직, 저장 시 아래로 추가
	
	// 강의 관리 > 생성된 강의명을 클릭시 해당 강의명의 과제 리스트로 이동
	
	//✔ 관리자 > 과제 관리
	// 과제조회 
	
	
	//✔ 관리자 > 통계 및 리포트
	// 강의별 과제 제출 정보, 강의별 방문률
	
	
	//✔ 마이페이지 > 프로필 아이콘 float
	// 비밀번호 : null / 비밀번호: 8~16자의 영문 대/소문자, 숫자, 특수문자 제한 조건
	// 이메일 : null / 중복 / 특수문자 금지 / 이메일 형식 제한조건 <<-직접 입력하는 칸 추가 (dropbox)
	
	//======================================================================================================================
	
	//✔ 데이터 처리
	/* MyBatis 데이터 CRUD 처리 */
	
	
	//✔ 조회 sql 문법 
	
	//✔ 로그 처리 
	/*
	 방문 페이지 visit_page
	 방문 시간 visit_time
	 떠난 시간 leave_time
	 요청 값  request_value
	 */
	
	//✔ 관리자 > 사용자 관리 
	// 페이지 처리 (리스트 갯수에 따른 페이지 수 처리) <<- 10개씩 20개씩 50개씩으로 수정하기

	/*
	@RequestMapping(value = "/index.do")
	public String Index(@RequestParam(defaultValue = "J")String kind,
			@RequestParam(defaultValue = "1")int page,
			Model model)
	{
		SearchVO vo = new SearchVO();
		vo.setKind(kind);
		vo.setPageno(page);
		
		//전체 갯수
		int total = boardService.GetTotal(vo);
		
		//최대 페이지 갯수
		int maxpage = total / 10;
		if( total % 10 != 0 ) maxpage++;
		
		//페이징 블럭 계산
		//시작블럭 = (현재페이지/10) * 10 + 1
		//끝블럭 = 시작블럭 + 10 - 1
		int startbk = ((page-1) / 10) * 10 + 1;
		int endbk   = startbk + 10 - 1;
		//끝블럭 > 전체페이지 갯수 크면 
		//끝블럭 = 전체페이지 갯수
		if( endbk > maxpage )
		{
			endbk = maxpage;
		}			
		
		//목록 조회 
		List<BoardVO> list = boardService.GetList(vo);
		for(BoardVO item : list)
		{
			System.out.println("title:" + item.getTitle());
		}
		
		model.addAttribute("total",total);
		model.addAttribute("maxpage",maxpage);
		
		model.addAttribute("startbk",startbk);
		model.addAttribute("endbk",endbk);
		
		model.addAttribute("search",vo);
		model.addAttribute("list",list);
		
		return "index";
	}

	@RequestMapping(value = "/idcheck.do")
	@ResponseBody 
	public String IDCheck(@RequestParam("id")String id)
	{
		if(id == null || id.equals(""))
		{
			//빈 id가 넘어온 경우.
			return "ERROR";
		}
		if( userService.CheckID(id) == true )
		{
			return "DUPLICATED";
		}else
		{
			return "NOT_DUPLICATED";
		}
	}
	
	@RequestMapping(value = "/join.do")
	public String Join()
	{
		return "join";
	}
	
	@RequestMapping(value = "/joinok.do", method = RequestMethod.POST)
	public String JoinOK(UserVO vo)
	{
		/*
		System.out.println("id:" + vo.getUserid());
		System.out.println("pw:" + vo.getUserpw());
		System.out.println("nm:" + vo.getName());
		*/
		
	/*
		userService.Join(vo);
		
		return "redirect:/index.do";
	}	
	
	@RequestMapping(value = "/login.do")
	public String Login()
	{
		return "login";
	}
	
	@RequestMapping(value = "/loginok.do", method = RequestMethod.POST)
	@ResponseBody 
	public String LoginOK(String id,String pw,
			HttpServletRequest request)
	{	
		HttpSession session = request.getSession();
		
		UserVO vo = userService.Login(id, pw);
		if(vo == null)
		{
			//로그인 안됨.	
			session.setAttribute("login", null);
			return "false";
		}else
		{
			session.setAttribute("login", vo);
			return "true";
		}
	}	
	
	@RequestMapping(value = "/logout.do")
	public String LogOut(HttpServletRequest request)
	{
		HttpSession session = request.getSession();
		//session.invalidate();
		session.setAttribute("login", null);
		return "redirect:/index.do";
	}
	
	@RequestMapping(value = "/view.do", method = RequestMethod.GET)
	public String View(@RequestParam(required = true) String no,
			Model model)
	{
		//게시물 정보 조회
		BoardVO vo = boardService.Read(no, true);
		
		//댓글 목록을 조회
		List<ReplyVO> reply = replyService.GetList(no);
		
		model.addAttribute("item",vo);
		model.addAttribute("reply",reply);
		
		return "view";
	}
	
	@RequestMapping(value = "/write.do")
	public String Write()
	{
		return "write";
	}	
	
	@RequestMapping(value = "/writeok.do", method = RequestMethod.POST)
	public String WriteOK(BoardVO vo,
			@RequestParam("attach")MultipartFile file,
			HttpServletRequest request) throws IllegalStateException, IOException
	{
		//로그인 정보를 조회한다.
		UserVO login = (UserVO)request.getSession().getAttribute("login");
		if(login == null)
		{
			return "redirect:/index.do";
		}
		//게시글 작성자 아이디를 설정한다.
		vo.setUserid(login.getUserid());
		
		if(file != null)
		{
			//첨부파일 업로드 되었음.
			
			//업로드된 원본 파일 이름 가져오기
			String originalFileName = file.getOriginalFilename();
			System.out.println("originalFileName:" + originalFileName);
			
			//파일 이름이 중복되지 않도록 파일 이름 변경 : 서버에 저장할 이름
			// UUID 클래스 사용
			UUID uuid = UUID.randomUUID();
			String savedFileName = uuid.toString();
			System.out.println("savedFileName:" + savedFileName);
			
			//첨부파일 객체 생성
			File newFile = new File(uploadPath + "\\" + savedFileName);
			
			//실제 저장 디렉토리로 전송		
			file.transferTo(newFile);
			
			vo.setFname(originalFileName); //원본파일명
			vo.setPname(savedFileName);    //저장된 파일명
		}
		
		boardService.Insert(vo);
		
		return "redirect:/view.do?no=" + vo.getNo();
	}	
	
	@RequestMapping(value = "/delete.do")
	public String Delete(@RequestParam(required = true)String no)
	{
		boardService.Delete(no);
		return "redirect:/index.do";
	}	
	
	@RequestMapping(value = "/modify.do")
	public String Modify(@RequestParam(required = true) String no,
			Model model)
	{
		//게시물 정보 조회
		BoardVO vo = boardService.Read(no, false);

		model.addAttribute("item",vo);
		
		return "modify";
	}
	
	@RequestMapping(value = "/modifyok.do", method = RequestMethod.POST)
	public String ModifyOK(BoardVO vo,@RequestParam("attach") MultipartFile file) throws IllegalStateException, IOException
	{
		if(file != null)
		{
			//첨부파일 업로드 되었음.
			
			//업로드된 원본 파일 이름 가져오기
			String originalFileName = file.getOriginalFilename();
			System.out.println("originalFileName:" + originalFileName);
			
			//파일 이름이 중복되지 않도록 파일 이름 변경 : 서버에 저장할 이름
			// UUID 클래스 사용
			UUID uuid = UUID.randomUUID();
			String savedFileName = uuid.toString();
			System.out.println("savedFileName:" + savedFileName);
			
			//첨부파일 객체 생성
			File newFile = new File(uploadPath + "\\" + savedFileName);
			
			//실제 저장 디렉토리로 전송		
			file.transferTo(newFile);
			
			vo.setFname(originalFileName); //원본파일명
			vo.setPname(savedFileName);    //저장된 파일명
		}		
		boardService.Update(vo);
		return "redirect:/view.do?no=" + vo.getNo();
	}
	
	//첨부파일 다운로드
	@RequestMapping(value = "/down.do")
	public void Download(@RequestParam(required = true) String no,
			HttpServletResponse response) throws Exception
	{
		BoardVO vo = boardService.Read(no, true);
		
		File file = new File(uploadPath, vo.getPname());
		
		// 파일명 인코딩
		//String filename = vo.getFname();
		String filename = new String(vo.getFname().getBytes("UTF-8"),
				"ISO-8859-1");
				
		// file 다운로드 설정
		response.setContentType("application/download");
		response.setContentLength((int)file.length());
		response.setHeader("Content-Disposition", "attatchment;filename=\"" + filename + "\"");
		
		// 다운로드 시 저장되는 이름은 Response Header의 "Content-Disposition"에 명시
		OutputStream os = response.getOutputStream();
		
		FileInputStream fis = new FileInputStream(file);
		FileCopyUtils.copy(fis, os);
		
	}
	
	@RequestMapping(value = "/replyok.do", 
			produces="application/text;charset=utf8", 
			method = RequestMethod.POST)
	@ResponseBody 
	public String ReplyOK(ReplyVO vo,HttpServletRequest request)
	{
		//로그인 검사
		UserVO login = (UserVO)request.getSession().getAttribute("login");
		
		if(login == null)
		{
			return "댓글을 등록하려면 로그인하세요.";
		}
		
		replyService.Insert(vo);
		
		return "댓글 등록이 완료되었습니다.";
	}	
	
	@RequestMapping(value = "/delreply.do", 
			produces="application/text;charset=utf8")
	@ResponseBody
	public String DelReply(String rno)
	{
		replyService.Delete(rno);
		return "댓글 삭제가 완료되었습니다.";
		}
	}
}
*/

}
