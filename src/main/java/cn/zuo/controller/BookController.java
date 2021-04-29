package cn.zuo.controller;

import cn.zuo.pojo.Books;
import cn.zuo.service.BookService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.ArrayList;
import java.util.List;

/*
 *Author Pass_Z
 *Date 2021/4/14 - 14:49
 */
@Controller
@RequestMapping("/book")
public class BookController {
    //调用service
    @Autowired
    @Qualifier("BookServiceImpl")
    private BookService bookService;

    //查询全部书籍并返回展示页面
    @RequestMapping("/allBook")
    public String list(Model  model){
        List<Books> books = bookService.queryAllBooks();

        model.addAttribute("list",books);
        return "allBook";

    }

    //跳转到增加书籍
    @RequestMapping("/toAddBook")
    public String toAddPaper(){

        return "addBook";
    }

    //添加书籍的请求
    @RequestMapping("/addBook")
    public String addBook(Books books){
        bookService.addBook(books);
        return "redirect:/book/allBook";
    }

    //跳转到修改页面
    @RequestMapping("/toUpdate")
    public String toUpdatePaper(int id,Model model){
        Books books = bookService.queryBookById(id);
        model.addAttribute("qbook",books);
        return "updateBook";
    }

    //修改书籍
    @RequestMapping("/updateBook")
    public String updateBook(Books books){
        System.out.println("updatebook=>"+books);
        bookService.updateBook(books);
        return "redirect:/book/allBook";
    }

    //删除书籍
    @RequestMapping("/deleteBook/{bookId}")
    public String deleteBook(@PathVariable("bookId") int id){
        bookService.deleteBookById(id);
        return "redirect:/book/allBook";
    }

    //查询书籍
    @RequestMapping("/queryBook")
    public String queryBook(String queryBookName,Model model){

        Books books = bookService.queryBookByName(queryBookName);

        List<Books> list = new ArrayList<Books>();
        list.add(books);

        if(books==null){
            list = bookService.queryAllBooks();
            model.addAttribute("error","未查到相应信息");
        }

        model.addAttribute("list",list);
        return "allBook";
    }
}
