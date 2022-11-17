Return-Path: <SRS0=KQo7=3R=foss.st.com=prvs=73200a0741=alexandre.torgue@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A7F5C433FE
	for <soc@archiver.kernel.org>; Thu, 17 Nov 2022 10:39:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 50CD6C433B5; Thu, 17 Nov 2022 10:39:45 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 0BE3FC433D7;
	Thu, 17 Nov 2022 10:39:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 0BE3FC433D7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2AH9Shhe012367;
	Thu, 17 Nov 2022 11:39:36 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=selector1;
 bh=EXvlua3C0YsN3Tv4O/Kaf4pDmpMUiAaTTPGAzHT2nzI=;
 b=aYbv3L3M8+XdjwRUpZznBuNYbDn5AMkJjWDoISjZpIkXY08Tj2QeQQlbLBeutB4SsPqg
 75yhPxULbwm4pjpsZ0K0x2kF0eKcYe15mcdldDdVnj3wFfuAgkBsnaZlm/VXB988cYLL
 eB8BzyaRYbNUb0sr7pT5FVgSru5z4VQ24rPEiMf0wYL6zW/WoSacBQfjQCHJoBcRlnqy
 GhQCS1GaDfzjWz/Wwvek30rUqWlQjlcg91PBeFX1bdtvw9pz+xxfFkau17ZHstbqZb4I
 g4dJPvFLd7d2JcdLOv2dcsHRhXhMHXSIIePvAj78q60uE9FCgqmc584wRrSyJe4cIVK6 9g== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3kv9ydp8pp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 17 Nov 2022 11:39:36 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 2591B10003D;
	Thu, 17 Nov 2022 11:39:32 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 1F63321B531;
	Thu, 17 Nov 2022 11:39:32 +0100 (CET)
Received: from localhost (10.201.21.93) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.32; Thu, 17 Nov
 2022 11:39:31 +0100
From: Alexandre Torgue <alexandre.torgue@foss.st.com>
List-Id: <soc.lore.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
        Kevin
 Hilman <khilman@baylibre.com>, <soc@kernel.org>,
        <arm@kernel.org>
CC: Alexandre Torgue <alexandre.torgue@foss.st.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-stm32@st-md-mailman.stormreply.com>
Subject: [PATCH] ARM: multi_v7_defconfig: enable Type-C UCSI and STM32G0 as modules
Date: Thu, 17 Nov 2022 11:39:31 +0100
Message-ID: <20221117103931.26174-1-alexandre.torgue@foss.st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.201.21.93]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-17_06,2022-11-17_01,2022-06-22_01

From: Fabrice Gasnier <fabrice.gasnier@foss.st.com>

Enable the USB Type-C UCSI, and the STM32G0 UCSI drivers as modules, since
used on STM32MP13 board.

Signed-off-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Signed-off-by: Alexandre Torgue <alexandre.torgue@foss.st.com>

---

Hi ARM SoC maintainers,

Please consider this patch as STM32 configs updates for v6.2.

Thanks
Alex 

diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi_v7_defconfig
index b61b2e3d116b..2b1de08b057e 100644
--- a/arch/arm/configs/multi_v7_defconfig
+++ b/arch/arm/configs/multi_v7_defconfig
@@ -891,6 +891,8 @@ CONFIG_USB_CONFIGFS_F_UVC=y
 CONFIG_USB_CONFIGFS_F_PRINTER=y
 CONFIG_USB_ETH=m
 CONFIG_TYPEC=m
+CONFIG_TYPEC_UCSI=m
+CONFIG_UCSI_STM32G0=m
 CONFIG_TYPEC_STUSB160X=m
 CONFIG_MMC=y
 CONFIG_MMC_BLOCK_MINORS=16
-- 
2.17.1

