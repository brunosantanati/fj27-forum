package br.com.alura.forum.repository;

import java.time.Instant;
import java.util.List;

import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.Repository;
import org.springframework.data.repository.query.Param;

import br.com.alura.forum.model.Category;
import br.com.alura.forum.model.OpenTopicsByCategory;
import br.com.alura.forum.model.User;
import br.com.alura.forum.model.topic.domain.Topic;

public interface TopicRepository extends Repository<Topic, Long>, JpaSpecificationExecutor<Topic> {
	
	@Query("select t from Topic t")
	List<Topic> list();
	
	List<Topic> findAll();
	
	@Query("SELECT count(topic) FROM Topic topic "
			+ "JOIN topic.course course "
			+ "JOIN course.subcategory subcategory "
			+ "JOIN subcategory.category category "
			+ "WHERE category = :category")
	int countTopicsByCategory(@Param("category") Category category);

	
	@Query("SELECT count(topic) FROM Topic topic "
			+ "JOIN topic.course course "
			+ "JOIN course.subcategory subcategory "
			+ "JOIN subcategory.category category "
			+ "WHERE category = :category AND topic.creationInstant > :lastWeek")
	int countLastWeekTopicsByCategory(@Param("category") Category category, 
			@Param("lastWeek") Instant lastWeek);

	
	@Query("SELECT count(topic) FROM Topic topic "
			+ "JOIN topic.course course "
			+ "JOIN course.subcategory subcategory "
			+ "JOIN subcategory.category category "
			+ "WHERE category = :category AND topic.status = 'NOT_ANSWERED'")
	int countUnansweredTopicsByCategory(@Param("category") Category category);
	
	Topic save(Topic topic);
	
	public List<Topic> findByOwnerAndCreationInstantAfterOrderByCreationInstantAsc(User loggedUser, Instant oneHourAgo);

	Topic findById(Long id);
	
	@Query("select new br.com.alura.forum.model.OpenTopicsByCategory(" +
			"t.course.subcategory.category.name as categoryName, " +
			"count(t) as topicCount, " +
			"now() as instant) from Topic t " +
			"where t.status = 'NOT_ANSWERED' " +
			"group by t.course.subcategory.category")
	List<OpenTopicsByCategory> findOpenTopicsByCategory();
}
