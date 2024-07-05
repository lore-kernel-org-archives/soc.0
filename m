Return-Path: <SRS0=oo5W=OF=foss.st.com=prvs=79166e676a=alexandre.torgue@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C6DFC38150
	for <soc@archiver.kernel.org>; Fri,  5 Jul 2024 13:44:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id EEEBDC32781; Fri,  5 Jul 2024 13:44:41 +0000 (UTC)
Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id A1BA2C116B1;
	Fri,  5 Jul 2024 13:44:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org A1BA2C116B1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 465C0JlQ027877;
	Fri, 5 Jul 2024 15:44:34 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=selector1; bh=/L3xKbgFs5G85oCfhak/ea
	VHmvMyZgDC7a4BndC5aZA=; b=UZeE2Pi/Cp8tMLPjLgPcV34Ozfgmxyd3k3T7ki
	/b6A3u49yXInR55VJdYXw8VoY74qvaOJVNEJcp4Qx3rXZCSxm2pYueei4LgqAcoC
	FT4AZmTbVmTdlZ1lRyaKfsO20enjt/MN1wuj0Y0Cos/Pd8qJgxudkVDQoTsouJqJ
	GpWvhwjddfz6ELYrkfhXkh96ze0z289KDXLAI/TevrBkhFfzk3uTlQWpRm3lbF6f
	ZxFsFnkxm235FYdyVVQcQNRdINWk/EhU+VmnlgP4lIg3tjzzGa0X5r3qV7TFBIQe
	gUqgJcpmnnTrUYNZteFzSybhXKj4wP+v3yLF/dquTKOE8WUg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 402w7jf95w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 05 Jul 2024 15:44:34 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 8682C40046;
	Fri,  5 Jul 2024 15:44:30 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id D6BAA2291A3;
	Fri,  5 Jul 2024 15:44:08 +0200 (CEST)
Received: from localhost (10.48.86.79) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Fri, 5 Jul
 2024 15:44:08 +0200
From: Alexandre Torgue <alexandre.torgue@foss.st.com>
List-Id: <soc.lore.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
        Kevin
 Hilman <khilman@baylibre.com>, <soc@kernel.org>,
        <arm@kernel.org>
CC: Alexandre Torgue <alexandre.torgue@foss.st.com>
Subject: [PATCH] ARM: multi_v7_defconfig: Add MCP23S08 pinctrl support
Date: Fri, 5 Jul 2024 15:44:07 +0200
Message-ID: <20240705134407.2833659-1-alexandre.torgue@foss.st.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.48.86.79]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-05_09,2024-07-05_01,2024-05-17_01

From: Christophe Roullier <christophe.roullier@foss.st.com>

Enable MCP23S08 I/O expanders to manage Ethernet PHY
reset in STM32MP135F-DK board.

Signed-off-by: Christophe Roullier <christophe.roullier@foss.st.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Alexandre Torgue <alexandre.torgue@foss.st.com>

---
Hi ARM SoC maintainers,

Please consider this first round of STM32 config for v6.11 cycle.

Thanks
Alex

diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi_v7_defconfig
index 86bf057ac366..62734530a3d6 100644
--- a/arch/arm/configs/multi_v7_defconfig
+++ b/arch/arm/configs/multi_v7_defconfig
@@ -469,6 +469,7 @@ CONFIG_SPI_XILINX=y
 CONFIG_SPI_SPIDEV=y
 CONFIG_SPMI=y
 CONFIG_PINCTRL_AS3722=y
+CONFIG_PINCTRL_MCP23S08=m
 CONFIG_PINCTRL_MICROCHIP_SGPIO=y
 CONFIG_PINCTRL_OCELOT=y
 CONFIG_PINCTRL_PALMAS=y
-- 
2.34.1

