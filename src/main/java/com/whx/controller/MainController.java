package com.whx.controller;

import com.whx.model.UserEntity;
import com.whx.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.List;

/**
 * Created by wanghongxiang on 16/7/2.
 */
@Controller
public class MainController {

    @Autowired
    UserRepository userRepository;


    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String index() {
        return "index";
    }

    @RequestMapping(value = "/admin/users", method = RequestMethod.GET)
    public String getUsers(ModelMap modelMap) {
        //查询user表中所有的记录
        List<UserEntity> userList = userRepository.findAll();
        //将所有记录传递给要返回的jsp页面,放在userList当中
        modelMap.addAttribute("userList", userList);
        //返回pages目录下的admin/users.jsp页面
        return "admin/users";


    }

    //get请求,访问添加用户页面
    @RequestMapping(value = "/admin/users/add", method = RequestMethod.GET)
    public String addUser() {
        //跳转到admin/addUser.jsp页面
        return "admin/addUser";
    }

    //post请求,处理添加用户的请求,并重定向到用户管理页面
    @RequestMapping(value = "/admin/users/addP", method = RequestMethod.POST)
    public String addUserPost(@ModelAttribute("user") UserEntity userEntity) {
        //注意此处,post请求传递过来的是一个UserEntity对象,里面包含了该用户的信息
        //通过 @ModelAttribute("user")注解可以获取传递过来的user,并创建该对象


        //数据库中添加一个用户,该步暂时不会刷新
//        userRepository.save(userEntity);

//        数据库中添加一个用户,并立即刷新缓存
        userRepository.saveAndFlush(userEntity);

        //重定向到用户管理页面,方法为redirect:url
        return "redirect:/admin/users";
    }


    //查看用户详情
    //@PathVariable可以收集url中的变量,需要匹配的变量用{}括起来
    //例如:访问localhost://8080/admin/users/show/1 将匹配id=1
    @RequestMapping(value = "admin/users/show/{id}", method = RequestMethod.GET)
    public String showUser(@PathVariable("id") Integer userId, ModelMap modelMap) {
        //找到userId的用户
        UserEntity userEntity = userRepository.findOne(userId);

        //传递给请求页面
        modelMap.addAttribute("user", userEntity);
        return "admin/userDetail";
    }

    //更新用户信息 页面
    @RequestMapping(value = "/admin/users/update/{id}", method = RequestMethod.GET)
    public String updateUser(@PathVariable("id") Integer userId, ModelMap modelMap) {

        //找到userId所表示的用户
        UserEntity userEntity = userRepository.findOne(userId);

        //传递给请求页
        modelMap.addAttribute("user", userEntity);
        return "admin/updateUser";

    }

    //更新用户信息 操作
    @RequestMapping(value = "admin/users/updateP", method = RequestMethod.POST)
    public String updateUserPost(@ModelAttribute("userP") UserEntity user) {
        //更新用户信息
        System.out.print(user);
        userRepository.updateUser(user.getNickname(), user.getFirstName(), user.getLastName(), user.getPassword(),user.getId());
        userRepository.flush();
        return "redirect:/admin/users";
    }

    //删除用户
    //要想删除该用户的所有博文后在删除用户,因为存在外键
    @RequestMapping(value = "/admin/users/delete/{id}",method = RequestMethod.GET)
    public String deleteUser(@PathVariable("id")Integer userId){


        //删除id未userId的用户
        userRepository.delete(userId);
        //立即刷新
        userRepository.flush();
        return "redirect:/admin/users";
    }
}
