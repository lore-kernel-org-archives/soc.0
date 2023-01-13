Return-Path: <SRS0=2WEJ=5K=hpe.com=prvs=03770366ca=nick.hawkins@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEEF5C54EBD
	for <soc@archiver.kernel.org>; Fri, 13 Jan 2023 16:09:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 66D3CC433F2; Fri, 13 Jan 2023 16:09:10 +0000 (UTC)
Received: from mx0b-002e3701.pphosted.com (mx0b-002e3701.pphosted.com [148.163.143.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 8E9B8C43396;
	Fri, 13 Jan 2023 16:09:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 8E9B8C43396
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=hpe.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=hpe.com
Received: from pps.filterd (m0134424.ppops.net [127.0.0.1])
	by mx0b-002e3701.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 30DFSbQm030643;
	Fri, 13 Jan 2023 16:08:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hpe.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references; s=pps0720;
 bh=BT46m0GFyZvdPoAAhfhdMehIokzv4T5w1f0EE/g4HzU=;
 b=gAjfH527j4tsrLKuxDul2aWmBDD+LSIfY0Nll6tAjRYFMKTGH5kLld0Gmg4MzMdS7AWK
 EKAkvulsjwVu3p3KCPXgM/QE7aSIDMDZk1tUtHsrCeybGxAmRx633guKmlJsC9jNjj/z
 l+gzuIsjyKTTjXIRPxzh7jWwgnKL4RHcoJy21VzMKUBUIHSzcaY8RxdDAXWXFt4DlGxH
 YWr7e5ttonupcAXJHTx5DROdQxbTo7fpr1MrSWWMWPTQa6RSZhHZ7Nn34G2WkYPqcHKv
 322F5crnhFam8axXd5ZyLiID/KWLGUtvK8HkWDSUijmeaATJEl7g6ofMQgHgRDAl2rmR NA== 
Received: from p1lg14878.it.hpe.com (p1lg14878.it.hpe.com [16.230.97.204])
	by mx0b-002e3701.pphosted.com (PPS) with ESMTPS id 3n39th0da2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 13 Jan 2023 16:08:55 +0000
Received: from p1lg14885.dc01.its.hpecorp.net (unknown [10.119.18.236])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by p1lg14878.it.hpe.com (Postfix) with ESMTPS id 834013D7B0;
	Fri, 13 Jan 2023 16:08:54 +0000 (UTC)
Received: from hpe.com (unknown [16.231.227.36])
	by p1lg14885.dc01.its.hpecorp.net (Postfix) with ESMTP id E61E180CCF0;
	Fri, 13 Jan 2023 16:08:53 +0000 (UTC)
From: nick.hawkins@hpe.com
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Cc: arnd@arndb.de, linux@roeck-us.net, verdun@hpe.com, nick.hawkins@hpe.com,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        linux@armlinux.org.uk, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH v5 2/2] ARM: multi_v7_defconfig: Add GXP Fan and SPI support
Date: Fri, 13 Jan 2023 10:06:51 -0600
Message-Id: <20230113160651.51201-3-nick.hawkins@hpe.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230113160651.51201-1-nick.hawkins@hpe.com>
References: <20230113160651.51201-1-nick.hawkins@hpe.com>
X-Proofpoint-ORIG-GUID: oCfOTr_2_J9GLRPoGZV69o8y8_Dj6aIv
X-Proofpoint-GUID: oCfOTr_2_J9GLRPoGZV69o8y8_Dj6aIv
X-HPE-SCL: -1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.923,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-13_07,2023-01-13_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 adultscore=0 mlxscore=0 phishscore=0 clxscore=1015 impostorscore=0
 spamscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0 mlxlogscore=851
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301130108

From: Nick Hawkins <nick.hawkins@hpe.com>

In order for HPE platforms to be supported by linux on GXP it is
necessary for there to be fan and spi driver support. There fan driver
can support up to 16 fans that are driven by pwm through the CPLD. The
SPI driver supports access to the core flash and bios part. The SPI
driver spi-gxp was added previously to linux.

Signed-off-by: Nick Hawkins <nick.hawkins@hpe.com>
Acked-by: Guenter Roeck <linux@roeck-us.net>

---
v5:
 *No change
v4:
 *No change
v3:
 *No change
v2:
 *No change
---
 arch/arm/configs/multi_v7_defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi_v7_defconfig
index b61b2e3d116b..192c89bfd02a 100644
--- a/arch/arm/configs/multi_v7_defconfig
+++ b/arch/arm/configs/multi_v7_defconfig
@@ -441,6 +441,7 @@ CONFIG_SPI_CADENCE=y
 CONFIG_SPI_DAVINCI=y
 CONFIG_SPI_FSL_QUADSPI=m
 CONFIG_SPI_GPIO=m
+CONFIG_SPI_GXP=m
 CONFIG_SPI_FSL_DSPI=m
 CONFIG_SPI_OMAP24XX=y
 CONFIG_SPI_ORION=y
@@ -530,6 +531,7 @@ CONFIG_SENSORS_NTC_THERMISTOR=m
 CONFIG_SENSORS_PWM_FAN=m
 CONFIG_SENSORS_RASPBERRYPI_HWMON=m
 CONFIG_SENSORS_INA2XX=m
+CONFIG_SENSORS_GXP_FAN_CTRL=m
 CONFIG_CPU_THERMAL=y
 CONFIG_DEVFREQ_THERMAL=y
 CONFIG_IMX_THERMAL=y
-- 
2.17.1

