Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86E8137C113
	for <soc@lists.linux.dev>; Thu, 25 Jun 2026 09:14:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782378845; cv=none; b=gJBMgJpIeHcO88G14S37B3PyXCt5XiT0PKoww9g1G/pAIiYO76p0zsb7EANcBN/F/ahSGsm10v6Be1L2NKhr288jornMSUT4OxXBc3JWFI6Q8pq30JIXL26YhT54Nqe7FvgKfQofI8lZzYymHVJKlAUD2uXvr3g2x/T3c4HCdug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782378845; c=relaxed/simple;
	bh=en4xdYDW/tnGPMQ48tqOKIrl1OcXtOdwWtGAIvSiC2Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CqGCvF2hBM1ndRafkHVYKzSiI6YbzLSZdiEaFv82VNCulOaNiW6VW+MQlV//c4PR3MEVWy0lqskA0Vc4Ljbr2QmhxCop4+rKnpRFWRT3Ove+6cOF63AV8I7liBfkhROhMXxqXfKnhEj6Bc82WosAI4hYvGoqsdW3AD8qypCpyeo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=c2bZND0R; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JhAQcagn; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="c2bZND0R";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JhAQcagn"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65P8pWgX1795845
	for <soc@lists.linux.dev>; Thu, 25 Jun 2026 09:14:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=sOLzOShEjuYgUh8L57a90PA4bqQtCVepg5o
	Kqqiaa+M=; b=c2bZND0RWQHpF3L2dJ0dv6Dl3/QlVETkaQvY/b9FdXJa9Kom8R9
	BbWrwfcKfk3ieyFCameOW+gTBCEcyiptktJA4ejp5h0qeClttyNoj/uSPCevKbWb
	A38KRGhUlJ21NrreRq4GSCuKbRD3fqNesfziYvOsHOPgl4+1+ESUNZAIdjvRPZRC
	UeFl81jiKPh3W8StxFwR0rPgMTleeC/8CU7w3Q6QAi96rlkmpzGlVikRnYWs8mYX
	K3rijrZGYNkUySNqvEu5Aab1TzoyT3OlDDIA0shoVmWJ0Mb1ucNExrZ54lheG9m4
	muZNliyMw104nXKXwlNw6n7LwAMZorO3y4g==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f0ueu9ewa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <soc@lists.linux.dev>; Thu, 25 Jun 2026 09:14:02 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-9158e75cbc0so265889485a.2
        for <soc@lists.linux.dev>; Thu, 25 Jun 2026 02:14:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782378842; x=1782983642; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sOLzOShEjuYgUh8L57a90PA4bqQtCVepg5oKqqiaa+M=;
        b=JhAQcagnvm9H0ide3gv5dsRceoOeDJm5wDDpFmgIDpUX7waXy56/ITSF64xrB0olRU
         9Pipki+ahSlexZ9Maq4jgXzg0klfjUgXbfQSgL0jW6wi6L6knmKnoLMvhDz10Ax0ppFO
         i8Amh1NbiMNPNZ+QrumLbNjO8CFamwhTnWkV1nioYUdYg+dJsr4Vx27LoUXXI7cXEWrX
         nNRseeAid0SoXDS/FNkmw4miHN+nh7xQs91fvAnCOv7q1MX6E1o4YDdL3ceWt+RZxuK4
         GS8XYRRflekzbrNxRVZeh0MkE5UcJ1ZyNQvs7X9NWOmoCJEVQT+pGWgcmT28X74sh05h
         bz0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782378842; x=1782983642;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sOLzOShEjuYgUh8L57a90PA4bqQtCVepg5oKqqiaa+M=;
        b=d4Cme4NJbzxZJguUL4SuLbNKEx5Qva4RJ2hGEeJJpc04KoaSpQMbHDogiasJGYvzsI
         V0nELC056VqRQq7m6LH6NUX4OfVAIcO8/MlLlTjh39+Juoi0W47Bp952d/hEqY03/2pj
         dUhmVeNnWOrxIyQ3rdevmaBxcfNwf/jMFFp4LwwoGT/LiKVAqGYE3QvSOCDtxRGafMRv
         HKjT+yiZR4d/UshANTXwhn9c2aTtqzg5WrO3NwvrmvU5z1cSR+P8heMCD2i2VQT2KuGd
         6Y/aPv+h7A+0JiCEnakWvrqwNcd7oWbjJJxTOGM0hhqIxKS34RmLP2o7LnTHWG+hieFB
         hYvQ==
X-Forwarded-Encrypted: i=1; AFNElJ/IMqSubMB4+UOqFvy91N5pH0GK1tehz9Ipq8aVcIdTnhz/qCuVYgAtOtadhCk7fwFA5KQ=@lists.linux.dev
X-Gm-Message-State: AOJu0YzGWqu5IvcGbWj/fBMyZCwuv3PJ3JKzHX9ciLYjYOko3rChjwNs
	xdU52Mz0oW7iA8SeIrSQTVuBUt6HckEJDZo29WFdMWQ+d4sWPZS3r08z0PIz6WHYPO+VdHc8EFs
	+RO/vtSTMYS7Wwkq9uk8Hz/jSfA6ni3LkQBBJs6tPWPEqZk4Np/UJl8g=
X-Gm-Gg: AfdE7clMDUZ1H+qeLjNZi+HLjTuCoWbnLeDtgWP8zr/XOt0pwURTDYXQlUdL3J0wAqI
	/3IrwGuJaa5Qhg6P25Eyo07AARcUg+fpb7Wr/9VeUK+9Y+WEkT705X9Tkq4FeAP9YAkYQ8qtMqq
	n0AchkY/MskJzELFF+zRDoZB9sWIeRKsio+XB5tJw1jpHuv1neVdXveNcVvHA6AOtMa1B9d+ZUc
	lArJ6q6/+oZz6ffGgpFnUQqeie3THPBnW73MYTDqvLtnht9oePKVzLgRxiF8LIuKIFxaJ+YFu6p
	HxwH9g0MOnLZ/xMo09ABZUA9JERO0+mfXp0H/T7YAL0dOSegV3yA1Kmt6RAqI3YUkP4WPhiKWwv
	ryv3BaAPtOV1cqtrPMgDcJ3h6Pn0=
X-Received: by 2002:a05:620a:4507:b0:915:cda5:2805 with SMTP id af79cd13be357-9293cec6496mr219779185a.52.1782378841565;
        Thu, 25 Jun 2026 02:14:01 -0700 (PDT)
X-Received: by 2002:a05:620a:4507:b0:915:cda5:2805 with SMTP id af79cd13be357-9293cec6496mr219775685a.52.1782378841129;
        Thu, 25 Jun 2026 02:14:01 -0700 (PDT)
Received: from quoll ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49263f9c59fsm109995015e9.0.2026.06.25.02.13.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 02:14:00 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Viresh Kumar <vireshk@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        linux-arm-kernel@lists.infradead.org, soc@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH] ARM: dts: st: spear13xx: Drop unused/incorrect usbh0_id and usbh1_id
Date: Thu, 25 Jun 2026 11:13:56 +0200
Message-ID: <20260625091355.107054-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1620; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=en4xdYDW/tnGPMQ48tqOKIrl1OcXtOdwWtGAIvSiC2Y=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqPPFT9FosOUrlRhQBfDSnt4DVLHwW4qCDda1A+
 Uo8my+67c+JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCajzxUwAKCRDBN2bmhouD
 1wW+D/9YvOOw/wE+xXFSqYhV3a4vn8KmLqOon0BYGD374ZsneeujkFUT3wpTStXTE9jL7cAYe7L
 U4Bp0r6GmjHMFKetlfQahrswLjKXadIgDCyx09nk1kg+XOeVS1gpf/2QpuRcNvz0BScK3ofxibr
 vNrmfGlrfMiyWQzGkyf19ed690MkCBiTfAZp5l4R6WP/xce3tKuea3VL9/dt47KRtJ/d8Uo7Z6d
 Hrd+1FdaBDCbOzeEi770gAWNkub4IGeV/d5ZU23l/JfPDT38w8dtL7ahTM42RKV8+HXMUz0NFmZ
 TRCwx3FMLB3TVteH/2TRLHQqIib3yRCEDPUQ4Lp6YozdMUVVUCo22TvaGDcJ+C5eEl90HoHC62Y
 y13VbMl5FJtE+NqDMeETWUMwqf9u06hgmphxCTExbNf6k/LUGTaChrlbEXFlTHnOo+ez+C8c4QI
 n5Sw851wG7wPa6iXvCgb9AMm07dE8jGhENXfXzT0BH41ZjBNA25BqFrswG5nsyuH3qS8SNJwMEG
 ps8S8jPynfzoxAMEMH5ZC7ubJoDiA8e3Kdtv3/9DyTcF/ENgXD/nEpbnmpXgMb/cuGDqZMrqn/G
 Df1Cp0vB2UXSs5ADbIlli4h+td52URoW6qZwjBxD6GFdZSeFiyg6AfywrMhQfScrrRckMZ/4yTP OAaE2/2qG2+Mvbw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: hACl99sfOfkPa2i_tmtkpyMgK3nWmaf8
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI1MDA3OSBTYWx0ZWRfX4TEggvaWAXvN
 to7BiXTHt6XxzvRZVx2tboqTmuMzxIYtqDfanrBrNOnWlKQzocl6l3lE9imO69q/tYxGr+OiATA
 70yTIxKN3X0ln5EVPLAIpc+t7wJeFhY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI1MDA3OSBTYWx0ZWRfX99WIAaDXMFHh
 qrdSXWMyMKsZyhrnhKCLDagNWFSk9lHmqmxKhqlycmW7NJTaudG8Jx0Y8u0SIVobGPEtS7Ptiup
 gow54U+ZSBwvtBlgczSM/7jqB1fnZ205zj6Q1FaAb1TxP0It33TU4YJdpeJnsMam8zYsV9lU3eH
 8otuufy/0FtM4IlNLF+uA3d+byYEbdfPKYMaaZ3kkDHu7hfVgnFvJmBqnHbllRLKHwNYIoPZIco
 a129GzFg/w9D6UIPto//bXCpglxPR7eyn7cmAi7RzsUbABPTcCgRysuCLOjKtsb2e6ewluitFfA
 SHN/JK3U7ESaCdnBDq9Ke4jjTZN88ahCA/qW+mFSzDWVEUFRKatgHPNrYL5bDHop20lQogbdvBK
 lvHG7ECEygLd+5Xyrr6ac251tOPWtZ/KXS3tHTYNbIUi7uXr+ibYP/2zRO4CcdYOqhlflQkhgGx
 YWuNj6jNphHBP+PpY8Q==
X-Authority-Analysis: v=2.4 cv=b/SCJNGx c=1 sm=1 tr=0 ts=6a3cf15a cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=rKRmnjq100BRpgpmRoYA:9 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: hACl99sfOfkPa2i_tmtkpyMgK3nWmaf8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-25_01,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 phishscore=0 bulkscore=0
 adultscore=0 clxscore=1015 spamscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606250079

"usbh0_id" and "usbh1_id" properties were never documented and never
used by Linux drivers, thus should be safe to drop to fix dtbs_check
warnings like:

  st/spear1310-evb.dtb: usb@e4800000 (st,spear600-ehci): Unevaluated properties are not allowed ('usbh0_id' was unexpected)
  st/spear1310-evb.dtb: usb@e5800000 (st,spear600-ehci): Unevaluated properties are not allowed ('usbh1_id' was unexpected)

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm/boot/dts/st/spear13xx.dtsi | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/arch/arm/boot/dts/st/spear13xx.dtsi b/arch/arm/boot/dts/st/spear13xx.dtsi
index 0bb88f2d4ef5..cf98160ba268 100644
--- a/arch/arm/boot/dts/st/spear13xx.dtsi
+++ b/arch/arm/boot/dts/st/spear13xx.dtsi
@@ -178,7 +178,6 @@ usb@e4800000 {
 			compatible = "st,spear600-ehci", "usb-ehci";
 			reg = <0xe4800000 0x1000>;
 			interrupts = <0 64 0x4>;
-			usbh0_id = <0>;
 			status = "disabled";
 		};
 
@@ -186,7 +185,6 @@ usb@e5800000 {
 			compatible = "st,spear600-ehci", "usb-ehci";
 			reg = <0xe5800000 0x1000>;
 			interrupts = <0 66 0x4>;
-			usbh1_id = <1>;
 			status = "disabled";
 		};
 
@@ -194,7 +192,6 @@ usb@e4000000 {
 			compatible = "st,spear600-ohci", "usb-ohci";
 			reg = <0xe4000000 0x1000>;
 			interrupts = <0 65 0x4>;
-			usbh0_id = <0>;
 			status = "disabled";
 		};
 
@@ -202,7 +199,6 @@ usb@e5000000 {
 			compatible = "st,spear600-ohci", "usb-ohci";
 			reg = <0xe5000000 0x1000>;
 			interrupts = <0 67 0x4>;
-			usbh1_id = <1>;
 			status = "disabled";
 		};
 
-- 
2.53.0

