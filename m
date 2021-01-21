Return-Path: <SRS0=2LUn=GY=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B55CC433DB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Jan 2021 03:44:43 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2366E2389A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Jan 2021 03:44:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2366E2389A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=v3.sk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=mmBI0kEdP8GbBrPTcQaMyK6dup9nsRa1IDhFLSPlZJc=; b=KvoLIFt1N1mjIHEKyrDJh6XyY
	gC6qQ5ZBibOcPA984JYJ4c/jG+o6gAPo1Lw1Lq/Y3q8u4JXyFr0qBKpdRxl7lbPL40WNi6h1dcKDh
	IP2JfDpSb9Dt58yxZFJqn6y8Vup35llFwwVOz1gow1lz4dRE3pr55r9QCMo6WO8oaWgjrsrIleI7B
	2tpPpYcHbOWu76Sao53mFQU4FZ/f3f3bwlhNw3ilRS7/PkLtOAADAf5WKpEqh2r3lkDPMokS+Umk1
	oEjsWGQYz+BihnCkrUwiSJlVRmxqEu3HnS9V6193WzBGcaqqQS/nrbHoaht7xW22QHK5b5qSazI+G
	jawN/CX5Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l2Qrl-0006KN-G5; Thu, 21 Jan 2021 03:42:38 +0000
Received: from mail.v3.sk ([167.172.186.51] helo=shell.v3.sk)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l2Qqq-00066z-TV
 for linux-arm-kernel@lists.infradead.org; Thu, 21 Jan 2021 03:41:46 +0000
Received: from localhost (localhost.localdomain [127.0.0.1])
 by zimbra.v3.sk (Postfix) with ESMTP id 6F214E0AA5;
 Thu, 21 Jan 2021 03:37:43 +0000 (UTC)
Received: from shell.v3.sk ([127.0.0.1])
 by localhost (zimbra.v3.sk [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id SxeCojyWVPUg; Thu, 21 Jan 2021 03:37:43 +0000 (UTC)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by zimbra.v3.sk (Postfix) with ESMTP id 2AEBAE0AA6;
 Thu, 21 Jan 2021 03:37:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at zimbra.v3.sk
Received: from shell.v3.sk ([127.0.0.1])
 by localhost (zimbra.v3.sk [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id 8KC0LjPfF8nu; Thu, 21 Jan 2021 03:37:43 +0000 (UTC)
Received: from localhost (unknown [109.183.109.54])
 by zimbra.v3.sk (Postfix) with ESMTPSA id D2B29E0AA5;
 Thu, 21 Jan 2021 03:37:42 +0000 (UTC)
From: Lubomir Rintel <lkundrak@v3.sk>
To: Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>
Subject: [PATCH 07/12] ARM: dts: mmp2: Use symbolic names for audio clocks
Date: Thu, 21 Jan 2021 04:41:25 +0100
Message-ID: <20210121034130.1381872-8-lkundrak@v3.sk>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210121034130.1381872-1-lkundrak@v3.sk>
References: <20210121034130.1381872-1-lkundrak@v3.sk>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210120_224141_146816_CE5344FD 
X-CRM114-Status: GOOD (  10.17  )
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
Message-ID: <20210121034125.cUbB7uryv4fDR3a9i__z1aU06Z16gJgS6ZWKKMLBG5s@z>

These are slighly easier to read.

Signed-off-by: Lubomir Rintel <lkundrak@v3.sk>
---
 arch/arm/boot/dts/mmp2.dtsi | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/mmp2.dtsi b/arch/arm/boot/dts/mmp2.dtsi
index 445bdcd50b9ed..46984d4c5224f 100644
--- a/arch/arm/boot/dts/mmp2.dtsi
+++ b/arch/arm/boot/dts/mmp2.dtsi
@@ -6,6 +6,7 @@
 
 #include <dt-bindings/clock/marvell,mmp2.h>
 #include <dt-bindings/power/marvell,mmp2.h>
+#include <dt-bindings/clock/marvell,mmp2-audio.h>
 
 / {
 	#address-cells = <1>;
@@ -243,7 +244,7 @@ sspa0: audio-controller@d42a0c00 {
 				interrupts = <2>;
 				clock-names = "audio", "bitclk";
 				clocks = <&soc_clocks MMP2_CLK_AUDIO>,
-					 <&audio_clk 1>;
+					 <&audio_clk MMP2_CLK_AUDIO_SSPA0>;
 				power-domains = <&soc_clocks MMP2_POWER_DOMAIN_AUDIO>;
 				#sound-dai-cells = <0>;
 				status = "disabled";
@@ -256,7 +257,7 @@ sspa1: audio-controller@d42a0d00 {
 				interrupts = <3>;
 				clock-names = "audio", "bitclk";
 				clocks = <&soc_clocks MMP2_CLK_AUDIO>,
-					 <&audio_clk 2>;
+					 <&audio_clk MMP2_CLK_AUDIO_SSPA1>;
 				power-domains = <&soc_clocks MMP2_POWER_DOMAIN_AUDIO>;
 				#sound-dai-cells = <0>;
 				status = "disabled";
-- 
2.29.2


_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
