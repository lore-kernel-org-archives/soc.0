Return-Path: <SRS0=Sdul=E6=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 088B6C2D0E4
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Nov 2020 10:36:35 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 77C7320708
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Nov 2020 10:36:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="sNc790Lf";
	dkim=temperror (0-bit key) header.d=cerno.tech header.i=@cerno.tech header.b="Oh9Eocx+";
	dkim=temperror (0-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="N6gC3HVq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 77C7320708
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=cerno.tech
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=cTJcJjFehkJhMZ4oeMCOtd7n8JUl2R4784LFr9Emz+k=; b=sNc790LfnPKPT6oNRLKxYQQyk+
	RcniB50WxoOLmMO+OSs5qCsT7moBzHttvaiztaGgqK7oimw9hUFyPL84tCFS1BTlJiceKU/b2hr4A
	9hXh0R8QYkIusOKYQOmuf2QdXALZcjxxjxkktBz+1ahx+FkXBRGisgmKLIjFx6lcogQQeYgNpKNGh
	U0KgEyzuk80w+VBpBAan+84BRcBcV/x/9Blk3kYyCfOKyz9EjEIe+em4DHKRA0Uq9kTPcl91U00a7
	XzVS62K1eubHM3Uo0YJYujoAWIi7I4WvvHx9jkQ/Z1Cw6FFpo3zbzfCgSGJkrM1EPHOqjDgV81aBd
	ZCCJ7bfg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1khVfz-0001Sc-6m; Tue, 24 Nov 2020 10:35:59 +0000
Received: from out3-smtp.messagingengine.com ([66.111.4.27])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1khVfw-0001RJ-8o
 for linux-arm-kernel@lists.infradead.org; Tue, 24 Nov 2020 10:35:57 +0000
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
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 13FF13280066;
 Tue, 24 Nov 2020 05:35:48 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Subject: [PATCH] soc: sunxi: Fix compilation of sunxi_mbus
Date: Tue, 24 Nov 2020 11:35:46 +0100
Message-ID: <20201124103546.839711-1-maxime@cerno.tech>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201124_053556_463536_7F1CC2AE 
X-CRM114-Status: GOOD (  12.01  )
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
Cc: Chen-Yu Tsai <wens@csie.org>, Maxime Ripard <maxime@cerno.tech>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20201124103546.aXbv0VtkFXlbY9wmb3X1iBtdL6qwlR9Fcc8wRoCD_Oo@z>

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


_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
