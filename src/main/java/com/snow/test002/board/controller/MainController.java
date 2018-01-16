package com.snow.test002.board.controller;

import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.snow.test002.board.service.MainService;
import com.snow.test002.common.CommandMap;

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
	
	@RequestMapping(value="/openBoardWrite.do")
	public ModelAndView openBoardWrite(CommandMap commandMap) throws Exception{
	    ModelAndView mv = new ModelAndView("/main/boardWrite");
	     
	    return mv;
	}
	
	@RequestMapping(value="/testMapArgumentResolver.do")
	public ModelAndView testMapArgumentResolver(CommandMap commandMap) throws Exception{
	    ModelAndView mv = new ModelAndView("");
	     
	    if(commandMap.isEmpty() == false){
	        Iterator<Entry<String,Object>> iterator = commandMap.getMap().entrySet().iterator();
	        Entry<String,Object> entry = null;
	        while(iterator.hasNext()){
	            entry = iterator.next();
	            logger.debug("key : "+entry.getKey()+", value : "+entry.getValue());
	        }
	    }
	    return mv;
	}
}
