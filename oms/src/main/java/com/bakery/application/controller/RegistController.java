package com.bakery.application.controller;
import com.bakery.application.constant.Url;
import com.bakery.application.constant.Views;
import com.bakery.application.entity.Employee;
import com.bakery.application.entity.EmployeeCriteria;
import com.bakery.application.service.EmployeeService;
import com.bakery.application.util.HttpClientUtil;
import com.bakery.application.util.MD5Util;
import com.bakery.application.util.UUIDUtil;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * @author liting
 * @date 2019/05/17  19:11
 */
@Controller
public class RegistController {
    @Autowired
    EmployeeService employeeService;
    //用户名
    private static String Uid = "XHuangYa";
    //接口安全秘钥
    //private static String Key = "d41d8cd98f00b204e980";
    private static String Key = "d41d8cd9843243214";
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
    @RequestMapping(value = Url.GET_REGIS_VALID_NUM_URL,method = RequestMethod.POST)
    public @ResponseBody String getValidNum(String phone, HttpServletRequest request){
        smsText= HttpClientUtil.getRandomCode();
        int result= HttpClientUtil.send(Uid,Key,phone,smsText);
        HttpSession session = request.getSession();
        session.setAttribute("resText", smsText);
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
    @RequestMapping(value = Url.VALIDATE_REGISNUM_URL,method = RequestMethod.POST)
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
     * @Description:注册用户名密码验证
     * @Author: LiTing
     * @Date: 12:27 PM 2019/4/21
     * @return:
     * @throws:
     */
    @RequestMapping(value = Url.REGIST_VALID_URL,method = RequestMethod.POST)
    public @ResponseBody
    boolean regisValid(Employee employee){
        boolean flag=true;
        EmployeeCriteria criteria=new EmployeeCriteria();
        EmployeeCriteria.Criteria cri =criteria.createCriteria();
        if(StringUtils.isNotBlank(employee.getEmpName())&&StringUtils.isNotBlank(employee.getPassword())){
            cri.andEmpNameEqualTo(employee.getEmpName().trim());
            cri.andPasswordEqualTo(employee.getPassword().trim());
            cri.andStatusEqualTo(1);
            flag = employeeService.selectByCriteria(criteria).size() > 0 ? false : true;
        }
        if(StringUtils.isNotBlank(employee.getPhone())){
            cri.andPhoneEqualTo(employee.getPhone());
            cri.andStatusEqualTo(1);
            flag = employeeService.selectByCriteria(criteria).size() > 0 ? false : true;
        }
        return flag;
    }
    /**
     * @Description:注册
     * @Author: LiTing
     * @Date: 12:27 PM 2019/4/21
     * @return:
     * @throws:
     */
    @RequestMapping(value = Url.REGIST_OMS_URL ,method = RequestMethod.POST)
    public @ResponseBody boolean login(Employee employee) throws Exception {
        boolean flag=true;
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
            flag=false;
        }else{
            employee.setEmpNo(UUIDUtil.create32Key());
            employee.setStatus(1);
            employee.setRoleId("0");
            employee.setPassword(MD5Util.finishMD5(employee.getPassword()));
            flag = employeeService.insertSelective(employee);
        }
        return flag;
    }



}
