package com.bakery.application.controller;

import com.bakery.application.constant.CodeTypeConstant;
import com.bakery.application.constant.Url;
import com.bakery.application.constant.Views;
import com.bakery.application.entity.*;
import com.bakery.application.service.BaseCodeService;
import com.bakery.application.service.EmployeeService;
import com.bakery.application.service.SysMenuService;
import com.bakery.application.util.HttpClientUtil;
import com.bakery.application.util.JsonUtil;
import com.bakery.application.util.MD5Util;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;

/**
 * @author liting
 * @date 2019-05-14  14:52
 */
@Controller
public class LoginController {
    @Autowired
    BaseCodeService baseCodeService;

    @Autowired
    SysMenuService sysMenuService;
    @Autowired
    EmployeeService employeeService;
    //用户名
    private static String Uid = "XHuangYa";
    //接口安全秘钥
    private static String Key = "d41d8cd98f00b204e980";
    //private static String Key = "d41d8cd9843243214";
    //手机号码，多个号码如13800000000,13800000001,13800000002
    private static String smsMob = "18341836189";
    //短信内容
    private static String smsText = "验证码：8888";
    /**
     * @Description:获取验证码
     * @Author: LiTing
     * @Date: 12:27 PM 2019/4/21
     * @return:
     * @throws:
     */
    @RequestMapping(value = Url.GET_VALID_NUM_URL,method = RequestMethod.POST)
    public @ResponseBody String getValidNum(String phone, HttpServletRequest request){
        smsText= HttpClientUtil.getRandomCode();
        int result= HttpClientUtil.send(Uid,Key,phone,smsText);
        HttpSession session = request.getSession();
        session.setAttribute("smsText", smsText);
        session.setMaxInactiveInterval(60 * 1);
        return HttpClientUtil.getMessage(result);
    }
    /**
     * @Description:验证验证码
     * @Author: LiTing
     * @Date: 12:27 PM 2019/4/
     * @return:
     * @throws:
     */
    @RequestMapping(value = Url.VALIDATE_NUMBER_URL,method = RequestMethod.POST)
    public @ResponseBody boolean validNum(String remark, HttpServletRequest request){
       boolean flag=false;
        if(StringUtils.isNotBlank(remark)){
            //从session中比对发送的验证码
            HttpSession session = request.getSession();//设置session
            String sessioncode =(String) session.getAttribute("smsText");
            if(StringUtils.isNotBlank(sessioncode)){
                if(sessioncode.equals(remark)){
                    flag=true;
                }
            }

        }
        return flag;
    }
    /**
     * @Description:登录验证
     * @Author: LiTing
     * @Date: 12:27 PM 2019/4/21
     * @return:
     * @throws:
     */
    @RequestMapping(value = Url.LOGIN_VALID_URL,method = RequestMethod.POST)
    public @ResponseBody boolean loginValid(Employee employee) throws Exception {
        boolean flag=false;
        EmployeeCriteria criteria=new EmployeeCriteria();
        EmployeeCriteria.Criteria cri =criteria.createCriteria();
        if(StringUtils.isNotBlank(employee.getEmpName())&&StringUtils.isNotBlank(employee.getPassword())){
            cri.andEmpNameEqualTo(employee.getEmpName().trim());
            cri.andPasswordEqualTo(MD5Util.finishMD5(employee.getPassword()));
            cri.andStatusEqualTo(1);
             flag = employeeService.selectByCriteria(criteria).size() > 0 ? true : false;
        }
        if(StringUtils.isNotBlank(employee.getPhone())){
            cri.andPhoneEqualTo(employee.getPhone());
            cri.andStatusEqualTo(1);
            flag = employeeService.selectByCriteria(criteria).size() > 0 ? true : false;
        }
        return flag;
    }
    /**
     * @Description:登录
     * @Author: LiTing
     * @Date: 12:27 PM 2019/4/21
     * @return:
     * @throws:
     */
    @RequestMapping(value = Url.LOGIN_OMS_URL,method = RequestMethod.POST)
    public @ResponseBody boolean login(Employee employee,HttpServletRequest request) throws Exception {
        boolean flag=false;
        EmployeeCriteria employeeCriteria=new EmployeeCriteria();
        EmployeeCriteria.Criteria cri=employeeCriteria.createCriteria();
        if(StringUtils.isNotBlank(employee.getEmpName())&&StringUtils.isNotBlank(employee.getPassword())) {
            cri.andEmpNameEqualTo(employee.getEmpName());
            cri.andPasswordEqualTo(MD5Util.finishMD5(employee.getPassword()));
            cri.andStatusEqualTo(1);
        }
        if(StringUtils.isNotBlank(employee.getPhone())){
            cri.andPhoneEqualTo(employee.getPhone());
            cri.andStatusEqualTo(1);
        }
        List<Employee> employees = employeeService.selectByCriteria(employeeCriteria);
        if(employees.size()>=1){
            flag=true;
            HttpSession session=request.getSession();
            session.setAttribute("employees",employees.get(0));
        }
        return flag;
    }
    /**
     * @Description: 初始化界面
     * @Author: LiTing
     * @Date: 3:36 PM 2019/5/17
     * @return:
     * @throws:
     */
    @RequestMapping(value = Url.WELCOME_URL)
    public String welcome(final Map<String, Object> map){
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
        return  Views.WELCOME_VIEW;
    }
    /**
     * @Description:找回密码获取验证吗
     * @Author: LiTing
     * @Date: 9:40 PM 2019/5/21
     * @return:
     * @throws:
     */
    @RequestMapping(value = Url.GETPWD_VALID_NUM_URL,method = RequestMethod.POST)
    public @ResponseBody String rePwdGetValidNum(String phone, HttpServletRequest request){
        smsText= HttpClientUtil.getRandomCode();
        int result= HttpClientUtil.send(Uid,Key,phone,smsText);
        HttpSession session = request.getSession();
        session.setAttribute("getPwdText", smsText);
        session.setMaxInactiveInterval(60 * 1);
        return HttpClientUtil.getMessage(result);
    }
    /**
     * @Description:找回密码验证验证码
     * @Author: LiTing
     * @Date: 12:27 PM 2019/4/
     * @return:
     * @throws:
     */
    @RequestMapping(value = Url.REPWD_VALIDATE_NUM_URL,method = RequestMethod.POST)
    public @ResponseBody boolean rePwdValidNum(String validNum, HttpServletRequest request){
        boolean flag=false;
        if(StringUtils.isNotBlank(validNum)){
            //从session中比对发送的验证码
            HttpSession session = request.getSession();//设置session
            String sessioncode =(String) session.getAttribute("getPwdText");
            if(StringUtils.isNotBlank(sessioncode)){
                if(sessioncode.equals(validNum)){
                    flag=true;
                }
            }

        }
        return flag;
    }
    /**
     * @Description: 找回密码
     * @Author: LiTing
     * @Date: 9:59 PM 2019/5/21
     * @return:
     * @throws:
     */
    @RequestMapping(value = Url.REBACK_PWD_URL,method = RequestMethod.POST)
    public @ResponseBody boolean reBackPwd(Employee employee){
        EmployeeCriteria criteria=new EmployeeCriteria();
        EmployeeCriteria.Criteria cri=criteria.createCriteria();
        cri.andPhoneEqualTo(employee.getPhone());
        return  employeeService.updateByExampleSelective(employee, criteria);
    }

}
