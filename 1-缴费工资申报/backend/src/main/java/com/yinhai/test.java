package com.yinhai;

import com.fr.cert.token.JwtBuilder;
import com.fr.cert.token.Jwts;
import com.fr.cert.token.SignatureAlgorithm;
import java.util.Date;
public class test {
	public static void main(String[] args) {
		//数字签名有效时长
		long validTime = 30 * 60 * 1000;
		//数字签名内容，以访问资源的相对路径作为内容
		String path = "GettingStarted.cpt"; //修改为需要进行数字签名认证的模板路径，相对路径，例如doc/xx.cpt
		String key = "123456"; //数字签名密钥，可以自定义
		//生成fine_digital_signature
		String fine_digital_signature = createJwt("", "", path, validTime, key);
		//输出fine_digital_signature
		System.out.println(fine_digital_signature);
	}
	private static String createJwt(String issuer, String id, String subject, long validTime, String key) {
		//用于生成数字签名，即参数fine_digital_signature的值
		SignatureAlgorithm signatureAlgorithm = SignatureAlgorithm.HS256;
		Date currentTime = new Date();
		Date expirationTime = new Date(currentTime.getTime() + validTime);
		JwtBuilder builder = Jwts.builder()
				.setIssuer(issuer)
				.setSubject(subject)
				.setIssuedAt(currentTime)
				.setExpiration(expirationTime)
				.setId(id)
				.signWith(signatureAlgorithm, key);
		return builder.compact();
	}
}
