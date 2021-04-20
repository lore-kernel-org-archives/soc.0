Return-Path: <SRS0=nS3V=JR=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1620FC433ED
	for <linux-amlogic@archiver.kernel.org>; Tue, 20 Apr 2021 23:04:24 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F2B5B61410
	for <linux-amlogic@archiver.kernel.org>; Tue, 20 Apr 2021 23:04:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F2B5B61410
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ftMLaJl4eCJSGeYSHIUTbd4zolwn0JmCgQjYWSBF1fU=; b=oa2EFXXVBCX6p3I0MVW4sJjFKQ
	JgN0xTygSbdORm2R5PheeQKgJaq3R6aQjvf8fSeypQkjOSnsjqt0Rs150b3VVvDpbKW1jOgw6wgFw
	9JJ5C4IHcRzBAlAb/2DhjN9UPfSQNXKPUefZVpV3XCWYmU+oAvj9GdoXlrNP/sirv2q75qgt7x823
	9/XgkpXXXRlUt4/rogHHCS7QTsiqCBCEa3qlhKBt8b0CgCSgFSDPgLCqJw+QKgDzjE3Yakd16gqIW
	FiWtGbMGzCIX3znpc/jhj2KbsEp4rmcoZm0G8q2cLDEsesPFFC+7LjS8ca1GHxlw4A2MgUN6raZBC
	xeeA3m+g==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lYzPg-00DEtZ-8f; Tue, 20 Apr 2021 23:04:13 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYzPd-00DEtN-0u
 for linux-amlogic@desiato.infradead.org; Tue, 20 Apr 2021 23:04:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=hot/XD38hSJlw3yqwRZmpSJt456nIc70hCLVFo4byo8=; b=igbBjChuT9wS55yjLjpljLgHJx
 YvHmPFUJhueaGb9lDLHBUBtv6HAcWMs+a0m5eiAY+rUWWLVrqLIaTH4FTOvftPRZYDm0SdWhu4A+1
 jh9a2E1sAMKYu1zo564shG/qnaTEkLDkcrQo+fkYx4u/ANd/52QVKmoEzvINPSmqbQ3laVY/wS7u0
 w3QWt7ziDAot+HY1euZLB38F2Af00zk1Q5B5nrkbhzt8bz6D4noJvrFp7zfbI7B9LFHhaDN+g6jyc
 AyBdmVXEYXw4KFF/SQ7sCC3y/J0G8g7XOQyZCKy1skx1tgQ6acCgeSBq9MgxDRaDepmA/e5FKjNIJ
 YcNO7CNg==;
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYzPY-00CTJu-Nu
 for linux-amlogic@lists.infradead.org; Tue, 20 Apr 2021 23:04:07 +0000
Received: by mail-pl1-x62e.google.com with SMTP id n10so9378942plc.0
 for <linux-amlogic@lists.infradead.org>; Tue, 20 Apr 2021 16:04:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=hot/XD38hSJlw3yqwRZmpSJt456nIc70hCLVFo4byo8=;
 b=Xz8NVSkcPXFO1td97DWfz1ah5C4XlY10Ij3tzxheolzhCwhywPplg55PbHRAb9Kol9
 LS9LXv5y236jvzZkMtT5nq2QyzL3OPfsKWaE91k6cFmBDXkdw4EiPfytYJxuma5qt+mT
 +Rx8qtW2F6Aw2aMItW4e6mlhFc549OoYKpTq8C20uvKDLfI17n61OTeyAuiLqIAN2Bpt
 MWcrRV8c345vM52ejzaIaCl66gwfdhTkQdQ4vXjl24l2LSV9gGNOCc2219bo4DMKa6JB
 YvsIYFCQz6xb+byiJf8byKFH/u6ipPX6BsFs1uu7wwZqZP6A0t6BQIB1O22ELsjJ+LFK
 2cFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=hot/XD38hSJlw3yqwRZmpSJt456nIc70hCLVFo4byo8=;
 b=AIFEzQ7QX+jr+dYidCw9mvuHgMeZOcT61l3b28jKv1GE5QupCDkIVXZ72oJAJC/6PK
 x/KhP60RnMv7v2a2Eu4NyiJrjLWZM6woOVwoyivYzTqeIG/gWEivOJ5kCh4iK0O+ivN+
 rmXdVYIwSSxtbAQZ3cP/mr0B4KIA6KJvSfM5TKYvDtrKSnADtsB9kEYYN2Qzwv3SJgkB
 U49ebSpBw8HKIVg+P1k4CGYXHF8iw6StcqW1NE0jbWvKwR0l09raecS0lSjooPOYEWDR
 LKk+YLmS4gnsVK3AjtVTg2alppyIvS9ah5y3DlT11fbe2PKlnNwoHWRU/MGDPVZl7XiT
 5v8g==
X-Gm-Message-State: AOAM531mKARUH7VWhavChSTClDnbHGo3+FbZonN84piHCdLaXwz4GQ13
 MUemiHEePUVEfzQhPM9OWtP+UA==
X-Google-Smtp-Source: ABdhPJwvqz79PjHQemZUYMkP617oxKVf0o9rqM+dMwjhmO+k1dxrcManmIUzdTxCpwJO0ML4//PLGw==
X-Received: by 2002:a17:902:9002:b029:e6:c95f:2a1d with SMTP id
 a2-20020a1709029002b02900e6c95f2a1dmr31376484plp.79.1618959843160; 
 Tue, 20 Apr 2021 16:04:03 -0700 (PDT)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152])
 by smtp.gmail.com with ESMTPSA id a190sm87079pfd.118.2021.04.20.16.04.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Apr 2021 16:04:02 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
List-Id: <soc.lore.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>, soc@kernel.org,
 Rob Herring <robh+dt@kernel.org>
Cc: devicetree@vger.kernel.org,
	linux-amlogic@lists.infradead.org
Subject: [PATCH] arm64: dts: amlogic: misc DT schema fixups
Date: Tue, 20 Apr 2021 16:04:02 -0700
Message-ID: <20210420230402.8807-1-khilman@baylibre.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210420_160404_882666_89E876B6 
X-CRM114-Status: GOOD (  15.48  )
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
Message-ID: <20210420230402.nMQ8SozRvY69KW5P7mu1JaAtKDDMsGJFVUifANNIPaA@z>

Take a pass at cleaning up a bunch of warnings
from 'make dtbs_check' that have crept in.

Signed-off-by: Kevin Hilman <khilman@baylibre.com>
---
 .../devicetree/bindings/gpu/arm,mali-bifrost.yaml  |  5 +++++
 .../bindings/media/amlogic,axg-ge2d.yaml           |  1 +
 Documentation/devicetree/bindings/media/rc.yaml    |  4 ++++
 .../devicetree/bindings/sound/amlogic,t9015.yaml   |  1 +
 arch/arm64/boot/dts/amlogic/meson-a1.dtsi          |  4 ++--
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
 18 files changed, 38 insertions(+), 27 deletions(-)

diff --git a/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml b/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
index 184492162e7e..db2240bad012 100644
--- a/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
+++ b/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
@@ -69,6 +69,11 @@ properties:
 
       where voltage is in V, frequency is in MHz.
 
+  dma-coherent:
+    description: |
+      Present if page table walks made by the SMMU are cache coherent with the
+      CPU.
+
 required:
   - compatible
   - reg
diff --git a/Documentation/devicetree/bindings/media/amlogic,axg-ge2d.yaml b/Documentation/devicetree/bindings/media/amlogic,axg-ge2d.yaml
index bee93bd84771..f3a337954eb3 100644
--- a/Documentation/devicetree/bindings/media/amlogic,axg-ge2d.yaml
+++ b/Documentation/devicetree/bindings/media/amlogic,axg-ge2d.yaml
@@ -33,6 +33,7 @@ required:
   - interrupts
   - clocks
   - resets
+  - reset-names
 
 additionalProperties: false
 
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
diff --git a/Documentation/devicetree/bindings/sound/amlogic,t9015.yaml b/Documentation/devicetree/bindings/sound/amlogic,t9015.yaml
index c7613ea728d4..7bcbed603824 100644
--- a/Documentation/devicetree/bindings/sound/amlogic,t9015.yaml
+++ b/Documentation/devicetree/bindings/sound/amlogic,t9015.yaml
@@ -41,6 +41,7 @@ required:
   - clocks
   - clock-names
   - resets
+  - reset-names
 
 additionalProperties: false
 
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
