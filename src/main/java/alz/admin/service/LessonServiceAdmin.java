package alz.admin.service;

import java.util.List;

import alz.admin.domain.BoardCriteriaAdmin;
import alz.admin.domain.LessonDTOAdmin;
import alz.admin.domain.LessonStateDTO;

public interface LessonServiceAdmin {

	Object readAll(BoardCriteriaAdmin cri);

	int getTotal(BoardCriteriaAdmin cri);

	void stateChangebyId(LessonStateDTO lessonDTO);


}
