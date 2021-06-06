Return-Path: <SRS0=Szqg=LA=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D2CBC4743F
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  6 Jun 2021 12:19:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5A2D6613C7
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  6 Jun 2021 12:19:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5A2D6613C7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=i2se.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BC/eqoSOLczvNNAF59dOebkv0+097pgzJ1hvmTZC/Oo=; b=MOJUcAXoQaqTvt
	YKNwR0B90e3/WXnpCVK+nl+48IuTAmdeAQ2EsNP9No4/jKEojF+yUP99BMW3b9c6KQ6Q0gMI+Awra
	mhfTSsF+BNDTdV/LyDvPOhRkiRyPbP4RR1hstTrOuCrVqhCznF+sYY+GE5uPVZ3J2GcsC2AkPrO4s
	XNyJCZ5wXvGri5JUoUp+gfsvkVjtCSab+9qyL56gx5N+5bZFAB2Oxx+P2sUfDr4KVJU1DBqIfXoZU
	++wENu6iiFogazQvDxNbhIZ7OO/HKm4TVb+V8jj7IugtjLo0iwWYDssUrTPa9TiIzs8ppylVb+pHP
	NX9hPbSR4LVeRaNtos1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lpriG-000E4h-Mr; Sun, 06 Jun 2021 12:17:08 +0000
Received: from mout.kundenserver.de ([212.227.17.24])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lpri1-000Dzv-Mv; Sun, 06 Jun 2021 12:16:55 +0000
Received: from localhost.localdomain ([37.4.249.157]) by
 mrelayeu.kundenserver.de (mreue108 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1MrhHm-1l2AsP35e8-00ngV6; Sun, 06 Jun 2021 14:16:33 +0200
From: Stefan Wahren <stefan.wahren@i2se.com>
To: Rob Herring <robh+dt@kernel.org>,
 Nicolas Saenz Julienne <nsaenz@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: Florian Fainelli <f.fainelli@gmail.com>, Ray Jui <rjui@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>,
 bcm-kernel-feedback-list@broadcom.com, Arnd Bergmann <arnd@arndb.de>,
 Olof Johansson <olof@lixom.net>, soc@kernel.org,
 Wim Van Sebroeck <wim@linux-watchdog.org>,
 Guenter Roeck <linux@roeck-us.net>, devicetree@vger.kernel.org,
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-watchdog@vger.kernel.org, Stefan Wahren <stefan.wahren@i2se.com>
Subject: [PATCH V2 1/7] ARM: dts: bcm283x: Fix up MMC node names
Date: Sun,  6 Jun 2021 14:16:11 +0200
Message-ID: <1622981777-5023-2-git-send-email-stefan.wahren@i2se.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1622981777-5023-1-git-send-email-stefan.wahren@i2se.com>
References: <1622981777-5023-1-git-send-email-stefan.wahren@i2se.com>
X-Provags-ID: V03:K1:Z/8QOVZ2cHa4lrvfJQqghM920G55e/tsw2Kl4Gl3CPhqRzxY/3Q
 pT8KAXiiYtiG2LFpO056LY5tzxOi+Gl7HNwVXnCr+Uls5Fn7P4AA8tzcENmameXpJB0f9It
 8CH8xbxBjWLR5DpsYYCYLmH1B5T/npNc7UitcUViH5+GE/J+7E9mdNSn0WFUl1ASkuRaqAE
 ggvIa84w6NiZwRifXy9Sw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:JGozPp/tc2Y=:4TCkNj3rNqgSZbnKTrYoqP
 l1TepbDJDswV1l8Zp+ZeCLvGoYDTNt7cbcn/4aRectbcMXGtVbUa4BGolWhSQXyRXXF82jtfq
 WV7YYFnDSSPbxeS2Nb72G0gCb4p8y7Jhrn3OEmf9u0ioh1eJf0Qmc/e8F6dKFSGp8piXCrUDs
 V3ujKZDCWp3yRArZVwUJNGZYlmy6ASPsPdqFJVmSd0lFkl3rxbQULHxQLpJNwYu6h2Cs22aoQ
 vn2iVIvozWRyxj6rjV8yOvTeYtljiYkCQo7OFxC3jGL4z2thwaTbJwBCfiFCiEZMSE4lrE/Ym
 tknNkOdEI9gIh67xgYU2gX4FVuS1YmLzHlzM4S+ux++MtXvYaWsbMzMnTRNDEn0F46KP2rT8n
 L6yQC6wlLaFjrYdbEfsc2PZjeNPEuzL+FPoD/TNtgjp4m3pTgsOD0q1HJzN7QBFwJRqEG4FPM
 BaFNC8FdQobzUHTdhm421SGhsKQ1iN+JbUfHn7Og7L9xpZtZJ25GdM+HxxQ0bp+KsjDCoHC+J
 ztsPy592xs8odkDq9tJffA=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210606_051654_055452_CBBC4EE1 
X-CRM114-Status: GOOD (  11.93  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210606121611.OfbDbQYUJk-M_3dHB84WaXXr3dci6XG36JQ19pPBYjs@z>

Fix the node names for the MMC/SD card controller to conform
to the standard node name mmc@..

Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
Reviewed-by: Nicolas Saenz Julienne <nsaenz@kernel.org>
---
 arch/arm/boot/dts/bcm2711.dtsi | 2 +-
 arch/arm/boot/dts/bcm283x.dtsi | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/bcm2711.dtsi b/arch/arm/boot/dts/bcm2711.dtsi
index 720beec..d872064 100644
--- a/arch/arm/boot/dts/bcm2711.dtsi
+++ b/arch/arm/boot/dts/bcm2711.dtsi
@@ -413,7 +413,7 @@
 		ranges = <0x0 0x7e000000  0x0 0xfe000000  0x01800000>;
 		dma-ranges = <0x0 0xc0000000  0x0 0x00000000  0x40000000>;
 
-		emmc2: emmc2@7e340000 {
+		emmc2: mmc@7e340000 {
 			compatible = "brcm,bcm2711-emmc2";
 			reg = <0x0 0x7e340000 0x100>;
 			interrupts = <GIC_SPI 126 IRQ_TYPE_LEVEL_HIGH>;
diff --git a/arch/arm/boot/dts/bcm283x.dtsi b/arch/arm/boot/dts/bcm283x.dtsi
index b83a864..0f3be55 100644
--- a/arch/arm/boot/dts/bcm283x.dtsi
+++ b/arch/arm/boot/dts/bcm283x.dtsi
@@ -420,7 +420,7 @@
 			status = "disabled";
 		};
 
-		sdhci: sdhci@7e300000 {
+		sdhci: mmc@7e300000 {
 			compatible = "brcm,bcm2835-sdhci";
 			reg = <0x7e300000 0x100>;
 			interrupts = <2 30>;
-- 
2.7.4


_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
