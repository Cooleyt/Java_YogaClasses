package com.cooley.beltexam.controllers;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.cooley.beltexam.models.Course;
import com.cooley.beltexam.models.LoginUser;
import com.cooley.beltexam.models.User;
import com.cooley.beltexam.services.CourseService;
import com.cooley.beltexam.services.UserService;



@Controller
public class HomeController {
	private UserService userServ;
	private CourseService courseServ;
	
	public HomeController(UserService userServ,CourseService courseServ) {
		this.userServ = userServ;
		this.courseServ = courseServ;
	}
	
	//login and reg landing page
		@RequestMapping("/")
		public String index(Model model) {
			model.addAttribute("newUser", new User());
			model.addAttribute("newLogin", new LoginUser());
			return "index.jsp";
		}
		
		//registration action
	    @PostMapping("/register")
	    public String register(@Valid @ModelAttribute("newUser") User newUser, 
	            BindingResult result, Model model, HttpSession session) {
	        userServ.register(newUser, result);
	        if(result.hasErrors()) {
	            model.addAttribute("newLogin", new LoginUser());
	            return "index.jsp";
	        }
	        session.setAttribute("user_id", newUser.getId());
	        return "redirect:/dashboard";
	    }
		
		//login action
	    @PostMapping("/login")
	    public String login(@Valid @ModelAttribute("newLogin") LoginUser newLogin, 
	            BindingResult result, Model model, HttpSession session) {
	        User user = userServ.login(newLogin, result);
	        if(result.hasErrors()) {
	            model.addAttribute("newUser", new User());
	            return "index.jsp";
	        }
	        session.setAttribute("user_id", user.getId());
	        return "redirect:/dashboard";
	    }
	    
	  //dashboard for all courses
		@RequestMapping("/dashboard")
		public String dashboard(Model model, HttpSession session) {
			if(session.getAttribute("user_id") == null) {
				return "redirect:/";
			}
			model.addAttribute("allCourses", courseServ.allCourses());
			model.addAttribute("user", userServ.oneUser((Long) 
					session.getAttribute("user_id")));
			return "dashboard.jsp";
		}
		
		//new course render JSP
		@RequestMapping("/newCourse")
		public String newCourse(@ModelAttribute("course") Course course, Model model, HttpSession session) {
			
			Long user_id = (Long) session.getAttribute("user_id");
			model.addAttribute("user", user_id);
			return "newCourse.jsp";
		}

		//creating new course action
		@RequestMapping(value = "/makeCourse", method= RequestMethod.POST)
		public String CreatedBy(@Valid @ModelAttribute("course") Course course, BindingResult result) {
			if(result.hasErrors()) {
				return "newCourse.jsp";
			}else {
				courseServ.create(course);
				return "redirect:/dashboard";
			}
		}
		//edit course render JSP
		@RequestMapping("/editCourse/{id}")
		public String editCourse(@PathVariable("id") Long id, @ModelAttribute("course") Course course, Model model, HttpSession session) {
			Course oneCourse = courseServ.oneCourse(id);
			model.addAttribute("course", oneCourse);
			
			//grabbing id from the user from session
			Long user_id = (Long) session.getAttribute("user_id");
			model.addAttribute("user", user_id);
			return "editCourse.jsp";
		}
		//editing course action
		@RequestMapping(value="/editingCourse/{id}", method=RequestMethod.PUT)
		public String editingCourse(@Valid @ModelAttribute("course") Course course, BindingResult result) {
			if(result.hasErrors()) {
				return "editCourse.jsp";
			}else {
				courseServ.update(course);
				return "redirect:/dashboard";
			}
		}
		
		//deleting a course
		@RequestMapping("/destroy/{id}")
		public String destroyable(@PathVariable("id") Long id) {
			courseServ.destroy(id);
			return "redirect:/dashboard";
		}
		
		//render one course JSP
		@RequestMapping("/oneCourse/{id}")
		public String oneCourse(@PathVariable("id") Long id, Model model, HttpSession session) {
			User user = userServ.oneUser((Long) session.getAttribute("user_id"));
			model.addAttribute("user", user);
			model.addAttribute("course", courseServ.oneCourse(id));
			return "oneCourse.jsp";
		}
		
		
		@RequestMapping("/logout")
		public String logout(HttpSession session){
			session.invalidate();
			return "redirect:/";
		}
}
