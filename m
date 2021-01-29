Return-Path: <SRS0=PP6i=HA=foss.st.com=alexandre.torgue@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A9F1C433E0
	for <soc@archiver.kernel.org>; Fri, 29 Jan 2021 08:48:48 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id C513164E0D; Fri, 29 Jan 2021 08:48:47 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C807D64DEB;
	Fri, 29 Jan 2021 08:48:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C807D64DEB
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=alexandre.torgue@foss.st.com
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 10T8g12F019183;
	Fri, 29 Jan 2021 09:48:43 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=selector1;
 bh=Y4R51dVXYytMnFJd2sUfWLMCXjGfjNB5brYNmHLmDQk=;
 b=Yq/PxWDu5sf7DH0+reXTpSM3J9xRUoGahlkRq5Zdr8e4DNjzFoojVhMQuS0mY7fkEkjl
 n97cBZeDVEMWLF2wo0U4BmPwl1ySvrU7E3lfENqOtcWJk8d7RamdhRXf/9pkYZVrj/VM
 gw9sja9qfckbY3a2zZyC8ThElzBxcHcH98ZRE6n3rmmcq2bYl0jSZv9KJONmgsyd7BwK
 FX/cUYTooMEOtTJiZAp/b25dWuZXlb0YW1filO5w6+jLirVZvFU6/JeM4pjtzVLJ7ZsJ
 qsfiYiU3g9keIipg6I1JKjqHcOwXpt1fm0Zmj4aVfD0DAxMXklLvE966rIMqwSCz0GDe Vg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
	by mx07-00178001.pphosted.com with ESMTP id 3689tec64r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 29 Jan 2021 09:48:43 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id F1A5310002A;
	Fri, 29 Jan 2021 09:48:42 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id E1408221793;
	Fri, 29 Jan 2021 09:48:42 +0100 (CET)
Received: from localhost (10.75.127.48) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 29 Jan 2021 09:48:42
 +0100
From: Alexandre Torgue <alexandre.torgue@foss.st.com>
List-Id: <soc.lore.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
        Kevin
 Hilman <khilman@baylibre.com>,
        <linux-arm-kernel@lists.infradead.org>, <soc@kernel.org>,
        <arm@kernel.org>
CC: Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue
	<alexandre.torgue@foss.st.com>
Subject: [PATCH] ARM: multi_v7_defconfig: add STM32 CEC support
Date: Fri, 29 Jan 2021 09:48:42 +0100
Message-ID: <20210129084842.29123-1-alexandre.torgue@foss.st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG3NODE2.st.com (10.75.127.8) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343,18.0.737
 definitions=2021-01-29_03:2021-01-28,2021-01-29 signatures=0

From: Yannick Fertre <yannick.fertre@foss.st.com>

Enable CEC support for STMicroelectronics as loadable module.

Signed-off-by: Yannick Fertre <yannick.fertre@foss.st.com>
Signed-off-by: Alexandre Torgue <alexandre.torgue@foss.st.com>

---

Hi,

I only have this patch for stm32 config v5.12 PR. Can you merge it please ?

Thanks
Alex

diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi_v7_defconfig
index c5f25710fedc..05cc0607a9ad 100644
--- a/arch/arm/configs/multi_v7_defconfig
+++ b/arch/arm/configs/multi_v7_defconfig
@@ -656,6 +656,7 @@ CONFIG_V4L_TEST_DRIVERS=y
 CONFIG_VIDEO_VIVID=m
 CONFIG_CEC_PLATFORM_DRIVERS=y
 CONFIG_CEC_SAMSUNG_S5P=m
+CONFIG_CEC_STM32=m
 CONFIG_VIDEO_ADV7180=m
 CONFIG_VIDEO_ADV7604=m
 CONFIG_VIDEO_ADV7604_CEC=y
-- 
2.17.1

