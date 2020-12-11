Return-Path: <SRS0=NAge=FP=gmail.com=joel.stan@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62B13C433FE
	for <soc@archiver.kernel.org>; Fri, 11 Dec 2020 11:13:05 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 0530323EF3; Fri, 11 Dec 2020 11:13:05 +0000 (UTC)
Received: from mail-pj1-f68.google.com (mail-pj1-f68.google.com [209.85.216.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AD58323EF2
	for <soc@kernel.org>; Fri, 11 Dec 2020 11:13:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AD58323EF2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=joel.stan@gmail.com
Received: by mail-pj1-f68.google.com with SMTP id iq13so2038665pjb.3
        for <soc@kernel.org>; Fri, 11 Dec 2020 03:13:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=i0qLd1y065xaAwFfQAElNav/tMxkC3MXtU6ZbI3ZaPQ=;
        b=szSi/1rZgxwasm/KaKA1RSMg1hG4ibI3SCZbMElGmGgr2P2cYIzQgFUU8qIIvIDwms
         WCI5VDiQr5zadTnwLaCpHdNn9iPaMbTnvRSqsanNHP2oYAIS045cE6lXbojkgLss4mUi
         P8IR+Fq0/0+uNmRAyDBni7hEv410aP87owLG0d1LJpVw0GQ1vFA0eSmt6nDhiUPnkRDR
         65Jwx+fgcB87ypu+zDXDQZmOZ4eWQWl5cUVashPeywBbAzmi2kbUoFKW8xYrCeleESvK
         nkUATtOpR2EYbwFkw8Bfi8tHUEbB4LgVXmXOgxdcpiqy+S22xViRJZLHxw3RvQiu70os
         izjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :mime-version:content-transfer-encoding;
        bh=i0qLd1y065xaAwFfQAElNav/tMxkC3MXtU6ZbI3ZaPQ=;
        b=rvbQM7Wmnq0BTNM8DMPGgamVZVKulz9sfu87uA1LotEnTmpbkBznP4JJgo32Pa157h
         WFKE2gTIiPIPJt/TnpgP6oziz8PCufTUJpQtXqRtzrtEFp+j9QaDft0Rrt/26ptL+1yk
         O1B94KUzguZGkwWKqmcInez0eprBYBTAxuqD8H7n1LK04FtKxnuYLa4KIL0Lnlw1lk79
         /EwJYf3Q8UQRJ050pOq7HWD/jMChrx8KYRCIIazO8BfKS2JhDzMO5tHUj1mQeqvG5tOF
         QQ/xktcFGBLSbBg+K2ecSmm/RfqyFVmduIrKAhmjVLhiwM8bSDv6UTkkuDFvNyZHEZ9P
         wNLQ==
X-Gm-Message-State: AOAM530+Hic+I+t9JzVgabLOVVzw7IPGU2nJyZ9P+5wcUxUrJ670abkH
	6EMXN0Lvw/F6c+QNo4rgJv5Mo7Mw7I/nzQ==
X-Google-Smtp-Source: ABdhPJx483rDnlGxDYyST9iFZ75JyHUgrSHBXhhtzd8mU8DynBiH4/QSnYFuK5La3PBOKK40/XjVBw==
X-Received: by 2002:a17:90a:658c:: with SMTP id k12mr12491418pjj.31.1607685182982;
        Fri, 11 Dec 2020 03:13:02 -0800 (PST)
Received: from voyager.home ([2001:8004:1580:fed:f7ad:243d:27f1:d714])
        by smtp.gmail.com with ESMTPSA id h17sm9290999pfo.220.2020.12.11.03.12.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Dec 2020 03:13:01 -0800 (PST)
Sender: "joel.stan@gmail.com" <joel.stan@gmail.com>
From: Joel Stanley <joel@jms.id.au>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Cc: Jae Hyun Yoo <jae.hyun.yoo@intel.com>,
	Vernon Mauery <vernon.mauery@linux.intel.com>,
	John Wang <wangzhiqiang.bj@bytedance.com>
Subject: [PATCH] soc: aspeed: Add clock control logic into Aspeed LPC SNOOP driver
Date: Fri, 11 Dec 2020 21:42:53 +1030
Message-Id: <20201211111253.954321-1-joel@jms.id.au>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Jae Hyun Yoo <jae.hyun.yoo@intel.com>

If LPC SNOOP driver is registered ahead of lpc-ctrl module, LPC
SNOOP block will be enabled without heart beating of LCLK until
lpc-ctrl enables the LCLK. This issue causes improper handling on
host interrupts when the host sends interrupt in that time frame.
Then kernel eventually forcibly disables the interrupt with
dumping stack and printing a 'nobody cared this irq' message out.

To prevent this issue, all LPC sub-nodes should enable LCLK
individually so this patch adds clock control logic into the LPC
SNOOP driver.

Fixes: 3772e5da4454 ("drivers/misc: Aspeed LPC snoop output using misc chardev")
Signed-off-by: Jae Hyun Yoo <jae.hyun.yoo@intel.com>
Signed-off-by: Vernon Mauery <vernon.mauery@linux.intel.com>
Signed-off-by: John Wang <wangzhiqiang.bj@bytedance.com>
Reviewed-by: Joel Stanley <joel@jms.id.au>
Link: https://lore.kernel.org/r/20201208091748.1920-1-wangzhiqiang.bj@bytedance.com
Signed-off-by: Joel Stanley <joel@jms.id.au>
---
Soc maintainers, please apply for 5.11.

 drivers/soc/aspeed/aspeed-lpc-snoop.c | 30 ++++++++++++++++++++++++---
 1 file changed, 27 insertions(+), 3 deletions(-)

diff --git a/drivers/soc/aspeed/aspeed-lpc-snoop.c b/drivers/soc/aspeed/aspeed-lpc-snoop.c
index 682ba0eb4eba..20acac6342ef 100644
--- a/drivers/soc/aspeed/aspeed-lpc-snoop.c
+++ b/drivers/soc/aspeed/aspeed-lpc-snoop.c
@@ -11,6 +11,7 @@
  */
 
 #include <linux/bitops.h>
+#include <linux/clk.h>
 #include <linux/interrupt.h>
 #include <linux/fs.h>
 #include <linux/kfifo.h>
@@ -67,6 +68,7 @@ struct aspeed_lpc_snoop_channel {
 struct aspeed_lpc_snoop {
 	struct regmap		*regmap;
 	int			irq;
+	struct clk		*clk;
 	struct aspeed_lpc_snoop_channel chan[NUM_SNOOP_CHANNELS];
 };
 
@@ -282,22 +284,42 @@ static int aspeed_lpc_snoop_probe(struct platform_device *pdev)
 		return -ENODEV;
 	}
 
+	lpc_snoop->clk = devm_clk_get(dev, NULL);
+	if (IS_ERR(lpc_snoop->clk)) {
+		rc = PTR_ERR(lpc_snoop->clk);
+		if (rc != -EPROBE_DEFER)
+			dev_err(dev, "couldn't get clock\n");
+		return rc;
+	}
+	rc = clk_prepare_enable(lpc_snoop->clk);
+	if (rc) {
+		dev_err(dev, "couldn't enable clock\n");
+		return rc;
+	}
+
 	rc = aspeed_lpc_snoop_config_irq(lpc_snoop, pdev);
 	if (rc)
-		return rc;
+		goto err;
 
 	rc = aspeed_lpc_enable_snoop(lpc_snoop, dev, 0, port);
 	if (rc)
-		return rc;
+		goto err;
 
 	/* Configuration of 2nd snoop channel port is optional */
 	if (of_property_read_u32_index(dev->of_node, "snoop-ports",
 				       1, &port) == 0) {
 		rc = aspeed_lpc_enable_snoop(lpc_snoop, dev, 1, port);
-		if (rc)
+		if (rc) {
 			aspeed_lpc_disable_snoop(lpc_snoop, 0);
+			goto err;
+		}
 	}
 
+	return 0;
+
+err:
+	clk_disable_unprepare(lpc_snoop->clk);
+
 	return rc;
 }
 
@@ -309,6 +331,8 @@ static int aspeed_lpc_snoop_remove(struct platform_device *pdev)
 	aspeed_lpc_disable_snoop(lpc_snoop, 0);
 	aspeed_lpc_disable_snoop(lpc_snoop, 1);
 
+	clk_disable_unprepare(lpc_snoop->clk);
+
 	return 0;
 }
 
-- 
2.29.2

