Return-Path: <SRS0=GZ1f=X5=huawei.com=john.garry@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A278BC43334
	for <soc@archiver.kernel.org>; Sun, 24 Jul 2022 16:49:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 85681C3411E; Sun, 24 Jul 2022 16:49:57 +0000 (UTC)
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com [185.176.79.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 14DEBC341C0;
	Sun, 24 Jul 2022 16:49:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 14DEBC341C0
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from fraeml744-chm.china.huawei.com (unknown [172.18.147.206])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4LrTYd0ZvQz67Kvx;
	Mon, 25 Jul 2022 00:45:09 +0800 (CST)
Received: from lhreml724-chm.china.huawei.com (10.201.108.75) by
 fraeml744-chm.china.huawei.com (10.206.15.225) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Sun, 24 Jul 2022 18:49:47 +0200
Received: from localhost.localdomain (10.69.192.58) by
 lhreml724-chm.china.huawei.com (10.201.108.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Sun, 24 Jul 2022 17:49:44 +0100
From: John Garry <john.garry@huawei.com>
List-Id: <soc.lore.kernel.org>
To: <will@kernel.org>, <catalin.marinas@arm.com>,
	<linux-arm-kernel@lists.infradead.org>, <arnd@arndb.de>, <olof@lixom.net>,
	<soc@kernel.org>
CC: <jpoimboe@kernel.org>, <linux-kernel@vger.kernel.org>, John Garry
	<john.garry@huawei.com>
Subject: [PATCH 2/2] arm64: defconfig: Enable DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT
Date: Mon, 25 Jul 2022 00:43:24 +0800
Message-ID: <1658681004-132191-3-git-send-email-john.garry@huawei.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <1658681004-132191-1-git-send-email-john.garry@huawei.com>
References: <1658681004-132191-1-git-send-email-john.garry@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.69.192.58]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 lhreml724-chm.china.huawei.com (10.201.108.75)
X-CFilter-Loop: Reflected

Since commit f9b3cd245784 ("Kconfig.debug: make DEBUG_INFO selectable
from a choice") faddr2line has stopped working by default as it relies
on CONFIG_DEBUG_INFO.

Enable CONFIG_DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT to get it working again,
which seems the sensible config option to use.

Signed-off-by: John Garry <john.garry@huawei.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index de662de0bb4d..43e3550afa45 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1311,6 +1311,7 @@ CONFIG_CRYPTO_DEV_HISI_TRNG=m
 CONFIG_CMA_SIZE_MBYTES=32
 CONFIG_PRINTK_TIME=y
 CONFIG_DEBUG_KERNEL=y
+CONFIG_DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT=y
 CONFIG_MAGIC_SYSRQ=y
 CONFIG_DEBUG_FS=y
 # CONFIG_SCHED_DEBUG is not set
-- 
2.35.3

