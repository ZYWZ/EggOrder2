package au.usyd.elec5619;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.google.gson.Gson;

import au.usyd.elec5619.domain.Classroom;


@Controller
@RequestMapping(value="/map")
public class MapController {
	
	@Resource(name="classroomManager")
	private DatabaseClassroomManager classroomManager;


	@RequestMapping(value={"", ".htm", ".html"}, method=RequestMethod.GET)
	public String showStudent(Model uiModel) {
		
		List<Classroom> classrooms = classroomManager.getAllClassrooms();
		String json = new Gson().toJson(classrooms);
		uiModel.addAttribute("classrooms",json);
		return "map";
	}
	
}
