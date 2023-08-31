Return-Path: <SRS0=fF9g=EQ=loongson.cn=zhoubinbin@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19E1DC83F32
	for <soc@archiver.kernel.org>; Thu, 31 Aug 2023 11:43:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 01751C43395; Thu, 31 Aug 2023 11:43:34 +0000 (UTC)
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.kernel.org (Postfix) with ESMTP id 294D9C433C9;
	Thu, 31 Aug 2023 11:43:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 294D9C433C9
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [112.20.109.102])
	by gateway (Coremail) with SMTP id _____8AxXOrhfPBkX28dAA--.33013S3;
	Thu, 31 Aug 2023 19:43:29 +0800 (CST)
Received: from localhost.localdomain (unknown [112.20.109.102])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8AxTSPffPBkbxJoAA--.36689S3;
	Thu, 31 Aug 2023 19:43:29 +0800 (CST)
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
Subject: [PATCH v2 5/5] soc: loongson: loongson_pm2: Populate children syscon nodes
Date: Thu, 31 Aug 2023 19:43:25 +0800
Message-Id: <967f837de873706686438cdcf7c71ed8828de31c.1693474728.git.zhoubinbin@loongson.cn>
X-Mailer: git-send-email 2.39.3
In-Reply-To: <cover.1693474728.git.zhoubinbin@loongson.cn>
References: <cover.1693474728.git.zhoubinbin@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf8AxTSPffPBkbxJoAA--.36689S3
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBj9xXoW7XF13WFy3tryUXr43AFy3KFX_yoWkKwc_u3
	W29r48Cr1UJFnIy398Zw13Ar9Fgrn5u3W8uF1Dtw1Iq3WUt3sxJFyUArnrGF17WF4Syrn8
	Z3y0gw1Ikw1rCosvyTuYvTs0mTUanT9S1TB71UUUUUDqnTZGkaVYY2UrUUUUj1kv1TuYvT
	s0mT0YCTnIWjqI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUI
	cSsGvfJTRUUUb2xYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20x
	vaj40_Wr0E3s1l1IIY67AEw4v_Jrv_JF1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxS
	w2x7M28EF7xvwVC0I7IYx2IY67AKxVW7JVWDJwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxV
	WxJVW8Jr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVWxJr0_GcWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27w
	Aqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Wrv_ZF1lYx0Ex4A2jsIE
	14v26r4j6F4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCF04k20xvY0x
	0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E
	7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcV
	C0I7IYx2IY67AKxVW7JVWDJwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Cr0_Gr1UMIIF0xvE
	42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8JVWxJwCI42IY6I8E87Iv6x
	kF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxUsZqXUUUUU

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

