Return-Path: <sashal@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E189CCA47B
	for <soc@archiver.kernel.org>; Tue, 28 Jun 2022 02:20:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id C45F2C36AE5; Tue, 28 Jun 2022 02:20:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54314C341CA;
	Tue, 28 Jun 2022 02:20:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1656382859;
	bh=4b2HMmvlf7NXYlP78oUShEcmXVWe526VfpbWjHp/+fQ=;
	h=From:To:List-Id:Cc:Subject:Date:In-Reply-To:References:From;
	b=qBLEnuoga4RfLMRKgNRY19Hrap0DT3YSFIGqU1H2tcKY8a9pvvjEeJgVHaqZlMXYj
	 yiQtNz+E7X+yzVF2zzcZZEhGMo4t5597bDe2gZyKECOAcGl/kYd428273l2sy+1wgv
	 0SVOPL5St8obPpfPoHoCcEsMSzkrqWGvZc9Y3mt72Gtf2BdwYOsf7zJSLnc9DsqLo2
	 6wKwxnb3rUa6BoG6jtiVuygQorXgOLVD7O6BJTFSwpoMH3at/2b1kM/39w7Jpbdzv1
	 B/NMC+m91PSjPawzEjWWbY8TQkbb+S4CtFY8w4Y73i9InNOHG93lsBueVLvS9CxhXg
	 9vC0JGlkXuJvA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
List-Id: <soc.lore.kernel.org>
Cc: Liang He <windhl@126.com>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Sasha Levin <sashal@kernel.org>,
	vireshk@kernel.org,
	shiraz.linux.kernel@gmail.com,
	soc@kernel.org,
	linux@armlinux.org.uk,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH AUTOSEL 5.18 53/53] arm: mach-spear: Add missing of_node_put() in time.c
Date: Mon, 27 Jun 2022 22:18:39 -0400
Message-Id: <20220628021839.594423-53-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220628021839.594423-1-sashal@kernel.org>
References: <20220628021839.594423-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit

From: Liang He <windhl@126.com>

[ Upstream commit 2c629dd2d14fd7f64a553f809eda6d0b3a4f615a ]

In spear_setup_of_timer(), of_find_matching_node() will return a
node pointer with refcount incrementd. We should use of_node_put()
in each fail path or when it is not used anymore.

Signed-off-by: Liang He <windhl@126.com>
Acked-by: Viresh Kumar <viresh.kumar@linaro.org>
Link: https://lore.kernel.org/r/20220616093027.3984903-1-windhl@126.com'
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
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
2.35.1

