package com.snow.test002.board.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.snow.test002.service.MainService;

@Controller
public class MainController {
	private static final Logger logger = LoggerFactory.getLogger(MainController.class);
	
	@Resource(name="mainService")
	private MainService mainService;
	
	@RequestMapping(value="/selectBoardList.do")
	public ModelAndView selectBoardList( Map<String, Object> commandMap ) throws Exception {
		ModelAndView mv = new ModelAndView("/main/boardList");
		
		logger.info("selectBoardList ==");
		List<Map<String,Object>> list = mainService.selectBoardList(commandMap);
        mv.addObject("list", list);
        
		return mv;	
	}
}
