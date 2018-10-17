package au.usyd.elec5619;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
@RequestMapping(value="/map")
public class MapController {
	protected final Log logger = LogFactory.getLog(getClass());

	@RequestMapping(value={"", ".htm", ".html"}, method=RequestMethod.GET)
	public String showStudent(Model uiModel) {
		return "map";
	}
}
