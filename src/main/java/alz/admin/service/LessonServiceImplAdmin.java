package alz.admin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import alz.admin.domain.BoardCriteriaAdmin;
import alz.admin.domain.LessonStateDTO;
import alz.admin.mapper.LessonMapperAdmin;
import alz.lesson.domain.LessonDTO;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class LessonServiceImplAdmin implements LessonServiceAdmin {
	
	//mapper 가져와서 사용
	private LessonMapperAdmin lessonMapper;
	
	@Autowired
	public LessonServiceImplAdmin(LessonMapperAdmin lessonMapper) {
		this.lessonMapper = lessonMapper;
	}

	@Override
	public Object readAll(BoardCriteriaAdmin cri) {
		List<LessonDTO> list = lessonMapper.LessonReqList(cri);
		return list;
	}

	@Override
	public int getTotal(BoardCriteriaAdmin cri) {
		int total = lessonMapper.getTotalCount(cri);
		return total;
	}

	@Override
	public void stateChangebyId(LessonStateDTO lessonDTO) {
		for(int i=0; i<lessonDTO.getLessonId().size();i++) {
		lessonDTO.setId(lessonDTO.getLessonId().get(i));
			lessonMapper.stateChangebyId(lessonDTO);
			
	}
	

}
}
