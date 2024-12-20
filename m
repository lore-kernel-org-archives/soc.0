Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE07E211A3D
	for <soc@lists.linux.dev>; Fri, 20 Dec 2024 12:57:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734699433; cv=none; b=ZMvikxb4XOn/xchvGcyV+AHoKOyyw/iajrhKrgb5mKbIBZ/sdF12bVGtOW8b2+T6XCMEbYKUrRQWZMGeAjpL/HjkZDr4kxkZEeUtcRl+3NXBL2R9pD50NJouUuzydvf+s5lhdkKbJ0Ccz/ke/19Ng53fXEuT0gPec2MmnIB3ZsM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734699433; c=relaxed/simple;
	bh=v8pe1C462aV+fIG3zKXCiyEm9jqi4VSJIeaN+5T4Zms=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Tp31I4ohD/EEXqzJOXnVCBrePbnyQZEVGWgwfuxtvEGMX8Dh9IvAZFx/n+mi7Xczpdgk71tkZeBmn54EeCPxVAGJYdqBeI4vO6gMQ40uibTHJStukQhMWhwVWVuBE3Hv2xc0uGdBP3+RSPLIm0pXBx1c62WhaiXCkjKe9g2Axbg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=QJPTzdPP; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="QJPTzdPP"
Received: by smtp.kernel.org (Postfix)
	id B534DC4CEDD; Fri, 20 Dec 2024 12:57:12 +0000 (UTC)
Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 4D79BC4CECD
	for <soc@kernel.org>; Fri, 20 Dec 2024 12:57:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 4D79BC4CECD
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BKBdFeP004201;
	Fri, 20 Dec 2024 13:57:02 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	ZFQLjA+qCdmK/6bkXjOa7RkL7bqQFU/Akn66EgpB5fM=; b=QJPTzdPPboM5yU27
	HTlg80IHvZzQ1v7UG7kAe61SbepE8iTa56/Z9kiErjJp/RblZdl5SqLQ0owNANkR
	HBQ5MUtyfzCKBctJUZ8lL8SL0UDobHe3kewqT0Iyik7jOb0xkqvNXGHJMxMLla5w
	LDbpKi3fchPL8SLoUHfDaFJ/HAOx1D/EmEa7FrR2zZHMTwFpj2+1zvef0kgVWkj2
	OMfC6W63ygY3pMQ7Q2x5ZVzs6450b9qAOoTitQLyQX8goyPNYbUKrlpYgZDNSwQ6
	Sjaljdo8C+47VKFeB6c+E2BM/ShmL/vSsUBrxCajD5mWzCwo8rYvoABJ/LNFH7SX
	gPDMtw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 43n6dcrrk0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 20 Dec 2024 13:57:02 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 5ADCB40053;
	Fri, 20 Dec 2024 13:55:53 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id AB98F27665C;
	Fri, 20 Dec 2024 13:55:11 +0100 (CET)
Received: from localhost (10.48.87.62) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Fri, 20 Dec
 2024 13:55:11 +0100
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
Subject: [PATCH v2 2/4] ARM: configs: stm32: Clean STM32 defconfig
Date: Fri, 20 Dec 2024 13:55:04 +0100
Message-ID: <20241220125506.3157268-3-patrice.chotard@foss.st.com>
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

Running make savedefconfig highlights some useless flags.

Since 54a48aa3d558 ("Compiler Attributes: remove CONFIG_ENABLE_MUST_CHECK")
flag ENABLE_MUST_CHECK has been removed.

Since 35260cf54522 ("Kconfig.debug: fix SCHED_DEBUG dependency")
SCHED_DEBUG depends on DEBUG_KERNEL and PROC_FS.
As PROC_FS is not set, SCHED_DEBUG reference can be removed.

Since 78011042684d ("scsi: bsg: Move bsg_scsi_ops to drivers/scsi/")
BLK_DEV_BSG depends on SCSI. As SCSI is not set, BLK_DEV_BSG reference
can be removed.

Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
---
 arch/arm/configs/stm32_defconfig | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/arch/arm/configs/stm32_defconfig b/arch/arm/configs/stm32_defconfig
index 973bf7c8236b..be7b63036730 100644
--- a/arch/arm/configs/stm32_defconfig
+++ b/arch/arm/configs/stm32_defconfig
@@ -12,7 +12,6 @@ CONFIG_BASE_SMALL=y
 # CONFIG_SIGNALFD is not set
 # CONFIG_EVENTFD is not set
 # CONFIG_AIO is not set
-# CONFIG_BLK_DEV_BSG is not set
 # CONFIG_MMU is not set
 CONFIG_ARCH_STM32=y
 CONFIG_CPU_V7M_NUM_IRQ=240
@@ -72,10 +71,8 @@ CONFIG_NLS=y
 CONFIG_CRC_ITU_T=y
 CONFIG_CRC7=y
 CONFIG_PRINTK_TIME=y
-# CONFIG_ENABLE_MUST_CHECK is not set
 # CONFIG_DEBUG_BUGVERBOSE is not set
 CONFIG_DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT=y
 CONFIG_MAGIC_SYSRQ=y
 # CONFIG_SLUB_DEBUG is not set
-# CONFIG_SCHED_DEBUG is not set
 CONFIG_CRYPTO=y
-- 
2.25.1

