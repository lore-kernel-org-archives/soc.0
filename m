Return-Path: <SRS0=INbW=5H=hpe.com=prvs=03745b4215=clayc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78A87C61DB3
	for <soc@archiver.kernel.org>; Tue, 10 Jan 2023 04:26:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 61DC8C433F0; Tue, 10 Jan 2023 04:26:04 +0000 (UTC)
Received: from mx0a-002e3701.pphosted.com (mx0a-002e3701.pphosted.com [148.163.147.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 57C90C433EF;
	Tue, 10 Jan 2023 04:26:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 57C90C433EF
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=hpe.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=hpe.com
Received: from pps.filterd (m0134421.ppops.net [127.0.0.1])
	by mx0b-002e3701.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 30A0nD1h003597;
	Tue, 10 Jan 2023 04:25:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hpe.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references; s=pps0720;
 bh=eJWRKFD9z7plkN6elhB+a1yxixq+W/JZIKNF2DtUM2M=;
 b=H1WPde8lyAy2Xb3TUkFlxhQVz6tAFkBPj2Fy0MeyyOfEQVNVi1t/Bu6SwgRpoH2OIb+f
 F+3c6vmNMLi6NJ3dp8rNYV6Q+07xeQ6x2fq4HqeYmp2Alao6LkE+YCKgRBdH4Hbwi/Ub
 KlLy1iR++MyIXusxvsWPysec0N//WUhUc4SHwtkpRhlh6gn/TCyKwyNoS5ydSJOJ4uve
 oaWTv6NdJu7Oy1DlyxkPN/oSgO3rMFfQwKWYob+RYhGDYwJQWxW+Y0B1k1+LKgKHpWRg
 3wQHAsIrQr0tXJE1GAi2lzPQrcxgIGO3HkQtg8TWVIqyWrojlSsWvFun7U9B5pnlVPPe CA== 
Received: from p1lg14879.it.hpe.com (p1lg14879.it.hpe.com [16.230.97.200])
	by mx0b-002e3701.pphosted.com (PPS) with ESMTPS id 3n0wt814kb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 10 Jan 2023 04:25:58 +0000
Received: from p1lg14886.dc01.its.hpecorp.net (unknown [10.119.18.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by p1lg14879.it.hpe.com (Postfix) with ESMTPS id 9BE75310C4;
	Tue, 10 Jan 2023 04:25:57 +0000 (UTC)
Received: from openbmc-dev.hpecorp.net (unknown [16.231.227.36])
	by p1lg14886.dc01.its.hpecorp.net (Postfix) with ESMTP id E80AF80C76A;
	Tue, 10 Jan 2023 04:25:53 +0000 (UTC)
From: clayc@hpe.com
List-Id: <soc.lore.kernel.org>
To: linux-kernel@vger.kernel.org, soc@kernel.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        verdun@hpe.com, nick.hawkins@hpe.com, arnd@arndb.de,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        linux@armlinux.org.uk, olof@lixom.net
Cc: Clay Chang <clayc@hpe.com>
Subject: [PATCH 4/5] ARM: multi_v7_defconfig: Add GXP SROM Driver
Date: Tue, 10 Jan 2023 12:25:32 +0800
Message-Id: <20230110042533.12894-5-clayc@hpe.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230110042533.12894-1-clayc@hpe.com>
References: <20230110042533.12894-1-clayc@hpe.com>
X-Proofpoint-ORIG-GUID: NvDGkOUb1mry9b_b4wxgR0KE0AjaSFOw
X-Proofpoint-GUID: NvDGkOUb1mry9b_b4wxgR0KE0AjaSFOw
X-HPE-SCL: -1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2023-01-10_01,2023-01-09_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 priorityscore=1501 impostorscore=0 mlxscore=0 bulkscore=0 phishscore=0
 spamscore=0 suspectscore=0 clxscore=1015 mlxlogscore=634 malwarescore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301100026

From: Clay Chang <clayc@hpe.com>

Add the CONFIG_HPE_GXP_SROM and CONFIG_HPE_GXP_SOCLIB.

Signed-off-by: Clay Chang <clayc@hpe.com>
---
 arch/arm/configs/multi_v7_defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi_v7_defconfig
index ee184eb37adc..f50a3731b84c 100644
--- a/arch/arm/configs/multi_v7_defconfig
+++ b/arch/arm/configs/multi_v7_defconfig
@@ -1254,3 +1254,5 @@ CONFIG_CMA_SIZE_MBYTES=64
 CONFIG_PRINTK_TIME=y
 CONFIG_MAGIC_SYSRQ=y
 CONFIG_DEBUG_FS=y
+CONFIG_HPE_GXP_SOCLIB=m
+CONFIG_HPE_GXP_SROM=m
-- 
2.17.1

