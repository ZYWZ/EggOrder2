package au.usyd.elec5619.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "booking")
public class Booking {

    @Id
    @Column(name = "id")
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int id;

    @Column(name = "studentId")
    private int studentId;

    @Column(name = "classroomId")
    private int classroomId;

    @Column(name = "bookingDate")
    private String  bookingDate;
    
    @Column(name = "startTime")
    private String startTime;
    
    @Column(name = "finishTime")
    private String finishTime;

    public int getId() {
        return id;
    }
    
    public void setId(int id) {
        this.id = id;
    } 
    
    public int getStudentId() {
        return studentId;
    } 
    
    public void setStudentId(int studentId) {
        this.studentId = studentId;
    }
    
    public int getClassroomId() {
        return classroomId;
    } 
    
    public void setClassroomId(int classroomId) {
        this.classroomId = classroomId;
    }
    
    public String getBookingDate() {
        return bookingDate;
    }
    
    public void setBookingDate(String bookingDate) {
        this.bookingDate = bookingDate;
    } 
    
    public String getStartTime() {
        return startTime;
    }
    
    public void setStartTime(String startTime) {
        this.startTime = startTime;
    } 

    public String getFinishTime() {
        return finishTime;
    }
    
    public void setFinishTime(String finishTime) {
        this.finishTime = finishTime;
    } 
}