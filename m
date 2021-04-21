Return-Path: <SRS0=AlHn=JS=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D46A1C433ED
	for <linux-amlogic@archiver.kernel.org>; Wed, 21 Apr 2021 20:48:55 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 36BBD61437
	for <linux-amlogic@archiver.kernel.org>; Wed, 21 Apr 2021 20:48:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 36BBD61437
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=7IY7M3hxLIvm6LLPBbRHmvLezFpMrlOvoALTyg2yz6I=; b=hkvcHBWPZCZ81E0S4X8G2qAJrU
	qfR1OCdpQfIXi/OkZHtM2MciiH9k0Q70S0nw4ke126WyUhz3/90OgNYT7GUPG08s9RX7YO3bDCo32
	5Sk5+skLKBdUkQOTId/u16Jr1aTR9J+hQi8ar6H2vmA4t/moF0XsUnqwJHA3wrgdFyBXWzzm9hqkA
	b9CKGO5q+tWQcxMlvBnCR5pccHkG7ed6Gfkjfd1ZOv0ODWWqLd9R+Fip1n42EodLE9HdMIXs4MW7Z
	oaQ2CK07jwLyoZgwuUmFR9Fj/xqYxhol2M9DY/Le/ijB8rNYk/zl97ICSf5P6jXuz7fEOmIDDA+1N
	3pS2czng==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lZJm9-00FAy0-Ko; Wed, 21 Apr 2021 20:48:45 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZJm3-00FAxj-6b
 for linux-amlogic@desiato.infradead.org; Wed, 21 Apr 2021 20:48:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=rXHkQUC6N93rblColIc3fKTzYzRtMUAGqoofGyDbWSI=; b=ZYlw4qO3ZwfipyWuGen++ku1yg
 g4+9WONBkcZLOhJGqpiGXiik0JC3j9/GutNyZ8Doro9ht+o6pwPe07jXqjkvsP/ZwXqVi2+sqEKtj
 oyOhRpBiVb7nOpQIbSP+pv303u+SOTwFl7SA7dwfu46zsOVwHizpLTI1vG5jiiumGGDbm7uZd8+Pb
 zRwABxOBi0WldFubPm/f9yoLUM1AVOz5vmsDltZkW20SmoKyw1y0MAYAFeiiM8c2FBHh1wBuvZSFp
 FgqVBUBXBkPbSk/15D0JAynvFsGwj+VedQMtViKoRd7sEWFi0rUAE0xLSQhKjMKGdq9wSsgNr7Q8+
 hf7Xl78g==;
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZJlz-00DBN6-77
 for linux-amlogic@lists.infradead.org; Wed, 21 Apr 2021 20:48:37 +0000
Received: by mail-pf1-x42d.google.com with SMTP id m11so30028585pfc.11
 for <linux-amlogic@lists.infradead.org>; Wed, 21 Apr 2021 13:48:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=rXHkQUC6N93rblColIc3fKTzYzRtMUAGqoofGyDbWSI=;
 b=CKEf39TzcRP1rZKkf0gmQPaJXdfFrLTCGK1bCIXtnGP2S9zxNI3EZfsGq0nUZYnBsS
 HjFJM8Z7XMZRGw0eZcGd125Cp0UGrpW71GmecltIz3+R3N1Mo+Em5f2kahfrDGjXE8A/
 9ovkgZkXjohBSVoVcPYmUD1Tvcft0D3bJ4cnoUdnweGiJ/dEe9ArnaoZ9FwAv8vCheMm
 9rDNNYK3d3s66/SWVRK48V4JwegbBesGEVF+PsHay+epDewZQXzev+4XeN88QdLtIpyM
 4a+MwkSNSmqFHM2pyMgiu02A7FpdvbClxEzHf4djYDDOG6xgMU6m78eO218x0yl7nwNo
 OJ/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=rXHkQUC6N93rblColIc3fKTzYzRtMUAGqoofGyDbWSI=;
 b=X+Pwat7LP+/VGEklBoQ4nMdDggYYS+XHxDGm6EIyFmlUefrLvh5RY6f0I1MCpLQ/Mj
 i+eDc6IdArXzJzQWSN9r0mQkK+awGguCeE20FLTVFm8LHkY/NaTzyMKrhd7uaavsAeYh
 EIezjQ86WM31eBzT/2f0r4hD1wTjlcicMndB1AEwp9TEfyXMK4IiVbCGnNKUyr2MhptR
 wpUbNvho7S54mTUxep9HRowepgPBzMdkig0xtIW9I+49XbpMiTwRHHme+MjHGojTDLb2
 2MQIIMzaruIsK+KsJ+CamSHRf35/z52Kow9HzI3OyOyztPtwiTvkvxHUuG9GTP381sJ+
 bsuA==
X-Gm-Message-State: AOAM530mBuHhvCAU9COX7Abo9W8CtMs4IQvdDMsHlrPEr0jBalhERBYu
 hSfefe49yltFH5Q5bJpYcS7VZw==
X-Google-Smtp-Source: ABdhPJwlQ1Wb/Byc0oeBUHh/06uqbj7RhMLWt9n7SLkntcEOIcZ63nHVg/RbdaNs8ji2c8iWnr8iAg==
X-Received: by 2002:a17:90a:d681:: with SMTP id
 x1mr13546397pju.82.1619038114240; 
 Wed, 21 Apr 2021 13:48:34 -0700 (PDT)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152])
 by smtp.gmail.com with ESMTPSA id w8sm222095pjq.10.2021.04.21.13.48.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Apr 2021 13:48:33 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
List-Id: <soc.lore.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>, soc@kernel.org,
 Rob Herring <robh+dt@kernel.org>
Cc: devicetree@vger.kernel.org,
	linux-amlogic@lists.infradead.org
Subject: [PATCH 1/2] arm64: dts: amlogic: misc DT schema fixups
Date: Wed, 21 Apr 2021 13:48:32 -0700
Message-ID: <20210421204833.18523-1-khilman@baylibre.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210421_134835_283934_0572B978 
X-CRM114-Status: GOOD (  14.40  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
Message-ID: <20210421204832.qzDv2diovSPBdqsj2L64S86uAHkJ_U2lFdKoExge9yE@z>

Take a pass at cleaning up a bunch of warnings
from 'make dtbs_check' that have crept in.

Signed-off-by: Kevin Hilman <khilman@baylibre.com>
---
 Documentation/devicetree/bindings/media/rc.yaml    |  4 ++++
 arch/arm64/boot/dts/amlogic/meson-a1.dtsi          |  4 ++--
 arch/arm64/boot/dts/amlogic/meson-axg.dtsi         |  1 -
 arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi  | 14 +++++++-------
 .../arm64/boot/dts/amlogic/meson-g12b-gsking-x.dts |  2 +-
 .../boot/dts/amlogic/meson-g12b-gtking-pro.dts     |  4 ++--
 arch/arm64/boot/dts/amlogic/meson-g12b-gtking.dts  |  2 +-
 .../boot/dts/amlogic/meson-g12b-odroid-n2.dtsi     |  4 ++--
 .../arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts |  2 +-
 .../dts/amlogic/meson-gxl-s905d-mecool-kii-pro.dts |  2 +-
 .../boot/dts/amlogic/meson-gxl-s905d-sml5442tw.dts |  8 ++++----
 .../boot/dts/amlogic/meson-gxm-mecool-kiii-pro.dts |  2 +-
 .../boot/dts/amlogic/meson-gxm-minix-neo-u9h.dts   |  2 +-
 .../boot/dts/amlogic/meson-gxm-wetek-core2.dts     |  2 +-
 arch/arm64/boot/dts/amlogic/meson-khadas-vim3.dtsi |  4 ++--
 .../arm64/boot/dts/amlogic/meson-sm1-odroid-c4.dts |  2 +-
 16 files changed, 31 insertions(+), 28 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/rc.yaml b/Documentation/devicetree/bindings/media/rc.yaml
index 946441b4e1a5..c4a088669112 100644
--- a/Documentation/devicetree/bindings/media/rc.yaml
+++ b/Documentation/devicetree/bindings/media/rc.yaml
@@ -90,9 +90,12 @@ properties:
       - rc-leadtek-y04g0051
       - rc-lme2510
       - rc-manli
+      - rc-mecool-kii-pro
+      - rc-mecool-kiii-pro
       - rc-medion-x10
       - rc-medion-x10-digitainer
       - rc-medion-x10-or2x
+      - rc-minix-neo
       - rc-msi-digivox-ii
       - rc-msi-digivox-iii
       - rc-msi-tvanywhere
@@ -145,6 +148,7 @@ properties:
       - rc-videomate-s350
       - rc-videomate-tv-pvr
       - rc-videostrong-kii-pro
+      - rc-vega-s9x
       - rc-wetek-hub
       - rc-wetek-play2
       - rc-winfast
diff --git a/arch/arm64/boot/dts/amlogic/meson-a1.dtsi b/arch/arm64/boot/dts/amlogic/meson-a1.dtsi
index 755b4ad15184..b4000cf65a9a 100644
--- a/arch/arm64/boot/dts/amlogic/meson-a1.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-a1.dtsi
@@ -88,13 +88,13 @@ reset: reset-controller@0 {
 				#reset-cells = <1>;
 			};
 
-			periphs_pinctrl: pinctrl@0400 {
+			periphs_pinctrl: pinctrl@400 {
 				compatible = "amlogic,meson-a1-periphs-pinctrl";
 				#address-cells = <2>;
 				#size-cells = <2>;
 				ranges;
 
-				gpio: bank@0400 {
+				gpio: bank@400 {
 					reg = <0x0 0x0400 0x0 0x003c>,
 					      <0x0 0x0480 0x0 0x0118>;
 					reg-names = "mux", "gpio";
diff --git a/arch/arm64/boot/dts/amlogic/meson-axg.dtsi b/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
index d945c84ab697..895c43c7af9f 100644
--- a/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
@@ -1731,7 +1731,6 @@ ge2d: ge2d@ff940000 {
 			interrupts = <GIC_SPI 150 IRQ_TYPE_EDGE_RISING>;
 			clocks = <&clkc CLKID_VAPB>;
 			resets = <&reset RESET_GE2D>;
-			reset-names = "core";
 		};
 
 		gic: interrupt-controller@ffc01000 {
diff --git a/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
index 3dd2a5a8739b..793d48f72390 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
@@ -128,9 +128,9 @@ soc {
 
 		pcie: pcie@fc000000 {
 			compatible = "amlogic,g12a-pcie", "snps,dw-pcie";
-			reg = <0x0 0xfc000000 0x0 0x400000
-			       0x0 0xff648000 0x0 0x2000
-			       0x0 0xfc400000 0x0 0x200000>;
+			reg = <0x0 0xfc000000 0x0 0x400000>,
+			      <0x0 0xff648000 0x0 0x2000>,
+			      <0x0 0xfc400000 0x0 0x200000>;
 			reg-names = "elbi", "cfg", "config";
 			interrupts = <GIC_SPI 221 IRQ_TYPE_LEVEL_HIGH>;
 			#interrupt-cells = <1>;
@@ -140,8 +140,8 @@ pcie: pcie@fc000000 {
 			#address-cells = <3>;
 			#size-cells = <2>;
 			device_type = "pci";
-			ranges = <0x81000000 0 0 0x0 0xfc600000 0 0x00100000
-				  0x82000000 0 0xfc700000 0x0 0xfc700000 0 0x1900000>;
+			ranges = <0x81000000 0 0 0x0 0xfc600000 0 0x00100000>,
+				 <0x82000000 0 0xfc700000 0x0 0xfc700000 0 0x1900000>;
 
 			clocks = <&clkc CLKID_PCIE_PHY
 				  &clkc CLKID_PCIE_COMB
@@ -2009,7 +2009,7 @@ mux {
 				};
 			};
 
-			vrtc: rtc@0a8 {
+			vrtc: rtc@a8 {
 				compatible = "amlogic,meson-vrtc";
 				reg = <0x0 0x000a8 0x0 0x4>;
 			};
@@ -2187,7 +2187,7 @@ gpio_intc: interrupt-controller@f080 {
 				amlogic,channel-interrupts = <64 65 66 67 68 69 70 71>;
 			};
 
-			watchdog: wdt@f0d0 {
+			watchdog: watchdog@f0d0 {
 				compatible = "amlogic,meson-gxbb-wdt";
 				reg = <0x0 0xf0d0 0x0 0x10>;
 				clocks = <&xtal>;
diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-gsking-x.dts b/arch/arm64/boot/dts/amlogic/meson-g12b-gsking-x.dts
index 211191f66344..6c7bfacbad78 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12b-gsking-x.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-g12b-gsking-x.dts
@@ -12,7 +12,7 @@
 #include <dt-bindings/sound/meson-g12a-tohdmitx.h>
 
 / {
-	compatible = "azw,gsking-x", "amlogic,g12b";
+	compatible = "azw,gsking-x", "amlogic,s922x", "amlogic,g12b";
 	model = "Beelink GS-King X";
 
 	aliases {
diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-gtking-pro.dts b/arch/arm64/boot/dts/amlogic/meson-g12b-gtking-pro.dts
index 0e331aa5a2d7..707daf92787b 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12b-gtking-pro.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-g12b-gtking-pro.dts
@@ -11,7 +11,7 @@
 #include <dt-bindings/sound/meson-g12a-tohdmitx.h>
 
 / {
-	compatible = "azw,gtking", "amlogic,g12b";
+	compatible = "azw,gtking", "amlogic,s922x", "amlogic,g12b";
 	model = "Beelink GT-King Pro";
 
 	aliases {
@@ -35,7 +35,7 @@ power-button {
 	leds {
 		compatible = "gpio-leds";
 
-		white {
+		led-white {
 			label = "power:white";
 			gpios = <&gpio_ao GPIOAO_11 GPIO_ACTIVE_HIGH>;
 			default-state = "on";
diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-gtking.dts b/arch/arm64/boot/dts/amlogic/meson-g12b-gtking.dts
index a7db84a500bb..5d96c1449050 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12b-gtking.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-g12b-gtking.dts
@@ -11,7 +11,7 @@
 #include <dt-bindings/sound/meson-g12a-tohdmitx.h>
 
 / {
-	compatible = "azw,gtking", "amlogic,g12b";
+	compatible = "azw,gtking", "amlogic,s922x", "amlogic,g12b";
 	model = "Beelink GT-King";
 
 	aliases {
diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtsi
index 473b81c652cf..344573e157a7 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtsi
@@ -42,7 +42,7 @@ emmc_pwrseq: emmc-pwrseq {
 	leds {
 		compatible = "gpio-leds";
 
-		blue {
+		led-blue {
 			label = "n2:blue";
 			gpios = <&gpio_ao GPIOAO_11 GPIO_ACTIVE_HIGH>;
 			linux,default-trigger = "heartbeat";
@@ -497,7 +497,7 @@ &gpio {
 	 * This signal should be handled by a USB specific power sequence
 	 * in order to reset the Hub when USB bus is powered down.
 	 */
-	usb-hub {
+	hog-0 {
 		gpio-hog;
 		gpios = <GPIOH_4 GPIO_ACTIVE_HIGH>;
 		output-high;
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts b/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts
index bfaf7f41a2d6..201596247fd9 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts
@@ -257,7 +257,7 @@ &gpio_ao {
 	 * This signal should be handled by a USB specific power sequence
 	 * in order to reset the Hub when USB bus is powered down.
 	 */
-	usb-hub {
+	hog-0 {
 		gpio-hog;
 		gpios = <GPIOAO_4 GPIO_ACTIVE_HIGH>;
 		output-high;
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxl-s905d-mecool-kii-pro.dts b/arch/arm64/boot/dts/amlogic/meson-gxl-s905d-mecool-kii-pro.dts
index 5ab5d3aa0646..c529b6c860a4 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxl-s905d-mecool-kii-pro.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxl-s905d-mecool-kii-pro.dts
@@ -44,7 +44,7 @@ button@0 {
 	leds {
 		compatible = "gpio-leds";
 
-		blue {
+		led-blue {
 			color = <LED_COLOR_ID_BLUE>;
 			function = LED_FUNCTION_POWER;
 			gpios = <&gpio GPIODV_24 GPIO_ACTIVE_HIGH>;
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxl-s905d-sml5442tw.dts b/arch/arm64/boot/dts/amlogic/meson-gxl-s905d-sml5442tw.dts
index ad6d72254150..b331a013572f 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxl-s905d-sml5442tw.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxl-s905d-sml5442tw.dts
@@ -16,28 +16,28 @@ / {
 	leds {
 		compatible = "gpio-leds";
 
-		yellow {
+		led-yellow {
 			color = <LED_COLOR_ID_YELLOW>;
 			function = LED_FUNCTION_STATUS;
 			gpios = <&gpio_ao GPIOAO_6 GPIO_ACTIVE_HIGH>;
 			default-state = "off";
 		};
 
-		blue {
+		led-blue {
 			color = <LED_COLOR_ID_BLUE>;
 			function = LED_FUNCTION_STATUS;
 			gpios = <&gpio GPIODV_28 GPIO_ACTIVE_HIGH>;
 			default-state = "off";
 		};
 
-		green {
+		led-green {
 			color = <LED_COLOR_ID_GREEN>;
 			function = LED_FUNCTION_STATUS;
 			gpios = <&gpio_ao GPIOAO_9 GPIO_ACTIVE_HIGH>;
 			default-state = "on";
 		};
 
-		red {
+		led-red {
 			color = <LED_COLOR_ID_RED>;
 			function = LED_FUNCTION_STATUS;
 			gpios = <&gpio GPIODV_27 GPIO_ACTIVE_HIGH>;
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxm-mecool-kiii-pro.dts b/arch/arm64/boot/dts/amlogic/meson-gxm-mecool-kiii-pro.dts
index 0651756d7fb5..ebebf344b715 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxm-mecool-kiii-pro.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxm-mecool-kiii-pro.dts
@@ -49,7 +49,7 @@ button@0 {
 	leds {
 		compatible = "gpio-leds";
 
-		blue {
+		led-blue {
 			color = <LED_COLOR_ID_BLUE>;
 			function = LED_FUNCTION_POWER;
 			gpios = <&gpio GPIODV_24 GPIO_ACTIVE_HIGH>;
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxm-minix-neo-u9h.dts b/arch/arm64/boot/dts/amlogic/meson-gxm-minix-neo-u9h.dts
index a414cd39c2b1..ea9f234d1fc7 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxm-minix-neo-u9h.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxm-minix-neo-u9h.dts
@@ -17,7 +17,7 @@ / {
 	leds {
 		compatible = "gpio-leds";
 
-		white {
+		led-white {
 			color = <LED_COLOR_ID_WHITE>;
 			function = LED_FUNCTION_POWER;
 			gpios = <&gpio_ao GPIOAO_9 GPIO_ACTIVE_HIGH>;
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxm-wetek-core2.dts b/arch/arm64/boot/dts/amlogic/meson-gxm-wetek-core2.dts
index ec794c134c15..1e7f77f9b533 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxm-wetek-core2.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxm-wetek-core2.dts
@@ -22,7 +22,7 @@ memory@0 {
 	leds {
 		compatible = "gpio-leds";
 
-		blue {
+		led-blue {
 			color = <LED_COLOR_ID_BLUE>;
 			function = LED_FUNCTION_STATUS;
 			gpios = <&gpio GPIODV_24 GPIO_ACTIVE_HIGH>;
diff --git a/arch/arm64/boot/dts/amlogic/meson-khadas-vim3.dtsi b/arch/arm64/boot/dts/amlogic/meson-khadas-vim3.dtsi
index 877e3b989203..66d67524b031 100644
--- a/arch/arm64/boot/dts/amlogic/meson-khadas-vim3.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-khadas-vim3.dtsi
@@ -43,14 +43,14 @@ button-function {
 	leds {
 		compatible = "gpio-leds";
 
-		white {
+		led-white {
 			color = <LED_COLOR_ID_WHITE>;
 			function = LED_FUNCTION_STATUS;
 			gpios = <&gpio_ao GPIOAO_4 GPIO_ACTIVE_HIGH>;
 			linux,default-trigger = "heartbeat";
 		};
 
-		red {
+		led-red {
 			color = <LED_COLOR_ID_RED>;
 			function = LED_FUNCTION_STATUS;
 			gpios = <&gpio_expander 5 GPIO_ACTIVE_HIGH>;
diff --git a/arch/arm64/boot/dts/amlogic/meson-sm1-odroid-c4.dts b/arch/arm64/boot/dts/amlogic/meson-sm1-odroid-c4.dts
index b2a4e823c1d8..8c327c03d845 100644
--- a/arch/arm64/boot/dts/amlogic/meson-sm1-odroid-c4.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-sm1-odroid-c4.dts
@@ -47,7 +47,7 @@ &gpio {
 	 * This signal should be handled by a USB specific power sequence
 	 * in order to reset the Hub when USB bus is powered down.
 	 */
-	usb-hub {
+	hog-0 {
 		gpio-hog;
 		gpios = <GPIOH_4 GPIO_ACTIVE_HIGH>;
 		output-high;
-- 
2.29.2


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
