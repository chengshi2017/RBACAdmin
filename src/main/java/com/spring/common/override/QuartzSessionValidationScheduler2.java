package com.spring.common.override;

import org.apache.shiro.session.mgt.DefaultSessionManager;
import org.apache.shiro.session.mgt.SessionValidationScheduler;
import org.apache.shiro.session.mgt.ValidatingSessionManager;
import org.quartz.*;
import org.quartz.impl.StdSchedulerFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * @Author: Jeremy
 * @Date: 2018/6/13
 * @Time: 16:46
 * @Version: 1.0
 * @Describe:
 */
public class QuartzSessionValidationScheduler2 implements SessionValidationScheduler {

    public static final long DEFAULT_SESSION_VALIDATION_INTERVAL = DefaultSessionManager.DEFAULT_SESSION_VALIDATION_INTERVAL;
    private static final String JOB_NAME = "SessionValidationJob";
    private static final Logger log = LoggerFactory.getLogger(QuartzSessionValidationScheduler2.class);
    private static final String SESSION_MANAGER_KEY = QuartzSessionValidationJob2.SESSION_MANAGER_KEY;
    private Scheduler scheduler;
    private boolean schedulerImplicitlyCreated = false;

    private boolean enabled = false;
    private ValidatingSessionManager sessionManager;
    private long sessionValidationInterval = DEFAULT_SESSION_VALIDATION_INTERVAL;

    public QuartzSessionValidationScheduler2() {
    }

    public QuartzSessionValidationScheduler2(ValidatingSessionManager sessionManager) {
        this.sessionManager = sessionManager;
    }

    protected Scheduler getScheduler() throws SchedulerException {
        if (this.scheduler == null) {
            this.scheduler = StdSchedulerFactory.getDefaultScheduler();
            this.schedulerImplicitlyCreated = true;
        }
        return this.scheduler;
    }

    public void setScheduler(Scheduler scheduler) {
        this.scheduler = scheduler;
    }

    public void setSessionManager(ValidatingSessionManager sessionManager) {
        this.sessionManager = sessionManager;
    }

    public boolean isEnabled() {
        return this.enabled;
    }

    public void setSessionValidationInterval(long sessionValidationInterval) {
        this.sessionValidationInterval = sessionValidationInterval;
    }

    public void enableSessionValidation() {
        if (log.isDebugEnabled()) {
            log.debug("Scheduling session validation job using Quartz with session validation interval of ["
                    + this.sessionValidationInterval + "]ms...");
        }

        try {
            SimpleTrigger trigger = TriggerBuilder.newTrigger().startNow().withIdentity(JOB_NAME, Scheduler.DEFAULT_GROUP)
                    .withSchedule(SimpleScheduleBuilder.simpleSchedule().withIntervalInMilliseconds(sessionValidationInterval))
                    .build();//<span style="color:#ff0000;">Quartz 2中的实现</span>

            JobDetail detail = JobBuilder.newJob(QuartzSessionValidationJob2.class)
                    .withIdentity(JOB_NAME, Scheduler.DEFAULT_GROUP).build();
            detail.getJobDataMap().put(SESSION_MANAGER_KEY, this.sessionManager);
            Scheduler scheduler = getScheduler();

            scheduler.scheduleJob(detail, trigger);
            if (this.schedulerImplicitlyCreated) {
                scheduler.start();
                if (log.isDebugEnabled()) {
                    log.debug("Successfully started implicitly created Quartz Scheduler instance.");
                }
            }
            this.enabled = true;

            if (log.isDebugEnabled())
                log.debug("Session validation job successfully scheduled with Quartz.");
        } catch (SchedulerException e) {
            if (log.isErrorEnabled())
                log.error("Error starting the Quartz session validation job.  Session validation may not occur.", e);
        }
    }

    @Override
    public void disableSessionValidation() {

    }

}
