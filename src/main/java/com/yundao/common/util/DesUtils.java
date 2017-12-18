package com.yundao.common.util;

import ch.qos.logback.core.net.SyslogOutputStream;
import com.yundao.core.utils.ConfigUtils;

import javax.crypto.BadPaddingException;
import javax.crypto.Cipher;
import javax.crypto.IllegalBlockSizeException;
import java.security.Key;

/**
 * Created by gjl on 2017/6/29.
 */
public class DesUtils {

    private Cipher mCipher = null;
    private static final String DEFAULT_KEY = ConfigUtils.getValue("DATASOURCE_SALT");
    private static DesUtils mDesUtils;

    private DesUtils() throws Exception {

        Key key = getKey(DEFAULT_KEY.getBytes());

        mCipher = Cipher.getInstance("DES");
        mCipher.init(Cipher.ENCRYPT_MODE, key);

    }

    private static DesUtils getInstance() {
        if (mDesUtils == null) {
            try {
                mDesUtils = new DesUtils();
            } catch (Exception e) {
                e.printStackTrace();
                return null;
            }
        }
        return mDesUtils;
    }

    /**
     * 加密字符串
     *
     * @version 2013 2013-2-2 下午3:08:46
     * @since 2013 2013-2-2 下午3:08:46
     * @param strIn
     * @return
     * @throws Exception
     */
    public static String encrypt(String strIn) {

        try {
            return byteArr2HexStr(DesUtils.encrypt(strIn.getBytes()));
        } catch (Exception e) {
            e.printStackTrace();
            return strIn;
        }
    }

    /**
     * 解密字节数组
     *
     * @version 2013 2013-2-2 下午3:34:30
     * @since 2013 2013-2-2 下午3:34:30
     * @param arrB
     * @return
     * @throws Exception
     */
    public static byte[] decrypt(byte[] arrB) {

        getInstance();

        if (mDesUtils == null) {
            return arrB;
        }

        try {
            return mDesUtils.mCipher.doFinal(arrB);
        } catch (IllegalBlockSizeException e) {
            e.printStackTrace();
            return arrB;
        } catch (BadPaddingException e) {
            e.printStackTrace();
            return arrB;
        }
    }

    /**
     * 解密字符串
     *
     * @version 2013 2013-2-2 下午3:08:10
     * @since 2013 2013-2-2 下午3:08:10
     * @param strIn
     * @return
     * @throws Exception
     */
    public static String decrypt(String strIn) {

        try {
            return new String(DesUtils.decrypt(hexStr2ByteArr(strIn)));
        } catch (Exception e) {
            e.printStackTrace();
            return strIn;
        }
    }

    /**
     * 加密字节数组
     *
     * @version 2013 2013-2-2 下午3:34:59
     * @since 2013 2013-2-2 下午3:34:59
     * @param arrB
     * @return
     * @throws Exception
     */
    public static byte[] encrypt(byte[] arrB) {

        getInstance();

        if (mDesUtils == null) {
            return arrB;
        }

        try {
            return mDesUtils.mCipher.doFinal(arrB);
        } catch (IllegalBlockSizeException e) {
            e.printStackTrace();
            return arrB;
        } catch (BadPaddingException e) {
            e.printStackTrace();
            return arrB;
        }
    }

    private static byte[] hexStr2ByteArr(String strIn) throws Exception {
        byte[] arrB = strIn.getBytes();
        int iLen = arrB.length;

        // 两个字符表示一个字节，所以字节数组长度是字符串长度除以2
        byte[] arrOut = new byte[iLen / 2];
        for (int i = 0; i < iLen; i = i + 2) {
            String strTmp = new String(arrB, i, 2);
            arrOut[i / 2] = (byte) Integer.parseInt(strTmp, 16);
        }
        return arrOut;
    }

    private static String byteArr2HexStr(byte[] arrB) throws Exception {
        int iLen = arrB.length;
        // 每个byte用两个字符才能表示，所以字符串的长度是数组长度的两倍
        StringBuffer sb = new StringBuffer(iLen * 2);
        for (int i = 0; i < iLen; i++) {
            int intTmp = arrB[i];
            // 把负数转换为正数
            while (intTmp < 0) {
                intTmp = intTmp + 256;
            }
            // 小于0F的数需要在前面补0
            if (intTmp < 16) {
                sb.append("0");
            }
            sb.append(Integer.toString(intTmp, 16));
        }
        return sb.toString();
    }

    private Key getKey(byte[] arrBTmp) throws Exception {
        // 创建一个空的8位字节数组（默认值为0）
        byte[] arrB = new byte[8];

        // 将原始字节数组转换为8位
        for (int i = 0; i < arrBTmp.length && i < arrB.length; i++) {
            arrB[i] = arrBTmp[i];
        }

        // 生成密钥
        Key key = new javax.crypto.spec.SecretKeySpec(arrB, "DES");

        return key;
    }

//    public static void main(String[] args){
//        String aa = "aaaa";
//        String aaen = DesUtils.encrypt(aa);
//        System.out.println(aaen);
//        System.out.println(DesUtils.decrypt(aaen));
//    }
}
