package alz.classes.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import alz.classes.domain.ClassDTO;

public interface ClassMapper {

	int insert(ClassDTO classes);

	ClassDTO findById(Long id);

	List<ClassDTO> findAll();

	int updateById(ClassDTO searchedClass);

	int deleteById(Long id);

}
