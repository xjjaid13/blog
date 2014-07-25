package test;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.spring.dao.UserMapperDao;
import com.spring.service.RssMapperService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = "classpath:springmvc.xml")
public class RssTest {

	
	@Autowired
	RssMapperService rssMapperService;
	
	@Test
	public void addRssTest(){
		rssMapperService.addRss("http://news.163.com/special/00011K6L/rss_newstop.xml", 1);
	}
	
	public static void main(String[] args) {
		
	}
	
}