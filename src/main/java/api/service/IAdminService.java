package api.service;

import api.entity.AdminEntity;
import api.entity.ShopEntity;
import api.entity.StandEntity;
import api.tools.LayuiTable;
import api.tools.Result;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * 管理员接口部分
 */
public interface IAdminService {

    /**
     * 获取管理员的详情
     * @return
     * @throws Exception
     */
    public Result<Object> getAdingInfo() throws Exception;

    /**
     * 修改管理员的资料
     * @param vo
     * @return
     * @throws Exception
     */
    public Result<Integer> updateAdminInfo(AdminEntity vo) throws Exception;

    /**
     * 上传用户图片
     * @param request
     * @param file
     * @return
     * @throws Exception
     */
    public Result<String> uploadLogo(HttpServletRequest request, MultipartFile file) throws  Exception;

    /**
     * 上传图片（头像的基类）
     * @param request
     * @param file
     * @return
     * @throws Exception
     */
    public Result<String> uploadPictureUtil(HttpServletRequest request, MultipartFile file) throws  Exception;


    /**
     * 获取所有商户信息-管理员用
     * @param vo
     * @return
     * @throws Exception
     */
    public LayuiTable<List> displayAllShopPagin(ShopEntity vo) throws Exception;

    /**
     * 获取所有的摊位
     * @param vo
     * @return
     * @throws Exception
     */
    public LayuiTable<List> displayAllStandPagin(StandEntity vo) throws Exception;

    /**
     * 添加摊位
     * @param vo
     * @return
     * @throws Exception
     */
    public Result<Integer> insertStand(StandEntity vo) throws Exception;

    /**
     * 修改摊位
     * @param vo
     * @return
     * @throws Exception
     */
    public Result<Integer> updateStand(StandEntity vo) throws Exception;


}