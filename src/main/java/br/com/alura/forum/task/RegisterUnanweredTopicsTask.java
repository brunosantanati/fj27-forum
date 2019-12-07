package br.com.alura.forum.task;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import br.com.alura.forum.model.OpenTopicsByCategory;
import br.com.alura.forum.repository.OpenTopicsByCategoryRepository;
import br.com.alura.forum.repository.TopicRepository;

@Component
public class RegisterUnanweredTopicsTask {

	@Autowired
	private TopicRepository topicRepository;
	
	@Autowired
	private OpenTopicsByCategoryRepository openTopicsByCategoryRepository;
	
	@Scheduled(cron = "* */10 * * * *") //em prod seria algo como agendamento todo dia às 20h: "0 0 20 * * *"
	public void execute() {
		List<OpenTopicsByCategory> topics = topicRepository.findOpenTopicsByCategory();
		this.openTopicsByCategoryRepository.saveAll(topics);
	}
	
}
