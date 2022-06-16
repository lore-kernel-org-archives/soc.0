Return-Path: <SRS0=zpUB=WX=126.com=windhl@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 730F5C433EF
	for <soc@archiver.kernel.org>; Thu, 16 Jun 2022 09:30:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 3BA97C3411C; Thu, 16 Jun 2022 09:30:55 +0000 (UTC)
Received: from mail-m965.mail.126.com (mail-m965.mail.126.com [123.126.96.5])
	by smtp.kernel.org (Postfix) with ESMTP id 186F1C3411B;
	Thu, 16 Jun 2022 09:30:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 186F1C3411B
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=126.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=126.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=2oWt2
	H9WAPMkG7oNEcwGjV07/1fUD/DB+viS6p1c6Jk=; b=H3pJKR4G1hHrlcp3eV55r
	7JebDMoYFyjVJp7PgyFEEyDXeIy9SLFGoIQPPCLdvM7n9DupZorWREwv0aDIvtN1
	dw9tFegFegrIKw8b9/e4soxkYqR7W5cJyD/cbCXsbLRSeA7rRwhQsO8OWZnFQGJJ
	LlYcrovxoU6wvPE1hbhtsw=
Received: from localhost.localdomain (unknown [124.16.139.61])
	by smtp10 (Coremail) with SMTP id NuRpCgAXNq41+KpiNnoVEw--.35290S2;
	Thu, 16 Jun 2022 17:30:30 +0800 (CST)
From: Liang He <windhl@126.com>
List-Id: <soc.lore.kernel.org>
To: vireshk@kernel.org,
	shiraz.linux.kernel@gmail.com,
	soc@kernel.org,
	linux@armlinux.org.uk
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	windhl@126.com
Subject: [PATCH v2] arm: mach-spear: Add missing of_node_put() in time.c
Date: Thu, 16 Jun 2022 17:30:27 +0800
Message-Id: <20220616093027.3984903-1-windhl@126.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:NuRpCgAXNq41+KpiNnoVEw--.35290S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7tFW8uw1UJF13ArWUKFW3Jrb_yoW8Gr4xpr
	W7uwsYvr48G3srXr4vyFZ7uw1vy3WDGFs7Ca9YkFyDAFs7Aa4UJF4rKa4DAay5tF4kZayx
	Cw1ftF1fZ3WDAaDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0p_ucMdUUUUU=
X-Originating-IP: [124.16.139.61]
X-CM-SenderInfo: hzlqvxbo6rjloofrz/1tbi7QUiF1pEANb65QABsL

In spear_setup_of_timer(), of_find_matching_node() will return a
node pointer with refcount incrementd. We should use of_node_put()
in each fail path or when it is not used anymore.

Signed-off-by: Liang He <windhl@126.com>
---
 changelog:
 
 v2: use goto-label patch style suggested by Viresh.
 v1: use plain of_node_put in each fail path.

 arch/arm/mach-spear/time.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/arch/arm/mach-spear/time.c b/arch/arm/mach-spear/time.c
index d1fdb6066f7b..c7c17c0f936c 100644
--- a/arch/arm/mach-spear/time.c
+++ b/arch/arm/mach-spear/time.c
@@ -218,13 +218,13 @@ void __init spear_setup_of_timer(void)
 	irq = irq_of_parse_and_map(np, 0);
 	if (!irq) {
 		pr_err("%s: No irq passed for timer via DT\n", __func__);
-		return;
+		goto err_put_np;
 	}
 
 	gpt_base = of_iomap(np, 0);
 	if (!gpt_base) {
 		pr_err("%s: of iomap failed\n", __func__);
-		return;
+		goto err_put_np;
 	}
 
 	gpt_clk = clk_get_sys("gpt0", NULL);
@@ -239,6 +239,8 @@ void __init spear_setup_of_timer(void)
 		goto err_prepare_enable_clk;
 	}
 
+	of_node_put(np);
+
 	spear_clockevent_init(irq);
 	spear_clocksource_init();
 
@@ -248,4 +250,6 @@ void __init spear_setup_of_timer(void)
 	clk_put(gpt_clk);
 err_iomap:
 	iounmap(gpt_base);
+err_put_np:
+	of_node_put(np);
 }
-- 
2.25.1

