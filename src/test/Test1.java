package test;

import java.util.List;

import net.sf.json.JSONObject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.spring.entity.Blog;
import com.spring.entity.Note;
import com.spring.service.BlogMapperService;
import com.spring.service.NoteMapperService;
import com.spring.service.WebLinktypeMapperService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = "classpath:spring-servlet.xml")
public class Test1 {

	@Autowired
	WebLinktypeMapperService webLinktypeMapperService;
	
	@Autowired
	NoteMapperService noteMapperService;
	
	@Autowired
	BlogMapperService blogMapperService;
	
	@Test
	public void test(){
		Blog blog = new Blog();
	}
	
	public static void main(String[] args) {
		
	}
	
}
