package au.usyd.elec5619;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
@RequestMapping(value="/map")
public class MapController {

	@RequestMapping(value={"", ".htm", ".html"}, method=RequestMethod.GET)
	public String showStudent(Model uiModel) {
		return "map";
	}
}
