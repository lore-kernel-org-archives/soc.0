Return-Path: <SRS0=duQC=SQ=gmail.com=joel.stan@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2B2BC433F5
	for <soc@archiver.kernel.org>; Tue,  1 Feb 2022 07:01:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id CC1F0C340EE; Tue,  1 Feb 2022 07:01:26 +0000 (UTC)
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 0B2C6C340EB
	for <soc@kernel.org>; Tue,  1 Feb 2022 07:01:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 0B2C6C340EB
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f175.google.com with SMTP id c194so2507329pfb.12
        for <soc@kernel.org>; Mon, 31 Jan 2022 23:01:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Y22CiBZZBcAvOw1UvX5uHxbkkByWdVmm47+E91Gl0iw=;
        b=okUpo1vvlrQ7YI/E1pXM1g1uj5VyAIpiw4BnCJsCJm6N8dkr24zUDCawaMoeOuG6m5
         OPzPF0vvR6VEDxyWhPmR14N74Qh63sdEEcWb2mS1UOAPi2DyfEkH6IrdjHmB0I2pLQQA
         FopSRIoUIskHuh5VLUSHWpS1RaAFaNdtVRAg5Ttoj4OdG3xB2I4tJCqUUEtJ9JnTgz/C
         +mLiP9noG9zjiEBSnUrDUeXTv/vCQZUxEygIP5gyiAW7AQjILl7lmDHGcSVflmNFxkeZ
         U0SoYT9SsUomzV1EbTLj13TB9slDHIVHky70JhXiAk8pYc0LjCIuljudZsKTqQGlrZBS
         aGmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:from:to:subject:date:message-id
         :mime-version:content-transfer-encoding;
        bh=Y22CiBZZBcAvOw1UvX5uHxbkkByWdVmm47+E91Gl0iw=;
        b=tlv7yw5ICKVK3tFU5d0ZyoXvvJ0qnW2oOmSTtjLGdOCs5VUvxaQivpg+zXSk0fVPuu
         JzpfxwZlzO7wb/2M/W54SzJPH4QmLfMG2elTwQBpWhUh0jOQrZN5AQSdmmm6cWxA3CJi
         584HBDbaH9J+weWaGvcc8u5sjUaB33lqupOWlMzhJvNQDHzlTziR1PNE7JKRvCKnELvG
         wCgNUaJVXBp7HlWfyP0fMgbDId5MvzNyF59GcYq4jJMHO4p7vAwrVOHw7gwJsvghXhLK
         ArBK+bedhmFgnZVcI4HEsv6Nka+0L9uJkBHnzViVTn7u+25MqXuY0cL6axkiabcsLCln
         ug1Q==
X-Gm-Message-State: AOAM533hNorxeidKSnREAWISzzLHq04GtQDdt05YRfwjx38NES148/yz
	HePSa80E0avkf/85ByV07nQ6kTX22yc=
X-Google-Smtp-Source: ABdhPJyllQNRnx1BXG4ES6KuySmPLqc4GZ/4ui6ofJUeWb2YD1xy9OI0cdM1nB0l02AWb1Yrg4okkw==
X-Received: by 2002:a05:6a00:130a:: with SMTP id j10mr22700575pfu.32.1643698884896;
        Mon, 31 Jan 2022 23:01:24 -0800 (PST)
Received: from voyager.lan ([45.124.203.14])
        by smtp.gmail.com with ESMTPSA id il18sm1643363pjb.27.2022.01.31.23.01.22
        for <soc@kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Jan 2022 23:01:23 -0800 (PST)
Sender: "joel.stan@gmail.com" <joel.stan@gmail.com>
From: Joel Stanley <joel@jms.id.au>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Subject: [PATCH] soc: aspeed: lpc-ctrl: Block error printing on probe defer cases
Date: Tue,  1 Feb 2022 17:31:18 +1030
Message-Id: <20220201070118.196372-1-joel@jms.id.au>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>

Add a checking code when it gets -EPROBE_DEFER while getting a clock
resource. In this case, it doesn't need to print out an error message
because the probing will be re-visited.

Signed-off-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Reviewed-by: Andrew Jeffery <andrew@aj.id.au>
Reviewed-by: Iwona Winiarska <iwona.winiarska@intel.com>
Link: https://lore.kernel.org/r/20211104173709.222912-1-jae.hyun.yoo@intel.com
Signed-off-by: Joel Stanley <joel@jms.id.au>
---
Please apply this through the soc tree as a fix.

 drivers/soc/aspeed/aspeed-lpc-ctrl.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/soc/aspeed/aspeed-lpc-ctrl.c b/drivers/soc/aspeed/aspeed-lpc-ctrl.c
index 72771e018c42..258894ed234b 100644
--- a/drivers/soc/aspeed/aspeed-lpc-ctrl.c
+++ b/drivers/soc/aspeed/aspeed-lpc-ctrl.c
@@ -306,10 +306,9 @@ static int aspeed_lpc_ctrl_probe(struct platform_device *pdev)
 	}
 
 	lpc_ctrl->clk = devm_clk_get(dev, NULL);
-	if (IS_ERR(lpc_ctrl->clk)) {
-		dev_err(dev, "couldn't get clock\n");
-		return PTR_ERR(lpc_ctrl->clk);
-	}
+	if (IS_ERR(lpc_ctrl->clk))
+		return dev_err_probe(dev, PTR_ERR(lpc_ctrl->clk),
+				     "couldn't get clock\n");
 	rc = clk_prepare_enable(lpc_ctrl->clk);
 	if (rc) {
 		dev_err(dev, "couldn't enable clock\n");
-- 
2.34.1

