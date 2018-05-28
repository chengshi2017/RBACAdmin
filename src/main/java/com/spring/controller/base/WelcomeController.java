package com.spring.controller.base;

import com.spring.common.utils.Constants;
import com.spring.common.utils.DateUtils;
import com.spring.model.Log;
import com.spring.model.LoginInfo;
import com.spring.service.dept.DeptService;
import com.spring.service.emp.EmpService;
import com.spring.service.job.JobService;
import com.spring.service.log.LogService;
import com.spring.service.permission.UserService;
import org.apache.tomcat.jni.OS;
import org.apache.tomcat.util.bcel.Const;
import org.hyperic.sigar.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import sun.rmi.log.LogInputStream;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.net.InetAddress;
import java.net.UnknownHostException;
import java.util.*;

/**
 * @Author: Jeremy
 * @Date: 2018/5/26
 * @Time: 20:17
 * @Version: 1.0
 * @Describe:
 */
@Controller
@RequestMapping(value = "/base")
public class WelcomeController extends SuperController {

    @Autowired
    private DeptService deptService;

    @Autowired
    private JobService jobService;

    @Autowired
    private EmpService empService;

    @Autowired
    private LogService logService;

    @Autowired
    private UserService userService;

    @GetMapping(value = "/welcome")
    public String welcome(Model model) throws SigarException, UnknownHostException {
        LoginInfo loginInfo=new LoginInfo();
        deptConvert(loginInfo);
        jobConvert(loginInfo);
        empConvert(loginInfo);
        logConvert(loginInfo);
        userConvert(loginInfo);
        messageConvert(loginInfo);
        cpuConvert(loginInfo);
        memoryConvert(loginInfo);
        serverConvert(loginInfo);
        otherConvert(loginInfo);
        systemConvert(loginInfo);
        sessionConvert(loginInfo);
        model.addAttribute("info",loginInfo);
        return "welcome";

    }

    /**
     * 统计部门数目
     * @param loginInfo
     * @return
     */
    private LoginInfo deptConvert(LoginInfo loginInfo){
        loginInfo.setDeptCount(deptService.getCountByFilter(Constants.DateTimeFilter.count));
        loginInfo.setDeptCountToday(deptService.getCountByFilter(Constants.DateTimeFilter.today));
        loginInfo.setDeptCountWeek(deptService.getCountByFilter(Constants.DateTimeFilter.week));
        loginInfo.setDeptCountMonth(deptService.getCountByFilter(Constants.DateTimeFilter.month));
        loginInfo.setDeptCountSixMonth(deptService.getCountByFilter(Constants.DateTimeFilter.sixMonth));
        loginInfo.setDeptCountYear(deptService.getCountByFilter(Constants.DateTimeFilter.year));
        return loginInfo;
    }

    /**
     * 统计职位总数
     * @param loginInfo
     * @return
     */
    private LoginInfo jobConvert(LoginInfo loginInfo){
        loginInfo.setJobCount(jobService.getCountByFilter(Constants.DateTimeFilter.count));
        loginInfo.setJobCountToday(jobService.getCountByFilter(Constants.DateTimeFilter.today));
        loginInfo.setJobCountWeek(jobService.getCountByFilter(Constants.DateTimeFilter.week));
        loginInfo.setJobCountMonth(jobService.getCountByFilter(Constants.DateTimeFilter.month));
        loginInfo.setJobCountSixMonth(jobService.getCountByFilter(Constants.DateTimeFilter.sixMonth));
        loginInfo.setJobCountYear(jobService.getCountByFilter(Constants.DateTimeFilter.year));
        return loginInfo;
    }

    /**
     * 统计员工总数
     * @param loginInfo
     * @return
     */
    private LoginInfo empConvert(LoginInfo loginInfo){
        loginInfo.setEmpCount(empService.getCountByFilter(Constants.DateTimeFilter.count));
        loginInfo.setEmpCountToday(empService.getCountByFilter(Constants.DateTimeFilter.today));
        loginInfo.setEmpCountWeek(empService.getCountByFilter(Constants.DateTimeFilter.week));
        loginInfo.setEmpCountMonth(empService.getCountByFilter(Constants.DateTimeFilter.month));
        loginInfo.setEmpCountSixMonth(empService.getCountByFilter(Constants.DateTimeFilter.sixMonth));
        loginInfo.setEmpCountYear(empService.getCountByFilter(Constants.DateTimeFilter.year));
        return loginInfo;
    }

    /**
     * 统计登录次数
     * @param loginInfo
     * @return
     */
    private LoginInfo logConvert(LoginInfo loginInfo){
        loginInfo.setLoginCount(logService.getCountByFilter(Constants.DateTimeFilter.count));
        loginInfo.setLoginCountToday(logService.getCountByFilter(Constants.DateTimeFilter.today));
        loginInfo.setLoginCountWeek(logService.getCountByFilter(Constants.DateTimeFilter.week));
        loginInfo.setLoginCountMonth(logService.getCountByFilter(Constants.DateTimeFilter.month));
        loginInfo.setLoginCountSixMonth(logService.getCountByFilter(Constants.DateTimeFilter.sixMonth));
        loginInfo.setLoginCountYear(logService.getCountByFilter(Constants.DateTimeFilter.year));
        return loginInfo;
    }

    /**
     * 统计用户人数
     * @param loginInfo
     * @return
     */
    private LoginInfo userConvert(LoginInfo loginInfo){
        loginInfo.setAdminCount(userService.getCountByFilter(Constants.DateTimeFilter.count));
        loginInfo.setAdminCountToday(userService.getCountByFilter(Constants.DateTimeFilter.today));
        loginInfo.setAdminCountWeek(userService.getCountByFilter(Constants.DateTimeFilter.week));
        loginInfo.setAdminCountMonth(userService.getCountByFilter(Constants.DateTimeFilter.month));
        loginInfo.setAdminCountSixMonth(userService.getCountByFilter(Constants.DateTimeFilter.sixMonth));
        loginInfo.setAdminCountYear(userService.getCountByFilter(Constants.DateTimeFilter.year));
        return loginInfo;

    }

    /**
     * 查询上一条登录信息
     * @param loginInfo
     * @return
     */
    private LoginInfo messageConvert(LoginInfo loginInfo){
        loginInfo.setCount(logService.getCountByFilter(Constants.DateTimeFilter.count));
        Log log=logService.getMessageByRecent();
        loginInfo.setLastIp(log.getIp());
        loginInfo.setLastTime(log.getOperateTime());
        return loginInfo;
    }

    private LoginInfo cpuConvert(LoginInfo loginInfo) throws SigarException {
        Sigar sigar = new Sigar();
        CpuInfo infos[] = sigar.getCpuInfoList();
        CpuPerc cpuList[] = null;
        CpuPerc cpu = sigar.getCpuPerc();;
        cpuList = sigar.getCpuPercList();
        //cpu总数
        loginInfo.setCpuCount(sigar.getCpuInfoList().length);
        //用户使用率
        loginInfo.setCpuUser(CpuPerc.format(cpu.getUser()));
        //系统使用率
        loginInfo.setCpuSys(CpuPerc.format(cpu.getSys()));
        //当前错误率
        loginInfo.setCpuNice(CpuPerc.format(cpu.getNice()));
        //当前等待率
        loginInfo.setCpuWait(CpuPerc.format(cpu.getWait()));
        //当前空闲率
        loginInfo.setCpuIdle(CpuPerc.format(cpu.getIdle()));
        //总的使用率
        loginInfo.setCpuCombined(CpuPerc.format(cpu.getCombined()));
        return loginInfo;
    }

    private LoginInfo memoryConvert(LoginInfo loginInfo) throws SigarException {
        Sigar sigar = new Sigar();
        Mem mem = sigar.getMem();
        loginInfo.setMemoryTotal(mem.getTotal() / 1024L + "K av");
        loginInfo.setMemoryUsed(mem.getUsed() / 1024L + "K used");
        loginInfo.setMemoryFree(mem.getFree() / 1024L + "K free");
        return loginInfo;
    }

    private LoginInfo serverConvert(LoginInfo loginInfo) throws UnknownHostException {
        Runtime r = Runtime.getRuntime();
        Properties props = System.getProperties();
        InetAddress addr;
        addr = InetAddress.getLocalHost();
        String ip = addr.getHostAddress();
        OperatingSystem OS = OperatingSystem.getInstance();
        Map<String, String> map = System.getenv();
        String userName = map.get("USERNAME");// 获取用户名
        String computerName = map.get("COMPUTERNAME");// 获取计算机名
        String userDomain = map.get("USERDOMAIN");// 获取计算机域名
        loginInfo.setName(computerName);
        loginInfo.setIp(ip);
        loginInfo.setDomainName(userDomain);
        loginInfo.setPort("9000");
        loginInfo.setSystem(OS.getVendorName());
        loginInfo.setIISVersion(props.getProperty("os.version"));
        loginInfo.setFolder(props.getProperty("user.dir"));
        return loginInfo;
    }

    private LoginInfo otherConvert(LoginInfo loginInfo){
        Sigar sigar = new Sigar();
        loginInfo.setMac(getMAC());
        return loginInfo;
    }


    public String getMAC() {
        Sigar sigar = null;
        try {
            sigar = new Sigar();
            String[] ifaces = sigar.getNetInterfaceList();
            String hwaddr = null;
            for (int i = 0; i < ifaces.length; i++) {
                NetInterfaceConfig cfg = sigar.getNetInterfaceConfig(ifaces[i]);
                if (NetFlags.LOOPBACK_ADDRESS.equals(cfg.getAddress())
                        || (cfg.getFlags() & NetFlags.IFF_LOOPBACK) != 0
                        || NetFlags.NULL_HWADDR.equals(cfg.getHwaddr())) {
                    continue;
                }
                /*
                 * 如果存在多张网卡包括虚拟机的网卡，默认只取第一张网卡的MAC地址，如果要返回所有的网卡（包括物理的和虚拟的）则可以修改方法的返回类型为数组或Collection
                 * ，通过在for循环里取到的多个MAC地址。
                 */
                hwaddr = cfg.getHwaddr();
                break;
            }
            return hwaddr != null?  hwaddr : null;
        } catch (Exception e) {
            return null;
        } finally {
            if (sigar != null)
                sigar.close();
        }
    }

    private LoginInfo systemConvert(LoginInfo loginInfo) throws UnknownHostException {
        Runtime r = Runtime.getRuntime();
        Properties props = System.getProperties();
        InetAddress addr;
        addr = InetAddress.getLocalHost();
        String ip = addr.getHostAddress();
        Map<String, String> map = System.getenv();
        String userName = map.get("USERNAME");// 获取用户名
        String computerName = map.get("COMPUTERNAME");// 获取计算机名
        String userDomain = map.get("USERDOMAIN");// 获取计算机域名
        loginInfo.setUserName(userName);
        loginInfo.setComputerName(computerName);
        loginInfo.setUserDomain(userDomain);
        loginInfo.setCurrentTime(new Date());
        loginInfo.setHostName(addr.getHostName());
        loginInfo.setUserHome(props.getProperty("user.home"));
        loginInfo.setSystem(props.getProperty("os.name"));
        loginInfo.setJavaVersion(props.getProperty("java.version"));
        loginInfo.setJavaVendor(props.getProperty("java.vendor"));
        loginInfo.setJavaVendorUrl(props.getProperty("java.vendor.url"));
        loginInfo.setJavaHome(props.getProperty("java.home"));
        loginInfo.setJavaSpecificationVersion(props.getProperty("java.vm.specification.version"));
        loginInfo.setJavaTotalMemory(r.totalMemory());
        loginInfo.setJavaAvailableProcessors(r.availableProcessors());
        loginInfo.setJavaFreeMemory(r.freeMemory());
        return loginInfo;
    }

    private LoginInfo sessionConvert(LoginInfo loginInfo){
        //用Map来存储session，sessionid作为key session作为value
        Map sessionMap = new HashMap<String,HttpSession>();
            String id=request.getSession().getId();
        HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
        loginInfo.setSessionId(id);
        sessionMap.put(id,session);
        loginInfo.setSessionNum(sessionMap.size());
        return loginInfo;
    }

}
