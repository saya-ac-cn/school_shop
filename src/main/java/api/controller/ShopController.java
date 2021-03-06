package api.controller;


import api.entity.*;
import api.service.impl.ShopServiceImpl;
import api.tools.LayuiTable;
import api.tools.Result;
import api.tools.ResultUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * 商户专属控制器
 * 其中内部又分为核心业务和非核心业务
 * 核心业务统一加注core
 * 其它的一律默认不加
 */
@RestController
@RequestMapping(value = "/api/shop")
public class ShopController {

    @Autowired
    @Qualifier("shopServiceImpl")
    private ShopServiceImpl shopServiceImpl;

    /**
     * 加载用户的信息
     *
     * @return
     * @throws Exception
     */
    @GetMapping(value = "/info.yht")
    public Result<StudentEntity> getStudentInfo() throws Exception {
        return shopServiceImpl.getStudentInfo(new StudentEntity());
    }

    /**
     * 修改商户管理员的信息
     *
     * @param vo
     * @return
     * @throws Exception
     */
    @PutMapping(value = "/admin/info.yht")
    public Result<Integer> updateAdminInfo(StudentEntity vo) throws Exception {
        return shopServiceImpl.studentUpdateInfo(vo);
    }

    /**
     * 修改商户管理员的密码
     *
     * @param vo
     * @return
     * @throws Exception
     */
    @PutMapping(value = "/admin/password.yht")
    public Result<Integer> updateAdminPass(StudentEntity vo) throws Exception {
        return shopServiceImpl.studentUpdatePass(vo);
    }

    /**
     * 修改商户管理员的密码保护问题
     *
     * @param vo
     * @return
     * @throws Exception
     */
    @PutMapping(value = "/admin/mibao.yht")
    public Result<Integer> updateAdminMibao(StudentEntity vo) throws Exception {
        return shopServiceImpl.studentUpdateMibao(vo);
    }

    /**
     * 用户上传图片
     *
     * @param request
     * @param file
     * @return
     * @throws Exception
     */
    @PostMapping(value = "/upload.yht")
    public Result<String> uploadPicture(@RequestParam(value = "type") String type, HttpServletRequest request, @RequestParam("file") MultipartFile file) throws Exception {
        if (type.trim().equals("3") == true) {
            return shopServiceImpl.uploadPictureGoods(request, file, type);
        } else if (type.trim().equals("2") == true) {
            return shopServiceImpl.uploadLogo(request, file, type);
        } else {
            return ResultUtil.error(999, "未能正确解析出数据参数");
        }
    }

    @GetMapping("/viewPicture/{page}")
    public Result<Object> viewPicture(@PathVariable("page") Integer page, @RequestParam(value = "rows", required = false) Integer rows) throws Exception {
        return shopServiceImpl.viewPicture(page, rows);
    }

    @DeleteMapping("/picture/delete/{id}")
    public Result<Object> deletePicture(@PathVariable("id") Integer id, HttpServletRequest request) throws Exception {
        return shopServiceImpl.deletePicture(request, id);
    }

    @GetMapping("/shopinfo.yht")
    public Result<Object> displayShopInfo(HttpServletRequest request) throws Exception {
        return shopServiceImpl.displayShopInfo(request);
    }

    @PutMapping("/shopinfo/info.yht")
    public Result<Object> updateShopInfo(ShopEntity vo) throws Exception {
        return shopServiceImpl.updateShopInfo(vo);
    }

    @PostMapping("/shop/register.yht")
    public Result<Integer> shopRegister(ShopEntity vo) throws Exception {
        return shopServiceImpl.shopRegister(vo);
    }

    @PostMapping("/goods/add.yht")
    public Result<Object> insertGoods(GoodsEntity vo) throws Exception {
        return shopServiceImpl.insertGoods(vo);
    }

    @GetMapping("/goods/pagin.yht")
    public LayuiTable<List> goodsPagin(GoodsEntity vo) throws Exception {
        return shopServiceImpl.goodsPaging(vo);
    }

    @PutMapping("/goods/update.yht")
    public Result<Object> updateGoods(GoodsEntity vo) throws Exception
    {
        return shopServiceImpl.updateGoods(vo);
    }

    @PutMapping("/goods/delete.yht")
    public Result<Object> deleteGoods(GoodsEntity vo) throws  Exception
    {
        return shopServiceImpl.deleteGoods(vo);
    }

    @GetMapping("/order/report.yht")
    public LayuiTable<List> orderReportPagin(OrderReport vo) throws Exception
    {
        return shopServiceImpl.orderReportPagin(vo);
    }

    @PostMapping("/order/delete.yht")
    public Result<Object> deleteOrder(@RequestParam("itermOrderId") Integer itermOrderId,
                                      @RequestParam("ststus") String ststus,
                                      @RequestParam("user") String user) throws Exception
    {
        return shopServiceImpl.deleteOrder(itermOrderId,ststus,user);
    }

    @GetMapping("/message.yht")
    public LayuiTable<List> getMessage(MessageEntity vo) throws Exception
    {
        return shopServiceImpl.getMessage(vo);
    }

}
