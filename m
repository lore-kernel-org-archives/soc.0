Return-Path: <SRS0=2LUn=GY=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0296C433E0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Jan 2021 03:45:09 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8543D2389A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Jan 2021 03:45:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8543D2389A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=v3.sk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=qrU3Ty8RQt5Trky7sXTrpLNu08+kPw5NWmG4apaY+gs=; b=lsu8Ft/OMi736E96PZ2EhbZaM
	84KpgKLqe46BMcBq8KQTa7o2C2Nk0gwBZfotLf25VTg5wT2ZgGRR0iUdYnOBulev/rvV7RJcqbZO2
	Ezal8G1eGRZKU/+cR0Z80BSG6qHLKlMXA/v7Ja3l/BLe+wmVNeqmDllFRdAbxxfh73BaBSVmt7Gbx
	c2NMvmiBV6aZc6jeCvcDUAj0mq35x50ygqZ/AZhaUKoYSTGIwZaZeBN4Y+GU5kCTXg142XUND7pGR
	CQlUbEwhM68E0Bbn7yfpu/y6EBwWwwgFcKmlyudAr36a59yy3Wse5kFmpZVeulVMEMLIQbycnoGIS
	i22uqCYsA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l2QsX-0006bO-OT; Thu, 21 Jan 2021 03:43:25 +0000
Received: from mail.v3.sk ([167.172.186.51] helo=shell.v3.sk)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l2Qqt-00068l-7M
 for linux-arm-kernel@lists.infradead.org; Thu, 21 Jan 2021 03:41:49 +0000
Received: from localhost (localhost.localdomain [127.0.0.1])
 by zimbra.v3.sk (Postfix) with ESMTP id BE354E0AA6;
 Thu, 21 Jan 2021 03:37:45 +0000 (UTC)
Received: from shell.v3.sk ([127.0.0.1])
 by localhost (zimbra.v3.sk [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id QeRj4b-AuJuy; Thu, 21 Jan 2021 03:37:45 +0000 (UTC)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by zimbra.v3.sk (Postfix) with ESMTP id 7E511E0AAC;
 Thu, 21 Jan 2021 03:37:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at zimbra.v3.sk
Received: from shell.v3.sk ([127.0.0.1])
 by localhost (zimbra.v3.sk [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id f7eoDp1UMAtZ; Thu, 21 Jan 2021 03:37:45 +0000 (UTC)
Received: from localhost (unknown [109.183.109.54])
 by zimbra.v3.sk (Postfix) with ESMTPSA id 46A02E0AA9;
 Thu, 21 Jan 2021 03:37:45 +0000 (UTC)
From: Lubomir Rintel <lkundrak@v3.sk>
To: Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>
Subject: [PATCH 11/12] ARM: dts: mmp3-dell-ariel: Replace SSP2 with spi-gpio
Date: Thu, 21 Jan 2021 04:41:29 +0100
Message-ID: <20210121034130.1381872-12-lkundrak@v3.sk>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210121034130.1381872-1-lkundrak@v3.sk>
References: <20210121034130.1381872-1-lkundrak@v3.sk>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210120_224143_438644_45F11360 
X-CRM114-Status: GOOD (  10.71  )
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
Message-ID: <20210121034129.KKV_BW6a8-LG21VDXuXxl2Ze-WGCxonUF4NfvaqsMv4@z>

The firmware leaves the pins in GPIO mode. Until we have a proper pinmux
driver hooked on we just need to bitbang SPI. No big deal, this is just
used for the power button and performance is not important.

Signed-off-by: Lubomir Rintel <lkundrak@v3.sk>
---
 arch/arm/boot/dts/mmp3-dell-ariel.dts | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/mmp3-dell-ariel.dts b/arch/arm/boot/dts/mmp3-dell-ariel.dts
index c4a6bd876d849..fe6df364a9eb6 100644
--- a/arch/arm/boot/dts/mmp3-dell-ariel.dts
+++ b/arch/arm/boot/dts/mmp3-dell-ariel.dts
@@ -30,6 +30,17 @@ memory@0 {
 		reg = <0x0 0x80000000>;
 		device_type = "memory";
 	};
+
+	ec_input_spi: spi {
+		compatible = "spi-gpio";
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		num-chipselects = <0>;
+		sck-gpios = <&gpio 55 GPIO_ACTIVE_HIGH>;
+		miso-gpios = <&gpio 57 GPIO_ACTIVE_HIGH>;
+		mosi-gpios = <&gpio 58 GPIO_ACTIVE_HIGH>;
+	};
 };
 
 &uart3 {
@@ -118,7 +129,7 @@ firmware-flash@0 {
 	};
 };
 
-&ssp2 {
+&ec_input_spi {
 	status = "okay";
 	cs-gpios = <&gpio 56 GPIO_ACTIVE_LOW>;
 
-- 
2.29.2


_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
