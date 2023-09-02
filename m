Return-Path: <SRS0=fh0W=ES=loongson.cn=zhoubinbin@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB38BCA0FFF
	for <soc@archiver.kernel.org>; Sat,  2 Sep 2023 08:47:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id A51D5C433CA; Sat,  2 Sep 2023 08:47:53 +0000 (UTC)
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.kernel.org (Postfix) with ESMTP id 1AD55C433C8;
	Sat,  2 Sep 2023 08:47:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 1AD55C433C8
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [112.20.109.102])
	by gateway (Coremail) with SMTP id _____8BxXeu19vJk7P4dAA--.56137S3;
	Sat, 02 Sep 2023 16:47:49 +0800 (CST)
Received: from localhost.localdomain (unknown [112.20.109.102])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8CxWM2z9vJkbI1pAA--.60477S3;
	Sat, 02 Sep 2023 16:47:49 +0800 (CST)
From: Binbin Zhou <zhoubinbin@loongson.cn>
To: Binbin Zhou <zhoubb.aaron@gmail.com>,
	Huacai Chen <chenhuacai@loongson.cn>,
	Yinbo Zhu <zhuyinbo@loongson.cn>,
	Arnd Bergmann <arnd@arndb.de>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: Huacai Chen <chenhuacai@kernel.org>,
	loongson-kernel@lists.loongnix.cn,
	soc@kernel.org,
	devicetree@vger.kernel.org,
	linux-pm@vger.kernel.org,
	Xuerui Wang <kernel@xen0n.name>,
	loongarch@lists.linux.dev,
	Binbin Zhou <zhoubinbin@loongson.cn>
Subject: [PATCH v3 5/5] soc: loongson: loongson2_pm: Populate children syscon nodes
Date: Sat,  2 Sep 2023 16:47:45 +0800
Message-Id: <da06ff3c2405f36c8cedddfd20f8b54f4448f619.1693623752.git.zhoubinbin@loongson.cn>
X-Mailer: git-send-email 2.39.3
In-Reply-To: <cover.1693623752.git.zhoubinbin@loongson.cn>
References: <cover.1693623752.git.zhoubinbin@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf8CxWM2z9vJkbI1pAA--.60477S3
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBj9xXoW7XF13WFy3tryUXr43AFy3KFX_yoWkKwc_u3
	W29r48Cr1UJFnIy398Zw13Ar9Fgrn5u3W8uF1Dtw1Iq3WUt3sxJFyUArnrGF17WF4Syrn8
	Z3y0gw1Ikw1rCosvyTuYvTs0mTUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUj1kv1TuYvT
	s0mT0YCTnIWjqI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUI
	cSsGvfJTRUUUb2kYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20x
	vaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxS
	w2x7M28EF7xvwVC0I7IYx2IY67AKxVW7JVWDJwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxV
	WxJVW8Jr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVW8Jr0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx
	1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26rWY6Fy7McIj6I8E87Iv
	67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41l42xK82IYc2
	Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s02
	6x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0x
	vE2Ix0cI8IcVAFwI0_Ar0_tr1lIxAIcVC0I7IYx2IY6xkF7I0E14v26F4j6r4UJwCI42IY
	6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Gr0_Cr1lIxAIcVC2z280aV
	CY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU04v3UUUUUU==

The syscon poweroff and reboot nodes logically belong to the Power
Management Unit so populate possible children.

Without it, the reboot/poweroff feature becomes unavailable.

Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
---
 drivers/soc/loongson/loongson2_pm.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/soc/loongson/loongson2_pm.c b/drivers/soc/loongson/loongson2_pm.c
index 5ffb77afd9eb..b8e5e1e3528a 100644
--- a/drivers/soc/loongson/loongson2_pm.c
+++ b/drivers/soc/loongson/loongson2_pm.c
@@ -11,6 +11,7 @@
 #include <linux/input.h>
 #include <linux/suspend.h>
 #include <linux/interrupt.h>
+#include <linux/of_platform.h>
 #include <linux/pm_wakeirq.h>
 #include <linux/platform_device.h>
 #include <asm/bootinfo.h>
@@ -192,6 +193,11 @@ static int loongson2_pm_probe(struct platform_device *pdev)
 	if (loongson_sysconf.suspend_addr)
 		suspend_set_ops(&loongson2_suspend_ops);
 
+	/* Populate children */
+	retval = devm_of_platform_populate(dev);
+	if (retval)
+		dev_err(dev, "Error populating children, reboot and poweroff might not work properly\n");
+
 	return 0;
 }
 
-- 
2.39.3

