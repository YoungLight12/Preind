package com.example.dogacat.controller.map;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.context.properties.bind.DefaultValue;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.example.dogacat.model.member.MemberDAO;
import com.example.dogacat.model.member.MemberDTO;
import com.example.dogacat.model.pet.PetDAO;
import com.example.dogacat.model.pet.PetDTO;
import com.example.dogacat.model.writer.WriterDTO;
import com.example.dogacat.util.Geo;

@Controller
@RequestMapping("/map/*")
public class MapController {
	@Autowired
	MemberDAO memberDAO;

	@Autowired
	PetDAO petDAO;

	@RequestMapping("map.do")
	public String map() {
		return "map/map";
	}

	@RequestMapping("mymap.do")
	public ModelAndView main(HttpSession session) {
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

		// List<PetDTO> pet_filename = petDAO.pet_filename();
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

		// mav.addObject("all", pet_filename);
		mav.addObject("filename", filename);

		mav.addObject("list", lists);

		mav.addObject("x", Geo.testmap(addr).get("x").toString());
		mav.addObject("y", Geo.testmap(addr).get("y").toString());

		mav.setViewName("map/Page2");

		return mav;

//		ModelAndView mav = new ModelAndView();
//
//		String addr = "서울 마포구 신촌로 94 그랜드마트";
//		String id = (String) session.getAttribute("id");
//		String filename = "home3.png";
//
//		List<String> list1 = memberDAO.addresslist();
//		List<String> list2 = new ArrayList<>();
//
//		for (String str : list1) {
//			list2.add(str + "|");
//		}
//
//		if (id != null) {
//			MemberDTO dto = memberDAO.info(id);
//			addr = dto.getAddress1();
//			List<PetDTO> list = petDAO.list(id, 0, 100);
//			try {
//				PetDTO petdto = list.get(0);
//				filename = petdto.getFilename();
//			} catch (Exception e) {
//				filename = "home3.png";
//			}
//
//			if (filename == "-") {
//				filename = "home3.png";
//			}
//			if (addr == null) {
//				addr = "서울 마포구 신촌로 94 그랜드마트";
//			}
//		}
//
//		mav.addObject("list", list2);
//		mav.addObject("filename", filename);
//		mav.addObject("addr", addr);
//		mav.setViewName("map/Page2");
//
//		return mav;
	}

//	@RequestMapping("/test")
//	@ResponseBody
//	public String test(double lat, double lng, HttpSession session) {
//		session.setAttribute("lng", lng);
//		session.setAttribute("lat", lat);
//
//		return "success";
//	}

	@RequestMapping("maptest")
	public ModelAndView maptest(@RequestParam(defaultValue = "1") int range, HttpSession session, ModelAndView mav) {

		String x, y = "";

		if (session.getAttribute("id") != null) {
//			System.out.println(session.getAttribute("x"));
//			System.out.println(session.getAttribute("y"));
			x = session.getAttribute("x").toString();
			y = session.getAttribute("y").toString();
		} else {
			x = (String) Geo.testmap("서울 마포구 신촌로 94 그랜드마트 7층").get("x");
			y = (String) Geo.testmap("서울 마포구 신촌로 94 그랜드마트 7층").get("y");
		}

		List<String> list1 = memberDAO.addresslist();
		List<String> list2 = new ArrayList<>();

		for (String str : list1) {
			list2.add(str + "|");
		}

//		System.out.println(x);
//		System.out.println(y);

		mav.addObject("list", list2);
		mav.addObject("range", range);
		mav.addObject("x", x);
		mav.addObject("y", y);
		mav.setViewName("map/Page2");

		return mav;
	}
}
