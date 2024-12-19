Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCBF219CD1E
	for <soc@lists.linux.dev>; Thu, 19 Dec 2024 17:32:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734629561; cv=none; b=XmibrKdYis4U2/rUACGhazHkX2+S/+MNsPmDPyigqivaskRf0cDCc7J3gWBngWES7A2tQRuCYfvM4maLgVfpVDlA2onJKHZmQ4pZv8ympNnrsqi092KYn4562Xx9m7O32GZxPFBRKhOS/ezZHm+opR2YFhvGoVnN0QdphznMxKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734629561; c=relaxed/simple;
	bh=FlYwoCPiWOJAw1qZC49A0ee5OZAzOfjgs0cxhdlVUNA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KN+EEjX51VJ41XlQLwLgFnBM0o91Dh4sW9ClWPRmRH5mzydtAnZ6Yf53X1ZlMAwmrzfotppqE9llX8jJRIJY58j3CfAufUDS+/SydEy4a3QiPfQBig8VokBkrLdeTX90Nk+ePUdIIi4bDlD0EjkIPUYzfCD38N0G2DjeWlgB3aA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=JnStwR6V; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="JnStwR6V"
Received: by smtp.kernel.org (Postfix)
	id 804D9C4CED0; Thu, 19 Dec 2024 17:32:40 +0000 (UTC)
Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id AF57EC4AF09
	for <soc@kernel.org>; Thu, 19 Dec 2024 17:32:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org AF57EC4AF09
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BJD57pO023671;
	Thu, 19 Dec 2024 18:32:32 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	8QjQJo0IASjGQ71YyUkuwEl4QEQBkgl8EgGu9PNaoxQ=; b=JnStwR6VczyKl0+u
	STwY+qfYMV6AAzsVelVTMg5azwoa7Pe0HJbdmKG38pTZ8WmGy8Qs5O7NzO7sUDCx
	r7x8ZZwBh7KjF9jGWSd3sySiewaROx3vjjOgVLESJ35lJZgBuRKjf5jns24P3ekG
	cIanh3AnCMr8CKDfm4Px0h6wF81mlU+M19eIuXOUJPY+XMFtA6cLrxavMomTMr7V
	QPYxJhlycHGH6e4crpdejWKi3Q2JhfZQ7K4ti90DhdBWD04R2T3Zo+3Nymo0nV3r
	oY48xYH30bn9I7ImXeei4rovSIi0gRvrp3l/+O4Dc+ivBOc91bV9C2aBKzg/BzE/
	Yua9Og==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 43mm2g9183-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 19 Dec 2024 18:32:32 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 5229C40054;
	Thu, 19 Dec 2024 18:31:06 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 187B2285EAC;
	Thu, 19 Dec 2024 18:29:58 +0100 (CET)
Received: from localhost (10.48.87.62) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Thu, 19 Dec
 2024 18:29:57 +0100
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
Subject: [PATCH 1/7] ARM: configs: stm32: run savedefconfig for STM32 defconfig
Date: Thu, 19 Dec 2024 18:29:28 +0100
Message-ID: <20241219172934.3010875-2-patrice.chotard@foss.st.com>
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

Run 'make savedefconfig' in order to clean stm32_defconfig.

Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
---
 arch/arm/configs/stm32_defconfig | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/arch/arm/configs/stm32_defconfig b/arch/arm/configs/stm32_defconfig
index 3baec075d1ef..d62a0c0b7ce5 100644
--- a/arch/arm/configs/stm32_defconfig
+++ b/arch/arm/configs/stm32_defconfig
@@ -12,14 +12,11 @@ CONFIG_BASE_SMALL=y
 # CONFIG_SIGNALFD is not set
 # CONFIG_EVENTFD is not set
 # CONFIG_AIO is not set
-# CONFIG_BLK_DEV_BSG is not set
 # CONFIG_MMU is not set
 CONFIG_ARCH_STM32=y
 CONFIG_CPU_V7M_NUM_IRQ=240
 CONFIG_SET_MEM_PARAM=y
 CONFIG_DRAM_BASE=0x90000000
-CONFIG_FLASH_MEM_BASE=0x08000000
-CONFIG_FLASH_SIZE=0x00200000
 # CONFIG_ATAGS is not set
 CONFIG_XIP_KERNEL=y
 CONFIG_XIP_PHYS_ADDR=0x08008000
@@ -74,10 +71,7 @@ CONFIG_NLS=y
 CONFIG_CRC_ITU_T=y
 CONFIG_CRC7=y
 CONFIG_PRINTK_TIME=y
-# CONFIG_ENABLE_MUST_CHECK is not set
 # CONFIG_DEBUG_BUGVERBOSE is not set
 CONFIG_DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT=y
 CONFIG_MAGIC_SYSRQ=y
 # CONFIG_SLUB_DEBUG is not set
-# CONFIG_SCHED_DEBUG is not set
-CONFIG_CRYPTO=y
-- 
2.25.1

