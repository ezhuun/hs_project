package spring.controller.hs;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RestController;

import spring.mapper.hs.AboardReplyMapperInter;

@RestController
public class AboardReplyController {
	
	private static final Logger log = LoggerFactory.getLogger(AboardReplyController.class);
	
	@Autowired
	private AboardReplyMapperInter arinter;

	
	
	
	

}
