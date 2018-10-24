package au.usyd.elec5619.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import au.usyd.elec5619.dao.ClassroomDao;
import au.usyd.elec5619.domain.Classroom;

@Service(value="ClassroomService")
// @Transactional
public class ClassroomService {

    @Autowired
    private ClassroomDao classroomDao;
    
    // business logic of registering a Person into the database
    public void registerClassroom(Classroom classroom) {
        
        // Step 1: check whether this person is already in the database
        
        // Step 2: if not, save this person into the database
    	classroomDao.saveClassroom(classroom);
    }
    
}