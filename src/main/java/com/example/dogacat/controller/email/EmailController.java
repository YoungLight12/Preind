package com.example.dogacat.controller.email;

import java.util.Random;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.example.dogacat.model.email.EmailDTO;
import com.example.dogacat.model.member.MemberDAO;
import com.example.dogacat.model.member.MemberDTO;
import com.example.dogacat.service.email.EmailServiceImpl;

@Controller
@RequestMapping("/email/*")
public class EmailController {

	@Autowired
	EmailServiceImpl emailService;

	@Autowired
	MemberDAO memberDAO;

	@RequestMapping("check.do")
	public String write() {
		return "email/check";
	}

	@RequestMapping("send.do")
	public ModelAndView send(EmailDTO dto, ModelAndView mav, HttpSession session) {
		Random rd = new Random();
		int randnum = rd.nextInt(1, 9999);
		String rn = String.format("%04d", randnum);
		session.setAttribute("check_number", rn);

		dto.setMessage(dto.getMessage() + "\n" + rn);
		String message = emailService.sendMail(dto);
		//System.out.println(message);

		mav.addObject("receiveMail", dto.getReceiveMail());
		mav.addObject("message", message);

		mav.setViewName("email/check");

		return mav;
	}

	@RequestMapping("checking.do")
	public ModelAndView checking(String answer, String receiveMail, ModelAndView mav, HttpSession session) {
		if (answer.equals(session.getAttribute("check_number"))) {
			String id = (String) session.getAttribute("id");
			MemberDTO dto = memberDAO.info(id);

			if (dto.getAddress1() == null || dto.getAddress1().equals("")) {
				dto.setLv(2);
			} else {
				dto.setLv(3);
			}

			dto.setEmail(receiveMail);
//			System.out.println(receiveMail);
//			System.out.println(dto);
			try {
				memberDAO.update(dto);
				mav.setViewName("redirect:/member/info.do?id=" + id);
			} catch (Exception e) {
				mav.setViewName("email/check");
				mav.addObject("check", "동일한 이메일이 있습니다. 다른 이메일을 입력하세요.");
			}

		} else {
			mav.setViewName("email/check");
			mav.addObject("check", "틀렸습니다. 다시 입력해주세요.");
		}
		return mav;
	}
}
