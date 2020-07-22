package alz.lesson.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import alz.lesson.domain.LessonDTO;
import alz.lesson.domain.LessonResponseDTO;

public interface LessonMapper {

	int insert(LessonDTO classes);

	LessonResponseDTO findById(Long id);

	List<LessonDTO> findAll();

	int updateById(LessonDTO searchedLessons);

	int deleteById(Long id);

}
