package com.example.dogacat.controller.homepage;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.example.dogacat.model.pet.PetDAO;
import com.example.dogacat.model.pet.PetDTO;
import com.example.dogacat.service.PageUtil2;

@Controller
@RequestMapping("/homepage/*")
public class HomepageController {
	@Autowired
	PetDAO petDAO;

	@RequestMapping("homepage.do")
	public ModelAndView homepage(@RequestParam(defaultValue = "1") int curPage, String id, ModelAndView mav,
			HttpSession session) {

		if (id == null && session.getAttribute("id") != null) {
			id = (String) session.getAttribute("id");
		}

		int count = petDAO.count(id);

		PageUtil2 page_info = new PageUtil2(count, curPage);
		int start = page_info.getPageBegin();
		int end = page_info.getPageEnd();

		List<PetDTO> list = petDAO.list(id, start, end);

		mav.addObject("id", id);
		mav.addObject("list", list);
		mav.addObject("page_info", page_info);
		mav.setViewName("personal/homepage");

		return mav;
	}
}
