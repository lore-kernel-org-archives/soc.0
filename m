Return-Path: <SRS0=5H41=56=foss.st.com=prvs=03972141f3=alexandre.torgue@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00D60C61DA4
	for <soc@archiver.kernel.org>; Thu,  2 Feb 2023 13:00:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id B525DC4339C; Thu,  2 Feb 2023 13:00:55 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 6A42CC4339B;
	Thu,  2 Feb 2023 13:00:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 6A42CC4339B
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3129EOgL027466;
	Thu, 2 Feb 2023 14:00:41 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=selector1;
 bh=u6Sfj6y+BYeKwXO39zfhBoo1IC3Sbmfpecpz+Oswch0=;
 b=Fu9Tgp2ReVj7DgrMVrSGZoeNurG3qvvqoXkiYjF1XmogeWWJ85KbS43bQB3i2u2G0xyg
 Rzl7tPOV55HljHog8duSuf/vuDPnibl5E7VIP307eLg8T+/w5ta5WWpsek2Mt8mTXLgA
 Rs1uQkJKVr478HXTHupWhstYbnyIlmUGYtvNYFkbfth6Q0Ii6DM0kdOhlRBKCUOeyjej
 /EoiSFAwjHrUqEjV8+DDTdiRc1nsLicUDSzqvVl7F6lj2SEPCCLeqyLg3YmErTidapfg
 96OXU8DZut4hoYQB0ALu1U1VB28eXmDnrc1Wf5sDaQYCjg9PgxRZKBVUsrwawrBZHiru 9Q== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3nfny582u0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 02 Feb 2023 14:00:41 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 8C96210002A;
	Thu,  2 Feb 2023 14:00:40 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 8763F218601;
	Thu,  2 Feb 2023 14:00:40 +0100 (CET)
Received: from localhost (10.201.21.93) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.13; Thu, 2 Feb
 2023 14:00:40 +0100
From: Alexandre Torgue <alexandre.torgue@foss.st.com>
List-Id: <soc.lore.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
        Kevin
 Hilman <khilman@baylibre.com>, <soc@kernel.org>,
        <arm@kernel.org>
CC: Alexandre Torgue <alexandre.torgue@foss.st.com>
Subject: [PATCH] ARM: configs: multi_v7: enable NVMEM driver for STM32
Date: Thu, 2 Feb 2023 14:00:40 +0100
Message-ID: <20230202130040.25233-1-alexandre.torgue@foss.st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.201.21.93]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-02-02_04,2023-02-02_01,2022-06-22_01

From: Patrick Delaunay <patrick.delaunay@foss.st.com>

Enable the STMicroelectronics NVMEM drivers used on
STM32 MPU, STM32MP15x and STM32MP13x, to access OTPs.

Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
Signed-off-by: Alexandre Torgue <alexandre.torgue@foss.st.com>

---

Hi ARM SoC maintainers,

This is the only patch I have for v6.3.

Cheers
Alex


diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi_v7_defconfig
index ee184eb37adc..42c19ffb361e 100644
--- a/arch/arm/configs/multi_v7_defconfig
+++ b/arch/arm/configs/multi_v7_defconfig
@@ -1192,6 +1192,7 @@ CONFIG_RAS=y
 CONFIG_NVMEM_IMX_OCOTP=y
 CONFIG_NVMEM_QCOM_QFPROM=y
 CONFIG_NVMEM_ROCKCHIP_EFUSE=m
+CONFIG_NVMEM_STM32_ROMEM=m
 CONFIG_NVMEM_SUNXI_SID=y
 CONFIG_NVMEM_VF610_OCOTP=y
 CONFIG_NVMEM_MESON_MX_EFUSE=m
-- 
2.17.1

