Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F573198A31
	for <soc@lists.linux.dev>; Thu, 19 Dec 2024 17:32:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734629544; cv=none; b=YbHNol/QOnrUTWJHMfgCBicf1yuCWhbqvs1HUnclbVtwjfrpua7CZrNRYYsLRDpkD2cMMpPSgff7hF0C6vOLQAcyPuu03yomHwE7cxaaI6D6iZgY33ENBX1hX0Lvrezx/Wyh1XqID8IkVE+zOOXVxGcq0VeNqGbSat9VgflL78c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734629544; c=relaxed/simple;
	bh=Z4MLZs+M8BWC86188Uz7VOB/n4dsyjxNLyfHy/W2qj4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PRCwIpZ6nDJ2XyKZHb6XA5r7/J95sl+3axwTqAu2rDyYY0L52hNWBJOhcbEp3sxAkU6w0LbEiPVjPuxbApRuZ4+vqZTUDwhEhsK1SLyFMQ+G/D6+9tJY4ddfEA/9T7kwfX3yrrGh4oj85FL694Y3YdT//orlrvtVMQjVnxBlVaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=1BU14NCk; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="1BU14NCk"
Received: by smtp.kernel.org (Postfix)
	id D4237C4CED4; Thu, 19 Dec 2024 17:32:23 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 9892FC4CECE
	for <soc@kernel.org>; Thu, 19 Dec 2024 17:32:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 9892FC4CECE
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BJFYH5o028786;
	Thu, 19 Dec 2024 18:32:12 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	OhEhazfQaoKwlcX8v7ah8N4anF3ZrMyyBYixA4XGpv0=; b=1BU14NCkJf0oYjh+
	HV6wyoZhOVyXHUQU82ugYhGFhZ8+SuhH80jdRRvKJPm2BMy1l+AcduezT1xfBSRa
	LaH63IbZTUAykj+5FNF3bVjzB+QSXSQZre67RY4ejfBO/nPtPm5vqPLyK9UMsJo+
	VgJQRsEmw1LYtBmG+BKp4MC14mPRdZ8Jkxshpni9mADwqvmkdcXCF7Fq1gXOHfxM
	/d4Cn0aAPyyBS/5qztitlKEm+6w4lDscjaqPsc1ja+6q4/SWyz6eoEnW07Cx8Ql0
	3p0X7x/1CZKOoGfq3bjnCXqVP5H7g1AbvbT4FFMG5CfbUrClhtU3DjkU6VgDlInB
	M9jCtg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 43mp8b8dmm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 19 Dec 2024 18:32:12 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 5204D40051;
	Thu, 19 Dec 2024 18:31:06 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id C17D6285EB2;
	Thu, 19 Dec 2024 18:29:58 +0100 (CET)
Received: from localhost (10.48.87.62) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Thu, 19 Dec
 2024 18:29:58 +0100
From: <patrice.chotard@foss.st.com>
To: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
        Alexandre
 Torgue <alexandre.torgue@foss.st.com>,
        Russell King <linux@armlinux.org.uk>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Petr Mladek <pmladek@suse.com>, Yoann Congal <yoann.congal@smile.fr>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>, <soc@kernel.org>,
        Patrice Chotard
	<patrice.chotard@foss.st.com>
Subject: [PATCH 2/7] ARM: configs: stm32: Disable CONFIG_COMMON_CLK_STM32MP in STM32 defconfig
Date: Thu, 19 Dec 2024 18:29:29 +0100
Message-ID: <20241219172934.3010875-3-patrice.chotard@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241219172934.3010875-1-patrice.chotard@foss.st.com>
References: <20241219172934.3010875-1-patrice.chotard@foss.st.com>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SAFCAS1NODE2.st.com (10.75.90.13) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01

From: Patrice Chotard <patrice.chotard@foss.st.com>

As stm32_defconfig is dedicated to STM32 MCUs, disable
CONFIG_COMMON_CLK_STM32MP flag which is only used by STM32 MPUs.

Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
---
 arch/arm/configs/stm32_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/configs/stm32_defconfig b/arch/arm/configs/stm32_defconfig
index d62a0c0b7ce5..9262be1e7cf6 100644
--- a/arch/arm/configs/stm32_defconfig
+++ b/arch/arm/configs/stm32_defconfig
@@ -60,6 +60,7 @@ CONFIG_DMADEVICES=y
 CONFIG_STM32_DMA=y
 CONFIG_STM32_DMAMUX=y
 CONFIG_STM32_MDMA=y
+# CONFIG_COMMON_CLK_STM32MP is not set
 CONFIG_IIO=y
 CONFIG_STM32_ADC_CORE=y
 CONFIG_STM32_ADC=y
-- 
2.25.1

