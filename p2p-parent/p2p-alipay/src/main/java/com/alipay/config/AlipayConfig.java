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
    public static String merchant_private_key = "MIIEvwIBADANBgkqhkiG9w0BAQEFAASCBKkwggSlAgEAAoIBAQCm1uR60i0R+NQePszzVBaI8/uZefQmbFXuT7i0Bn7rN0XM1fphwJ1N0D39BTxa4soHDK99jNYIVQYS047AQvzSmdHTmEIg+zft5BkjGWh0qp9/UC5HnGSYGavzOJzG7G413u5vGguhn6/sJqoYfZOK2Vpt8tzzCKjsDiuBfocXRLfaJd+WX9vE9XaltHfxxWU9N0FPokLMg2CBI5A+Gmuqhe1gr1zGi5i2OLUlZOPpIwwOBh14EaJIQKOSyxOickyKRBsagFN5KRFPA20C1NFZFWtPRQ3qJjXTadXymSMIvPg4YW9STchea2WRbjGgG6luH7IFQrYMa9rY3sUsvdz7AgMBAAECggEAY+RQQnVqxNLt9fn17k7Pe0pRvy+0jfjZbmlPFoK5JQ4f/ae0VSjlRjzDkKW84FHfUl83B332fGCj1UvTsauqAlJUvlLwbRzc/NNQdaJ11zx9aNXSD9BErojYWjTwMW5IAnsq2VyH0EpzI3p251jwqPbAXQpHXkA2G7fUNqFSMwxbZEXnhSstIu0ztIc22c8Gjc/3zBx9fXIKdn6d27EZcqee7K/t1BoM8DtUKbUJdz5HIZtnmOhcuPga9G0pl61Px+7klG8DKpQeMOs0iFSaG+Mx0dT/vXte40EdTPFWzY8lDk5inYszJCqttCXp8YP+9csMsxjcpSHAkh2DsHCl4QKBgQDRWPsWQQfzw/p0NrBdM44sT0ZAJYW4SWdjuBEtCQD7eMhTBtwrA+pxD9gKZbWXT1IXOxOfEO8F3OfBKRmM/PgaLsvdV+qHheBu4Oi/5MRrEg2IBnaELbJP6aWENGfKkYG+rhqWCy54iSiylu4PTBHmv0iFStxNFOm9yDov5KOxiwKBgQDMBN/JWI/POXvUp9kiVkLb6oahnJhLDxgMJxwoil6yiilfAWXiyRvXOahsWGZsdNAmxFRoDJf9KCZeX81YPcpDprHnlLJ3XiWgp8FZ/yOLgecKcSc0IUhE1cU6pAHdWzKR3FqVsDokHnm0cOjHyKGPha4GHGOAf9cZQybvtM4QUQKBgQClwsLtWAin52GEa1kyMwQ76XlCiXNb/CM1PiW7dwmkFHrp4uCp3qvfYiA5+1bRvCjP5CMhLBNWnReURqrIi/UXJj6dwGMfc83FfahNaSJtdRnpvtRQzK4HwIUiLSyRpK0LAmhire/Z2SC0Z/WPfzgdcRBHGoNdNVXuw3/vNCa5CQKBgQCd3xOwgXhe2VOKPgwWtvtro3JksoFia56nIMh4UoJu09ypqLJHqGmDxRkgJdO0DzxXE0thbIVcH2p5Utbado4ChYZa9kSXe+HQDJ/g3T6LII1BFkhI3YxHv8er1eefe4eJOSNbe4+yDWcOCuUGW6kxHzeHgQY6FDLFWKJTkOx30QKBgQCD3pgzbzZk+UcJAh/HbcPF6EaUisK4/ZvJvM3+05QVgiJUs71iTH7EqI5c+M+THZJeatqWsgCGhDOnfBSc7e/Q07OO8W2BxVhM2rxqIfUDlRp8UCRRNVyYfcraASGY+SktVLbjVFbbGEKjbguNcaQV5cTlBffChAK1X1VP1o91ow==";

    // 支付宝公钥,查看地址：https://openhome.alipay.com/platform/keyManage.htm 对应APPID下的支付宝公钥。
    public static String alipay_public_key = "MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAptbketItEfjUHj7M81QWiPP7mXn0JmxV7k+4tAZ+6zdFzNX6YcCdTdA9/QU8WuLKBwyvfYzWCFUGEtOOwEL80pnR05hCIPs37eQZIxlodKqff1AuR5xkmBmr8zicxuxuNd7ubxoLoZ+v7CaqGH2TitlabfLc8wio7A4rgX6HF0S32iXfll/bxPV2pbR38cVlPTdBT6JCzINggSOQPhprqoXtYK9cxouYtji1JWTj6SMMDgYdeBGiSECjkssTonJMikQbGoBTeSkRTwNtAtTRWRVrT0UN6iY102nV8pkjCLz4OGFvUk3IXmtlkW4xoBupbh+yBUK2DGva2N7FLL3c+wIDAQAB";

    // 服务器异步通知页面路径  需http://格式的完整路径，不能加?id=123这类自定义参数，必须外网可以正常访问
    public static String notify_url = "http://localhost:8080/p2p/user//selectById";

    // 页面跳转同步通知页面路径 需http://格式的完整路径，不能加?id=123这类自定义参数，必须外网可以正常访问
    public static String return_url = "http://localhost:8080/p2p/user//selectById";

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
