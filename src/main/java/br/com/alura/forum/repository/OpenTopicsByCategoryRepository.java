package br.com.alura.forum.repository;

import org.springframework.data.repository.Repository;

import br.com.alura.forum.model.OpenTopicsByCategory;

public interface OpenTopicsByCategoryRepository extends Repository<OpenTopicsByCategory, Long> {

	void saveAll(Iterable<OpenTopicsByCategory> topics);
	
}
