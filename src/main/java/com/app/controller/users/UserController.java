package com.app.controller.users;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.app.dto.users.User;
import com.app.dto.users.UserSerch;
import com.app.service.users.UserService;

@Controller
public class UserController {
	
	@Autowired
	UserService userService;

	@GetMapping("/users")
    public String user(Model model, @RequestParam(required = false) String keyword) {
		
		//List<User> user = userSerivce.findUser();
		
		List<User> users;
        if (keyword != null && !keyword.isEmpty()) {
            // 키워드가 존재할 경우 해당하는 사용자만 가져옴
            users = userService.findUserList(keyword);
        } else {
            // 키워드가 없을 경우 모든 사용자 가져옴
            users = userService.findUser();
        }
		
		model.addAttribute("user", users);

        return "/index";
    }
	
//	ajax값 넘겨 주기 위한 컨트롤러
	@GetMapping("/users/details")
	@ResponseBody
	public List<User> getMustDetails(@RequestParam String keyword) {

	    List<User> user = userService.findUserList(keyword);
	    
	    return user;
	}
	
}
