package com.example.dogacat.controller;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
//import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.catalina.connector.Response;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.example.dogacat.model.member.MemberDAO;
import com.example.dogacat.model.member.MemberDTO;
import com.example.dogacat.model.pet.PetDAO;
import com.example.dogacat.model.pet.PetDTO;
import com.example.dogacat.model.writer.WriterDAO;
import com.example.dogacat.model.writer.WriterDTO;
import com.example.dogacat.util.Geo;

@Controller
public class HomeController {

	@Autowired
	MemberDAO memberDAO;

	@Autowired
	PetDAO petDAO;

	@Autowired
	WriterDAO writerDAO;

	@RequestMapping("/")
	public String home() {
		return "redirect:/main.do";
	}

	@RequestMapping("/main.do")
	public ModelAndView main(HttpSession session) {
		List<WriterDTO> notice = writerDAO.list(0, 3, "all", "", 0);
		List<WriterDTO> FAQs = writerDAO.list(0, 3, "all", "", 3);
		List<PetDTO> all = petDAO.all();

		ModelAndView mav = new ModelAndView();

		String addr = "서울 마포구 신촌로 94 그랜드마트";
		String id = (String) session.getAttribute("id");
		String filename = "home3.png";

		if (id != null) {
			MemberDTO dto = memberDAO.info(id);

			if (dto.getAddress1() == null || dto.getAddress1().equals("")) {
				addr = "서울 마포구 신촌로 94 그랜드마트";
			} else {
				addr = dto.getAddress1();
			}

			List<String> file = petDAO.pet_filename(id);
			try {
				if (!file.get(0).equals("") || !file.get(0).equals("-")) {
					filename = file.get(0);
				}
			} catch (Exception e) {
				filename = "noimage.png";
			}
			
		}

		List<MemberDTO> list3 = memberDAO.list();

		List<List<String>> lists = new ArrayList<>();

		for (MemberDTO memberDTO : list3) {
			List<String> list = new ArrayList<>();
			List<String> file = petDAO.pet_filename(memberDTO.getId());
			String file1 = "";
			
			try {
				file1 = file.get(0);
			} catch (Exception e) {
				file1 = "noimage.png";
			}
			
			list.add("'" + memberDTO.getAddress1() + "'");
			list.add("'" + memberDTO.getNickname() + "'");
			list.add("'" + memberDTO.getId() + "'");
			list.add("'" + file1 + "'");

			lists.add(list);
		}
		
		mav.addObject("all", all);

		mav.addObject("FAQs", FAQs);
		mav.addObject("notice", notice);

		mav.addObject("list", lists);

		mav.addObject("filename", filename);
		mav.addObject("addr", addr);
		mav.addObject("x", Geo.testmap(addr).get("x").toString());
		mav.addObject("y", Geo.testmap(addr).get("y").toString());

		mav.setViewName("home");

		return mav;
	}

	@RequestMapping("/fail")
	public void fail(Response response) {
		try {
			response.setContentType("text/html; charset=utf-8");
			PrintWriter w = response.getWriter();
			w.write("<script>alert('경로 오류!');location.href='/';</script>");
			w.flush();
			w.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@RequestMapping("/info.do")
	public String info() {
		return "/info";
	}
}
