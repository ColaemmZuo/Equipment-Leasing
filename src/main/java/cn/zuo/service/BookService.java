package cn.zuo.service;

import cn.zuo.pojo.Books;
import org.apache.ibatis.annotations.Param;

import java.awt.print.Book;
import java.util.List;

/*
 *Author Pass_Z
 *Date 2021/4/13 - 21:49
 */
public interface BookService {
    //增加一本书
    int addBook(Books books);

    //删除一本书
    int deleteBookById(int id);

    //更新一本书
    int updateBook(Books books);

    //查询一本书
    Books queryBookById(int id);

    //查询全部书
    List<Books> queryAllBooks();


    Books queryBookByName(String bookName);
}
