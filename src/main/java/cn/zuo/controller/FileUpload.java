package cn.zuo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.*;

/*
 *Author Pass_Z
 *Date 2021/4/29 - 17:17
 */
@Controller
public class FileUpload {

    @RequestMapping("/picUpload")
    public String fileUpload(@RequestParam("picupload") CommonsMultipartFile file , HttpServletRequest request) throws IOException {
        //@RequestParam("file") 将name=file控件得到的文件封装成CommonsMultipartFile 对象
        //批量上传CommonsMultipartFile则为数组即可
        //获取文件名 : file.getOriginalFilename();
        String uploadFileName = file.getOriginalFilename();

        //如果文件名为空，直接回到首页！
//        if ("".equals(uploadFileName)){
//            return "dashboard";
//        }
        System.out.println("上传文件名 : "+uploadFileName);

        //上传路径保存设置
        String path = request.getSession().getServletContext().getRealPath("/pics");
        //如果路径不存在，创建一个
        File realPath = new File(path);
        if (!realPath.exists()){
            realPath.mkdir();
        }
        System.out.println("上传文件保存地址："+realPath);

        InputStream is = file.getInputStream(); //文件输入流
        OutputStream os = new FileOutputStream(new File(realPath,uploadFileName)); //文件输出流

        //读取写出
        int len=0;
        byte[] buffer = new byte[1024];
        while ((len=is.read(buffer))!=-1){
            os.write(buffer,0,len);
            os.flush();
        }
        os.close();
        is.close();
        return "dashboard";
    }
}
