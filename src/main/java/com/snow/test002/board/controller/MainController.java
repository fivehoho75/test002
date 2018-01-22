package com.snow.test002.board.controller;

import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.snow.test002.board.service.MainService;
import com.snow.test002.common.CommandMap;
import com.snow.test002.common.vo.ReturnVO;

@Controller
public class MainController {
	private static final Logger logger = LoggerFactory.getLogger(MainController.class);
	
	@Resource(name="mainService")
	private MainService mainService;
	
	@RequestMapping(value="/selectBoardList.do")
	public String selectBoardList(CommandMap commandMap, Model model) throws Exception {
		List<Map<String,Object>> list = mainService.selectBoardList(commandMap.getMap());
        model.addAttribute("list", list);
        
		return "/main/boardList";	
	}
	
	@RequestMapping(value="/openBoardWrite.do")
	public String openBoardWrite(CommandMap commandMap, Model model) throws Exception{     
	    return "/main/boardWrite";
	}
	
	@RequestMapping(value="/insertBoard.do")
	public @ResponseBody ReturnVO insertBoard(CommandMap commandMap, Model model) throws Exception{     
	    ReturnVO returnVO = new ReturnVO();
		int nAffected = mainService.insertBoard(commandMap.getMap());
		
		if ( nAffected > 0 ) {
			returnVO.setnAffected(nAffected);
		    returnVO.setMsg("저장 성공");
		} else {
			returnVO.setnAffected(0);
			returnVO.setMsg("저장 실패");
		}
		
	    return returnVO;
	}
	
	@RequestMapping(value="/openBoardDetail.do")
	public String openBoardDetail(CommandMap commandMap, Model model) throws Exception{  
	    Map<String,Object> map = mainService.selectBoardDetail(commandMap.getMap());
	    model.addAttribute("map", map);
	     
	    return "/main/boardDetail";
	}
	
	@RequestMapping(value="/openBoardUpdate.do")
	public String openBoardUpdate(CommandMap commandMap, Model model) throws Exception{  
	    Map<String,Object> map = mainService.selectBoardDetail(commandMap.getMap());
	    model.addAttribute("map", map);
	     
	    return "/main/boardUpdate";
	}
	
	@RequestMapping(value="/updateBoard.do")
	public @ResponseBody ReturnVO updateBoard(CommandMap commandMap, Model model) throws Exception{     
	    ReturnVO returnVO = new ReturnVO();
		int nAffected = mainService.updateBoard(commandMap.getMap());
		
		if ( nAffected > 0 ) {
			returnVO.setnAffected(nAffected);
		    returnVO.setMsg("저장 성공");
		} else {
			returnVO.setnAffected(0);
			returnVO.setMsg("저장 실패");
		}
		
	    return returnVO;
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
