package com.alipay.config;

import org.springframework.stereotype.Component;

import java.io.FileWriter;
import java.io.IOException;

@Component
public class AlipayConfig {

//↓↓↓↓↓↓↓↓↓↓请在这里配置您的基本信息↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓

    // 应用ID,您的APPID，收款账号既是您的APPID对应支付宝账号
    public static String app_id = "2016101400686333";

    // 商户私钥，您的PKCS8格式RSA2私钥
    public static String merchant_private_key = "MIIEvAIBADANBgkqhkiG9w0BAQEFAASCBKYwggSiAgEAAoIBAQCGe9uFCTGIjDwnvuVbadLvC1JlHBRhBPc4cMekF9MNc7szKCj4Rjt/XPDDyPsdEAA2bQM4ybFz2KBsSBGFZp9k2USS3SSK0munsFSPCbrElecYJ8w/UPnSGrLbHZDE28gMBXvW5G2ckw35P7voKX2QNiA2LEJZLI1cq9dTit0mM4eiHmvgtcRKC/PPrPTlsEuZ54J9vymqvd/1CRBx2pPXWOnl9yKMU86JfimDZMmPlb2MYEsr3+wzFnaSrUVpmZkem/CdPc9PC1DjEeFBxoODFNQlc3ozxQejzruE1nEormG/FcZvEVhys0i4ZOheU8oHGYEU5MRchnvWL6X/EVOxAgMBAAECggEAfBR89uMDm7vfqMA9t7kM0Fc+32EoAFfnjWCpImKE7O1xtAKCwodyT9G9prah0i+4Mn8kMNoO6xbc9OsNl2qW+CJqXaLCG3+HqoFLk2njs4unW6ckkOqyhMLzcK13q9ooWccZeqzp4UPg6a5/PfZCDrORxsnRMZuklfNKyZ7e6mXcVQKrk86CNiRSKhJLqc/Ua22UVv9s+GCrRdy3uKh/Y/Xul15MxWxd/HBOOfqXq8liM+kYMI8xQy701aHDUD6k8TNqmlRxF+DRORxBE5oUZTO/ju4QkkCD4vLl5my7jLMe5RIbzNDzHNS6LA8pl1L3PE8xF/2EKmsm1kW7Q85dwQKBgQC/rOyCeasnVVJk7694cZQen13rSPMPsw/XP0qv2SOfh+TW5p6WwaFFUhWugX5uZc7FzdKG+8OGMPcjpWDiywD220IleKns91qh5b5VI7HjvrcdhOvxN58BuYYuMHYD4Mmbddw7uAZjZoYt2gLXExUD9sJVUVCQ1cxgy+KRGy43SQKBgQCznYcGGdBcgfJToYUQQZzKbNfw1N7qi+dX0rcKxONoe0Z1NKUCtaNpVDRhv3TpNg8aENoINVADLu9vsmAQUxV4+xV+/xItpFvflIgMgFK/52utXF9ZzZggFxtNglxP0zbA8TkHtiV00m3TYzbl2YeOrV3+dmQ4TVvahVfXZ+mxKQKBgDFrIztspS0p+Wlexs318quGiU99anWUxDPJ9Lar9FxQTDcAFMlnuO3HgSGR74gFJa+oJmx5AutZOo7tN7KhhmkfFMnWd3FKQQrW0iDfaCEA7fNlbvOtVIi8TZUhF3xee3xigdq/0p3UNCokOHE9UUDJYUdgBLai+OPIDW0+JcdJAoGAZ82LQiBbBYtn86MuFnYE2gvLRHiRl7Vg7qVteYDN+Az+bDAPiSBWH0I1v6P5OeovEh5ZE1NUOXK/l6rbz7NkfnWFN87Lv6r0GaNqeOcUa6mf1iHDTU//MdSIx+Ol29AyHZGLJwTCYuBV7kuxZ2au6+sPnkbnpo42nnRfjrKUIPkCgYBXBYEyBkRXS8ke76Hqqx9Dgb4cMsro0ap39oDLelxMLnv4Ssf+xu3fQdW8NmxGzcJkIHpLsT14MXXXPvv1PxmzX8vsbxo6tFEhDDtZvfTVEWen/Xg+vpitlKt6bBkaSSu1NgFtox5ds7X0N/gUoAsWUwF52GM8Zb9TvWnCTJkVGA==";
    // 支付宝公钥,查看地址：https://openhome.alipay.com/platform/keyManage.htm 对应APPID下的支付宝公钥。
    public static String alipay_public_key = "MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAmDoDx48cNfKTNptOKOj8K72MPiHaiU9xiwpWeKZ58NFNfbz4PyP34BSrpdK7NCLiBFLMjkRryWCKKoATvV3VYdXD3AxyZHxiBGxKNscaMdTPh05tgbR/gF3RVZzOxPTpiTjw8Ysod5ha03xOeCXUu0rsQ8402ZZlqkefjF1ZGsTdSKCynMmCSfifWP4j+YhtP/gsQPFeecPB5uKVDg57Ch/zz+Yu+LedXdJpgQAGWYoo+td1RCm040NDycPrAUKmUGHDtcXo6KxZiAcdUYfyMZtGSzFGj5PwDe/SyQ1mZ51EDO0AxXqTOUUDa43FHTZZUE1qiYHphsfBQoB6POIbcwIDAQAB";
    // 服务器异步通知页面路径  需http://格式的完整路径，不能加?id=123这类自定义参数，必须外网可以正常访问
    public static String notify_url = "http://localhost:8080/p2p/alipay//alipayNotifyUrl";

    // 页面跳转同步通知页面路径 需http://格式的完整路径，不能加?id=123这类自定义参数，必须外网可以正常访问
    public static String return_url = "http://localhost:8080/p2p/alipay//alipayReturnNotice";

    // 签名方式
    public static String sign_type = "RSA2";

    // 字符编码格式
    public static String charset = "utf-8";

    // 支付宝网关
    public static String gatewayUrl = "https://openapi.alipaydev.com/gateway.do";

    // 支付宝网关
    public static String log_path = "C:\\";


//↑↑↑↑↑↑↑↑↑↑请在这里配置您的基本信息↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑

    /**
     * 写日志，方便测试（看网站需求，也可以改成把记录存入数据库）
     * @param sWord 要写入日志里的文本内容
     */
    public static void logResult(String sWord) {
        FileWriter writer = null;
        try {
            writer = new FileWriter(log_path + "alipay_log_" + System.currentTimeMillis()+".txt");
            writer.write(sWord);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (writer != null) {
                try {
                    writer.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
    }
}
