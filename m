Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6ED22C6FD1D
	for <soc@archiver.kernel.org>; Tue,  4 Apr 2023 08:24:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 56B54C433EF; Tue,  4 Apr 2023 08:24:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5276FC433D2;
	Tue,  4 Apr 2023 08:24:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680596663;
	bh=Jx5bvjrSNpzL7FAJ0vFM7n8T6kg58By1narMR8bQMcI=;
	h=From:To:List-Id:Cc:Subject:Date:In-Reply-To:References:From;
	b=Vlpp8/o5jbSpwOhzro/2OUcugQ6BJ3HLIkiEzefoeA+6yrtMBNJXqubbdSKt0yyCh
	 IF37wNje1EPIR8zA0WzZ24p35vIhIWJ1wbo7V3fl9spRq7SZw6pdpaoHcz25b/MAYd
	 8BziiO4iVla68ernU21LsVc0Oy2rGV1ZUPHfqHyzOu6jA7lCiP1aRxEKP30IccQNMs
	 6+TF6rmamywTb77+/rE6x/wtR+KOaX0nRBbpE5zf+l32wHeM1myjWxl78HG113gVBd
	 wLBuTXKE34mtjFdOfKqCbJIoJCOCUvuziKKdcfk2QYOepdd9Kb4RDPZ/GH8l5SbsLE
	 nl+jKQTYn4bCg==
From: Arnd Bergmann <arnd@kernel.org>
To: Tony Lindgren <tony@atomide.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	"Aaro Koskinen" <aaro.koskinen@iki.fi>,
	"Bartosz Golaszewski" <brgl@bgdev.pl>,
	=?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
	Christian Lamparter <chunkeey@googlemail.com>,
	"David S. Miller" <davem@davemloft.net>,
	"Dmitry Torokhov" <dmitry.torokhov@gmail.com>,
	"Eric Dumazet" <edumazet@google.com>,
	"Felipe Balbi" <balbi@kernel.org>,
	"Jakub Kicinski" <kuba@kernel.org>,
	"Johannes Berg" <johannes@sipsolutions.net>,
	"Krzysztof Kozlowski" <krzysztof.kozlowski+dt@linaro.org>,
	"Linus Walleij" <linus.walleij@linaro.org>,
	"Paolo Abeni" <pabeni@redhat.com>,
	"Rob Herring" <robh+dt@kernel.org>,
	linux-wireless@vger.kernel.org,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	linux-omap@vger.kernel.org
Subject: [PATCH v2 2/3] ARM: dts: omap2: add stlc4560 spi-wireless node
Date: Tue,  4 Apr 2023 10:24:00 +0200
Message-Id: <20230404082401.1087835-3-arnd@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230404082401.1087835-1-arnd@kernel.org>
References: <20230404082401.1087835-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

Converted from the platform_device creation in board-n8x0.c.

Link: https://lore.kernel.org/all/20230314163201.955689-1-arnd@kernel.org/
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/arm/boot/dts/omap2.dtsi                |  4 ++++
 arch/arm/boot/dts/omap2420-n8x0-common.dtsi | 12 ++++++++++++
 2 files changed, 16 insertions(+)

diff --git a/arch/arm/boot/dts/omap2.dtsi b/arch/arm/boot/dts/omap2.dtsi
index afabb36a8ac1..fdc1790adf43 100644
--- a/arch/arm/boot/dts/omap2.dtsi
+++ b/arch/arm/boot/dts/omap2.dtsi
@@ -129,6 +129,8 @@ i2c2: i2c@48072000 {
 		};
 
 		mcspi1: spi@48098000 {
+			#address-cells = <1>;
+			#size-cells = <0>;
 			compatible = "ti,omap2-mcspi";
 			ti,hwmods = "mcspi1";
 			reg = <0x48098000 0x100>;
@@ -140,6 +142,8 @@ mcspi1: spi@48098000 {
 		};
 
 		mcspi2: spi@4809a000 {
+			#address-cells = <1>;
+			#size-cells = <0>;
 			compatible = "ti,omap2-mcspi";
 			ti,hwmods = "mcspi2";
 			reg = <0x4809a000 0x100>;
diff --git a/arch/arm/boot/dts/omap2420-n8x0-common.dtsi b/arch/arm/boot/dts/omap2420-n8x0-common.dtsi
index 63b0b4921e4e..fe9dd8bbfc85 100644
--- a/arch/arm/boot/dts/omap2420-n8x0-common.dtsi
+++ b/arch/arm/boot/dts/omap2420-n8x0-common.dtsi
@@ -109,3 +109,15 @@ partition@5 {
 		};
 	};
 };
+
+&mcspi2 {
+	status = "okay";
+
+	wifi@0 {
+		reg = <0>;
+		compatible = "st,stlc4560";
+		spi-max-frequency = <48000000>;
+		interrupts-extended = <&gpio3 23 IRQ_TYPE_EDGE_RISING>;
+		powerdown-gpios = <&gpio4 1 GPIO_ACTIVE_LOW>; /* gpio 97 */
+	};
+};
-- 
2.39.2

