package alz.classroom.service;

import org.springframework.stereotype.Service;

import alz.classroom.mapper.ClassroomMapper;

@Service
public class ClassroomServiceImpl implements ClassroomService {

	private ClassroomMapper classroomMapper;
	
	public ClassroomServiceImpl(ClassroomMapper classroomMapper) {
		this.classroomMapper = classroomMapper;
	}

	@Override
	public boolean checkStudent(Long lessonId, Long userId) {
		return classroomMapper.findStudentByLesson(lessonId)==userId;
	}
	
	
	
}
