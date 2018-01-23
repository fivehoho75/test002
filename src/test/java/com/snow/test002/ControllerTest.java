package com.snow.test002;

import org.junit.Test;
import org.springframework.test.web.servlet.MockMvc;

import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;
import static org.springframework.test.web.servlet.setup.MockMvcBuilders.standaloneSetup;

import com.snow.test002.board.controller.MainController;

public class ControllerTest {
	
	@Test
	public void controllerTest() throws Exception {
		MainController controller = new MainController();
	    MockMvc mockMvc = standaloneSetup(controller).build();
	    mockMvc.perform(get("/selectBoardList.do"))
	    		.andExpect(status().isOk());
	            //.andExpect(view().name("/main/boardList"));
	}
}
