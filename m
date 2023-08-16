Return-Path: <SRS0=R1Kc=EB=foss.st.com=prvs=6592f3dbca=alexandre.torgue@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E786FC04A6A
	for <soc@archiver.kernel.org>; Wed, 16 Aug 2023 12:31:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id B4A7BC433C9; Wed, 16 Aug 2023 12:31:07 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id ECF4FC433CB;
	Wed, 16 Aug 2023 12:31:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org ECF4FC433CB
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 37G9Hakp006726;
	Wed, 16 Aug 2023 14:30:56 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	from:to:cc:subject:date:message-id:mime-version:content-type; s=
	selector1; bh=aQ3Oy5IRnhLF7BGSXUN6xvsS6Hh9KWmB45eVliqlAwE=; b=vb
	vx0kw0DpPrdWgbRT67KBiMwGZ+LTnTyfdMdiZTJ9AkUBOvcUx5v5gLYlBM0B7ifz
	yK/SrZTiUjzOEx19EmBlOb3XorBMw3M/nBr3wGB+kbi3bveRXVc/7CYcOpVUYRwh
	TX/rpQ0KIZhtu9kM5Be5skn+cuX7obZvldjYSCo7Mm7A4nrswHotmcTtTG6QPEM6
	SU/n6ogYIMw3yvVBKzLLWEpmxqzAq+xVaagV17eWM73SMgQ3NvfQCaRk66Kw1Igw
	rMXDUK4gzm9QLgb1ar6MLMIuhP2eDL5AyFoL/ZAh+mznMK4asEoNGfuKC0LmGCYV
	FF7j3TdE+OhlR6szaIBw==
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3sgupts3pm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 16 Aug 2023 14:30:56 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id EC78F100061;
	Wed, 16 Aug 2023 14:30:55 +0200 (CEST)
Received: from Webmail-eu.st.com (eqndag1node4.st.com [10.75.129.133])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id E5A3B237D62;
	Wed, 16 Aug 2023 14:30:55 +0200 (CEST)
Received: from localhost (10.201.21.122) by EQNDAG1NODE4.st.com
 (10.75.129.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Wed, 16 Aug
 2023 14:30:55 +0200
From: Alexandre Torgue <alexandre.torgue@foss.st.com>
List-Id: <soc.lore.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
        Kevin
 Hilman <khilman@baylibre.com>, <soc@kernel.org>,
        <arm@kernel.org>
CC: Alexandre Torgue <alexandre.torgue@foss.st.com>
Subject: [PATCH] ARM: multi_v7_defconfig: Add SCMI regulator support
Date: Wed, 16 Aug 2023 14:30:55 +0200
Message-ID: <20230816123055.12636-1-alexandre.torgue@foss.st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.201.21.122]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To EQNDAG1NODE4.st.com
 (10.75.129.133)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-08-16_11,2023-08-15_02,2023-05-22_02

From: Pascal Paillet <p.paillet@foss.st.com>

SCMI regulators are used in the ARMv7 STMicrolectronics stm32mp boards:
- for STM32MP13: stm32mp135f-dk
- for STM32MP15 boards with SCMI variant, introduced by commit 5b7e58313a77
  ("ARM: dts: stm32: Add SCMI version of STM32 boards (DK1/DK2/ED1/EV1)")
  * stm32mp157c-ev1-scmi
  * stm32mp157c-ed1-scmi
  * stm32mp157c-dk2-scmi
  * stm32mp157a-dk1-scmi

Signed-off-by: Pascal Paillet <p.paillet@foss.st.com>
Signed-off-by: Alexandre Torgue <alexandre.torgue@foss.st.com>

---

Hi ARM SoC maintainers,

This is the only patch I have for v6.6.

Cheers
Alex

diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi_v7_defconfig
index f0800f806b5f..3ec925725abb 100644
--- a/arch/arm/configs/multi_v7_defconfig
+++ b/arch/arm/configs/multi_v7_defconfig
@@ -613,6 +613,7 @@ CONFIG_REGULATOR_ACT8865=y
 CONFIG_REGULATOR_ACT8945A=y
 CONFIG_REGULATOR_ANATOP=y
 CONFIG_REGULATOR_AB8500=y
+CONFIG_REGULATOR_ARM_SCMI=y
 CONFIG_REGULATOR_AS3711=y
 CONFIG_REGULATOR_AS3722=y
 CONFIG_REGULATOR_AXP20X=y
-- 
2.17.1

