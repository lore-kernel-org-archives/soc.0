Return-Path: <SRS0=INbW=5H=hpe.com=prvs=03745b4215=clayc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB17CC54EBE
	for <soc@archiver.kernel.org>; Tue, 10 Jan 2023 04:26:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id AE94BC433F0; Tue, 10 Jan 2023 04:26:15 +0000 (UTC)
Received: from mx0a-002e3701.pphosted.com (mx0a-002e3701.pphosted.com [148.163.147.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 8075FC433D2;
	Tue, 10 Jan 2023 04:26:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 8075FC433D2
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=hpe.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=hpe.com
Received: from pps.filterd (m0134422.ppops.net [127.0.0.1])
	by mx0b-002e3701.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 309Nprnr016772;
	Tue, 10 Jan 2023 04:26:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hpe.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references; s=pps0720;
 bh=ON+ooHXKRcLz9a7mKEFwwAlWyLb4g7QY6+Wkhe/RFTY=;
 b=VutGmrP0WyLiEZRJ690R+rmi4jFdRmcYMU+0lEX+SEUU3WesbHRxhnKeJ64byhIJ5fUZ
 snDrKz6BcT5MxZUmoYB9KJjftxrb6KTwQW24dax2xZ9vDPSo7top05m2emKekp6dHluZ
 tDctxlqkMseRGSBT4q9Nle3Bdq8gISW8baK+HEgVQjR30Y9Vs5tfnOIhu1wN2Du+Dh/k
 r+C/XkknC8lDwVUptlytz7ISjYkUD9NcAbMfITF6Efh9LsbSgQK2zR1d9FnDLgrYsVFf
 7lMLlMgiklY4AiATwRQ2qJBftpwQ5Z9TVz4WH73OwHct2cX+Yhm7kG8p/rmKBi3DrFMR Yw== 
Received: from p1lg14880.it.hpe.com (p1lg14880.it.hpe.com [16.230.97.201])
	by mx0b-002e3701.pphosted.com (PPS) with ESMTPS id 3n0vynsfpr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 10 Jan 2023 04:26:09 +0000
Received: from p1lg14886.dc01.its.hpecorp.net (unknown [10.119.18.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by p1lg14880.it.hpe.com (Postfix) with ESMTPS id D214D807ECB;
	Tue, 10 Jan 2023 04:26:01 +0000 (UTC)
Received: from openbmc-dev.hpecorp.net (unknown [16.231.227.36])
	by p1lg14886.dc01.its.hpecorp.net (Postfix) with ESMTP id 11D3180BE24;
	Tue, 10 Jan 2023 04:25:57 +0000 (UTC)
From: clayc@hpe.com
List-Id: <soc.lore.kernel.org>
To: linux-kernel@vger.kernel.org, soc@kernel.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        verdun@hpe.com, nick.hawkins@hpe.com, arnd@arndb.de,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        linux@armlinux.org.uk, olof@lixom.net
Cc: Clay Chang <clayc@hpe.com>
Subject: [PATCH 5/5] MAINTAINERS: Add maintainer of GXP SROM support
Date: Tue, 10 Jan 2023 12:25:33 +0800
Message-Id: <20230110042533.12894-6-clayc@hpe.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230110042533.12894-1-clayc@hpe.com>
References: <20230110042533.12894-1-clayc@hpe.com>
X-Proofpoint-GUID: TC7f-ukkXfS1AGZjrSFi6v0Uc-bEsyGU
X-Proofpoint-ORIG-GUID: TC7f-ukkXfS1AGZjrSFi6v0Uc-bEsyGU
X-HPE-SCL: -1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2023-01-10_01,2023-01-09_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 adultscore=0
 mlxlogscore=999 priorityscore=1501 mlxscore=0 lowpriorityscore=0
 spamscore=0 malwarescore=0 bulkscore=0 phishscore=0 clxscore=1015
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301100026

From: Clay Chang <clayc@hpe.com>

Add Clay Chang as the maintainer of GXP SROM support.

Signed-off-by: Clay Chang <clayc@hpe.com>
---
 MAINTAINERS | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index ea941dc469fa..164571ac1cc5 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2279,14 +2279,22 @@ F:	arch/arm/mach-sa1100/jornada720.c
 ARM/HPE GXP ARCHITECTURE
 M:	Jean-Marie Verdun <verdun@hpe.com>
 M:	Nick Hawkins <nick.hawkins@hpe.com>
+M:	Clay Chang <clayc@hpe.com>
 S:	Maintained
 F:	Documentation/devicetree/bindings/arm/hpe,gxp.yaml
+F:	Documentation/devicetree/bindings/soc/hpe/
+F:	Documentation/devicetree/bindings/soc/hpe/hpe,gxp-srom.yaml
 F:	Documentation/devicetree/bindings/spi/hpe,gxp-spifi.yaml
 F:	Documentation/devicetree/bindings/timer/hpe,gxp-timer.yaml
 F:	arch/arm/boot/dts/hpe-bmc*
 F:	arch/arm/boot/dts/hpe-gxp*
 F:	arch/arm/mach-hpe/
 F:	drivers/clocksource/timer-gxp.c
+F:	drivers/soc/hpe/
+F:	drivers/soc/hpe/Kconfig
+F:	drivers/soc/hpe/Makefile
+F:	drivers/soc/hpe/gxp-soclib.[ch]
+F:	drivers/soc/hpe/gxp-srom.c
 F:	drivers/spi/spi-gxp.c
 F:	drivers/watchdog/gxp-wdt.c
 
-- 
2.17.1

