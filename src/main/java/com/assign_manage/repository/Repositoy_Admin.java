package com.assign_manage.repository;

import org.springframework.stereotype.Repository;

@Repository
public class Repositoy_Admin
{
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

