Return-Path: <SRS0=eFGS=AE=foss.st.com=prvs=2467cd9a6c=alexandre.torgue@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56AE7C77B6C
	for <soc@archiver.kernel.org>; Thu, 13 Apr 2023 07:20:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 299ECC4339B; Thu, 13 Apr 2023 07:20:52 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 7B629C433D2;
	Thu, 13 Apr 2023 07:20:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 7B629C433D2
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 33D362rc001543;
	Thu, 13 Apr 2023 09:20:44 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=selector1;
 bh=KCHtImODWxl+dZ21buP7TYk1gatXq+K3qY4DhfMR30E=;
 b=wWDUICyhhVyLWja986M81NGkOSN48nirhC5ttSq1H0DcB01P4Ofioei5PI+20x1oiYez
 KI4riNGs+kBb2IFOSeYrtyQIb+Eil/0gt/akESaPCEl+M0Z4XXoXBGTa9Jean7lU77g2
 DmBES9+Ryr2HnQ0abs7fEwEqD/sCNA+/oY7TA9Y9i+Bhrw3M8f5RWopGrgqu7gVwR4+5
 gKWDio+s1EJqDuIOAhS5htN8VwCcxxUt3C2cGfVLcS1RMMRxK7enk4ZY44VWVIAFP4FM
 LXNJPQuZlrSaMWu1B3o7U3YFniQJAUsUiYtgEWcfxkHOdwi2jI1pG5dFkE/l3fgSMrnp jg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3pw8b0v169-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 13 Apr 2023 09:20:44 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 57D0910002A;
	Thu, 13 Apr 2023 09:20:43 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 28D4420F577;
	Thu, 13 Apr 2023 09:20:43 +0200 (CEST)
Received: from localhost (10.201.21.93) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Thu, 13 Apr
 2023 09:20:42 +0200
From: Alexandre Torgue <alexandre.torgue@foss.st.com>
List-Id: <soc.lore.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
        Kevin
 Hilman <khilman@baylibre.com>, <soc@kernel.org>,
        <arm@kernel.org>
CC: Alexandre Torgue <alexandre.torgue@foss.st.com>
Subject: [PATCH] ARM: multi_v7_defconfig: Add OPTEE support
Date: Thu, 13 Apr 2023 09:20:42 +0200
Message-ID: <20230413072042.30657-1-alexandre.torgue@foss.st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.201.21.93]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-13_04,2023-04-12_01,2023-02-09_01

STM32MP13 platform relies on OPTEE to boot: Clocks and regulators are
handled in the secure world by OPTEE and exported to the non secure world
(LINUX) thanks to ARM SCMI protocol.

Signed-off-by: Alexandre Torgue <alexandre.torgue@foss.st.com>

---

Hi ARM SoC maintainers,

This is the only patch I have for v6.4.

Cheers
Alex

diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi_v7_defconfig
index 084cc612ea23..7d0222f7d76b 100644
--- a/arch/arm/configs/multi_v7_defconfig
+++ b/arch/arm/configs/multi_v7_defconfig
@@ -1212,6 +1212,8 @@ CONFIG_FSI_MASTER_ASPEED=m
 CONFIG_FSI_SCOM=m
 CONFIG_FSI_SBEFIFO=m
 CONFIG_FSI_OCC=m
+CONFIG_TEE=y
+CONFIG_OPTEE=y
 CONFIG_INTERCONNECT_QCOM=y
 CONFIG_INTERCONNECT_QCOM_MSM8916=y
 CONFIG_COUNTER=m
-- 
2.17.1

