package br.com.alura.forum.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.data.web.PageableDefault;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import br.com.alura.forum.controller.dto.input.TopicSearchInputDto;
import br.com.alura.forum.controller.dto.output.TopicBriefOutputDto;
import br.com.alura.forum.controller.dto.output.TopicDashboardItemOutputDto;
import br.com.alura.forum.model.topic.domain.Topic;
import br.com.alura.forum.repository.TopicRepository;
import br.com.alura.forum.service.DashboardDataProcessingService;
import br.com.alura.forum.vo.CategoriesAndTheirStatisticsData;

@RestController
@RequestMapping("/api/topics")
public class TopicController {
	
	@Autowired
	private TopicRepository topicRepository;
	
	@Autowired
	private DashboardDataProcessingService dashboardDataProcessingService;
	
	@GetMapping(produces = MediaType.APPLICATION_JSON_VALUE)
	public Page<TopicBriefOutputDto> listTopics(TopicSearchInputDto topicSearch, 
			@PageableDefault(sort="creationInstant", direction=Sort.Direction.DESC) Pageable pageRequest){
		
		Specification<Topic> topicSearchSpecification = topicSearch.build();
		Page<Topic> topics = topicRepository.findAll(topicSearchSpecification, pageRequest);
		return TopicBriefOutputDto.listFromTopics(topics);
	}
	
    @GetMapping(value = "/dashboard", produces = MediaType.APPLICATION_JSON_VALUE)
    public List<TopicDashboardItemOutputDto> getDashboardInfo() {
    
    		CategoriesAndTheirStatisticsData categoriesStatisticsData = this.dashboardDataProcessingService.execute();
    		return TopicDashboardItemOutputDto.listFromCategories(categoriesStatisticsData);
    		
    }

}
