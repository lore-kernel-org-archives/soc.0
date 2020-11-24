Return-Path: <SRS0=uVGZ=E6=cerno.tech=maxime@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54026C2D0E4
	for <soc@archiver.kernel.org>; Tue, 24 Nov 2020 10:35:53 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 13C3B2076B; Tue, 24 Nov 2020 10:35:53 +0000 (UTC)
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com [66.111.4.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BC23E20708
	for <soc@kernel.org>; Tue, 24 Nov 2020 10:35:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BC23E20708
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=cerno.tech
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=maxime@cerno.tech
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
	by mailout.nyi.internal (Postfix) with ESMTP id 5ECAB5C01F2;
	Tue, 24 Nov 2020 05:35:50 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute6.internal (MEProxy); Tue, 24 Nov 2020 05:35:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
	from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding; s=fm1; bh=eGkugY0ERTRhb+8Paq2NccKAoP
	rgm2JRJwCsoW6Xviw=; b=Oh9Eocx+ViOdp5JskwCP9XNvumsvi0jne18Xk+1Kte
	Z3jV7nsxFWVE09b/eAYyd+r11W1WensfUw+mviOcLc8147RRRoUb2VYxxoHn9+1k
	8NXcDvzK6QXGpZFXmKbIUoyJ+vBFW+GptqYCBLYYkkBYFOP3iYTU+hfYDMfppC3Y
	pOofhklHehVuOGAFv60buq340eyS+CuUEWoDb9LsROma3v/RaKh5iCWOa5njvYMx
	u47DqCOtA7lB6Jza3Zlfr08jHwtfvRyI1LPnljmEgEJ39DMzPR+JWEA5f43XkWDe
	mdk2JBO/OeyWwPeN3m+ETsKWHVm8Hx8H1tlGFBgXiU3A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:date:from
	:message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=eGkugY0ERTRhb+8Pa
	q2NccKAoPrgm2JRJwCsoW6Xviw=; b=N6gC3HVqXPqv8UqLu9KdJMQhqehVfM637
	8oL8aRPtAGYMdwrp/g/dYcxvy9Mjkpwq9vgI5/HOnUtOfkyqr7Roa1YHMyFRrmrd
	xgoO74+l085ARhiuHLnD5bF4tnE+WMoUuNUdpyWW5XmGqW1ZYSAgCdwvt1wzsUhs
	rcfkOCMc99BDHc4P6d5qPysYSebYpG/xTrELnKuoGWr69wAyLm1Yp5OsshDWJEYz
	FabYChg7q/vTCOlCBu1YNKGyaQYr0BwPFmpVkulyWFZ2DyWmeD8tY8lxJKW7KODY
	Slt6WhoTZWcV2t7woiOblmeEBXDqj+99vfdCyIKAqZZ7zYDBUQGQg==
X-ME-Sender: <xms:BeK8X3023F9BGdfiLWbQf_Ih7vawcuykR0ejioKSv_uWYEdRiBcL7g>
    <xme:BeK8X2Gd6ZJs4jLi6kognprUCyRLubQQo3JijKwOgIJ9lKg-BlvvI72xV_wSKYhEl
    Roqc7HXDS16E-6zPEg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrudegkedgudejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgggfestdekredtre
    dttdenucfhrhhomhepofgrgihimhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhn
    ohdrthgvtghhqeenucggtffrrghtthgvrhhnpeejffehuddvvddvlefhgeelleffgfeije
    dvhefgieejtdeiueetjeetfeeukeejgeenucfkphepledtrdekledrieekrdejieenucev
    lhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvg
    estggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:BeK8X36AqZtSBBFzNuVuDLtO9-bcKI_iqrmnav9ATqxundUPCTte5Q>
    <xmx:BeK8X81VqI2dDBCcghjl32JR7WYrMLfNKpFQC3yVW8pCVqyK1t0xUQ>
    <xmx:BeK8X6F6AqnKv6dFfwK89w4k3s9V0e8sn0xA6J70hc9q4P25SV2eYQ>
    <xmx:BuK8X8Nt9aR0TuQO4WyeJCFAoyoFUoccsTEuueI3nI-zW0Jre8QsYw>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr [90.89.68.76])
	by mail.messagingengine.com (Postfix) with ESMTPA id 13FF13280066;
	Tue, 24 Nov 2020 05:35:48 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Cc: Chen-Yu Tsai <wens@csie.org>,
	Maxime Ripard <maxime@cerno.tech>,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH] soc: sunxi: Fix compilation of sunxi_mbus
Date: Tue, 24 Nov 2020 11:35:46 +0100
Message-Id: <20201124103546.839711-1-maxime@cerno.tech>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

dma_direct_set_offset has been moved from dma-mapping.h to
dma-map-ops.h, but our driver hasn't been updated resulting in a build
breakage. Let's change the header to fix the build.

Fixes: 16fee29b0735 ("dma-mapping: remove the dma_direct_set_offset export")
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/soc/sunxi/sunxi_mbus.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soc/sunxi/sunxi_mbus.c b/drivers/soc/sunxi/sunxi_mbus.c
index a9d077f73c3a..e9925c8487d7 100644
--- a/drivers/soc/sunxi/sunxi_mbus.c
+++ b/drivers/soc/sunxi/sunxi_mbus.c
@@ -2,7 +2,7 @@
 /* Copyright (C) 2020 Maxime Ripard <maxime@cerno.tech> */
 
 #include <linux/device.h>
-#include <linux/dma-mapping.h>
+#include <linux/dma-map-ops.h>
 #include <linux/init.h>
 #include <linux/notifier.h>
 #include <linux/of.h>
-- 
2.28.0

