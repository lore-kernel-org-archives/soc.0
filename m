Return-Path: <SRS0=w+Vp=X7=huawei.com=john.garry@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27423C43334
	for <soc@archiver.kernel.org>; Tue, 26 Jul 2022 09:30:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id EE82BC341C8; Tue, 26 Jul 2022 09:30:46 +0000 (UTC)
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com [185.176.79.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id E07E0C341C0
	for <soc@kernel.org>; Tue, 26 Jul 2022 09:30:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org E07E0C341C0
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from fraeml708-chm.china.huawei.com (unknown [172.18.147.200])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4LsWl52Nlvz67yqK;
	Tue, 26 Jul 2022 17:26:57 +0800 (CST)
Received: from lhreml724-chm.china.huawei.com (10.201.108.75) by
 fraeml708-chm.china.huawei.com (10.206.15.36) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Tue, 26 Jul 2022 11:30:41 +0200
Received: from localhost.localdomain (10.69.192.58) by
 lhreml724-chm.china.huawei.com (10.201.108.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Tue, 26 Jul 2022 10:30:39 +0100
From: John Garry <john.garry@huawei.com>
To: <arnd@arndb.de>, <olof@lixom.net>
List-Id: <soc.lore.kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <soc@kernel.org>, John Garry
	<john.garry@huawei.com>
Subject: [PATCH] arm64: defconfig: Sync some configs with savedefconfig
Date: Tue, 26 Jul 2022 17:24:33 +0800
Message-ID: <1658827473-121156-1-git-send-email-john.garry@huawei.com>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.69.192.58]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 lhreml724-chm.china.huawei.com (10.201.108.75)
X-CFilter-Loop: Reflected

Some configs can obviously be removed when sync'ing with savedefconfig, as
follows:

- config ARCH_BCMBCA is selected by config ARCH_BCM4908 from
  arch/arm64/Kconfig.platforms, and the latter is enabled in the defconfig,
  so no need to explicitly enable in the defconfig.

- config SECCOMP was changed to def_bool y in commit 282a181b1a0d ("
  seccomp: Move config option SECCOMP to arch/Kconfig"), so no need to
  explicitly enable in the defconfig.

- config MAILBOX is already selected by some drivers enabled in the
  defconfig, so no need to explicitly enable.

- config QRTR was enabled in the defconfig from commit 1bdf91fd2ae82 ("
  arm64: defconfig: Enable Qualcomm QRTR"). However until many kernel
  versions later in commit 231a136fdf46 ("arm64: defconfig: enable ath11k
  driver"), no driver depended on config QRTR - not for building anyway.
  In commit 231a136fdf46, config ATH11K_PCI was enabled and this selects
  config QRTR, so there is no need to explicitly enable in the defconfig.

Signed-off-by: John Garry <john.garry@huawei.com>

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 6b17e263ec4a..f34e14752ca7 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -35,7 +35,6 @@ CONFIG_ARCH_ALPINE=y
 CONFIG_ARCH_APPLE=y
 CONFIG_ARCH_BCM2835=y
 CONFIG_ARCH_BCM4908=y
-CONFIG_ARCH_BCMBCA=y
 CONFIG_ARCH_BCM_IPROC=y
 CONFIG_ARCH_BERLIN=y
 CONFIG_ARCH_BRCMSTB=y
@@ -121,7 +120,6 @@ CONFIG_CRYPTO_AES_ARM64_CE_BLK=y
 CONFIG_CRYPTO_CHACHA20_NEON=m
 CONFIG_CRYPTO_AES_ARM64_BS=m
 CONFIG_JUMP_LABEL=y
-CONFIG_SECCOMP=y
 CONFIG_MODULES=y
 CONFIG_MODULE_UNLOAD=y
 # CONFIG_CORE_DUMP_DEFAULT_ELF_HEADERS is not set
@@ -175,7 +173,6 @@ CONFIG_NET_CLS_ACT=y
 CONFIG_NET_ACT_GACT=m
 CONFIG_NET_ACT_MIRRED=m
 CONFIG_NET_ACT_GATE=m
-CONFIG_QRTR=m
 CONFIG_QRTR_SMD=m
 CONFIG_QRTR_TUN=m
 CONFIG_CAN=m
@@ -1104,7 +1101,6 @@ CONFIG_FSL_MC_DPIO=y
 CONFIG_FSL_RCPM=y
 CONFIG_MTK_DEVAPC=m
 CONFIG_MTK_PMIC_WRAP=y
-CONFIG_MAILBOX=y
 CONFIG_QCOM_AOSS_QMP=y
 CONFIG_QCOM_COMMAND_DB=y
 CONFIG_QCOM_CPR=y
-- 
2.35.3

