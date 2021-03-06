package com.bakery.application.controller;

import com.bakery.application.constant.*;
import com.bakery.application.dto.BaseCodeDTO;
import com.bakery.application.dto.ProductDTO;
import com.bakery.application.entity.*;
import com.bakery.application.service.*;
import com.bakery.application.util.JsonUtil;
import com.bakery.application.util.UUIDUtil;
import com.github.pagehelper.PageInfo;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author liting
 * @date 2019/05/01  22:14
 */
@Controller
public class ProductController {

    @Autowired
    BaseCodeService baseCodeService;

    @Autowired
    OrderService orderService;

    @Autowired
    ProductService productService;


    @Autowired
    SysMenuService sysMenuService;
    @Autowired
    EmployeeService employeeService;

    /**
     * @Description:商品管理列表首页
     * @Author: LiTing
     * @Date: 1:19 PM 2019/5/4
     * @return:
     * @throws:
     */
    @RequestMapping(Url.PDT_MANAGER_LIST)
    public String pdtIndex(final Map<String, Object> map) {
        //商品類別
        List<BaseCode> pdtTypeList = baseCodeService.findByCodeType(CodeTypeConstant.PDT_TYPE);
        //計量單位
        List<BaseCode> measureList = baseCodeService.findByCodeType(CodeTypeConstant.MEASER);
        //查询按钮
        List<SysMenu> sysMenuList = sysMenuService.selecyByCriteria(new SysMenuCriteria());
        //归属部门
        List<BaseCode> deptTypeList = baseCodeService.findByCodeType(CodeTypeConstant.DEPT_TYPE);
        //员工标识
        List<BaseCode> roleTypeList = baseCodeService.findByCodeType(CodeTypeConstant.EMP_ROLE_TYPE);
        //员工职位
        List<BaseCode> JobList = baseCodeService.findByCodeType(CodeTypeConstant.EMP_JOB);
        //员工性别
        List<BaseCode> sexList = baseCodeService.findByCodeType(CodeTypeConstant.SEX);
        //上级领导
        EmployeeCriteria criteria = new EmployeeCriteria();
        EmployeeCriteria.Criteria cri = criteria.createCriteria();
        cri.andJobEqualTo("1");
        List<Employee> mgrList = employeeService.selectByCriteria(criteria);
        map.put("deptTypeList", JsonUtil.listtojson(deptTypeList));
        map.put("roleTypeList", JsonUtil.listtojson(roleTypeList));
        map.put("JobList", JsonUtil.listtojson(JobList));
        map.put("sysMenuList", JsonUtil.listtojson(sysMenuList));
        map.put("sexList", JsonUtil.listtojson(sexList));
        map.put("mgrList", JsonUtil.listtojson(mgrList));
        map.put("sysMenuList", JsonUtil.listtojson(sysMenuList));
        map.put("pdtTypeList", JsonUtil.listtojson(pdtTypeList));
        map.put("measureList", JsonUtil.listtojson(measureList));
        return Views.PDT_LIST_VIEW;
    }

    /**
     * @Description:分页查询
     * @Author: LiTing
     * @Date: 2:46 PM 2019/5/4
     * @return:
     * @throws:
     */
    @RequestMapping(value = Url.PDT_MANAGE_QUERY_URL, method = RequestMethod.POST)
    public @ResponseBody
    BootstrapTablePage queryPdtByPage(Product product, Page page) {
        List<ProductDTO> productList = productService.selectByCriteriaPage(page, product);
        PageInfo pageInfo = new PageInfo<ProductDTO>(productList);
        BootstrapTablePage bootTable = new BootstrapTablePage(String.valueOf(pageInfo.getTotal()));
        bootTable.pageValue(page, pageInfo.getList());
        bootTable.setPageSize(page.getPageSize() + "");
        return bootTable;

    }

    /**
     * @Description:新增修改商品
     * @Author: LiTing
     * @Date: 2:46 PM 2019/5/4
     * @return:
     * @throws:
     */
    @RequestMapping(value = Url.INSERT_OR_UPDATE_PDT_URL, method = RequestMethod.POST)
    public @ResponseBody
    Map<String, Object> createOrupdate(Product product, Map<String, Object> map) {
        if (StringUtils.isNotBlank(product.getPdtId())) {
            map = productService.updateByPrimaryKeySelective(product, "");
        } else {
            map = productService.insertSelective(product);
        }
        return map;
    }

    /**
     * @Description: 文件上传
     * @Author: LiTing
     * @Date: 2:49 PM 2019/5/4
     * @return:
     * @throws:
     */
    @RequestMapping(value = Url.UPLOAD_FILE_URL, method = RequestMethod.POST)
    public @ResponseBody
    String upLoadFile(MultipartFile file) throws IOException {
        //获取源文件名
        String originalFilename = file.getOriginalFilename();
        //获取文件上传的后缀名
        String exet = originalFilename.substring(originalFilename.lastIndexOf("."));
        String uuid = UUIDUtil.create32Key();
        //动态创建文件路径（以时间命名）
        Date date = new Date();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
        String dir = "/Users/liting/文档/upload/" + sdf.format(date);
        File fileDir = new File(dir);
        //判断文件是否存在
        if (!fileDir.exists()) {
            fileDir.mkdirs();
        }
        String saveFilePath = fileDir + "/" + uuid + exet;
        File newFile = new File(saveFilePath);
        file.transferTo(newFile);
        return JsonUtil.stringtojson(sdf.format(date) + uuid + exet);
    }

    /**
     * @Description:刪除商品
     * @Author: LiTing
     * @Date: 2:46 PM 2019/5/4
     * @return:
     * @throws:
     */
    @RequestMapping(value = Url.DELETE_PDT_URL, method = RequestMethod.POST)
    public @ResponseBody
    Map<String, Object> deletePdt(Product product, String flag) {
        return productService.updateByPrimaryKeySelective(product, flag);
    }

    /**
     * @Description:上架/下架商品
     * @Author: LiTing
     * @Date: 2:46 PM 2019/5/4
     * @return:
     * @throws:
     */
    @RequestMapping(value = Url.OPERATE_SHELL_PDT_URL, method = RequestMethod.POST)
    public @ResponseBody
    Map<String, Object> operateShellPdt(Product product) {
        return productService.updateByExampleSelective(product);
    }

    /**
     * @Description: 加载订单获得商品类别树
     * @Author: LiTing
     * @Date: 2:49 PM 2019/5/4
     * @return:
     * @throws:
     */
    @RequestMapping(value = Url.SELECT_LEFT_TREE, method = RequestMethod.POST)
    public @ResponseBody
    String selectLeftTrees() {
        List<BaseCodeDTO> baselistdto = productService.selectLeftTrees();
        return JsonUtil.listtojson(baselistdto);
    }


}
