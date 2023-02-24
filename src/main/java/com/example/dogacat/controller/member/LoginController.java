package com.example.dogacat.controller.member;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.example.dogacat.model.email.EmailDTO;
import com.example.dogacat.model.member.MemberDAO;
import com.example.dogacat.model.member.MemberDTO;
import com.example.dogacat.service.email.EmailServiceImpl;
import com.example.dogacat.util.Geo;

@Controller
@RequestMapping("/login/*")
public class LoginController {
	@Autowired
	MemberDAO memberDAO;

	@Autowired
	EmailServiceImpl emailService;

	@RequestMapping("login_page.do")
	public String login_page() {
		return "member/login";
	}

	@RequestMapping("login.do")
	public ModelAndView login(MemberDTO dto, ModelAndView mav, HttpSession session) {
		MemberDTO dto2 = memberDAO.login(dto);

		if (dto2 != null) {
			if (dto2.getAddress1() == null || dto2.getAddress1().equals("")) {
				dto2.setAddress1("서울 마포구 신촌로 94 그랜드마트 7층");
			}

			Map<String, Object> map = Geo.testmap(dto2.getAddress1());

			session.setAttribute("id", dto2.getId());
			session.setAttribute("name", dto2.getName());
			session.setAttribute("nickname", dto2.getNickname());
			session.setAttribute("lv", dto2.getLv());
			session.setAttribute("x", map.get("x"));
			session.setAttribute("y", map.get("y"));

			mav.setViewName("redirect:/main.do");
		} else {
			mav.addObject("message", "error");
			mav.setViewName("member/login");
		}

		return mav;
	}

	@RequestMapping("logout.do")
	public ModelAndView logout(HttpSession session, ModelAndView mav) {
		session.invalidate();
		mav.setViewName("member/login");
		mav.addObject("message", "logout");

		return mav;
	}

	@RequestMapping("find_id_page.do")
	public String find_id_page() {
		return "member/find_id";
	}

	@RequestMapping("find_id.do")
	public String find_id(String name, String email) {

		ModelAndView mav = new ModelAndView();
		String id = memberDAO.find_id(name, email);
		String message = "";

		if (id.equals("") || id == null) {
			message = "false1";
		} else {
			EmailDTO emailDTO = new EmailDTO();

			emailDTO.setMessage(name + "님의 아이디는 " + id + "입니다.");
			emailDTO.setSenderName("Priend");
			emailDTO.setSenderMail("okhg98@gmail.com");
			emailDTO.setSubject("아이디 찾기");
			emailDTO.setReceiveMail(email);

			try {
				emailService.sendMail(emailDTO);
				message = "success";
			} catch (Exception e) {
				e.printStackTrace();
				message = "false2";
			}
		}

		mav.setViewName("member/find_id");
		mav.addObject("message", message);

		return message;
	}

	@RequestMapping("find_pw_page.do")
	public String find_pw_page() {
		return "member/find_pw";
	}

	@RequestMapping("find_pw.do")
	public String find_pw(String id, String name, String email) {

		ModelAndView mav = new ModelAndView();
		String pw = memberDAO.find_pw(id, name, email);
		String message = "";

		if (pw.equals("") || pw == null) {
			message = "false1";
		} else {
			EmailDTO emailDTO = new EmailDTO();

			emailDTO.setMessage(name + "님의 비밀번호는 " + pw + "입니다.");
			emailDTO.setSenderName("Priend");
			emailDTO.setSenderMail("okhg98@gmail.com");
			emailDTO.setSubject("아이디 찾기");
			emailDTO.setReceiveMail(email);

			try {
				emailService.sendMail(emailDTO);
				message = "success";
			} catch (Exception e) {
				e.printStackTrace();
				message = "false2";
			}
		}

		mav.setViewName("member/find_pw");
		mav.addObject("message", message);

		return message;
	}

	@RequestMapping("join.do")
	public String add() {
		return "member/join";
	}

	@RequestMapping("insert.do")
	public String insert(MemberDTO dto, HttpSession session) {

		String nickname = dto.getNickname();

		if (nickname.equals("") || nickname == null) {
			dto.setNickname(dto.getName());
		}

		memberDAO.insert(dto);
		return "redirect:/member/login_page.do";
	}

	@RequestMapping("checkid.do")
	public ModelAndView checkid(MemberDTO dto, HttpSession session) {
		ModelAndView mav = new ModelAndView();

		mav.setViewName("member/join");
		int result = memberDAO.checkid(dto.getId());
		if (result != 0) {
			mav.addObject("result", "error");
			mav.addObject("id_check_count", 0);
		} else {
			mav.addObject("dto", dto);
			mav.addObject("result", "success");
			mav.addObject("id_check_count", 1);
		}

		return mav;
	}
}
