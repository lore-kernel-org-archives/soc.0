Return-Path: <SRS0=EGTb=NO=gmail.com=robherring2@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.0 required=3.0 tests=BAYES_00,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 854B8C4338F
	for <soc@archiver.kernel.org>; Mon, 23 Aug 2021 16:51:35 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 64F86613A8; Mon, 23 Aug 2021 16:51:35 +0000 (UTC)
Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3DBB361371
	for <soc@kernel.org>; Mon, 23 Aug 2021 16:51:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3DBB361371
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f42.google.com with SMTP id y14-20020a0568302a0e00b0051acbdb2869so31226152otu.2
        for <soc@kernel.org>; Mon, 23 Aug 2021 09:51:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=UDttmrL3qkGY99O3sazRRvmpTIwGQDXC9kFpDK8dALQ=;
        b=BzAraSIECVV2oU1PUZDiq6yVHiom/TL7B8/qK8fBpmmBl1bFP4YydxSfmL+9ZtOLY+
         wqZuwCmE+mJsX7Ladm2nTPTfugriTw9v2o8DROQwikwRJT8985zGdni/oM/nIqEImo7Z
         OPDGIQ1qjyiSVqz+rLdJb9Gl1NTYYr1Gc5NCQgiz7Oi8fdWBJg0PJ5T635TGRW2JaU+k
         mV9KQXhIegLqUQ50Kp65sBRSzIxH3ylldyfaL2NNrFTR4V2Hv3UPg2Spp59oTtUvj0M0
         WyQ2cf6lE5j6M32zYNrV4HmQ9GUY2rJmSjzjPyoFz5DgohNHYNQUsOUF9NonuDXtgMMR
         35+Q==
X-Gm-Message-State: AOAM530G/WN5D8nHTrkTiS52fSA6BBrpBVVKUPJHJoJB+axmZRbyxxYq
	SI55zd/5cH6XLBOdcDNte7j/EvW41A==
X-Google-Smtp-Source: ABdhPJzVPFNHjoTnOGse9poCrgW5sZyAhkWWGtqRCkFEDQzIi/Lsc/nIF3km+UJ55+z7k475BhIgOQ==
X-Received: by 2002:a9d:6a4b:: with SMTP id h11mr29603442otn.5.1629737494070;
        Mon, 23 Aug 2021 09:51:34 -0700 (PDT)
Received: from xps15.herring.priv (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.googlemail.com with ESMTPSA id l8sm3524141oom.19.2021.08.23.09.51.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Aug 2021 09:51:33 -0700 (PDT)
From: Rob Herring <robh@kernel.org>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2] arm/arm64: dts: Fix remaining dtc 'unit_address_format' warnings
Date: Mon, 23 Aug 2021 11:51:26 -0500
Message-Id: <20210823165126.2320910-1-robh@kernel.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix all the remaining dtc 'unit_address_format' warnings except for the ones
related to 'register-bit-led'. For those, we need to decide on and document
the node name.

Signed-off-by: Rob Herring <robh@kernel.org>
---
v2:
 - Add back intergrator vco1/2 labels.

Arnd, Olof,

Please apply this directly.

Rob
---
 arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts  |  2 +-
 arch/arm/boot/dts/at91-sama5d27_som1.dtsi     | 12 ++++----
 arch/arm/boot/dts/at91-sama5d2_ptc_ek.dts     |  4 +--
 arch/arm/boot/dts/at91-sama5d2_xplained.dts   | 14 +++++-----
 arch/arm/boot/dts/dm8148-evm.dts              |  8 +++---
 arch/arm/boot/dts/dm8168-evm.dts              |  8 +++---
 arch/arm/boot/dts/integratorap-im-pd1.dts     |  4 +--
 arch/arm/boot/dts/keystone-k2e-netcp.dtsi     |  2 +-
 arch/arm/boot/dts/keystone-k2hk-netcp.dtsi    |  2 +-
 arch/arm/boot/dts/keystone-k2l-netcp.dtsi     |  2 +-
 arch/arm/boot/dts/nuvoton-npcm750-evb.dts     |  4 +--
 arch/arm/boot/dts/qcom-apq8064.dtsi           | 24 ++++++++--------
 arch/arm/boot/dts/qcom-sdx55.dtsi             |  2 +-
 arch/arm/boot/dts/ste-ab8500.dtsi             | 28 +++++++++----------
 arch/arm/boot/dts/ste-ab8505.dtsi             | 24 ++++++++--------
 arch/arm/boot/dts/ste-db8500.dtsi             |  6 ++--
 arch/arm/boot/dts/ste-db8520.dtsi             |  6 ++--
 .../arm/boot/dts/ste-ux500-samsung-janice.dts |  2 +-
 arch/arm/boot/dts/stm32429i-eval.dts          |  2 +-
 arch/arm/boot/dts/stm32f469-disco.dts         |  2 +-
 .../marvell/armada-8040-clearfog-gt-8k.dts    |  2 +-
 arch/arm64/boot/dts/marvell/cn9130-db.dts     |  2 +-
 arch/arm64/boot/dts/qcom/ipq6018.dtsi         |  2 +-
 23 files changed, 82 insertions(+), 82 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts b/arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts
index d26a9e16ff7c..97cc217fb099 100644
--- a/arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts
@@ -303,7 +303,7 @@ gpio@0 {
 			type = <PCA955X_TYPE_GPIO>;
 		};
 
-		gpio@01 {
+		gpio@1 {
 			reg = <1>;
 			type = <PCA955X_TYPE_GPIO>;
 		};
diff --git a/arch/arm/boot/dts/at91-sama5d27_som1.dtsi b/arch/arm/boot/dts/at91-sama5d27_som1.dtsi
index e3251f3e3eaa..b48ac3b62a31 100644
--- a/arch/arm/boot/dts/at91-sama5d27_som1.dtsi
+++ b/arch/arm/boot/dts/at91-sama5d27_som1.dtsi
@@ -47,32 +47,32 @@ flash@0 {
 					spi-rx-bus-width = <4>;
 					m25p,fast-read;
 
-					at91bootstrap@00000000 {
+					at91bootstrap@0 {
 						label = "at91bootstrap";
 						reg = <0x00000000 0x00040000>;
 					};
 
-					bootloader@00040000 {
+					bootloader@40000 {
 						label = "bootloader";
 						reg = <0x00040000 0x000c0000>;
 					};
 
-					bootloaderenvred@00100000 {
+					bootloaderenvred@100000 {
 						label = "bootloader env redundant";
 						reg = <0x00100000 0x00040000>;
 					};
 
-					bootloaderenv@00140000 {
+					bootloaderenv@140000 {
 						label = "bootloader env";
 						reg = <0x00140000 0x00040000>;
 					};
 
-					dtb@00180000 {
+					dtb@180000 {
 						label = "device tree";
 						reg = <0x00180000 0x00080000>;
 					};
 
-					kernel@00200000 {
+					kernel@200000 {
 						label = "kernel";
 						reg = <0x00200000 0x00600000>;
 					};
diff --git a/arch/arm/boot/dts/at91-sama5d2_ptc_ek.dts b/arch/arm/boot/dts/at91-sama5d2_ptc_ek.dts
index dfd150eb0fd8..a5515b0dd346 100644
--- a/arch/arm/boot/dts/at91-sama5d2_ptc_ek.dts
+++ b/arch/arm/boot/dts/at91-sama5d2_ptc_ek.dts
@@ -93,12 +93,12 @@ bootloader@40000 {
 							reg = <0x40000 0xc0000>;
 						};
 
-						bootloaderenvred@0x100000 {
+						bootloaderenvred@100000 {
 							label = "bootloader env redundant";
 							reg = <0x100000 0x40000>;
 						};
 
-						bootloaderenv@0x140000 {
+						bootloaderenv@140000 {
 							label = "bootloader env";
 							reg = <0x140000 0x40000>;
 						};
diff --git a/arch/arm/boot/dts/at91-sama5d2_xplained.dts b/arch/arm/boot/dts/at91-sama5d2_xplained.dts
index 509c732a0d8b..908b2cc22844 100644
--- a/arch/arm/boot/dts/at91-sama5d2_xplained.dts
+++ b/arch/arm/boot/dts/at91-sama5d2_xplained.dts
@@ -95,37 +95,37 @@ flash@0 {
 					spi-rx-bus-width = <4>;
 					m25p,fast-read;
 
-					at91bootstrap@00000000 {
+					at91bootstrap@0 {
 						label = "at91bootstrap";
 						reg = <0x00000000 0x00040000>;
 					};
 
-					bootloader@00040000 {
+					bootloader@40000 {
 						label = "bootloader";
 						reg = <0x00040000 0x000c0000>;
 					};
 
-					bootloaderenvred@00100000 {
+					bootloaderenvred@100000 {
 						label = "bootloader env redundant";
 						reg = <0x00100000 0x00040000>;
 					};
 
-					bootloaderenv@00140000 {
+					bootloaderenv@140000 {
 						label = "bootloader env";
 						reg = <0x00140000 0x00040000>;
 					};
 
-					dtb@00180000 {
+					dtb@180000 {
 						label = "device tree";
 						reg = <0x00180000 0x00080000>;
 					};
 
-					kernel@00200000 {
+					kernel@200000 {
 						label = "kernel";
 						reg = <0x00200000 0x00600000>;
 					};
 
-					misc@00800000 {
+					misc@800000 {
 						label = "misc";
 						reg = <0x00800000 0x00000000>;
 					};
diff --git a/arch/arm/boot/dts/dm8148-evm.dts b/arch/arm/boot/dts/dm8148-evm.dts
index 91d1018ab75f..8ef48c00f98d 100644
--- a/arch/arm/boot/dts/dm8148-evm.dts
+++ b/arch/arm/boot/dts/dm8148-evm.dts
@@ -80,19 +80,19 @@ partition@0 {
 			label = "X-Loader";
 			reg = <0 0x80000>;
 		};
-		partition@0x80000 {
+		partition@80000 {
 			label = "U-Boot";
 			reg = <0x80000 0x1c0000>;
 		};
-		partition@0x1c0000 {
+		partition@1c0000 {
 			label = "Environment";
 			reg = <0x240000 0x40000>;
 		};
-		partition@0x280000 {
+		partition@280000 {
 			label = "Kernel";
 			reg = <0x280000 0x500000>;
 		};
-		partition@0x780000 {
+		partition@780000 {
 			label = "Filesystem";
 			reg = <0x780000 0xf880000>;
 		};
diff --git a/arch/arm/boot/dts/dm8168-evm.dts b/arch/arm/boot/dts/dm8168-evm.dts
index cf05d532db65..5126e2d72ed7 100644
--- a/arch/arm/boot/dts/dm8168-evm.dts
+++ b/arch/arm/boot/dts/dm8168-evm.dts
@@ -154,19 +154,19 @@ partition@0 {
 			label = "X-Loader";
 			reg = <0 0x80000>;
 		};
-		partition@0x80000 {
+		partition@80000 {
 			label = "U-Boot";
 			reg = <0x80000 0x1c0000>;
 		};
-		partition@0x1c0000 {
+		partition@1c0000 {
 			label = "Environment";
 			reg = <0x240000 0x40000>;
 		};
-		partition@0x280000 {
+		partition@280000 {
 			label = "Kernel";
 			reg = <0x280000 0x500000>;
 		};
-		partition@0x780000 {
+		partition@780000 {
 			label = "Filesystem";
 			reg = <0x780000 0xf880000>;
 		};
diff --git a/arch/arm/boot/dts/integratorap-im-pd1.dts b/arch/arm/boot/dts/integratorap-im-pd1.dts
index 1412a1a968fc..0614f82b808e 100644
--- a/arch/arm/boot/dts/integratorap-im-pd1.dts
+++ b/arch/arm/boot/dts/integratorap-im-pd1.dts
@@ -29,7 +29,7 @@ syscon@0 {
 		compatible = "arm,im-pd1-syscon", "syscon";
 		reg = <0x00000000 0x1000>;
 
-		vco1: clock@00 {
+		vco1: vco1-clock {
 			compatible = "arm,impd1-vco1";
 			#clock-cells = <0>;
 			lock-offset = <0x08>;
@@ -38,7 +38,7 @@ vco1: clock@00 {
 			clock-output-names = "IM-PD1-VCO1";
 		};
 
-		vco2: clock@04 {
+		vco2: vco2-clock {
 			compatible = "arm,impd1-vco2";
 			#clock-cells = <0>;
 			lock-offset = <0x08>;
diff --git a/arch/arm/boot/dts/keystone-k2e-netcp.dtsi b/arch/arm/boot/dts/keystone-k2e-netcp.dtsi
index ad15e77874b1..71064483d34f 100644
--- a/arch/arm/boot/dts/keystone-k2e-netcp.dtsi
+++ b/arch/arm/boot/dts/keystone-k2e-netcp.dtsi
@@ -95,7 +95,7 @@ pdsps {
 		#address-cells = <1>;
 		#size-cells = <1>;
 		ranges;
-		pdsp0@0x2a10000 {
+		pdsp0@2a10000 {
 			reg = <0x2a10000 0x1000    /*iram */
 			       0x2a0f000 0x100     /*reg*/
 			       0x2a0c000 0x3c8	   /*intd */
diff --git a/arch/arm/boot/dts/keystone-k2hk-netcp.dtsi b/arch/arm/boot/dts/keystone-k2hk-netcp.dtsi
index d5a6c1f5633c..022d93c366c7 100644
--- a/arch/arm/boot/dts/keystone-k2hk-netcp.dtsi
+++ b/arch/arm/boot/dts/keystone-k2hk-netcp.dtsi
@@ -112,7 +112,7 @@ pdsps {
 		#address-cells = <1>;
 		#size-cells = <1>;
 		ranges;
-		pdsp0@0x2a10000 {
+		pdsp0@2a10000 {
 			reg = <0x2a10000 0x1000    /*iram */
 			       0x2a0f000 0x100     /*reg*/
 			       0x2a0c000 0x3c8	   /*intd */
diff --git a/arch/arm/boot/dts/keystone-k2l-netcp.dtsi b/arch/arm/boot/dts/keystone-k2l-netcp.dtsi
index c1f982604145..e96ca664abc2 100644
--- a/arch/arm/boot/dts/keystone-k2l-netcp.dtsi
+++ b/arch/arm/boot/dts/keystone-k2l-netcp.dtsi
@@ -94,7 +94,7 @@ pdsps {
 		#address-cells = <1>;
 		#size-cells = <1>;
 		ranges;
-		pdsp0@0x2a10000 {
+		pdsp0@2a10000 {
 			reg = <0x2a10000 0x1000    /*iram */
 			       0x2a0f000 0x100     /*reg*/
 			       0x2a0c000 0x3c8	   /*intd */
diff --git a/arch/arm/boot/dts/nuvoton-npcm750-evb.dts b/arch/arm/boot/dts/nuvoton-npcm750-evb.dts
index dea3dbc4a6a5..0334641f8829 100644
--- a/arch/arm/boot/dts/nuvoton-npcm750-evb.dts
+++ b/arch/arm/boot/dts/nuvoton-npcm750-evb.dts
@@ -105,11 +105,11 @@ rootfs@600000 {
 				label = "rootfs";
 				reg = <0x0600000 0x700000>;
 				};
-			spare1@D00000 {
+			spare1@d00000 {
 				label = "spare1";
 				reg = <0x0D00000 0x200000>;
 				};
-			spare2@0F00000 {
+			spare2@f00000 {
 				label = "spare2";
 				reg = <0x0F00000 0x200000>;
 				};
diff --git a/arch/arm/boot/dts/qcom-apq8064.dtsi b/arch/arm/boot/dts/qcom-apq8064.dtsi
index 2687c4e890ba..8294ad1548fc 100644
--- a/arch/arm/boot/dts/qcom-apq8064.dtsi
+++ b/arch/arm/boot/dts/qcom-apq8064.dtsi
@@ -766,40 +766,40 @@ xoadc: xoadc@197 {
 					#size-cells = <0>;
 					#io-channel-cells = <2>;
 
-					vcoin: adc-channel@00 {
+					vcoin: adc-channel@0 {
 						reg = <0x00 0x00>;
 					};
-					vbat: adc-channel@01 {
+					vbat: adc-channel@1 {
 						reg = <0x00 0x01>;
 					};
-					dcin: adc-channel@02 {
+					dcin: adc-channel@2 {
 						reg = <0x00 0x02>;
 					};
-					vph_pwr: adc-channel@04 {
+					vph_pwr: adc-channel@4 {
 						reg = <0x00 0x04>;
 					};
-					batt_therm: adc-channel@08 {
+					batt_therm: adc-channel@8 {
 						reg = <0x00 0x08>;
 					};
-					batt_id: adc-channel@09 {
+					batt_id: adc-channel@9 {
 						reg = <0x00 0x09>;
 					};
-					usb_vbus: adc-channel@0a {
+					usb_vbus: adc-channel@a {
 						reg = <0x00 0x0a>;
 					};
-					die_temp: adc-channel@0b {
+					die_temp: adc-channel@b {
 						reg = <0x00 0x0b>;
 					};
-					ref_625mv: adc-channel@0c {
+					ref_625mv: adc-channel@c {
 						reg = <0x00 0x0c>;
 					};
-					ref_1250mv: adc-channel@0d {
+					ref_1250mv: adc-channel@d {
 						reg = <0x00 0x0d>;
 					};
-					chg_temp: adc-channel@0e {
+					chg_temp: adc-channel@e {
 						reg = <0x00 0x0e>;
 					};
-					ref_muxoff: adc-channel@0f {
+					ref_muxoff: adc-channel@f {
 						reg = <0x00 0x0f>;
 					};
 				};
diff --git a/arch/arm/boot/dts/qcom-sdx55.dtsi b/arch/arm/boot/dts/qcom-sdx55.dtsi
index 0057c7c04d31..1e6ce035f76a 100644
--- a/arch/arm/boot/dts/qcom-sdx55.dtsi
+++ b/arch/arm/boot/dts/qcom-sdx55.dtsi
@@ -143,7 +143,7 @@ tz_mem: memory@8ff00000 {
 			reg = <0x8ff00000 0x100000>;
 		};
 
-		tz_apps_mem: memory@0x90000000 {
+		tz_apps_mem: memory@90000000 {
 			no-map;
 			reg = <0x90000000 0x500000>;
 		};
diff --git a/arch/arm/boot/dts/ste-ab8500.dtsi b/arch/arm/boot/dts/ste-ab8500.dtsi
index d0fe3f9aa183..9b735919a4d1 100644
--- a/arch/arm/boot/dts/ste-ab8500.dtsi
+++ b/arch/arm/boot/dts/ste-ab8500.dtsi
@@ -58,46 +58,46 @@ gpadc: ab8500-gpadc {
 					#io-channel-cells = <1>;
 
 					/* GPADC channels */
-					bat_ctrl: channel@01 {
+					bat_ctrl: channel@1 {
 						reg = <0x01>;
 					};
-					btemp_ball: channel@02 {
+					btemp_ball: channel@2 {
 						reg = <0x02>;
 					};
-					main_charger_v: channel@03 {
+					main_charger_v: channel@3 {
 						reg = <0x03>;
 					};
-					acc_detect1: channel@04 {
+					acc_detect1: channel@4 {
 						reg = <0x04>;
 					};
-					acc_detect2: channel@05 {
+					acc_detect2: channel@5 {
 						reg = <0x05>;
 					};
-					adc_aux1: channel@06 {
+					adc_aux1: channel@6 {
 						reg = <0x06>;
 					};
-					adc_aux2: channel@07 {
+					adc_aux2: channel@7 {
 						reg = <0x07>;
 					};
-					main_batt_v: channel@08 {
+					main_batt_v: channel@8 {
 						reg = <0x08>;
 					};
-					vbus_v: channel@09 {
+					vbus_v: channel@9 {
 						reg = <0x09>;
 					};
-					main_charger_c: channel@0a {
+					main_charger_c: channel@a {
 						reg = <0x0a>;
 					};
-					usb_charger_c: channel@0b {
+					usb_charger_c: channel@b {
 						reg = <0x0b>;
 					};
-					bk_bat_v: channel@0c {
+					bk_bat_v: channel@c {
 						reg = <0x0c>;
 					};
-					die_temp: channel@0d {
+					die_temp: channel@d {
 						reg = <0x0d>;
 					};
-					usb_id: channel@0e {
+					usb_id: channel@e {
 						reg = <0x0e>;
 					};
 					xtal_temp: channel@12 {
diff --git a/arch/arm/boot/dts/ste-ab8505.dtsi b/arch/arm/boot/dts/ste-ab8505.dtsi
index 0defc15b9bbc..02ce833d142a 100644
--- a/arch/arm/boot/dts/ste-ab8505.dtsi
+++ b/arch/arm/boot/dts/ste-ab8505.dtsi
@@ -54,40 +54,40 @@ gpadc: ab8500-gpadc {
 					#io-channel-cells = <1>;
 
 					/* GPADC channels */
-					bat_ctrl: channel@01 {
+					bat_ctrl: channel@1 {
 						reg = <0x01>;
 					};
-					btemp_ball: channel@02 {
+					btemp_ball: channel@2 {
 						reg = <0x02>;
 					};
-					acc_detect1: channel@04 {
+					acc_detect1: channel@4 {
 						reg = <0x04>;
 					};
-					acc_detect2: channel@05 {
+					acc_detect2: channel@5 {
 						reg = <0x05>;
 					};
-					adc_aux1: channel@06 {
+					adc_aux1: channel@6 {
 						reg = <0x06>;
 					};
-					adc_aux2: channel@07 {
+					adc_aux2: channel@7 {
 						reg = <0x07>;
 					};
-					main_batt_v: channel@08 {
+					main_batt_v: channel@8 {
 						reg = <0x08>;
 					};
-					vbus_v: channel@09 {
+					vbus_v: channel@9 {
 						reg = <0x09>;
 					};
-					charger_c: channel@0b {
+					charger_c: channel@b {
 						reg = <0x0b>;
 					};
-					bk_bat_v: channel@0c {
+					bk_bat_v: channel@c {
 						reg = <0x0c>;
 					};
-					die_temp: channel@0d {
+					die_temp: channel@d {
 						reg = <0x0d>;
 					};
-					usb_id: channel@0e {
+					usb_id: channel@e {
 						reg = <0x0e>;
 					};
 				};
diff --git a/arch/arm/boot/dts/ste-db8500.dtsi b/arch/arm/boot/dts/ste-db8500.dtsi
index 344d29853bf7..b67d3bd65de8 100644
--- a/arch/arm/boot/dts/ste-db8500.dtsi
+++ b/arch/arm/boot/dts/ste-db8500.dtsi
@@ -19,19 +19,19 @@ reserved-memory {
 		ranges;
 
 		/* Modem trace memory */
-		ram@06000000 {
+		ram@6000000 {
 			reg = <0x06000000 0x00f00000>;
 			no-map;
 		};
 
 		/* Modem shared memory */
-		ram@06f00000 {
+		ram@6f00000 {
 			reg = <0x06f00000 0x00100000>;
 			no-map;
 		};
 
 		/* Modem private memory */
-		ram@07000000 {
+		ram@7000000 {
 			reg = <0x07000000 0x01000000>;
 			no-map;
 		};
diff --git a/arch/arm/boot/dts/ste-db8520.dtsi b/arch/arm/boot/dts/ste-db8520.dtsi
index 287804e9e183..60d5fb806969 100644
--- a/arch/arm/boot/dts/ste-db8520.dtsi
+++ b/arch/arm/boot/dts/ste-db8520.dtsi
@@ -19,19 +19,19 @@ reserved-memory {
 		ranges;
 
 		/* Modem trace memory */
-		ram@06000000 {
+		ram@6000000 {
 			reg = <0x06000000 0x00f00000>;
 			no-map;
 		};
 
 		/* Modem shared memory */
-		ram@06f00000 {
+		ram@6f00000 {
 			reg = <0x06f00000 0x00100000>;
 			no-map;
 		};
 
 		/* Modem private memory */
-		ram@07000000 {
+		ram@7000000 {
 			reg = <0x07000000 0x01000000>;
 			no-map;
 		};
diff --git a/arch/arm/boot/dts/ste-ux500-samsung-janice.dts b/arch/arm/boot/dts/ste-ux500-samsung-janice.dts
index 25af066f6f3a..aee8439b7e8f 100644
--- a/arch/arm/boot/dts/ste-ux500-samsung-janice.dts
+++ b/arch/arm/boot/dts/ste-ux500-samsung-janice.dts
@@ -580,7 +580,7 @@ i2c-gate {
 					#size-cells = <0>;
 
 					/* Bosch BMA222 accelerometer */
-					accelerometer@08 {
+					accelerometer@8 {
 						compatible = "bosch,bma222";
 						reg = <0x08>;
 						mount-matrix = "0", "1", "0",
diff --git a/arch/arm/boot/dts/stm32429i-eval.dts b/arch/arm/boot/dts/stm32429i-eval.dts
index 9ac1ffe53413..cb46326a8c75 100644
--- a/arch/arm/boot/dts/stm32429i-eval.dts
+++ b/arch/arm/boot/dts/stm32429i-eval.dts
@@ -60,7 +60,7 @@ chosen {
 		stdout-path = "serial0:115200n8";
 	};
 
-	memory@00000000 {
+	memory@0 {
 		device_type = "memory";
 		reg = <0x00000000 0x2000000>;
 	};
diff --git a/arch/arm/boot/dts/stm32f469-disco.dts b/arch/arm/boot/dts/stm32f469-disco.dts
index 8c982ae79f43..30905ce672a0 100644
--- a/arch/arm/boot/dts/stm32f469-disco.dts
+++ b/arch/arm/boot/dts/stm32f469-disco.dts
@@ -60,7 +60,7 @@ chosen {
 		stdout-path = "serial0:115200n8";
 	};
 
-	memory@00000000 {
+	memory@0 {
 		device_type = "memory";
 		reg = <0x00000000 0x1000000>;
 	};
diff --git a/arch/arm64/boot/dts/marvell/armada-8040-clearfog-gt-8k.dts b/arch/arm64/boot/dts/marvell/armada-8040-clearfog-gt-8k.dts
index 0ec0d5625818..8729c6467303 100644
--- a/arch/arm64/boot/dts/marvell/armada-8040-clearfog-gt-8k.dts
+++ b/arch/arm64/boot/dts/marvell/armada-8040-clearfog-gt-8k.dts
@@ -20,7 +20,7 @@ chosen {
 		stdout-path = "serial0:115200n8";
 	};
 
-	memory@00000000 {
+	memory@0 {
 		device_type = "memory";
 		reg = <0x0 0x0 0x0 0x80000000>;
 	};
diff --git a/arch/arm64/boot/dts/marvell/cn9130-db.dts b/arch/arm64/boot/dts/marvell/cn9130-db.dts
index 9758609541c7..47a3b97a0363 100644
--- a/arch/arm64/boot/dts/marvell/cn9130-db.dts
+++ b/arch/arm64/boot/dts/marvell/cn9130-db.dts
@@ -27,7 +27,7 @@ aliases {
 		spi2 = &cp0_spi1;
 	};
 
-	memory@00000000 {
+	memory@0 {
 		device_type = "memory";
 		reg = <0x0 0x0 0x0 0x80000000>;
 	};
diff --git a/arch/arm64/boot/dts/qcom/ipq6018.dtsi b/arch/arm64/boot/dts/qcom/ipq6018.dtsi
index 9fa5b028e4f3..23ee1bfa4318 100644
--- a/arch/arm64/boot/dts/qcom/ipq6018.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq6018.dtsi
@@ -151,7 +151,7 @@ reserved-memory {
 		#size-cells = <2>;
 		ranges;
 
-		rpm_msg_ram: memory@0x60000 {
+		rpm_msg_ram: memory@60000 {
 			reg = <0x0 0x60000 0x0 0x6000>;
 			no-map;
 		};
-- 
2.30.2

