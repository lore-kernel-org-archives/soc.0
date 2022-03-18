Return-Path: <SRS0=3feU=T5=inria.fr=Julia.Lawall@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E385C4332F
	for <soc@archiver.kernel.org>; Fri, 18 Mar 2022 10:37:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id C4916C340E8; Fri, 18 Mar 2022 10:37:51 +0000 (UTC)
Received: from mail3-relais-sop.national.inria.fr (mail3-relais-sop.national.inria.fr [192.134.164.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id B7EA2C340EC;
	Fri, 18 Mar 2022 10:37:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org B7EA2C340EC
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=inria.fr
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=kLFY9Yxqe1s3OOFAPDyKIWGJGBLJRoXKVlnXfo8VTrQ=;
  b=EKOvbyqoGSC/JvN9rk4SvEUe1jyqefG6RQQe6dlY+/PslstO3gPjh2Px
   7vuORTfLDtlAWDsH4A1vWe/Bkx+iGaPJCIRthnj4i/tuHxOKFEG7PaRQz
   8NFKvGigLS1kz6xHrGc1j5x8nurYPRMzUUtwwyM7xhkJdI7SxqUCWPgiR
   I=;
Authentication-Results: mail3-relais-sop.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=Julia.Lawall@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="5.90,192,1643670000"; 
   d="scan'208";a="8935657"
Received: from i80.paris.inria.fr (HELO i80.paris.inria.fr.) ([128.93.90.48])
  by mail3-relais-sop.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2022 11:37:38 +0100
From: Julia Lawall <Julia.Lawall@inria.fr>
To: Viresh Kumar <vireshk@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: kernel-janitors@vger.kernel.org,
	Shiraz Hashim <shiraz.linux.kernel@gmail.com>,
	soc@kernel.org,
	Russell King <linux@armlinux.org.uk>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ARM: spear: fix typos in comments
Date: Fri, 18 Mar 2022 11:37:16 +0100
Message-Id: <20220318103729.157574-21-Julia.Lawall@inria.fr>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Various spelling mistakes in comments.
Detected with the help of Coccinelle.

Signed-off-by: Julia Lawall <Julia.Lawall@inria.fr>

---
 arch/arm/mach-spear/spear13xx.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/mach-spear/spear13xx.c b/arch/arm/mach-spear/spear13xx.c
index 74d1ca2a529a..b38391e9d8bf 100644
--- a/arch/arm/mach-spear/spear13xx.c
+++ b/arch/arm/mach-spear/spear13xx.c
@@ -29,7 +29,7 @@ void __init spear13xx_l2x0_init(void)
 	/*
 	 * 512KB (64KB/way), 8-way associativity, parity supported
 	 *
-	 * FIXME: 9th bit, of Auxillary Controller register must be set
+	 * FIXME: 9th bit, of Auxiliary Controller register must be set
 	 * for some spear13xx devices for stable L2 operation.
 	 *
 	 * Enable Early BRESP, L2 prefetch for Instruction and Data,

