Return-Path: <SRS0=gmZ6=GP=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FF5FC433DB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Jan 2021 09:29:26 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 121C5221EF
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Jan 2021 09:29:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 121C5221EF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=F7Hn6lQYtpYYorGTKHpM8WYsAC94My1Idv5MomW5yjA=; b=gf37wjov9Zgu8+v2Glc1kJdiBf
	4k7ubZmgqjAPorBkOVei1H/rZq3j+/FTwDwgxXqUmZTGogkM82R8v6WLrQUrgOioslH3eYoSyuqb4
	vxPBLsnjwdsrun+UNl3LmEdPVIDwVbl/rbHNNQOdrBBmtPrH3IL0itK/QhzEUby4Ipgs0wbFkc+RO
	oHObPLJWpr/cUsYMDc4J/TmOnOl2jEFv7Wbvs9wUh1LXFkK2ZMma/lCTJlVaqQI4blUNa0qWUoIg5
	4hBjJ7CB9G8VcbCpXH/tSatMQPPomndIEBiDmfjJfEE/Q/PYNH2mKoeLS2xP/OqfUKk1oUkQuY+ZY
	LE2BPMEg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kzFy1-0006pE-Pd; Tue, 12 Jan 2021 09:27:57 +0000
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kzFxy-0006nv-TG
 for linux-arm-kernel@lists.infradead.org; Tue, 12 Jan 2021 09:27:55 +0000
Received: by mail-lf1-x133.google.com with SMTP id x20so2269143lfe.12
 for <linux-arm-kernel@lists.infradead.org>;
 Tue, 12 Jan 2021 01:27:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
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
 b=cVgbZcxsgNHfgzD4ILXBAGfKXnxXBdSNLNHCKnCdMpnQ7uxRxR8IBJ1mbkiYl9nt6A
 YA2SSbUQoZSjqAxcRiHWaPq7uaqRIyrR5t/r0zsV+gI2NzPBe834ErUojupyVCtjYgnG
 3HDxiW3bMstSNWFuhwF27WSLbIjsfkSgvLI/6tUwV0lXw9TqHbqvUgxm8o3wX4NL80ms
 gggUJcj70WRKM2UUbIhQJdviHYsT05/Dz+Fbp4UUFcMfJueIsAGsbDEtCvzgWBXKyx7e
 ZLCeG5YPlEGAAyFR/p3gX22YuXSRgRguPyyX3lZe7Fcc3+M3FyJ5Pr2T1gELB0t+neam
 HPvA==
X-Gm-Message-State: AOAM531ZEnxnzsRzJxJFjGpXl2HdW2U44x3MVkqn3O5TreTSkkn+o7q3
 r2p54Fo0arqMyhF+j0b/CQPPgg==
X-Google-Smtp-Source: ABdhPJy/1VhSSmbVyYAv9anuZRB8fkOnCkbdKseZs6M8PkdIdtZKQCiM7Qkc6y1+ma3r3wRRVjtEkg==
X-Received: by 2002:a19:8c05:: with SMTP id o5mr1693454lfd.304.1610443673114; 
 Tue, 12 Jan 2021 01:27:53 -0800 (PST)
Received: from localhost.localdomain
 (c-92d7225c.014-348-6c756e10.bbcust.telenor.se. [92.34.215.146])
 by smtp.gmail.com with ESMTPSA id n25sm318630lfh.177.2021.01.12.01.27.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Jan 2021 01:27:52 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Subject: [PATCH] bus: arm-integrator-lm: Add of_node_put() before return
 statement
Date: Tue, 12 Jan 2021 10:25:49 +0100
Message-ID: <20210112092549.251548-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210112_042754_972649_DF62FDD5 
X-CRM114-Status: GOOD (  14.14  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Cc: Linus Walleij <linus.walleij@linaro.org>,
 Sumera Priyadarsini <sylphrenadin@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210112092549.91UxitD7jZ3QVfqHxU5Qw1iT4vHZIikGbsBH8XZvv40@z>

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


_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
