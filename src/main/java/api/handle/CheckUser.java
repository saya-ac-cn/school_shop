package api.handle;

import api.dao.StudentDAO;
import api.entity.StudentEntity;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class CheckUser implements HandlerInterceptor {

    @Resource
    @Qualifier("studentDAO")
    private StudentDAO studentDAO;

    public boolean preHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o) throws Exception {
        httpServletRequest.setCharacterEncoding("utf-8");
        //获取当前请求url:http://localhost:8080/shopLogin.html
        String url = httpServletRequest.getRequestURL().toString();
        if(url.contains("/api/admin") || url.contains("/view/admin"))
        {
            //进入运维人员专属的目录下
            Integer sessionAdmin= (Integer) httpServletRequest.getSession().getAttribute("Admin");//在session中取出运维管理员的信息
            if (sessionAdmin != null) {
                //通过验证
                System.out.println("pass the /api/root/");
                return true;
            }
            else
            {
                //未通过验证
                System.err.println("please admin login");
                this.redirectAjax(httpServletRequest, httpServletResponse,"/adminLogin.html");
                return false;
            }
        }
        else if(url.contains("/api/user") || url.contains("/view/user"))
        {
            //进入普通用户专属的目录下
            Integer sessionUser= (Integer) httpServletRequest.getSession().getAttribute("UserID");//在session中取出运维管理员的信息
            if (sessionUser != null) {
                //通过验证
                System.out.println("pass the /api/user/");
                return true;
            }
            else
            {
                //未通过验证
                System.err.println("please user login");
                this.redirectAjax(httpServletRequest, httpServletResponse,"/userLogin.html");
                return false;
            }
        }
        else if (url.contains("/api/shop") || url.contains("/view/shop"))
        {
            //进入商户目录
            //检查是否登录
            Integer sessionShop= (Integer) httpServletRequest.getSession().getAttribute("ShopID");//在session中取出商户管理员的信息
            if (sessionShop != null) {
                //通过验证
                System.out.println("pass the /api/shop");
                return true;
            }
            else
            {
                //未通过验证
                System.err.println("please shop login");
                this.redirectAjax(httpServletRequest, httpServletResponse,"/shopLogin.html");
                return false;
            }
        }
        return false;
    }

    //对于请求是ajax请求重定向问题的处理方法
    public void redirectAjax(HttpServletRequest request, HttpServletResponse response,String url) throws IOException {
        //获取当前请求的路径
        String basePath = request.getScheme() + "://" + request.getServerName() + ":"  + request.getServerPort()+request.getContextPath();
        //如果request.getHeader("X-Requested-With") 返回的是"XMLHttpRequest"说明就是ajax请求，需要特殊处理 否则直接重定向就可以了
        if("XMLHttpRequest".equals(request.getHeader("X-Requested-With"))){
            //告诉ajax我是重定向
            response.setHeader("REDIRECT", "REDIRECT");
            //告诉ajax我重定向的路径
            response.setHeader("CONTENTPATH", basePath+url);
            response.setStatus(HttpServletResponse.SC_FORBIDDEN);
            System.err.println("Ajax请求");
        }else{
            System.err.println("非Ajax请求");
            response.sendRedirect(basePath + url);
        }
    }

    public void postHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, ModelAndView modelAndView) throws Exception {

    }

    public void afterCompletion(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, Exception e) throws Exception {

    }
}
