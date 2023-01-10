Return-Path: <SRS0=INbW=5H=hpe.com=prvs=03745b4215=clayc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24A51C54EBE
	for <soc@archiver.kernel.org>; Tue, 10 Jan 2023 04:26:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 0C6FBC433F2; Tue, 10 Jan 2023 04:26:00 +0000 (UTC)
Received: from mx0a-002e3701.pphosted.com (mx0a-002e3701.pphosted.com [148.163.147.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id E3302C433EF;
	Tue, 10 Jan 2023 04:25:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org E3302C433EF
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=hpe.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=hpe.com
Received: from pps.filterd (m0150241.ppops.net [127.0.0.1])
	by mx0a-002e3701.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 30A3n9j9010124;
	Tue, 10 Jan 2023 04:25:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hpe.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references; s=pps0720;
 bh=uXvadRzdh452Znhi2px4eeo5gn0RKDj9w51c+kKDe0I=;
 b=CFZLnpONDrIgMQ7qNVCcp7Y2Jc7FOjlJK4P9zZ8IBzojWTQ3OlytCG17zQgrtcgTxng1
 c2u6zArUKvGBPpq6tTtHRaUp9Q2aPNKqCgt8EC2S3vlkZqZS+pcWee2XhzkosCih6GsF
 mB+MqHsbG96tfDYHk3ZGKWGvQCyVm2DzU9tfO3hugySSplrS9UBGmBNo6ttn4ZlYPOlA
 sJY1OH+1z23XPGvh8/54bka/DcLi0v0FjmTzjpws4G22goVE8Y7WcncbJHLcg4zcMQ3a
 RJaJKPOanFbq/PTQlejiYq3gwLoSOO0Z6j6H4Vq0jDRxSEh9iUs/pe8LyZZyh51p7kqU 1Q== 
Received: from p1lg14881.it.hpe.com (p1lg14881.it.hpe.com [16.230.97.202])
	by mx0a-002e3701.pphosted.com (PPS) with ESMTPS id 3n10eq054y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 10 Jan 2023 04:25:54 +0000
Received: from p1lg14886.dc01.its.hpecorp.net (unknown [10.119.18.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by p1lg14881.it.hpe.com (Postfix) with ESMTPS id 7AE9A8085FF;
	Tue, 10 Jan 2023 04:25:53 +0000 (UTC)
Received: from openbmc-dev.hpecorp.net (unknown [16.231.227.36])
	by p1lg14886.dc01.its.hpecorp.net (Postfix) with ESMTP id CCBE580BE24;
	Tue, 10 Jan 2023 04:25:49 +0000 (UTC)
From: clayc@hpe.com
List-Id: <soc.lore.kernel.org>
To: linux-kernel@vger.kernel.org, soc@kernel.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        verdun@hpe.com, nick.hawkins@hpe.com, arnd@arndb.de,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        linux@armlinux.org.uk, olof@lixom.net
Cc: Clay Chang <clayc@hpe.com>
Subject: [PATCH 3/5] ARM: dts: hpe: Add SROM Driver
Date: Tue, 10 Jan 2023 12:25:31 +0800
Message-Id: <20230110042533.12894-4-clayc@hpe.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230110042533.12894-1-clayc@hpe.com>
References: <20230110042533.12894-1-clayc@hpe.com>
X-Proofpoint-GUID: WPa6vxRI7u8Jlhf1wRcVvTcernnNkHUe
X-Proofpoint-ORIG-GUID: WPa6vxRI7u8Jlhf1wRcVvTcernnNkHUe
X-HPE-SCL: -1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2023-01-10_01,2023-01-09_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 malwarescore=0
 impostorscore=0 mlxscore=0 phishscore=0 mlxlogscore=669 lowpriorityscore=0
 spamscore=0 adultscore=0 suspectscore=0 priorityscore=1501 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2301100026

From: Clay Chang <clayc@hpe.com>

Add SROM driver to the device tree. Also re-organize the AHB base
address to accommodate the SROM driver register requirements. Add the
hpe,gxp-srom compatible.

Signed-off-by: Clay Chang <clayc@hpe.com>
---
 arch/arm/boot/dts/hpe-gxp.dtsi | 41 +++++++++++++++++++---------------
 1 file changed, 23 insertions(+), 18 deletions(-)

diff --git a/arch/arm/boot/dts/hpe-gxp.dtsi b/arch/arm/boot/dts/hpe-gxp.dtsi
index cf735b3c4f35..3e96941721d5 100644
--- a/arch/arm/boot/dts/hpe-gxp.dtsi
+++ b/arch/arm/boot/dts/hpe-gxp.dtsi
@@ -52,76 +52,81 @@
 			cache-level = <2>;
 		};
 
-		ahb@c0000000 {
+		ahb@80000000 {
 			compatible = "simple-bus";
 			#address-cells = <1>;
 			#size-cells = <1>;
-			ranges = <0x0 0xc0000000 0x30000000>;
+			ranges = <0x0 0x80000000 0x7FFFFFFF>;
 			dma-ranges;
 
-			vic0: interrupt-controller@eff0000 {
+			vic0: interrupt-controller@4eff0000 {
 				compatible = "arm,pl192-vic";
-				reg = <0xeff0000 0x1000>;
+				reg = <0x4eff0000 0x1000>;
 				interrupt-controller;
 				#interrupt-cells = <1>;
 			};
 
-			vic1: interrupt-controller@80f00000 {
+			vic1: interrupt-controller@f00000 {
 				compatible = "arm,pl192-vic";
-				reg = <0x80f00000 0x1000>;
+				reg = <0xf00000 0x1000>;
 				interrupt-controller;
 				#interrupt-cells = <1>;
 			};
 
-			uarta: serial@e0 {
+			uarta: serial@400000e0 {
 				compatible = "ns16550a";
-				reg = <0xe0 0x8>;
+				reg = <0x400000e0 0x8>;
 				interrupts = <17>;
 				interrupt-parent = <&vic0>;
 				clock-frequency = <1846153>;
 				reg-shift = <0>;
 			};
 
-			uartb: serial@e8 {
+			uartb: serial@400000e8 {
 				compatible = "ns16550a";
-				reg = <0xe8 0x8>;
+				reg = <0x400000e8 0x8>;
 				interrupts = <18>;
 				interrupt-parent = <&vic0>;
 				clock-frequency = <1846153>;
 				reg-shift = <0>;
 			};
 
-			uartc: serial@f0 {
+			uartc: serial@400000f0 {
 				compatible = "ns16550a";
-				reg = <0xf0 0x8>;
+				reg = <0x400000f0 0x8>;
 				interrupts = <19>;
 				interrupt-parent = <&vic0>;
 				clock-frequency = <1846153>;
 				reg-shift = <0>;
 			};
 
-			usb0: usb@efe0000 {
+			usb0: usb@4efe0000 {
 				compatible = "hpe,gxp-ehci", "generic-ehci";
-				reg = <0xefe0000 0x100>;
+				reg = <0x4efe0000 0x100>;
 				interrupts = <7>;
 				interrupt-parent = <&vic0>;
 			};
 
-			st: timer@80 {
+			st: timer@40000080 {
 				compatible = "hpe,gxp-timer";
-				reg = <0x80 0x16>;
+				reg = <0x40000080 0x16>;
 				interrupts = <0>;
 				interrupt-parent = <&vic0>;
 				clocks = <&iopclk>;
 				clock-names = "iop";
 			};
 
-			usb1: usb@efe0100 {
+			usb1: usb@4efe0100 {
 				compatible = "hpe,gxp-ohci", "generic-ohci";
-				reg = <0xefe0100 0x110>;
+				reg = <0x4efe0100 0x110>;
 				interrupts = <6>;
 				interrupt-parent = <&vic0>;
 			};
+
+			srom: srom@fc0000 {
+				compatible = "hpe,gxp-srom";
+				reg = <0xfc0000 0x100>;
+			};
 		};
 	};
 };
-- 
2.17.1

