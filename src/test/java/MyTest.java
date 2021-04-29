import cn.zuo.pojo.Books;
import cn.zuo.service.BookService;
import cn.zuo.service.BookServiceImpl;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.awt.print.Book;

/*
 *Author Pass_Z
 *Date 2021/4/14 - 15:10
 */
public class MyTest {
    @Test
    public void test(){
        ApplicationContext context =
                new ClassPathXmlApplicationContext("applicationContext.xml");
        BookService bookServiceImpl = context.getBean("BookServiceImpl",BookService.class);
        for (Books books : bookServiceImpl.queryAllBooks()){
            System.out.println(books);
        }
    }
}
