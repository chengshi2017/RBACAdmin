package com.spring.common.utils;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.net.InetAddress;
import java.net.NetworkInterface;
import java.nio.BufferUnderflowException;
import java.nio.ByteBuffer;
import java.security.SecureRandom;
import java.util.Calendar;
import java.util.Enumeration;

/**
 * @Author Sunny
 * @Date 2018/2/22
 * @time 23:44
 * @Describe:
 */
public class UUID {

    protected static final Logger log = LoggerFactory.getLogger(UUID.class.getName());
    protected static final Object _lock = new Object();
    private static final byte[] ALPHABET = new byte[]{48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90};
    protected static final int millisPerDay = 86400000;
    private static int hostId = 1;
    private static byte hostCode1;
    private static byte hostCode2;
    private static byte hostCode3;
    private static final byte[] emptyIP;
    protected static final byte[] IP;
    private static short counter;
    private static long dateCount;
    private static byte[] dateBuffer;
    private static long timeInterval;
    private static String currDate;

    public UUID() {
    }

    public static int getHostId() {
        return hostId;
    }

    public static void setHostId(int id) {
        hostId = id;
        hostCode1 = ALPHABET[hostId >>> 4 & 15];
        hostCode2 = ALPHABET[hostId & 15];
    }

    public static long getTimeInterval() {
        return timeInterval;
    }

    public static void setTimeInterval(long t) {
        timeInterval = t;
    }

    private static synchronized void createDateBuffer(long tt) {
        Calendar cal = Calendar.getInstance();
        cal.setTimeInMillis(tt);
        int yyyy = cal.get(1);
        int y = yyyy - 2000;
        int y1 = (y & 240) >>> 4;
        int y2 = y & 15;
        int m = cal.get(2) + 1;
        int d = cal.get(5);
        dateBuffer = new byte[4];
        dateBuffer[0] = ALPHABET[y1];
        dateBuffer[1] = ALPHABET[y2];
        dateBuffer[2] = ALPHABET[m];
        dateBuffer[3] = ALPHABET[d];
        currDate = String.valueOf(yyyy * 10000 + m * 100 + d);
    }

    public static String getUUID() {
        byte[] uuid = new byte[16];
        long tt = System.currentTimeMillis() - timeInterval;
        long dd = tt / 86400000L;
        int ss = (int)(tt % 86400000L);
        if (dateCount != dd) {
            createDateBuffer(tt);
        }

        System.arraycopy(dateBuffer, 0, uuid, 0, 4);
        int d1 = ss >>> 25;
        int d2 = ss >>> 20 & 31;
        int d3 = ss >>> 15 & 31;
        int d4 = ss >>> 10 & 31;
        int d5 = ss >>> 5 & 31;
        int d6 = ss & 31;
        uuid[4] = ALPHABET[d1];
        uuid[5] = ALPHABET[d2];
        uuid[6] = ALPHABET[d3];
        uuid[7] = ALPHABET[d4];
        uuid[8] = ALPHABET[d5];
        uuid[9] = ALPHABET[d6];
        uuid[10] = hostCode1;
        uuid[11] = hostCode2;
        uuid[12] = hostCode3;
        Object var13 = _lock;
        short c;
        synchronized(_lock) {
            if (counter < 1 || counter >= 30000) {
                counter = 1;
            }

            c = counter++;
        }

        int c2 = c >> 10 & 31;
        int c3 = c >> 5 & 31;
        int c4 = c & 31;
        uuid[13] = ALPHABET[c2];
        uuid[14] = ALPHABET[c3];
        uuid[15] = ALPHABET[c4];
        return new String(uuid);
    }

    public static long currentTimeMillis() {
        return System.currentTimeMillis() - timeInterval;
    }

    public static String currentDate() {
        long tt = System.currentTimeMillis() - timeInterval;
        long dd = tt / 86400000L;
        if (dateCount != dd) {
            createDateBuffer(tt);
        }

        return currDate;
    }

    public static String currentTime() {
        Calendar cal = Calendar.getInstance();
        cal.setTimeInMillis(System.currentTimeMillis() - timeInterval);
        long val = (long)(cal.get(11) * 10000 + cal.get(12) * 100 + cal.get(13));
        if (val < 10000L) {
            return "00" + String.valueOf(val);
        } else {
            return val < 100000L ? "0" + String.valueOf(val) : String.valueOf(val);
        }
    }

    public static String currentDateTime() {
        Calendar cal = Calendar.getInstance();
        cal.setTimeInMillis(System.currentTimeMillis() - timeInterval);
        long val = (long)(cal.get(1) * 10000 + (cal.get(2) + 1) * 100 + cal.get(5));
        long val1 = (long)(cal.get(11) * 10000 + cal.get(12) * 100 + cal.get(13));
        if (val1 < 10000L) {
            return val + "00" + val1;
        } else {
            return val1 < 100000L ? val + "0" + val1 : val + String.valueOf(val1);
        }
    }

    public static String longDateTime() {
        Calendar cal = Calendar.getInstance();
        cal.setTimeInMillis(System.currentTimeMillis() - timeInterval);
        StringBuilder result = new StringBuilder(32);
        int v = cal.get(1);
        result.append(v);
        result.append("-");
        v = cal.get(2) + 1;
        if (v < 10) {
            result.append("0");
        }

        result.append(v);
        result.append("-");
        v = cal.get(5);
        if (v < 10) {
            result.append("0");
        }

        result.append(v);
        result.append(" ");
        v = cal.get(11);
        if (v < 10) {
            result.append("0");
        }

        result.append(v);
        result.append(":");
        v = cal.get(12);
        if (v < 10) {
            result.append("0");
        }

        result.append(v);
        result.append(":");
        v = cal.get(13);
        if (v < 10) {
            result.append("0");
        }

        result.append(v);
        return result.toString();
    }

    private static int createMachineIdentifier() {
        int machinePiece;
        try {
            StringBuilder sb = new StringBuilder();
            Enumeration e = NetworkInterface.getNetworkInterfaces();

            while(e.hasMoreElements()) {
                NetworkInterface ni = (NetworkInterface)e.nextElement();
                sb.append(ni.toString());
                byte[] mac = ni.getHardwareAddress();
                if (mac != null) {
                    ByteBuffer bb = ByteBuffer.wrap(mac);

                    try {
                        sb.append(bb.getChar());
                        sb.append(bb.getChar());
                        sb.append(bb.getChar());
                    } catch (BufferUnderflowException var7) {
                        ;
                    }
                }
            }

            machinePiece = sb.toString().hashCode();
        } catch (Throwable var8) {
            machinePiece = (new SecureRandom()).nextInt();
            log.warn("Failed to get machine identifier from network interface, using random number instead");
        }

        machinePiece &= 16777215;
        return machinePiece;
    }

    static {
        hostCode1 = ALPHABET[0];
        hostCode2 = ALPHABET[1];
        hostCode3 = ALPHABET[2];
        emptyIP = new byte[]{0, 0, 0, 0};

        byte[] addr;
        try {
            addr = InetAddress.getLocalHost().getAddress();
        } catch (Exception var2) {
            addr = emptyIP;
        }

        IP = addr;
        hostId = createMachineIdentifier();
        hostCode1 = ALPHABET[hostId >>> 10 & 31];
        hostCode2 = ALPHABET[hostId >>> 5 & 31];
        hostCode3 = ALPHABET[hostId & 31];
        counter = 1;
        dateCount = 0L;
        dateBuffer = null;
        timeInterval = 0L;
        currDate = null;
    }

}
