Return-Path: <SRS0=s/Qz=NQ=gmail.com=joel.stan@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5FFE4C4338F
	for <soc@archiver.kernel.org>; Wed, 25 Aug 2021 00:12:37 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 3174A611EF; Wed, 25 Aug 2021 00:12:37 +0000 (UTC)
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F307C610A6
	for <soc@kernel.org>; Wed, 25 Aug 2021 00:12:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org F307C610A6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f46.google.com with SMTP id z24-20020a17090acb1800b0018e87a24300so3558318pjt.0
        for <soc@kernel.org>; Tue, 24 Aug 2021 17:12:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=FS1rSkA+fXAPOA6CB3lp7CTsa420KR1zgvw7ZpPtuNk=;
        b=Gov3sLMj6oj0xQ8V+D7ZsVrJw9vBljQSHgGp+lWxosHkUBtMcTxPnTGRZ63P8deAtL
         zeM1ENQi7qMkbE3eDbUXLXceqYS1djEkmFxhDglDfE04UBezbEqM0//e4zqiwCCFf1Ni
         OrPi6CG1fll0mdJoQcrDMNQAZfqoXqvOHBJMRPj6FcsalRsXC5W5j3vWtOqMLfdAVRBf
         A3Oi2NYgUVAy0ho6Hmdd4fC+SuQ6iBzOibOQsVyx1X08ZODjrTPSM8UViSiAT5Pav4iC
         4TqX5PI/Bm2XDz7j49jxrEGx+FOGswC7K0wrq6058KYaTjQ7uR4koddeuTmCD1I+XcYd
         YdoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:subject:date:message-id
         :mime-version:content-transfer-encoding;
        bh=FS1rSkA+fXAPOA6CB3lp7CTsa420KR1zgvw7ZpPtuNk=;
        b=mHJ+UUSlY3S2lMjfXJc3G1HYMNdAJDZd4XpMsZhuqvIG/wnOKL3XDgkxaBjsAUGVF3
         +2P/g0vAKZAeWyp8sSNquYgElCEwZAdHxKJWxHhxaN/nObg6tju7txdqm7Xn8XFCYK0j
         MCrC20PJeRvuW3cGxOE6cc6MIFL1Y26rWx/FiTTfcaoZwi98jJSWmGDdeASeg9/FZzjR
         o+gbK0wHMbe3J81hqBcqsr8lMz3GSJfqfa37PNYfdvj2QF4/5ldEia32wl0qnuwhqiCv
         QxOmXhQVDQ/9010/pDb9sFhYvcrzK9rbeqzFbEl/ONo+prs7OsSIRZhlJ0bQY3ZiK93L
         i2vw==
X-Gm-Message-State: AOAM532EDA9Yewq1bvY35zC6SPUR605ORWzmSoufIAfREBN/ND5p8sLk
	StZdPaI3APnDKyp4XF/p2ZnBey4RYx4=
X-Google-Smtp-Source: ABdhPJw/zMnhQCVZYyssVzCneRY5mxWSQNvSFHJORT9ECX3nSCryPlt8HHbNbOOIrb+N4t9Q6siwqg==
X-Received: by 2002:a17:90a:2fc2:: with SMTP id n2mr6961183pjm.112.1629850355992;
        Tue, 24 Aug 2021 17:12:35 -0700 (PDT)
Received: from voyager.lan ([45.124.203.15])
        by smtp.gmail.com with ESMTPSA id g19sm3426853pjl.25.2021.08.24.17.12.33
        for <soc@kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Aug 2021 17:12:35 -0700 (PDT)
Sender: "joel.stan@gmail.com" <joel.stan@gmail.com>
From: Joel Stanley <joel@jms.id.au>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Subject: [PATCH] soc: aspeed-lpc-ctrl: Fix clock cleanup in error path
Date: Wed, 25 Aug 2021 09:42:14 +0930
Message-Id: <20210825001214.3056193-1-joel@jms.id.au>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Yang Yingliang <yangyingliang@huawei.com>

Move syscon_regmap_lookup_by_compatible() above the
devm_clk_get() to avoid missing clk_disable_unprepare().

Fixes: 2f9b25fa6682 ("soc: aspeed: Re-enable FWH2AHB on AST2600")
Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
Reviewed-by: Joel Stanley <joel@jms.id.au>
Link: https://lore.kernel.org/r/20210824085522.1849410-1-yangyingliang@huawei.com
Signed-off-by: Joel Stanley <joel@jms.id.au>
---
soc maintainers, please apply this for v5.15. It's a fix for a patch
that is already queued for merging.

 drivers/soc/aspeed/aspeed-lpc-ctrl.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/soc/aspeed/aspeed-lpc-ctrl.c b/drivers/soc/aspeed/aspeed-lpc-ctrl.c
index 6893c5ec3259..72771e018c42 100644
--- a/drivers/soc/aspeed/aspeed-lpc-ctrl.c
+++ b/drivers/soc/aspeed/aspeed-lpc-ctrl.c
@@ -295,6 +295,16 @@ static int aspeed_lpc_ctrl_probe(struct platform_device *pdev)
 		return -ENODEV;
 	}
 
+	if (of_device_is_compatible(dev->of_node, "aspeed,ast2600-lpc-ctrl")) {
+		lpc_ctrl->fwh2ahb = true;
+
+		lpc_ctrl->scu = syscon_regmap_lookup_by_compatible("aspeed,ast2600-scu");
+		if (IS_ERR(lpc_ctrl->scu)) {
+			dev_err(dev, "couldn't find scu\n");
+			return PTR_ERR(lpc_ctrl->scu);
+		}
+	}
+
 	lpc_ctrl->clk = devm_clk_get(dev, NULL);
 	if (IS_ERR(lpc_ctrl->clk)) {
 		dev_err(dev, "couldn't get clock\n");
@@ -306,16 +316,6 @@ static int aspeed_lpc_ctrl_probe(struct platform_device *pdev)
 		return rc;
 	}
 
-	if (of_device_is_compatible(dev->of_node, "aspeed,ast2600-lpc-ctrl")) {
-		lpc_ctrl->fwh2ahb = true;
-
-		lpc_ctrl->scu = syscon_regmap_lookup_by_compatible("aspeed,ast2600-scu");
-		if (IS_ERR(lpc_ctrl->scu)) {
-			dev_err(dev, "couldn't find scu\n");
-			return PTR_ERR(lpc_ctrl->scu);
-		}
-	}
-
 	lpc_ctrl->miscdev.minor = MISC_DYNAMIC_MINOR;
 	lpc_ctrl->miscdev.name = DEVICE_NAME;
 	lpc_ctrl->miscdev.fops = &aspeed_lpc_ctrl_fops;
-- 
2.33.0

