Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90323C433F5
	for <soc@archiver.kernel.org>; Wed, 27 Oct 2021 07:24:31 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 65776610CA; Wed, 27 Oct 2021 07:24:31 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id E260A60F9B;
	Wed, 27 Oct 2021 07:24:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1635319471;
	bh=g0Y1Fuj4DAZix267DbS+k2+lzxVT4mzCR0JHx/82Uzs=;
	h=From:List-Id:To:Cc:Subject:Date:From;
	b=kOkn9u4MZrOTcljO1dROb6a6ZIPJ7FvMMgZmwDfKHwwRetJScX7JBXn8yvroMzZDu
	 lh64gVkoeCvRH9ELN2MX5qfK2HKZ531h3RbKAIrAKC57IMQ+NyDUDCsmYnybxvNFiC
	 rm1utm6bDZ2pbaRhf53WhqHTskNvsrDZKFUZQhfrVskh71Tg4AjLorxmdDVU97QPJ9
	 xD+1KSPj9h25oIIInIUv4n+u0nChxwh3QSq7OVC0RwUcn5Vknu/cNvNYwjUP0RLF8m
	 9bPdO6W9XxkKW4/saKD+zyqlg422N5GqSHn666GBnY3HDSPSrtVluG+rl9WFrhFeds
	 6e3P8bDB9xjEg==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org,
	Andy Gross <agross@kernel.org>,
	Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Stephen Boyd <swboyd@chromium.org>,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] firmware: qcom: scm: fix non-SMP build
Date: Wed, 27 Oct 2021 09:24:10 +0200
Message-Id: <20211027072427.2730827-1-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

A check was added for non-arm platforms, but the same code
is still broken on Arm non-SMP:

ERROR: modpost: "__cpu_logical_map" [drivers/firmware/qcom-scm.ko] undefined!

Fixes: c50031f03dfe ("firmware: qcom: scm: Don't break compile test on non-ARM platforms")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/firmware/qcom_scm.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/firmware/qcom_scm.c b/drivers/firmware/qcom_scm.c
index 11464f6502be..f08036f8c296 100644
--- a/drivers/firmware/qcom_scm.c
+++ b/drivers/firmware/qcom_scm.c
@@ -17,7 +17,7 @@
 #include <linux/reset-controller.h>
 #include <linux/arm-smccc.h>
 
-#if defined(CONFIG_ARM) || defined(CONFIG_ARM64)
+#if defined(CONFIG_SMP) && (defined(CONFIG_ARM) || defined(CONFIG_ARM64))
 #include <asm/smp_plat.h>
 #endif
 
@@ -264,7 +264,7 @@ static bool __qcom_scm_is_call_available(struct device *dev, u32 svc_id,
 	return ret ? false : !!res.result[0];
 }
 
-#if defined(CONFIG_ARM) || defined(CONFIG_ARM64)
+#if defined(CONFIG_SMP) && (defined(CONFIG_ARM) || defined(CONFIG_ARM64))
 static int __qcom_scm_set_boot_addr_mc(void *entry, const cpumask_t *cpus,
 				       unsigned int flags)
 {
-- 
2.29.2

