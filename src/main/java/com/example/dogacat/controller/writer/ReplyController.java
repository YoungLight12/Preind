package com.example.dogacat.controller.writer;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.example.dogacat.model.writer.ReplyDAO;
import com.example.dogacat.model.writer.ReplyDTO;
import com.example.dogacat.service.PageUtil;

@RestController
@RequestMapping("/reply/*")
public class ReplyController {
	@Autowired
	ReplyDAO replyDao;

	@RequestMapping("insert.do")
	public void insert(ReplyDTO dto) {
		replyDao.insert(dto);
	}

	@RequestMapping("delete/{idx}")
	public ResponseEntity<String> delete(@PathVariable("idx") int idx) {
		ResponseEntity<String> entity = null;
		try {
			replyDao.delete(idx); // 레코드 삭제
			entity = new ResponseEntity<>("success", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
	}

	@RequestMapping("detail/{idx}")
	public ModelAndView detail(@PathVariable("idx") int idx, ModelAndView mav) {
		ReplyDTO dto = replyDao.detail(idx);
		
		mav.setViewName("writer/reply_detail");
		mav.addObject("dto", dto);
		
		return mav;
	}

	@RequestMapping("list.do")
	public ModelAndView list(int write_code, @RequestParam(defaultValue = "1") int curPage, ModelAndView mav) {
		int count = replyDao.count(write_code);
		
		PageUtil page_info = new PageUtil(count, curPage);
		int start = page_info.getPageBegin();
		int end = page_info.getPageEnd();
		
		List<ReplyDTO> list = replyDao.list(start, end, write_code);
		
		mav.setViewName("writer/reply");
		mav.addObject("list", list);
		mav.addObject("page_info", page_info);
		mav.addObject("start", start);
		mav.addObject("count", count);
		
		return mav;
	}

//	@RequestMapping("list_json.do")
//	public @ResponseBody List<ReplyDTO> list_json(@RequestParam(defaultValue = "1") int curPage,
//			@RequestParam int idx) {
//		int count = replyDao.count(idx); // 댓글 갯수
//		PageUtil page_info = new PageUtil(count, curPage);
//		int start = page_info.getPageBegin();
//		int end = page_info.getPageEnd();
//		List<ReplyDTO> list = replyDao.list(idx, start, end);
//		return list;
//	}

	@RequestMapping("update/{idx}")
	public ResponseEntity<String> update(@PathVariable("idx") int idx, String reply_text) {
		ResponseEntity<String> entity = null;
		
		try {
			replyDao.update(idx, reply_text); // 레코드 수정
			entity = new ResponseEntity<String>("success", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
}
