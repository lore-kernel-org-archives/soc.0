Return-Path: <SRS0=w+Vp=X7=huawei.com=john.garry@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90155CCA489
	for <soc@archiver.kernel.org>; Tue, 26 Jul 2022 10:08:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 5B23BC341C0; Tue, 26 Jul 2022 10:08:59 +0000 (UTC)
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com [185.176.79.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 5C804C341C8;
	Tue, 26 Jul 2022 10:08:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 5C804C341C8
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from fraeml706-chm.china.huawei.com (unknown [172.18.147.207])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4LsXb95vl7z67sgR;
	Tue, 26 Jul 2022 18:05:09 +0800 (CST)
Received: from lhreml724-chm.china.huawei.com (10.201.108.75) by
 fraeml706-chm.china.huawei.com (10.206.15.55) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2375.24; Tue, 26 Jul 2022 12:08:54 +0200
Received: from localhost.localdomain (10.69.192.58) by
 lhreml724-chm.china.huawei.com (10.201.108.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Tue, 26 Jul 2022 11:08:51 +0100
From: John Garry <john.garry@huawei.com>
To: <agross@kernel.org>, <bjorn.andersson@linaro.org>,
	<linus.walleij@linaro.org>
List-Id: <soc.lore.kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <olof@lixom.net>, <soc@kernel.org>,
	<arnd@arndb.de>, John Garry <john.garry@huawei.com>
Subject: [PATCH] pinctrl: qcom: Make PINCTRL_SM8450 depend on PINCTRL_MSM
Date: Tue, 26 Jul 2022 18:02:44 +0800
Message-ID: <1658829764-124936-1-git-send-email-john.garry@huawei.com>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.69.192.58]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 lhreml724-chm.china.huawei.com (10.201.108.75)
X-CFilter-Loop: Reflected

All the many other configs depend on config PINCTRL_MSM, yet for config
PINCTRL_SM8450 we select config PINCTRL_MSM. Make config PINCTRL_SM8450
depend on PINCTRL_MSM to be consistent with the rest.

Signed-off-by: John Garry <john.garry@huawei.com>
Suggested-by: Arnd Bergmann <arnd@arndb.de>
---
Note: .config output is same after this change. We also lose the need to
      remove CONFIG_PINCTRL_MSM=y when sync'ing with savedefconfig
      Based on arm/defconfig branch for ARM AND ARM64 SoC
      SUB-ARCHITECTURES tree

diff --git a/drivers/pinctrl/qcom/Kconfig b/drivers/pinctrl/qcom/Kconfig
index 3daeb9772391..4ac561667b20 100644
--- a/drivers/pinctrl/qcom/Kconfig
+++ b/drivers/pinctrl/qcom/Kconfig
@@ -367,7 +367,7 @@ config PINCTRL_SM8350
 config PINCTRL_SM8450
 	tristate "Qualcomm Technologies Inc SM8450 pin controller driver"
 	depends on GPIOLIB && OF
-	select PINCTRL_MSM
+	depends on PINCTRL_MSM
 	help
 	  This is the pinctrl, pinmux, pinconf and gpiolib driver for the
 	  Qualcomm Technologies Inc TLMM block found on the Qualcomm
-- 
2.35.3

