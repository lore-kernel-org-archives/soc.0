Return-Path: <SRS0=2LUn=GY=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A204BC433DB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Jan 2021 03:44:54 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 552CB2389A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Jan 2021 03:44:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 552CB2389A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=v3.sk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=spHbSOGfxX9PI5c3zbNlMZUc8aCZkl10QYedVi0HD50=; b=1cTkWjAaZYjbm4CNzA9aPNgOp
	zaeiRKhwLsto1Goc4jb6zGstHL4H+L09gtZs2B4U5zg8zmcTSVpJANLzVn8zski4RDOiDiv8Svl85
	vnnQVba1ypUCmWoAEVJ5EedzA6qvFHHDdtXzlUitmEe9Iy+4191kmZE85vZT8fImIcVj6m2yb9Xer
	/cAoaIcYfivzYXOvpkupdSqKlMrByPBl09zM6RJr8gf0dZAv/f/ZDX/688l1FS/HxohOI8/0sO31+
	yx6hUCgDtBjuiodZ0D0XYee2GXBnkFCF1o9WiiRPm1Auc7i+TC/tPTLiL3AhWGgxRLXFh9JUgeBBJ
	s0Hnn4Rjw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l2QsH-0006UM-GG; Thu, 21 Jan 2021 03:43:09 +0000
Received: from mail.v3.sk ([167.172.186.51] helo=shell.v3.sk)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l2Qqq-000670-TW
 for linux-arm-kernel@lists.infradead.org; Thu, 21 Jan 2021 03:41:48 +0000
Received: from localhost (localhost.localdomain [127.0.0.1])
 by zimbra.v3.sk (Postfix) with ESMTP id 06C37E0AA7;
 Thu, 21 Jan 2021 03:37:44 +0000 (UTC)
Received: from shell.v3.sk ([127.0.0.1])
 by localhost (zimbra.v3.sk [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id cvsnP83ra3B4; Thu, 21 Jan 2021 03:37:43 +0000 (UTC)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by zimbra.v3.sk (Postfix) with ESMTP id ABD25E0AA6;
 Thu, 21 Jan 2021 03:37:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at zimbra.v3.sk
Received: from shell.v3.sk ([127.0.0.1])
 by localhost (zimbra.v3.sk [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id U_8s97sQJy5Q; Thu, 21 Jan 2021 03:37:43 +0000 (UTC)
Received: from localhost (unknown [109.183.109.54])
 by zimbra.v3.sk (Postfix) with ESMTPSA id 754ACE0AAA;
 Thu, 21 Jan 2021 03:37:43 +0000 (UTC)
From: Lubomir Rintel <lkundrak@v3.sk>
To: Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>
Subject: [PATCH 08/12] ARM: dts: mmp2-olpc-xo-1-75: Use symbolic names for
 audio clocks
Date: Thu, 21 Jan 2021 04:41:26 +0100
Message-ID: <20210121034130.1381872-9-lkundrak@v3.sk>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210121034130.1381872-1-lkundrak@v3.sk>
References: <20210121034130.1381872-1-lkundrak@v3.sk>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210120_224141_163726_6354C8B9 
X-CRM114-Status: GOOD (  10.52  )
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
List-Id: <soc.lore.kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Lubomir Rintel <lkundrak@v3.sk>, SoC Team <soc@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210121034126.1BG0TPEA1wF0PHnTzKWK1E_MXsECpDcX64w5HaPSsbg@z>

These are slighly easier to read.

Signed-off-by: Lubomir Rintel <lkundrak@v3.sk>
---
 arch/arm/boot/dts/mmp2-olpc-xo-1-75.dts | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/mmp2-olpc-xo-1-75.dts b/arch/arm/boot/dts/mmp2-olpc-xo-1-75.dts
index 0f8b5ad48deed..55ea87870af3e 100644
--- a/arch/arm/boot/dts/mmp2-olpc-xo-1-75.dts
+++ b/arch/arm/boot/dts/mmp2-olpc-xo-1-75.dts
@@ -2,7 +2,7 @@
 /*
  * OLPC XO 1.75 Laptop.
  *
- * Copyright (C) 2018,2019 Lubomir Rintel <lkundrak@v3.sk>
+ * Copyright (C) 2018,2019,2020 Lubomir Rintel <lkundrak@v3.sk>
  */
 
 /dts-v1/;
@@ -10,6 +10,7 @@
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/input/linux-event-codes.h>
 #include <dt-bindings/interrupt-controller/irq.h>
+#include <dt-bindings/clock/marvell,mmp2-audio.h>
 
 / {
 	model = "OLPC XO-1.75";
@@ -194,7 +195,7 @@ audio-codec@1a {
 		port {
 			rt5631_0: endpoint {
 				mclk-fs = <256>;
-				clocks = <&audio_clk 0>;
+				clocks = <&audio_clk MMP2_CLK_AUDIO_SYSCLK>;
 				remote-endpoint = <&sspa0_0>;
 			};
 		};
-- 
2.29.2


_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
