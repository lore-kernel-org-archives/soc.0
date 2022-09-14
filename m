Return-Path: <sashal@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D218ECAAD8
	for <soc@archiver.kernel.org>; Wed, 14 Sep 2022 09:06:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 35C2BC433B5; Wed, 14 Sep 2022 09:06:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2BDC3C433D7;
	Wed, 14 Sep 2022 09:06:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1663146396;
	bh=HyKsRTjb+JuE90GA2As1ikV1HmfWou1KhKPxFf/QXFc=;
	h=From:To:List-Id:Cc:Subject:Date:In-Reply-To:References:From;
	b=fF1CKJlfceABb30E/mxpc9aT9qmR3AiKuZVW3qat3t750UOvIdJkI60oYAoTqThdz
	 ilW3SgcnEntZ0dXoW+VAeA3nM8YVqTqU2N0dsQH/0XrXYhwQR3z9yrB7oiUHeXHOTV
	 +ou2mw94vD3YcoGbk9jZ3wJRRse9FwqEIbN60EnDvi1XPeEzZnb17GSl9OA8i0mNRw
	 F6Bh20amRoec/PrQlB11KnVHuIWKlzAR1tCdEI9v01XwG3PvMxHwuRm2yzW30dES8y
	 5Hagy2DqPY51pX1KzpxEajUsow7FWTx1b9pKW681FidbvvqewcThw52Qx6do399G/t
	 uVh1ypoQmh2Ug==
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
Subject: [PATCH AUTOSEL 4.9 13/13] arm: mach-spear: Add missing of_node_put() in time.c
Date: Wed, 14 Sep 2022 05:05:40 -0400
Message-Id: <20220914090540.471725-13-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220914090540.471725-1-sashal@kernel.org>
References: <20220914090540.471725-1-sashal@kernel.org>
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
index aaaa6781b9fea..57b77c7effa9a 100644
--- a/arch/arm/mach-spear/time.c
+++ b/arch/arm/mach-spear/time.c
@@ -223,13 +223,13 @@ void __init spear_setup_of_timer(void)
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
@@ -244,6 +244,8 @@ void __init spear_setup_of_timer(void)
 		goto err_prepare_enable_clk;
 	}
 
+	of_node_put(np);
+
 	spear_clockevent_init(irq);
 	spear_clocksource_init();
 
@@ -253,4 +255,6 @@ void __init spear_setup_of_timer(void)
 	clk_put(gpt_clk);
 err_iomap:
 	iounmap(gpt_base);
+err_put_np:
+	of_node_put(np);
 }
-- 
2.35.1

