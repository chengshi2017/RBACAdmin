package com.spring.model;

import java.util.Date;

/**
 * @Author: Jeremy
 * @Date: 2018/5/26
 * @Time: 17:50
 * @Version: 1.0
 * @Describe:
 */
public class LoginInfo {

    //当前系统登录次数
    private Integer count;

    //上次登录Ip
    private String lastIp;

    //上次登录时间
    private Date lastTime;

    //总数
    private Integer deptCount;

    private Integer jobCount;

    private Integer empCount;

    private Integer loginCount;

    private Integer adminCount;

    //今日
    private Integer deptCountToday;

    private Integer jobCountToday;

    private Integer empCountToday;

    private Integer loginCountToday;

    private Integer adminCountToday;

    //本周
    private Integer deptCountWeek;

    private Integer jobCountWeek;

    private Integer empCountWeek;

    private Integer loginCountWeek;

    private Integer adminCountWeek;

    //本月
    private Integer deptCountMonth;

    private Integer jobCountMonth;

    private Integer empCountMonth;

    private Integer loginCountMonth;

    private Integer adminCountMonth;

    //半年
    private Integer deptCountSixMonth;

    private Integer jobCountSixMonth;

    private Integer empCountSixMonth;

    private Integer loginCountSixMonth;

    private Integer adminCountSixMonth;

    //本年
    private Integer deptCountYear;

    private Integer jobCountYear;

    private Integer empCountYear;

    private Integer loginCountYear;

    private Integer adminCountYear;

    /**
     * cpu
     */
    //cpu总数(单位：个)
    private Integer cpuCount;

    /**
     * CPU 使用情况
     */
    //用户使用率
    private String cpuUser;

    //系统使用率
    private String cpuSys;

    //当前等待率
    private String cpuWait;

    //当前错误率
    private String cpuNice;

    //当前空闲率
    private String cpuIdle;

    //总的使用率
    private String cpuCombined;

    /**
     * 内存
     */
    private String memoryTotal;

    private String memoryUsed;

    private String memoryFree;

    /**
     * 服务器信息
     */
    //服务器名称
    private String name;

    //服务器ip
    private String ip;

    //服务器mac地址
    private String mac;

    //服务器域名
    private String domainName;

    //服务器端口
    private String port;

    //服务器IIS版本
    private String IISVersion;

    //服务器操作系统
    private String system;

    //系统所在的文件夹
    private String folder;

    /**
     * 系统信息
     * @return
     */
    //用户名
    private String userName;

    //计算机名称
    private String computerName;

    //计算机域名
    private String userDomain;

    //当前系统时间
    private Date currentTime;

    //本地主机名
    private String hostName;

    //用户主目录
    private String userHome;

    //操作系统名称
    private String systemName;

    /**
     * jdk信息
     */
    //Java的运行环境版本
    private String javaVersion;

    //Java的运行环境供应商
    private String javaVendor;

    //Java供应商的URL
    private String javaVendorUrl;

    //Java的安装路径
    private String javaHome;

    //Java的虚拟机规范版本
    private String javaSpecificationVersion;

    //JVM可以使用的剩余内存
    private long javaFreeMemory;

    //JVM可以使用的处理器个数
    private long javaAvailableProcessors;

    //JVM可以使用的总内存
    private long javaTotalMemory;

    /**
     * session信息
     * @return
     */
    private Integer sessionNum;

    private String sessionId;


    public Integer getCount() {
        return count;
    }

    public void setCount(Integer count) {
        this.count = count;
    }

    public String getLastIp() {
        return lastIp;
    }

    public void setLastIp(String lastIp) {
        this.lastIp = lastIp;
    }

    public Date getLastTime() {
        return lastTime;
    }

    public void setLastTime(Date lastTime) {
        this.lastTime = lastTime;
    }

    public Integer getDeptCount() {
        return deptCount;
    }

    public void setDeptCount(Integer deptCount) {
        this.deptCount = deptCount;
    }

    public Integer getJobCount() {
        return jobCount;
    }

    public void setJobCount(Integer jobCount) {
        this.jobCount = jobCount;
    }

    public Integer getEmpCount() {
        return empCount;
    }

    public void setEmpCount(Integer empCount) {
        this.empCount = empCount;
    }

    public Integer getLoginCount() {
        return loginCount;
    }

    public void setLoginCount(Integer loginCount) {
        this.loginCount = loginCount;
    }

    public Integer getAdminCount() {
        return adminCount;
    }

    public void setAdminCount(Integer adminCount) {
        this.adminCount = adminCount;
    }

    public Integer getDeptCountToday() {
        return deptCountToday;
    }

    public void setDeptCountToday(Integer deptCountToday) {
        this.deptCountToday = deptCountToday;
    }

    public Integer getJobCountToday() {
        return jobCountToday;
    }

    public void setJobCountToday(Integer jobCountToday) {
        this.jobCountToday = jobCountToday;
    }

    public Integer getEmpCountToday() {
        return empCountToday;
    }

    public Integer getDeptCountSixMonth() {
        return deptCountSixMonth;
    }

    public void setDeptCountSixMonth(Integer deptCountSixMonth) {
        this.deptCountSixMonth = deptCountSixMonth;
    }

    public Integer getJobCountSixMonth() {
        return jobCountSixMonth;
    }

    public void setJobCountSixMonth(Integer jobCountSixMonth) {
        this.jobCountSixMonth = jobCountSixMonth;
    }

    public Integer getEmpCountSixMonth() {
        return empCountSixMonth;
    }

    public void setEmpCountSixMonth(Integer empCountSixMonth) {
        this.empCountSixMonth = empCountSixMonth;
    }

    public Integer getLoginCountSixMonth() {
        return loginCountSixMonth;
    }

    public void setLoginCountSixMonth(Integer loginCountSixMonth) {
        this.loginCountSixMonth = loginCountSixMonth;
    }

    public Integer getAdminCountSixMonth() {
        return adminCountSixMonth;
    }

    public void setAdminCountSixMonth(Integer adminCountSixMonth) {
        this.adminCountSixMonth = adminCountSixMonth;
    }

    public void setEmpCountToday(Integer empCountToday) {
        this.empCountToday = empCountToday;
    }

    public Integer getLoginCountToday() {
        return loginCountToday;
    }

    public void setLoginCountToday(Integer loginCountToday) {
        this.loginCountToday = loginCountToday;
    }

    public Integer getAdminCountToday() {
        return adminCountToday;
    }

    public void setAdminCountToday(Integer adminCountToday) {
        this.adminCountToday = adminCountToday;
    }

    public Integer getDeptCountWeek() {
        return deptCountWeek;
    }

    public void setDeptCountWeek(Integer deptCountWeek) {
        this.deptCountWeek = deptCountWeek;
    }

    public Integer getJobCountWeek() {
        return jobCountWeek;
    }

    public void setJobCountWeek(Integer jobCountWeek) {
        this.jobCountWeek = jobCountWeek;
    }

    public Integer getEmpCountWeek() {
        return empCountWeek;
    }

    public void setEmpCountWeek(Integer empCountWeek) {
        this.empCountWeek = empCountWeek;
    }

    public Integer getLoginCountWeek() {
        return loginCountWeek;
    }

    public void setLoginCountWeek(Integer loginCountWeek) {
        this.loginCountWeek = loginCountWeek;
    }

    public Integer getAdminCountWeek() {
        return adminCountWeek;
    }

    public void setAdminCountWeek(Integer adminCountWeek) {
        this.adminCountWeek = adminCountWeek;
    }

    public Integer getDeptCountMonth() {
        return deptCountMonth;
    }

    public void setDeptCountMonth(Integer deptCountMonth) {
        this.deptCountMonth = deptCountMonth;
    }

    public Integer getJobCountMonth() {
        return jobCountMonth;
    }

    public void setJobCountMonth(Integer jobCountMonth) {
        this.jobCountMonth = jobCountMonth;
    }

    public Integer getEmpCountMonth() {
        return empCountMonth;
    }

    public void setEmpCountMonth(Integer empCountMonth) {
        this.empCountMonth = empCountMonth;
    }

    public Integer getLoginCountMonth() {
        return loginCountMonth;
    }

    public void setLoginCountMonth(Integer loginCountMonth) {
        this.loginCountMonth = loginCountMonth;
    }

    public Integer getAdminCountMonth() {
        return adminCountMonth;
    }

    public void setAdminCountMonth(Integer adminCountMonth) {
        this.adminCountMonth = adminCountMonth;
    }

    public Integer getDeptCountYear() {
        return deptCountYear;
    }

    public void setDeptCountYear(Integer deptCountYear) {
        this.deptCountYear = deptCountYear;
    }

    public Integer getJobCountYear() {
        return jobCountYear;
    }

    public void setJobCountYear(Integer jobCountYear) {
        this.jobCountYear = jobCountYear;
    }

    public Integer getEmpCountYear() {
        return empCountYear;
    }

    public void setEmpCountYear(Integer empCountYear) {
        this.empCountYear = empCountYear;
    }

    public Integer getLoginCountYear() {
        return loginCountYear;
    }

    public void setLoginCountYear(Integer loginCountYear) {
        this.loginCountYear = loginCountYear;
    }

    public Integer getAdminCountYear() {
        return adminCountYear;
    }

    public void setAdminCountYear(Integer adminCountYear) {
        this.adminCountYear = adminCountYear;
    }

    public Integer getCpuCount() {
        return cpuCount;
    }

    public void setCpuCount(Integer cpuCount) {
        this.cpuCount = cpuCount;
    }

    public String getCpuUser() {
        return cpuUser;
    }

    public void setCpuUser(String cpuUser) {
        this.cpuUser = cpuUser;
    }

    public String getCpuSys() {
        return cpuSys;
    }

    public void setCpuSys(String cpuSys) {
        this.cpuSys = cpuSys;
    }

    public String getCpuWait() {
        return cpuWait;
    }

    public void setCpuWait(String cpuWait) {
        this.cpuWait = cpuWait;
    }

    public String getCpuIdle() {
        return cpuIdle;
    }

    public void setCpuIdle(String cpuIdle) {
        this.cpuIdle = cpuIdle;
    }

    public String getCpuCombined() {
        return cpuCombined;
    }

    public void setCpuCombined(String cpuCombined) {
        this.cpuCombined = cpuCombined;
    }

    public String getMemoryTotal() {
        return memoryTotal;
    }

    public void setMemoryTotal(String memoryTotal) {
        this.memoryTotal = memoryTotal;
    }

    public String getMemoryUsed() {
        return memoryUsed;
    }

    public void setMemoryUsed(String memoryUsed) {
        this.memoryUsed = memoryUsed;
    }

    public String getMemoryFree() {
        return memoryFree;
    }

    public void setMemoryFree(String memoryFree) {
        this.memoryFree = memoryFree;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getIp() {
        return ip;
    }

    public void setIp(String ip) {
        this.ip = ip;
    }

    public String getDomainName() {
        return domainName;
    }

    public void setDomainName(String domainName) {
        this.domainName = domainName;
    }

    public String getPort() {
        return port;
    }

    public void setPort(String port) {
        this.port = port;
    }

    public String getIISVersion() {
        return IISVersion;
    }

    public void setIISVersion(String IISVersion) {
        this.IISVersion = IISVersion;
    }

    public String getSystem() {
        return system;
    }

    public void setSystem(String system) {
        this.system = system;
    }

    public String getFolder() {
        return folder;
    }

    public void setFolder(String folder) {
        this.folder = folder;
    }

    public String getMac() {
        return mac;
    }

    public void setMac(String mac) {
        this.mac = mac;
    }

    public String getCpuNice() {
        return cpuNice;
    }

    public void setCpuNice(String cpuNice) {
        this.cpuNice = cpuNice;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getComputerName() {
        return computerName;
    }

    public void setComputerName(String computerName) {
        this.computerName = computerName;
    }

    public String getUserDomain() {
        return userDomain;
    }

    public void setUserDomain(String userDomain) {
        this.userDomain = userDomain;
    }

    public String getHostName() {
        return hostName;
    }

    public void setHostName(String hostName) {
        this.hostName = hostName;
    }

    public String getUserHome() {
        return userHome;
    }

    public void setUserHome(String userHome) {
        this.userHome = userHome;
    }

    public String getSystemName() {
        return systemName;
    }

    public void setSystemName(String systemName) {
        this.systemName = systemName;
    }

    public String getJavaVersion() {
        return javaVersion;
    }

    public void setJavaVersion(String javaVersion) {
        this.javaVersion = javaVersion;
    }

    public String getJavaVendor() {
        return javaVendor;
    }

    public void setJavaVendor(String javaVendor) {
        this.javaVendor = javaVendor;
    }

    public String getJavaVendorUrl() {
        return javaVendorUrl;
    }

    public void setJavaVendorUrl(String javaVendorUrl) {
        this.javaVendorUrl = javaVendorUrl;
    }

    public String getJavaHome() {
        return javaHome;
    }

    public void setJavaHome(String javaHome) {
        this.javaHome = javaHome;
    }

    public String getJavaSpecificationVersion() {
        return javaSpecificationVersion;
    }

    public void setJavaSpecificationVersion(String javaSpecificationVersion) {
        this.javaSpecificationVersion = javaSpecificationVersion;
    }

    public long getJavaFreeMemory() {
        return javaFreeMemory;
    }

    public void setJavaFreeMemory(long javaFreeMemory) {
        this.javaFreeMemory = javaFreeMemory;
    }

    public long getJavaAvailableProcessors() {
        return javaAvailableProcessors;
    }

    public void setJavaAvailableProcessors(long javaAvailableProcessors) {
        this.javaAvailableProcessors = javaAvailableProcessors;
    }

    public long getJavaTotalMemory() {
        return javaTotalMemory;
    }

    public void setJavaTotalMemory(long javaTotalMemory) {
        this.javaTotalMemory = javaTotalMemory;
    }

    public Integer getSessionNum() {
        return sessionNum;
    }

    public void setSessionNum(Integer sessionNum) {
        this.sessionNum = sessionNum;
    }

    public String getSessionId() {
        return sessionId;
    }

    public void setSessionId(String sessionId) {
        this.sessionId = sessionId;
    }

    public Date getCurrentTime() {
        return currentTime;
    }

    public void setCurrentTime(Date currentTime) {
        this.currentTime = currentTime;
    }
}
