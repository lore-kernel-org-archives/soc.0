Return-Path: <SRS0=5wGQ=GC=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-21.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92D89C433E0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Dec 2020 15:21:49 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 56CC0207A6
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Dec 2020 15:21:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 56CC0207A6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=fJfr6K9N2HOWO41d3rTKkEd07kOfnvUj0fzpeshRlBE=; b=u8FGUCkCpmEkpAtc4BPUvR5zgd
	oGPkGmlOCw/EU6e5pdDeZ2X0GbmN1XZKXleOgVqrosdIbjiZJd+Fphk2h01dkRwg481xdjLwsWP/z
	MKLCvHT7ZWtyR0JGvQlkI0sgpjoyGE+sguaowA+m8pBB2ZivUtTaQ98tGGirM5du+W1zFTzb75JjO
	hlhhKBvCEpDNVj7aIRulZY8KnD5IAorBctTFt/6c47aYkMJWOaqKDUHmkuHA7hZlERDhk9X0uZKOY
	TKC8RvWdyPBFyntTn+HlDA81vjfTciM/uD0TNAlym53mp21m86HYhWM/gHfXLPfiT5Uy03H+xDSF/
	AbMSI7Xg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kudGt-0002GR-9l; Wed, 30 Dec 2020 15:20:19 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kudGq-0002Fr-Ek
 for linux-arm-kernel@lists.infradead.org; Wed, 30 Dec 2020 15:20:17 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 88273207A6;
 Wed, 30 Dec 2020 15:20:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1609341615;
 bh=9cD3rzF+jliZQDFnmk4M4xcu9Ory+11lC0lM2Tsu4OU=;
 h=From:To:List-Id:Cc:Subject:Date:From;
 b=n8HRhucWlzEZzObZp3nGR1mAY/JHQd7aLrF14pJ7/oiivyyYJ677VyO5q4+OiWhQC
 L3XcVXJrptNxwFLCHhlZPd4vb1daIRZWEeSb8auZwclBoYpA2tMwDt9QzbigIlUwc3
 eSTAY8W6FbmcDJv9p4EJXv6ldbAELZ2hMV865adDCsXTRrRMZEbXy/UkBTuKoh+Mek
 SnM3ZE+QTy0WsI2liqOTWkLzdG0eL7SlPnaNCZst65ERvsQ1NdDm2z55dFVS2FQaYZ
 sFs3/pbbPa1/clfMNaBDIIdjXxvG4tsgCLq2H2zjAw3JZbOIizE0TaMgO9YsUjIfV6
 K5m4zDkI0RjDw==
From: Arnd Bergmann <arnd@kernel.org>
To: Jamie Iles <jamie@jamieiles.com>,
	Rob Herring <robh+dt@kernel.org>
Subject: [PATCH] ARM: picoxcell: fix missing interrupt-parent properties
Date: Wed, 30 Dec 2020 16:20:05 +0100
Message-ID: <20201230152010.3914962-1-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201230_102016_577659_817CC723 
X-CRM114-Status: GOOD (  12.90  )
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
Cc: devicetree@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
 linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
 soc@kernel.org, Olof Johansson <olof@lixom.net>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20201230152005.B5jAfmxRdGjg1kcMEH2dlbxmx-qwfsYszdKBn4SPdr0@z>

From: Arnd Bergmann <arnd@arndb.de>

dtc points out that the interrupts for some devices are not parsable:

picoxcell-pc3x2.dtsi:45.19-49.5: Warning (interrupts_property): /paxi/gem@30000: Missing interrupt-parent
picoxcell-pc3x2.dtsi:51.21-55.5: Warning (interrupts_property): /paxi/dmac@40000: Missing interrupt-parent
picoxcell-pc3x2.dtsi:57.21-61.5: Warning (interrupts_property): /paxi/dmac@50000: Missing interrupt-parent
picoxcell-pc3x2.dtsi:233.21-237.5: Warning (interrupts_property): /rwid-axi/axi2pico@c0000000: Missing interrupt-parent

There are two VIC instances, so it's not clear which one needs to be
used. I found the BSP sources that reference VIC0, so use that:

https://github.com/r1mikey/meta-picoxcell/blob/master/recipes-kernel/linux/linux-picochip-3.0/0001-picoxcell-support-for-Picochip-picoXcell-SoC.patch

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/arm/boot/dts/picoxcell-pc3x2.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/picoxcell-pc3x2.dtsi b/arch/arm/boot/dts/picoxcell-pc3x2.dtsi
index c4c6c7e9e37b..5898879a3038 100644
--- a/arch/arm/boot/dts/picoxcell-pc3x2.dtsi
+++ b/arch/arm/boot/dts/picoxcell-pc3x2.dtsi
@@ -45,18 +45,21 @@ paxi {
 		emac: gem@30000 {
 			compatible = "cadence,gem";
 			reg = <0x30000 0x10000>;
+			interrupt-parent = <&vic0>;
 			interrupts = <31>;
 		};
 
 		dmac1: dmac@40000 {
 			compatible = "snps,dw-dmac";
 			reg = <0x40000 0x10000>;
+			interrupt-parent = <&vic0>;
 			interrupts = <25>;
 		};
 
 		dmac2: dmac@50000 {
 			compatible = "snps,dw-dmac";
 			reg = <0x50000 0x10000>;
+			interrupt-parent = <&vic0>;
 			interrupts = <26>;
 		};
 
@@ -233,6 +236,7 @@ ebi@50000000 {
 		axi2pico@c0000000 {
 			compatible = "picochip,axi2pico-pc3x2";
 			reg = <0xc0000000 0x10000>;
+			interrupt-parent = <&vic0>;
 			interrupts = <13 14 15 16 17 18 19 20 21>;
 		};
 	};
-- 
2.29.2


_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
