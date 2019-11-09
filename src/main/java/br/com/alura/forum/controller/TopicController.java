package br.com.alura.forum.controller;

import java.util.Arrays;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import br.com.alura.forum.model.Category;
import br.com.alura.forum.model.Course;
import br.com.alura.forum.model.User;
import br.com.alura.forum.model.topic.domain.Topic;

@Controller
public class TopicController {
	
	@ResponseBody
	@RequestMapping("/api/topics")
	public List<Topic> listTopics(){
		Category subcategory = new Category("Java", new Category("Programação"));
		Course course = new Course("Java e JSF", subcategory);
		User owner = new User("Fulano", "fulano@gmail.com", "123456");
		Topic topic = new Topic("Problemas com o JSF", "Erro ao fazer conversão da data", owner, course);
		
		List<Topic> topics = Arrays.asList(topic, topic, topic);
		return topics;
	}

}
