Return-Path: <SRS0=mpRk=HM=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8CA5C433DB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Feb 2021 17:24:40 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 56F9464EAA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Feb 2021 17:24:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 56F9464EAA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe
	:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=sDbhI7LLsex8jKkPa/AmIusmc7Ps2WzPV+vUiWZJgpU=; b=IEpn+7sNvPas4Hg4+sKSvDdiZ7
	INQNAYuW0JgU3rOeo82Kmz6jDgprhbVUgXNujkW2/hZmbwkBT568xrKjsKp9mDu3RqCTlee2TOoBj
	RuXynyrURklU3f2qhWo77wHU+R4fcoJPZ7g47SKlMPuDiogmzqrdFdQVdEOHLteuSXTFMQlQHdwQ0
	iycMBbp6X3QI0fkBPIke9YAiecV/s9hNOPWghUW79rEGFe80F7JEF7/51caWfhaFllzeRZbTui/gM
	pkFGd6MbOe6aBGqauYMjUlynVQfmt/U6rQ2J4ThXtKzd4xOQTiA/LYvt5BJAExfELMH8x/23Kd73+
	oJrxNGYQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l9tDE-0001vO-Rn; Wed, 10 Feb 2021 17:23:36 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l9tCs-0001nj-HN
 for linux-arm-kernel@lists.infradead.org; Wed, 10 Feb 2021 17:23:26 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1FE8E64DE3;
 Wed, 10 Feb 2021 17:23:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1612977793;
 bh=8GU9DVtt/5bde9Q4EVBFu3ii3pwB0bk2nJKprnW4oJs=;
 h=From:List-Id:To:Subject:Date:From;
 b=WX69UVuOne21ABCZWN8YNi/Qrp0d9qxI1FYS4ziKRO0xjTqDrd9GSAziM1SPRR18D
 cN63YoL3O0mHRghItnYdw+DzMLI297BrwZcg6c/8K0gerlF1bgDJzSrZd3HvENOVFa
 H0kYusJAMXoecWpN/xMG2CH0XXWMtlVo/z0gW9cx4svgYjeDTgcFyuZp4j75BgaBRJ
 erN2O36boqTwPtZBW22od70PZExDXM6l8tJnK5iVWO6H/O1+ywEXVxiUWmMRpdbH8j
 /77yEjHG/9uOrBOTWp6eSz/qInx1JHBfroohxIGjy7PLmwfj2W/D+Uu/0AgmLCfCGp
 n7n7Y3Ht3lHjg==
From: Krzysztof Kozlowski <krzk@kernel.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org, soc@kernel.org, Arnd Bergmann <arnd@arndb.de>,
 Olof Johansson <olof@lixom.net>, Krzysztof Kozlowski <krzk@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] MAINTAINERS: arm: samsung: include S3C headers in platform
 entry
Date: Wed, 10 Feb 2021 18:23:03 +0100
Message-ID: <20210210172303.335268-1-krzk@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210210_122314_682905_4404143F 
X-CRM114-Status: UNSURE (   9.86  )
X-CRM114-Notice: Please train this message.
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210210172303.ls2wqNrVW8KmxGAQgP1IxQPZHwFn44YTub846b78224@z>

Several S3C24xx/S3C64xx headers in include/linux are not caught by
Samsung S3C/S5P/Exynos maintainer entry and might look like abandoned.
Include them in "ARM/SAMSUNG S3C, S5P AND EXYNOS ARM ARCHITECTURES"
entry.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 MAINTAINERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 68e2b4cb4788..5f7aa507b812 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2383,6 +2383,8 @@ F:	drivers/*/*s5pv210*
 F:	drivers/memory/samsung/
 F:	drivers/soc/samsung/
 F:	drivers/tty/serial/samsung*
+F:	include/linux/platform_data/*s3c*
+F:	include/linux/serial_s3c.h
 F:	include/linux/soc/samsung/
 N:	exynos
 N:	s3c2410
-- 
2.25.1


_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
