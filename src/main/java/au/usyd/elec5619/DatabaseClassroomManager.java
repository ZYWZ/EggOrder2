package au.usyd.elec5619;

import java.util.List;

import javax.annotation.Resource;

import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.hibernate.classic.Session;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import au.usyd.elec5619.domain.Classroom;

@Service(value="classroomManager")
@Transactional
public class DatabaseClassroomManager {

    @Resource
    private SessionFactory sessionFactory;

    public SessionFactory getSessionFactory() {
        return sessionFactory;
    }

    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

	public void addClassroom(Classroom classroom) {
		this.sessionFactory.getCurrentSession().save(classroom);
	}

	public Classroom getClassroomById(long id) {
		Session currentSession = this.sessionFactory.getCurrentSession();
		Classroom classroom = (Classroom) currentSession.get(Classroom.class, id);
		return classroom;
	}

	public void updateClassroom(Classroom classroom) {
		Session currentSession = this.sessionFactory.getCurrentSession();
		currentSession.merge(classroom);
	}

	public void deleteClassroom(long id) {
		Session currentSession = this.sessionFactory.getCurrentSession();
		Classroom classroom = (Classroom) currentSession.get(Classroom.class, id);
		currentSession.delete(classroom);
	}
	
	public List<Classroom> getAllClassrooms() {
		Session currentSession = this.sessionFactory.getCurrentSession();
		Query query = currentSession.createQuery("from Classroom");
		List<Classroom> result = (List<Classroom>) query.list();
		return result;
	}
}