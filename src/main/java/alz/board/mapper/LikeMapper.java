package alz.board.mapper;

import alz.board.domain.LikeDTO;

public interface LikeMapper {

	void addLike(LikeDTO like);

	int removeLike(LikeDTO likeDTO);

	LikeDTO getLike(LikeDTO likeDTO);
	
	

}
