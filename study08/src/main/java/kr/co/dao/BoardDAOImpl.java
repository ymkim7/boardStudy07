package kr.co.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.vo.BoardVO;
import kr.co.vo.Criteria;
import kr.co.vo.SearchCriteria;

@Repository
public class BoardDAOImpl implements BoardDAO {
	
	@Autowired
	private SqlSession sql;

	@Override
	public void create(BoardVO vo) throws Exception {
		sql.insert("board.create", vo);

	}

	@Override
	public BoardVO read(Integer bno) throws Exception {
		// TODO Auto-generated method stub
		return sql.selectOne("board.read", bno);
	}

	@Override
	public void update(BoardVO vo) throws Exception {
		sql.update("board.update", vo);

	}

	@Override
	public void delete(Integer bno) throws Exception {
		sql.delete("board.delete", bno);

	}

	@Override
	public List<BoardVO> listAll() throws Exception {
		// TODO Auto-generated method stub
		return sql.selectList("board.listAll");
	}

	@Override
	public void updateViewCnt(Integer bno) throws Exception {
		sql.update("board.updateViewCnt", bno);
		
	}

	@Override
	public List<BoardVO> listPage(int page) throws Exception {
		
		if(page <= 0) {
			page = 1;
		}
		
		page = (page - 1) * 10;
		
		return sql.selectList("board.listPage", page);
	}

	@Override
	public List<BoardVO> listCriteria(Criteria cri) throws Exception {
		// TODO Auto-generated method stub
		return sql.selectList("board.listCriteria", cri);
	}

	@Override
	public int countPaging(Criteria cri) throws Exception {
		// TODO Auto-generated method stub
		return sql.selectOne("board.countPaging", cri);
	}

	@Override
	public List<BoardVO> listSearch(SearchCriteria cri) throws Exception {
		// TODO Auto-generated method stub
		return sql.selectList("board.listSearch", cri);
	}

	@Override
	public int listSearchCount(SearchCriteria cri) throws Exception {
		// TODO Auto-generated method stub
		return sql.selectOne("board.listSearchCount", cri);
	}

}
