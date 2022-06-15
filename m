Return-Path: <SRS0=ijZO=WW=126.com=windhl@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE8E8C43334
	for <soc@archiver.kernel.org>; Wed, 15 Jun 2022 13:10:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 7725DC3411B; Wed, 15 Jun 2022 13:10:19 +0000 (UTC)
Received: from m15113.mail.126.com (m15113.mail.126.com [220.181.15.113])
	by smtp.kernel.org (Postfix) with ESMTP id 997A9C34115;
	Wed, 15 Jun 2022 13:10:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 997A9C34115
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=126.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=126.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=aGlwT
	pJzDJp35gUCkFaGCu1AAXCT+U62kQKsYj5c2C0=; b=AwHCpk2FIq9EyzKxyneVF
	M7nmt8aQnX8yADa7h/+p5/aT2UJMOokEUN1KhwFBXsUhMGPvaHTqsgTcZrQ2MdPR
	Cy2Gb1LT8iOcQJyz7UKW22NhskkzOez5l4u9++EIlNCufHzy0AjFdgLDjn6MSdRk
	84GevR0IgsQwV7+31WHf9M=
Received: from localhost.localdomain (unknown [124.16.139.61])
	by smtp3 (Coremail) with SMTP id DcmowAAHmJ3w0qli+QOKDQ--.43766S2;
	Wed, 15 Jun 2022 20:39:13 +0800 (CST)
From: Liang He <windhl@126.com>
List-Id: <soc.lore.kernel.org>
To: vireshk@kernel.org,
	shiraz.linux.kernel@gmail.com,
	soc@kernel.org,
	linux@armlinux.org.uk
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	windhl@126.com
Subject: [PATCH] arch: arm: mach-spear: Add missing of_node_put() in time.c
Date: Wed, 15 Jun 2022 20:39:12 +0800
Message-Id: <20220615123912.3965902-1-windhl@126.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:DcmowAAHmJ3w0qli+QOKDQ--.43766S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrKFW3Gryxtr43tFy8AFWrXwb_yoWDXwc_GF
	1xWa9xGr40gF1Uua9rua1fGwsFyw15Cr4xWFyxZ3W7Kayjvr1UCF1kt3429ry7Zw4YgrW8
	tFWDCayayw129jkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7xREyCGUUUUUU==
X-Originating-IP: [124.16.139.61]
X-CM-SenderInfo: hzlqvxbo6rjloofrz/1tbizhIhF18RPTEOUgAAs0

In spear_setup_of_timer(), of_find_matching_node() will return a
node pointer with refcount incrementd. We should use of_node_put()
in each fail path or when it is not used anymore.

Signed-off-by: Liang He <windhl@126.com>
---
 arch/arm/mach-spear/time.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/arch/arm/mach-spear/time.c b/arch/arm/mach-spear/time.c
index d1fdb6066f7b..a1b6635b4ecb 100644
--- a/arch/arm/mach-spear/time.c
+++ b/arch/arm/mach-spear/time.c
@@ -217,16 +217,20 @@ void __init spear_setup_of_timer(void)
 
 	irq = irq_of_parse_and_map(np, 0);
 	if (!irq) {
+		of_node_put(np);
 		pr_err("%s: No irq passed for timer via DT\n", __func__);
 		return;
 	}
 
 	gpt_base = of_iomap(np, 0);
 	if (!gpt_base) {
+		of_node_put(np);
 		pr_err("%s: of iomap failed\n", __func__);
 		return;
 	}
-
+	
+	of_node_put(np);
+	
 	gpt_clk = clk_get_sys("gpt0", NULL);
 	if (IS_ERR(gpt_clk)) {
 		pr_err("%s:couldn't get clk for gpt\n", __func__);
-- 
2.25.1

