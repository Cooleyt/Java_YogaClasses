package com.cooley.beltexam.services;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.cooley.beltexam.models.Course;
import com.cooley.beltexam.repositories.CourseRepository;

@Service
public class CourseService {
	private CourseRepository courseRepo;
	
	public CourseService(CourseRepository courseRepo) {
		this.courseRepo = courseRepo;
	}
	
	public Course oneCourse(Long id) {
		Optional<Course> optionalCourse = courseRepo.findById(id);
		if(optionalCourse.isPresent()) {
			return optionalCourse.get();
		}else {
			return null;
		}
	}
	
	public Course create(Course course) {
		return courseRepo.save(course);
	}
	
	public Course update(Course course) {
		return courseRepo.save(course);
	}
	
	public List<Course> allCourses(){
		return courseRepo.findAll();
	}
	
	public void destroy(Long id) {
		courseRepo.deleteById(id);
	}
	
}
