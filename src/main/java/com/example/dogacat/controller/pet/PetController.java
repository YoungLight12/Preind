package com.example.dogacat.controller.pet;

import java.io.File;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

//import org.apache.commons.fileupload.FileUpload;
//import org.apache.commons.fileupload.UploadContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.example.dogacat.model.pet.PetDAO;
import com.example.dogacat.model.pet.PetDTO;
//import com.example.dogacat.util.UploadFileUtils;
import com.example.dogacat.service.PageUtil2;

@Controller
@RequestMapping("/pet/*")
public class PetController {
	@Autowired
	PetDAO dao;

	@RequestMapping("insert_page.do")
	public String insert_page() {
		return "pet/insert";
	}

	@RequestMapping("list.do")
	public ModelAndView list(@RequestParam(defaultValue = "1") int curPage, ModelAndView mav, HttpSession session) {

		String id = (String) session.getAttribute("id");
		
		int count = dao.count(id);
		
		PageUtil2 page_info = new PageUtil2(count, curPage);
		int start = page_info.getPageBegin();
		int end = page_info.getPageEnd();
		
		List<PetDTO> list = dao.list(id, start, end);
		// System.out.println(list);

		mav.setViewName("pet/list");
		mav.addObject("list", list);
//		session.setAttribute("mypetlist", list);

		return mav;
	}

	@RequestMapping("info.do")
	public ModelAndView info(ModelAndView mav, int pet_code, HttpSession session) {

		PetDTO dto = dao.view(pet_code);
		String type_name = dao.type_name(pet_code);
		dto.setType_name(type_name);

		mav.setViewName("pet/info");
		mav.addObject("dto", dto);
		mav.addObject("petlist", session.getAttribute("mypetlist"));

		return mav;
	}

	@RequestMapping("change_info_page.do")
	public ModelAndView change_info(ModelAndView mav, HttpSession session, int pet_code) {
		PetDTO dto = dao.view(pet_code);
		String master = dao.find_master(dto.getId());
		String original = dto.getFilename().substring(dto.getFilename().indexOf("_") + 1);

		mav.setViewName("pet/change_info");
		mav.addObject("dto", dto);
		mav.addObject("master", master);
		mav.addObject("original", original);

		return mav;
	}

	@RequestMapping("find_master.do")
	public String find_master(ModelAndView mav, HttpSession session, String id) {
		return dao.find_master(id);
	}

	@RequestMapping("update.do")
	public String update(PetDTO dto, HttpServletRequest request) {
		if (!dto.getFile1().isEmpty()) {
			String filename = dto.getFile1().getOriginalFilename();

			try {
				ServletContext application = request.getSession().getServletContext();
				String path = application.getRealPath("/resources/images/");

				String savedName = uploadFile(dto.getFile1(), path);
				dto.setFilename(savedName);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else {
			PetDTO dto2 = dao.view(dto.getPet_code());
			dto.setFilename(dto2.getFilename());
		}
		dao.update(dto);
		
		return "redirect:/pet/info.do?pet_code=" + dto.getPet_code();
	}

	public String uploadFile(MultipartFile file, String path) throws Exception {
		String originalName = file.getOriginalFilename();
//		byte[] fileData = file.getBytes();
		UUID uid = UUID.randomUUID();
		String savedName = uid.toString() + "_" + originalName;
//		File target = new File(path, savedName);
//		FileCopyUtils.copy(fileData, target);
		new File(path).mkdir();
		file.transferTo(new File(path + savedName));
		return savedName;
	}

	@RequestMapping("up.do")
	public String up(int pet_code) {
		if (dao.up(pet_code) == null)
			return "redirect:/pet/info.do?pet_code=" + pet_code;
		else {
			int pet_code2 = dao.up(pet_code).getPet_code();
			return "redirect:/pet/info.do?pet_code=" + pet_code2;
		}
	}

	@RequestMapping("down.do")
	public String down(int pet_code) {
		if (dao.down(pet_code) == null)
			return "redirect:/pet/info.do?pet_code=" + pet_code;
		else {
			int pet_code2 = dao.down(pet_code).getPet_code();
			return "redirect:/pet/info.do?pet_code=" + pet_code2;
		}
	}

	@RequestMapping("add.do")
	public ModelAndView add(ModelAndView mav, HttpSession session) {
		String master = dao.find_master((String) session.getAttribute("id"));

		mav.setViewName("pet/insert");
		mav.addObject("master", master);

		return mav;
	}

	@RequestMapping("insert.do")
	public String insert(PetDTO dto, HttpServletRequest request) {
		String filename = "-";

		if (!dto.getFile1().isEmpty()) {
			filename = dto.getFile1().getOriginalFilename();

			try {
				ServletContext application = request.getSession().getServletContext();
				String path = application.getRealPath("/resources/images/");
				String savedName = uploadFile(dto.getFile1(), path);
				dto.setFilename(savedName);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else {
			dto.setFilename(filename);
		}

		dao.insert(dto);
		return "redirect:/member/info.do?id=" + dto.getId();
	}
	
	@RequestMapping("delete.do")
	public String delete(int pet_code, HttpSession session) {
		dao.delete(pet_code);
		
		return "redirect:/member/info.do?id=" + session.getAttribute("id");
	}

	@RequestMapping("info_only.do")
	public ModelAndView info_only(ModelAndView mav, int pet_code) {

		PetDTO dto = dao.view(pet_code);
		String type_name = dao.type_name(pet_code);
		dto.setType_name(type_name);
		mav.addObject("dto", dto);
		mav.setViewName("pet/info_only");

		return mav;
	}
}
