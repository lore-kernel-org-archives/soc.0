Return-Path: <sashal@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EABF2C433EF
	for <soc@archiver.kernel.org>; Tue, 28 Jun 2022 02:24:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id D0A6AC341CB; Tue, 28 Jun 2022 02:24:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6CE87C341CA;
	Tue, 28 Jun 2022 02:24:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1656383052;
	bh=4b2HMmvlf7NXYlP78oUShEcmXVWe526VfpbWjHp/+fQ=;
	h=From:To:List-Id:Cc:Subject:Date:In-Reply-To:References:From;
	b=WTZ5S5IH4FwFEV5f6hzyfGfKwoIlUjXtw178Irt7GyEhfuKqU/H103TaPW5DFESK4
	 dNpmjeUo8pkPYmaEQrK/1wEOFH7z1ijdLh9NMTAM64fKfTFQkeM69JtUlJfct1Ezfd
	 YQBynllFe/GhjfFTsOgKWyl7EYaba2CWBwCcG8cDh9EBxkKArRnINGOISXfsb7db8c
	 O612DglKPYYxtIcZHK5NuWUzqVHZsD69ah0QTXEACzBNacWjK22OV9Jtyzp4OiGXrO
	 0GutalOWSBFdHEyPHaAeFW52SFdPvHo5+1ZB5D0qZAhoGk3koolJnRGGz4KPq7YtOh
	 cy5p2lFAxXAkw==
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
Subject: [PATCH AUTOSEL 5.10 34/34] arm: mach-spear: Add missing of_node_put() in time.c
Date: Mon, 27 Jun 2022 22:22:41 -0400
Message-Id: <20220628022241.595835-34-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220628022241.595835-1-sashal@kernel.org>
References: <20220628022241.595835-1-sashal@kernel.org>
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

