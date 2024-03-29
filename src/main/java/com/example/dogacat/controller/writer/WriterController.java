package com.example.dogacat.controller.writer;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.example.dogacat.model.member.MemberDAO;
import com.example.dogacat.model.pet.PetDAO;
import com.example.dogacat.model.pet.PetDTO;
import com.example.dogacat.model.writer.WriteFileDTO;
import com.example.dogacat.model.writer.WriterDAO;
import com.example.dogacat.model.writer.WriterDTO;
import com.example.dogacat.service.PageUtil;

@Controller
@RequestMapping("/writer/*1")
public class WriterController {

	@Autowired
	WriterDAO writerDAO;

	@Autowired
	PetDAO petDAO;

	@Autowired
	MemberDAO memberDAO;

	@RequestMapping("list.do")
	public ModelAndView list(@RequestParam(defaultValue = "1") int curPage,
							@RequestParam(defaultValue = "all") String search_option, 
							@RequestParam(defaultValue = "") String keyword,
							int address, ModelAndView mav, HttpSession session) {

		int count = writerDAO.count(search_option, keyword, address);

		PageUtil page_info = new PageUtil(count, curPage);
		int start = page_info.getPageBegin();
		int end = page_info.getPageEnd();

		String id = (String) session.getAttribute("id");
		int lv = lv(id);

		List<WriterDTO> list = writerDAO.list(start, end, search_option, keyword, address);
		List<WriterDTO> notice = writerDAO.list(0, 3, "all", "", 0);

		mav.addObject("search_option", search_option);
		mav.addObject("keyword", keyword);
		mav.addObject("address", address);
		mav.addObject("page_info", page_info);
		mav.addObject("notice", notice);
		mav.addObject("list", list);
		mav.addObject("lv", lv);

		if (address == 0) {
			mav.setViewName("writer/Notice");
		} else {
			mav.setViewName("writer/QnA");
		}

		return mav;
	}

	@RequestMapping("info.do")
	public ModelAndView info(int write_code, ModelAndView mav, HttpSession session) {

		WriterDTO dto = writerDAO.detail(write_code);
		List<String> filename = writerDAO.filename(write_code);
		
		int address = dto.getAddress();
		long read_time = 0;
		long current_time = System.currentTimeMillis();

		if (session.getAttribute("read_time_" + write_code) != null) {
			read_time = (long) session.getAttribute("read_time_" + write_code);
		}

		if (current_time - read_time > 3600 * 1000 && session.getAttribute("id") != null) {
			writerDAO.hit(write_code);
			session.setAttribute("read_time_" + write_code, current_time);
		}

		try {
			String pet_name = petDAO.view(dto.getPet_code()).getPet_name();
			mav.addObject("pet_name", pet_name);
		} catch (Exception e) {
			mav.addObject("pet_name", "기타1111");
		}

		mav.setViewName("writer/QnA_info");
		mav.addObject("filename", filename);
		mav.addObject("dto", dto);
		mav.addObject("address", address);
		mav.addObject("address1234", address);

		return mav;
	}

	@RequestMapping("community.do")
	public ModelAndView community(ModelAndView mav) {
		List<WriterDTO> notice = writerDAO.list(0, 3, "all", "", 0);
		List<WriterDTO> FAQs = writerDAO.list(0, 3, "all", "", 3);
		List<WriterDTO> QnA = writerDAO.list(0, 3, "all", "", 2);

		mav.setViewName("writer/Community");
		mav.addObject("QnA", QnA);
		mav.addObject("FAQs", FAQs);
		mav.addObject("notice", notice);

		return mav;
	}

	@RequestMapping("write.do")
	public ModelAndView write(ModelAndView mav, int address) {
//		String id = (String) session.getAttribute("id");
//		List<PetDTO> list = petDAO.list(id,0,100);
//
//		mav.addObject("list", list);
		mav.addObject("address", address);
		mav.setViewName("writer/write");

		return mav;
	}

	@RequestMapping("insert.do")
	public void insert(WriterDTO writerdto, HttpSession session, HttpServletRequest request, List<MultipartFile> files) {
		int i = 0;
		
		for (MultipartFile file : files) {
			if (!file.getOriginalFilename().equals("") && file.getOriginalFilename() != null) {
				i++;
			}
		}
		
		writerdto.setId((String) session.getAttribute("id"));
		writerdto.setFilecount(i);
		int write_code = writerDAO.insert(writerdto);

		if (files.size() != 0)
			insertfile(files, write_code, request);
	}

	@RequestMapping("delete.do")
	public void delete(int write_code, int address) {
		writerDAO.dropfile(write_code);
		writerDAO.delete(write_code);
	}

	@RequestMapping("de.do")
	public String de(int write_code, int address) {
		writerDAO.dropfile(write_code);
		writerDAO.delete(write_code);

		return "redirect:/writer/list.do?address=" + address;
	}

	@RequestMapping("update_page.do")
	public ModelAndView update_page(ModelAndView mav, int write_code) {
		WriterDTO dto = writerDAO.detail(write_code);

		List<PetDTO> list = petDAO.list(dto.getId(), 0, 100);

		mav.setViewName("/writer/QnA_change");
		mav.addObject("dto", dto);
		mav.addObject("list", list);

		return mav;
	}

	@RequestMapping("update.do")
	public void update(WriterDTO dto, List<MultipartFile> files, HttpServletRequest request) {
		int i = 0;
		
		for (MultipartFile file : files) {
			if (!file.getOriginalFilename().equals("") && file.getOriginalFilename() != null) {
				i++;
			}
		}
		
		if(i > 0)
			writerDAO.dropfile(dto.getWrite_code());
		
		insertfile(files, dto.getWrite_code(), request);
		
		dto.setFilecount(i);
		writerDAO.update(dto);
	}

	public int lv(String id) {
		int lv = 0;
		if (id != null) {
			lv = memberDAO.info(id).getLv();
		}

		return lv;
	}

	@ResponseBody
	@RequestMapping("display_file.do")
	public ResponseEntity<byte[]> display_file(String file_name) throws Exception {

		InputStream in = null;
		ResponseEntity<byte[]> entity = null;

		try {
			HttpHeaders headers = new HttpHeaders();
			in = new FileInputStream(file_name);

			file_name = file_name.substring(file_name.indexOf("_") + 1);
			headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
			headers.add("Content-Disposition", "attachment; filename=\"" + file_name + "\"");
			entity = new ResponseEntity<byte[]>(IOUtils.toByteArray(in), headers, HttpStatus.OK);

		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<byte[]>(HttpStatus.BAD_REQUEST);
		} finally {
			if (in != null)
				in.close();
		}

		return entity;
	}

	@RequestMapping("summer.do")
	public ModelAndView summernote(ModelAndView mav, int address, HttpSession session) {

		String id = (String) session.getAttribute("id");
		List<PetDTO> list = petDAO.list(id, 0, 100);

		mav.addObject("list", list);
		mav.addObject("address", address);
		mav.setViewName("writer/summer");

		return mav;
	}

	@RequestMapping("summer_change.do")
	public ModelAndView summer_change(ModelAndView mav, int write_code, HttpSession session) {
		WriterDTO dto = writerDAO.detail(write_code);

		List<PetDTO> list = petDAO.list(dto.getId(), 0, 100);
		
		List<String> files = writerDAO.filename(write_code);

		mav.setViewName("writer/summer_change");
		mav.addObject("address", dto.getAddress());
		mav.addObject("dto", dto);
		mav.addObject("list", list);
		mav.addObject("files", files);

		return mav;
	}

	public String uploadFile(MultipartFile file, String path) throws Exception {
		UUID uid = UUID.randomUUID();

		String originalName = file.getOriginalFilename();
		String savedName = uid.toString() + "_" + originalName;

		new File(path).mkdir();
		file.transferTo(new File(path + savedName));

		return savedName;
	}

	public void insertfile(List<MultipartFile> files, int write_code, HttpServletRequest request) {
		if (!files.isEmpty()) {
			try {
				for (MultipartFile file : files) {
					ServletContext application = request.getSession().getServletContext();
					WriteFileDTO writeFileDTO = new WriteFileDTO();

					String path = application.getRealPath("/resources/write/");
					String originalName = file.getOriginalFilename();
					String savedName = uploadFile(file, path);

					writeFileDTO.setFilename(savedName);
					writeFileDTO.setWrite_code(write_code);

					if (!originalName.equals("") && originalName != null) {
						writerDAO.insert(writeFileDTO);				
					}
				}			
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}
}
