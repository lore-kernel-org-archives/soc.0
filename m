Return-Path: <SRS0=mxEd=GP=linaro.org=linus.walleij@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4767C433E0
	for <soc@archiver.kernel.org>; Tue, 12 Jan 2021 09:27:55 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id A80C722E00; Tue, 12 Jan 2021 09:27:55 +0000 (UTC)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1A3A222DFB
	for <soc@kernel.org>; Tue, 12 Jan 2021 09:27:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1A3A222DFB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=linus.walleij@linaro.org
Received: by mail-lf1-f47.google.com with SMTP id h205so2323695lfd.5
        for <soc@kernel.org>; Tue, 12 Jan 2021 01:27:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=METSwAua1CAp5GIW9nV/dGIaSqOoqj6ibm2D9U37vGA=;
        b=ArdnwJpwBVhcf184x5Q7iXSC6Nz2fALSAgBU2C/7pl9gSIe017C6LnR3XMS41+M8Rr
         328cXoMFHQRqH7bnQ9n1SqYXQgpf486QwXnDsiwP4YZyylcYi2QvgHPGxBO+Xam7wOtm
         6/HEgB2MZ//CxqsOf2mgDGcX9gRy4qTGsJgyGtRygE2ROQ15mPJeAXBssSKVkb/ARYj+
         ljgqbR2eEq/NNadWRYhltLE0rSajZ7C/p3nf2D4dnBSSLKcTHcAzdY/+XgeugxmqQK35
         bKFLndcchzp5FLO18egceLk7Sp8ggAPG2uAa3JfzUCgpISc45/J1iBgGsTC1wVNe5nr7
         72Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=METSwAua1CAp5GIW9nV/dGIaSqOoqj6ibm2D9U37vGA=;
        b=IR1IOYTgNAWSugbT0PEh4qWULk68kwrvUQHWCzbSqduONqu+wfkMv/J/U7jEdNyds5
         OLNaNnlZ5x3B/OxnkVj/9A5lK3bA4piE3jFvYkn+NE8BLzlQt1D1iYwCDscmZvtiDviN
         +BLJqXMO5BxhF4RjdooTd5A4d+NO5ZzrLpGEjZMDba1aQiVfquuGp0rRi2Qb+3jYt9Tv
         ILqdwMMC3xruY5yFXlK4x30NzETlOKTY0//2nZVubH1eqptab9iDObAwxpPOAESJz5LN
         Bxnm8/q6NWhBNjlwuyqvRLYQXq4aB06uAwTkDSUPgftlZW4gdMF/cCfPzL9dC2p2GJT0
         2Qag==
X-Gm-Message-State: AOAM531nlglZUbU+irXXwprDIqRZN1R7pIsVg468YjsdLWNmB4fgoXSB
	VJ/IxTuATvGGfCDCmUHo6LxzFA==
X-Google-Smtp-Source: ABdhPJy/1VhSSmbVyYAv9anuZRB8fkOnCkbdKseZs6M8PkdIdtZKQCiM7Qkc6y1+ma3r3wRRVjtEkg==
X-Received: by 2002:a19:8c05:: with SMTP id o5mr1693454lfd.304.1610443673114;
        Tue, 12 Jan 2021 01:27:53 -0800 (PST)
Received: from localhost.localdomain (c-92d7225c.014-348-6c756e10.bbcust.telenor.se. [92.34.215.146])
        by smtp.gmail.com with ESMTPSA id n25sm318630lfh.177.2021.01.12.01.27.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Jan 2021 01:27:52 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	Sumera Priyadarsini <sylphrenadin@gmail.com>,
	Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH] bus: arm-integrator-lm: Add of_node_put() before return statement
Date: Tue, 12 Jan 2021 10:25:49 +0100
Message-Id: <20210112092549.251548-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Sumera Priyadarsini <sylphrenadin@gmail.com>

Every iteration of for_each_available_child_of_node() decrements
the reference count of the previous node, however when control is
transferred from the middle of the loop, as in the case of a return
or break or goto, there is no decrement thus ultimately resulting in
a memory leak.

Fix a potential memory leak in arm-integrator-lm.c by inserting
of_node_put() before a return statement.

Issue found with Coccinelle.

Signed-off-by: Sumera Priyadarsini <sylphrenadin@gmail.com>
Link: https://lore.kernel.org/r/20200829174154.GA9319@Kaladin
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
SoC people: please apply this directly as a non-urgent fix,
I have no other patches for Versatile right now.
---
 drivers/bus/arm-integrator-lm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/bus/arm-integrator-lm.c b/drivers/bus/arm-integrator-lm.c
index 845b6c43fef8..2344d560b144 100644
--- a/drivers/bus/arm-integrator-lm.c
+++ b/drivers/bus/arm-integrator-lm.c
@@ -54,6 +54,7 @@ static int integrator_lm_populate(int num, struct device *dev)
 			ret = of_platform_default_populate(child, NULL, dev);
 			if (ret) {
 				dev_err(dev, "failed to populate module\n");
+				of_node_put(child);
 				return ret;
 			}
 		}
-- 
2.29.2

