package br.com.alura.forum.repository;

import static org.assertj.core.api.Assertions.assertThat;

import java.util.List;

import org.junit.jupiter.api.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.orm.jpa.DataJpaTest;
import org.springframework.boot.test.autoconfigure.orm.jpa.TestEntityManager;
import org.springframework.test.context.junit4.SpringRunner;

import br.com.alura.forum.model.OpenTopicsByCategory;
import br.com.alura.forum.repository.setup.TopicRepositoryTestsSetup;

@RunWith(SpringRunner.class)
@DataJpaTest
public class TopicRepositoryTests {
	
	@Autowired
	private TestEntityManager testEntityManager;
	
	@Autowired
	private TopicRepository topicRepository;
	
	@Test
	public void shouldReturnOpenTopicsByCategory() {
		
		TopicRepositoryTestsSetup testSetup = new TopicRepositoryTestsSetup(testEntityManager);
		testSetup.openTopicsByCategorySetup();
		
		List<OpenTopicsByCategory> openTopics = this.topicRepository.findOpenTopicsByCategory();
		
		assertThat(openTopics).isNotEmpty();
		assertThat(openTopics).hasSize(2);
		
		assertThat(openTopics.get(0).getCategoryName()).isEqualTo("Programação");
		assertThat(openTopics.get(0).getTopicCount()).isEqualTo(2);
		
		assertThat(openTopics.get(1).getCategoryName()).isEqualTo("Front-end");
		assertThat(openTopics.get(1).getTopicCount()).isEqualTo(1);
	}

}
