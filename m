Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AE1A7D07D
	for <soc@lists.linux.dev>; Fri, 20 Dec 2024 12:57:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734699433; cv=none; b=I0fL/+cUdxSrLgu4N1w265+aoM2M9AHF9GJAx/aPg3Ons4sgDWedUPpMuq6Tvn/PtbT7XlOX+f+Sb2gloYmjq89JVVe4WcgwTa6VWvVrpQQEsfk6HIc7+1zNlEnlY0amQpNVdkI8UrcG3WWSgSKvIWFRSrFA+p50Pkue6HBvl1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734699433; c=relaxed/simple;
	bh=gzi2CxFDQdCbQ1AYLAPmzDaSmgsV01ClmPgXfPrEu9k=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=D1ieFddgPUof9Wfv8SooHZwx/QYPl7wUPE9+2GFFBMJAW+9FdVEbsYijHsD6Bdp0dULcF76jlKowAaqyTDId06H4m/Wz6hEXsfxONIgHxkpzXbk77UflX93SKWtzavSvZOKmjPYuWCxsdCl5+XovWa3MMhPgoPyArDHq8jf5ka8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=ZMW1iKsO; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="ZMW1iKsO"
Received: by smtp.kernel.org (Postfix)
	id 8E696C4CECD; Fri, 20 Dec 2024 12:57:13 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 5684DC4AF0B
	for <soc@kernel.org>; Fri, 20 Dec 2024 12:57:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 5684DC4AF0B
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BKBdHpJ005350;
	Fri, 20 Dec 2024 13:57:01 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	gf94z3PIFbHYymMM5mkmDn7wyg3IsJqIi74hdr2FxBI=; b=ZMW1iKsO/3SQBomK
	pKNWXjbu9vcyHGqtuZCpYu6q/COiXx4flHrI6zXsON0N7IPetEIArCo0qzNxKlaQ
	Y020C/K8QwXag+G+lzxwPbRHDw+Kby2F21mcg9aB7UoROdwwYS9x5gzBIti2WpJx
	4uvaCTob/C5/lvvfHUNKm/1mX+lp0KoLMf/0moQm8QLSlgmVRED6wRUsodH/2p85
	QayThQLslGIeGclr1RQI10a7oGFLwMh8+bgtPInxjNB66lnfDyFH/a2IP4F9FALb
	FrLTStcdVQqM6K9xMcGUL3V9gukKVVADYzjOCalod90i0Bod+HHmLVD1uJd3vDhA
	bbZ29w==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 43n4vu1b29-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 20 Dec 2024 13:57:01 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id E15E240054;
	Fri, 20 Dec 2024 13:55:53 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 33CE227665F;
	Fri, 20 Dec 2024 13:55:13 +0100 (CET)
Received: from localhost (10.48.87.62) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Fri, 20 Dec
 2024 13:55:12 +0100
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
Subject: [PATCH v2 4/4] ARM: configs: stm32: Remove useless flags in STM32 defconfig
Date: Fri, 20 Dec 2024 13:55:06 +0100
Message-ID: <20241220125506.3157268-5-patrice.chotard@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241220125506.3157268-1-patrice.chotard@foss.st.com>
References: <20241220125506.3157268-1-patrice.chotard@foss.st.com>
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

Disable CONFIG_SUSPEND, CONFIG_ADVISE_SYSCALLS, CONFIG_IO_URING
CONFIG_POSIX_TIMERS, CONFIG_GCC_PLUGINS, it will reduce the kernel
image size for these platforms which embed a low amount of memory.

Tested on STM32F746-DISCO board which embeds 8MB of memory.

Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
---
 arch/arm/configs/stm32_defconfig | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm/configs/stm32_defconfig b/arch/arm/configs/stm32_defconfig
index d62a0c0b7ce5..77048b5e1ec4 100644
--- a/arch/arm/configs/stm32_defconfig
+++ b/arch/arm/configs/stm32_defconfig
@@ -6,12 +6,15 @@ CONFIG_BLK_DEV_INITRD=y
 CONFIG_CC_OPTIMIZE_FOR_SIZE=y
 CONFIG_EXPERT=y
 # CONFIG_UID16 is not set
+# CONFIG_POSIX_TIMERS is not set
 CONFIG_BASE_SMALL=y
 # CONFIG_FUTEX is not set
 # CONFIG_EPOLL is not set
 # CONFIG_SIGNALFD is not set
 # CONFIG_EVENTFD is not set
 # CONFIG_AIO is not set
+# CONFIG_IO_URING is not set
+# CONFIG_ADVISE_SYSCALLS is not set
 # CONFIG_MMU is not set
 CONFIG_ARCH_STM32=y
 CONFIG_CPU_V7M_NUM_IRQ=240
@@ -20,6 +23,8 @@ CONFIG_DRAM_BASE=0x90000000
 # CONFIG_ATAGS is not set
 CONFIG_XIP_KERNEL=y
 CONFIG_XIP_PHYS_ADDR=0x08008000
+# CONFIG_SUSPEND is not set
+# CONFIG_GCC_PLUGINS is not set
 CONFIG_BINFMT_FLAT=y
 # CONFIG_COREDUMP is not set
 # CONFIG_VM_EVENT_COUNTERS is not set
@@ -60,6 +65,7 @@ CONFIG_DMADEVICES=y
 CONFIG_STM32_DMA=y
 CONFIG_STM32_DMAMUX=y
 CONFIG_STM32_MDMA=y
+# CONFIG_COMMON_CLK_STM32MP is not set
 CONFIG_IIO=y
 CONFIG_STM32_ADC_CORE=y
 CONFIG_STM32_ADC=y
-- 
2.25.1

