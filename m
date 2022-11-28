Return-Path: <SRS0=c8/2=34=foss.st.com=prvs=8331b3624e=alexandre.torgue@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9B8CC43217
	for <soc@archiver.kernel.org>; Mon, 28 Nov 2022 13:33:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id A1E6DC433D6; Mon, 28 Nov 2022 13:33:54 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 28220C433C1;
	Mon, 28 Nov 2022 13:33:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 28220C433C1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2ASDG65D016777;
	Mon, 28 Nov 2022 14:33:45 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=selector1;
 bh=jYMbD/1k03Hl6hLPeOod/Pa/2dM12syhuqqVjWA3PiE=;
 b=X30ycP5W6M94XynFLTjvPZcc72VZ4idhFCnrG5rSkZHzTj3CURZYA/3Bvap4Tn4l5fOZ
 kgHwV0lqyTvpy/v3HDvu9b+1vZlcBPD/z9cGO3qelHJJvz4TN+fEkApnlC8y0jCmqKl/
 gAPCcazCHhNDbkkVtCx/zP7LSahRXBSFKKCxZovQC+MiEfQtMo42bOBa1Uh3qyPozG1J
 bqWTtA8VYV1+7ij0FBE4GbTH4vzphIxrZ1cRcECGfawGW0NBwyDbZYaUCDJ5OvKXeyt4
 zV200ndNQz3tRhAQLfApBIgj+4j8GFNE/KftxGGiqlQFV/8SNY86KNnwHWWXrJ6eKfbB KQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3m3b16k74e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 28 Nov 2022 14:33:45 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id CFC21100034;
	Mon, 28 Nov 2022 14:33:40 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 8193721FEAB;
	Mon, 28 Nov 2022 14:33:40 +0100 (CET)
Received: from localhost (10.201.21.93) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.13; Mon, 28 Nov
 2022 14:33:40 +0100
From: Alexandre Torgue <alexandre.torgue@foss.st.com>
List-Id: <soc.lore.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
        Kevin
 Hilman <khilman@baylibre.com>, <soc@kernel.org>,
        <arm@kernel.org>
CC: Alexandre Torgue <alexandre.torgue@foss.st.com>
Subject: [PATCH] Revert "ARM: dts: stm32: add fake interrupt propoerty for ASync notif - TEMP/TO REMOVE"
Date: Mon, 28 Nov 2022 14:33:39 +0100
Message-ID: <20221128133339.25055-1-alexandre.torgue@foss.st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.201.21.93]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-28_11,2022-11-28_02,2022-06-22_01

This reverts commit fb4ce97d9c5daafe100a83670c697b92c9d1bb45.

Signed-off-by: Alexandre Torgue <alexandre.torgue@foss.st.com>

---

Hi,

Sorry but I need to revert this patch which has been added to my 
DT for 6.2 PR by mistake.

Thanks
Alex

diff --git a/arch/arm/boot/dts/stm32mp131.dtsi b/arch/arm/boot/dts/stm32mp131.dtsi
index 2a9b3a5bba83..accc3824f7e9 100644
--- a/arch/arm/boot/dts/stm32mp131.dtsi
+++ b/arch/arm/boot/dts/stm32mp131.dtsi
@@ -33,8 +33,6 @@
 		optee {
 			method = "smc";
 			compatible = "linaro,optee-tz";
-			interrupt-parent = <&intc>;
-			interrupts = <GIC_SPI 134 IRQ_TYPE_LEVEL_HIGH>;
 		};
 
 		scmi: scmi {
-- 
2.17.1

