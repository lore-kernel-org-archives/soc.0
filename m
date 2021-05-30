Return-Path: <SRS0=k3Qe=KZ=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56DC0C47091
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 30 May 2021 09:28:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1487B610FA
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 30 May 2021 09:28:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1487B610FA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=i2se.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xDlQ0SN9sWiPpH+lD/gtVN8lIju/JL4Yu5/3YRfEl5Q=; b=iG+nCvR65TaYRf
	z+V5xYL1Y8rEosXZBUMIuveOEEMhHYpP126q7fU+xXS9/MZiftIkzH9xj+wGfYs/DvTZxCObAJDqW
	huWcV//6mOk1RCyB284f93wQRDMlVIrJAwTywX/5HtPKyG71Ceu3op7OBPpUQ/9qjNlc4Duuzbcn6
	fV++1gUBmpEGa2duftmywlWa1yKSWn2NdJ5zT7ZDpqAHxjQS5nRhB1N5yGBAEKdG6OR7Ya062YlQF
	Bq7csGL+0zLiM79261i9eNMg+gRJoNUS8Aq+YF1I60o7h5Ho1rHBbXL4sJSwm8u3Hg5Hk2DntSLBU
	+1taVG4TkbBs2SaCOeMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lnHiX-009NEQ-1c; Sun, 30 May 2021 09:26:45 +0000
Received: from mout.kundenserver.de ([212.227.17.13])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lnHiS-009NCH-Na; Sun, 30 May 2021 09:26:42 +0000
Received: from localhost.localdomain ([37.4.249.151]) by
 mrelayeu.kundenserver.de (mreue106 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1N33ZD-1lQ0mo1C7J-013L7p; Sun, 30 May 2021 11:26:23 +0200
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
Subject: [PATCH 1/6] ARM: dts: bcm283x: Fix up MMC node names
Date: Sun, 30 May 2021 11:26:10 +0200
Message-ID: <1622366775-5309-2-git-send-email-stefan.wahren@i2se.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1622366775-5309-1-git-send-email-stefan.wahren@i2se.com>
References: <1622366775-5309-1-git-send-email-stefan.wahren@i2se.com>
X-Provags-ID: V03:K1:zU43vaxG+aviVLNrCI/EJL4B8YCOUb5/nUyh6xHFOfoaHTiga8y
 mn2JIOjJXEYn0AOzLQCVNHBfyAdXgIBfc+Y0J+1FlTdSQC5PrRSBFyNBUZZ5RQTAV+TwY2U
 /Vzj0UGSnnRen0BSE7x9Yr5gXZZhuKPZ/WTXOphHSlql+AS1FLSouKmPXmzAic+dyNGxbdG
 sKHcib4DUxU62/AhxGirA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:BXOAIRfrMrA=:OzaYHAs0xVvwgJGlfZz9fb
 COFvigPoPyhg/rx5AGNc8BDMlY/IzlbHspvjPOJA420EyPLoBacGcxcydhkGGkHiI+i78cja7
 sngly6uGu9q73jzZLGBUYAkIcFIURnAtA2EN3f+mSGIUI1+BVqGaLwtRGSd/i0BtUWeJa7JcA
 ehCaVvkHwrNBlenr7SeYe7IJ3OFM6f14LxHST4b/Lww9ccpD6ORVZ4U13GVm4k+RckTFP0nGq
 u7Jw8guiF+Rqvk1BA9MoEuDex/2CPRYY/JkuXe9U2lHqrQ2MT8naWv0RPUFstHb8TbYw2poCB
 fceb/jzRARunLREt+JSEWb1v+kbqcBacU1JZOppotTdrQXimED7LkDc4YWF3CZOWASSC+Bs/8
 hCJwt0MT7LcX8WqxjAdV6FLfPXt8WjsF+fKulKk0xwazhoRNJu6fmx5ectoaWMdttYocIQZJf
 +uFjagEknAOfdffOhAldjoKVsTGrUeY4zEUQPVb+S+eHLbEJyuTTjaQVggKKyR/i5YCYqOqy5
 DhTm/CkcF1wmrayKTzj+vs=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210530_022641_164171_63794FEE 
X-CRM114-Status: GOOD (  12.01  )
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
Message-ID: <20210530092610.2VMD7E_-DMnLnqEooXjyyQTgZt6LiUVWZ4nQwyPPJVk@z>

Fix the node names for the MMC/SD card controller to conform
to the standard node name mmc@..

Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
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
