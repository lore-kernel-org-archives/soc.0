Return-Path: <sashal@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 523D7C43334
	for <soc@archiver.kernel.org>; Tue, 28 Jun 2022 02:26:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 1AB73C36AE2; Tue, 28 Jun 2022 02:26:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D55D3C34115;
	Tue, 28 Jun 2022 02:26:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1656383217;
	bh=9VsapHYo2tU4CgPhLYgYIkxQ2l1Fr2KCRwEjZPbMERE=;
	h=From:To:List-Id:Cc:Subject:Date:In-Reply-To:References:From;
	b=r3zHDcSMBizxZwm6TDu8e0vNTt2hpOVqvhxmUOPEPT+hk8lhR1QOb7IFayz2eI3eo
	 wv0GiJZRtLnkZb6O72LLQsPgw321TmZgYfkcxFkchM2V7D6RcPmbwGqhi1OH7/vm/F
	 gS7DEZlYSPKE7qn4dESNnE7K+bh/mWWtDil1/iMJmbD5EKgyvyp1v8WgubU/ZS8evr
	 hi0IsI3c68+FHCH2UqiG85zc6qO6xx6Mt/dzGCRHwPTdw9IiRNqvtZ5Q7e1HheObcX
	 NKCMUD8QAOxykcCskJh57qgAUDUYqIJKx58oPwayAxLOlvotVfL0K+JMpHsAZY8lnB
	 1sdBXwy/3rpSg==
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
Subject: [PATCH AUTOSEL 4.14 17/17] arm: mach-spear: Add missing of_node_put() in time.c
Date: Mon, 27 Jun 2022 22:26:15 -0400
Message-Id: <20220628022615.596977-17-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220628022615.596977-1-sashal@kernel.org>
References: <20220628022615.596977-1-sashal@kernel.org>
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
index 289e036c9c30..6a77ba2c1c50 100644
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

