Return-Path: <SRS0=1ZhM=BW=foss.st.com=prvs=45170c5eae=alexandre.torgue@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32CC8C7EE29
	for <soc@archiver.kernel.org>; Fri,  2 Jun 2023 13:31:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 19F66C433EF; Fri,  2 Jun 2023 13:31:20 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 83E0DC433D2;
	Fri,  2 Jun 2023 13:31:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 83E0DC433D2
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 352BikPi001501;
	Fri, 2 Jun 2023 15:31:13 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=selector1;
 bh=SEnLjI1iAJ0BEpP1paBgUZKIcQgTv9KF2fDW8DrAk08=;
 b=xLltTGXldgai/457X8tQ4WXQ2qbQCiCK0w6103nkKKp34kBNl9chpQJcF1clZLoLTM/n
 +VpR3j8L7VVAftiQv51I+KX5rX1ON0Oua5p+YkezobTllzhMW8Yq6yJMoVsYLiP+mc6E
 rGlzwK2Zq61TxnNQCXBBsFMWxoc7nFJeP0c7Wk/QQou0FYtalPfpRYQwaw9cbwO6qXER
 XWXXOnyLPUMSGIAbaMH0U1hniqnpBIhwbjCeMWv/O54oufTLHEJaLU/qD0E4dQeNHeL3
 oWy9IK78QTV0m1Ua/Oi6mk6rt4/ahKpqaSFSqTFNt5kmb8SQlJheOQDBPnSeGQNVpPLG KQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3qweqeph6a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 02 Jun 2023 15:31:13 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 1FC6610002A;
	Fri,  2 Jun 2023 15:31:13 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 17238236954;
	Fri,  2 Jun 2023 15:31:13 +0200 (CEST)
Received: from localhost (10.201.21.93) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Fri, 2 Jun
 2023 15:31:12 +0200
From: Alexandre Torgue <alexandre.torgue@foss.st.com>
List-Id: <soc.lore.kernel.org>
To: <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Catalin
 Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Arnd
 Bergmann <arnd@arndb.de>,
        Olof Johansson <olof@lixom.net>, <soc@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-kernel@vger.kernel.org>, <linux-gpio@vger.kernel.org>
Subject: [PATCH v2 10/10] MAINTAINERS: add entry for ARM/STM32 ARCHITECTURE
Date: Fri, 2 Jun 2023 15:28:59 +0200
Message-ID: <20230602132859.16442-11-alexandre.torgue@foss.st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230602132859.16442-1-alexandre.torgue@foss.st.com>
References: <20230602132859.16442-1-alexandre.torgue@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.201.21.93]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-06-02_10,2023-06-02_02,2023-05-22_02

STM32 SoCs based on Armv8 have been added to the STM32 family. Those new
SoCs are maintained as legacy STM32 MPU.

Signed-off-by: Alexandre Torgue <alexandre.torgue@foss.st.com>

diff --git a/MAINTAINERS b/MAINTAINERS
index 7e0b87d5aa2e..06759396e220 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2849,6 +2849,7 @@ T:	git git://git.kernel.org/pub/scm/linux/kernel/git/atorgue/stm32.git stm32-nex
 F:	arch/arm/boot/dts/stm32*
 F:	arch/arm/mach-stm32/
 F:	drivers/clocksource/armv7m_systick.c
+F:	arch/arm64/boot/dts/st/
 N:	stm32
 N:	stm
 
-- 
2.17.1

