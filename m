Return-Path: <sashal@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6FFEC433EF
	for <soc@archiver.kernel.org>; Sun, 13 Feb 2022 05:47:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 8748DC340F1; Sun, 13 Feb 2022 05:47:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69B27C004E1;
	Sun, 13 Feb 2022 05:47:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1644731273;
	bh=vKWHdsmYDWl5RO166LaWnwShGYAB6Psf4gyh7lRWA1g=;
	h=From:To:List-Id:Cc:Subject:Date:From;
	b=MBqIbUGce1I5AFbEqTz+t/plu/q8s71yXI8o1EYDwRSlbxPwTd+0x9UmQpn1Pvo5J
	 jLBCSzKjinTc92Th0S8dvEtbZz5mj7mitNkhgd1J5E6raXWCqjjyoCjbkc+UdUwMEi
	 VzMqMlVjzTsB0el898NtCx5L782Lw9ZWPcQ0+srWhjuXq679g2KR/fUWVo+eP7PaFf
	 7XsYzxTD63ISm2f4lQlojkJASPu53kah+CPCXLuljNNF87z6IlXs2hVCnkyq/ztREr
	 2m4iTBu4r6xE8G9zToHe5rlBlWOnRUkObVe0SwFs1jcQ4lJjwCcs7LwPfDZL6IPjVf
	 XYeFTvAnBiCSQ==
From: Sasha Levin <sashal@kernel.org>
To: stable-commits@vger.kernel.org,
	tony@atomide.com
List-Id: <soc.lore.kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>,
	soc@kernel.org,
	=?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>
Subject: Patch "ARM: dts: Fix timer regression for beagleboard revision c" has been added to the 5.16-stable tree
Date: Sun, 13 Feb 2022 00:47:49 -0500
Message-Id: <20220213054750.242492-1-sashal@kernel.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Patchwork-Hint: ignore
X-stable: review
Content-Transfer-Encoding: 8bit

This is a note to let you know that I've just added the patch titled

    ARM: dts: Fix timer regression for beagleboard revision c

to the 5.16-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     arm-dts-fix-timer-regression-for-beagleboard-revisio.patch
and it can be found in the queue-5.16 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.



commit f96b5c79f8df924b980a18557b9019ae9857b7de
Author: Tony Lindgren <tony@atomide.com>
Date:   Thu Nov 25 16:48:34 2021 +0200

    ARM: dts: Fix timer regression for beagleboard revision c
    
    [ Upstream commit 23885389dbbbbc698986e77a45c1fc44a6e3632e ]
    
    Commit e428e250fde6 ("ARM: dts: Configure system timers for omap3")
    caused a timer regression for beagleboard revision c where the system
    clockevent stops working if omap3isp module is unloaded.
    
    Turns out we still have beagleboard revisions a-b4 capacitor c70 quirks
    applied that limit the usable timers for no good reason. This also affects
    the power management as we use the system clock instead of the 32k clock
    source.
    
    Let's fix the issue by adding a new omap3-beagle-ab4.dts for the old timer
    quirks. This allows us to remove the timer quirks for later beagleboard
    revisions. We also need to update the related timer quirk check for the
    correct compatible property.
    
    Fixes: e428e250fde6 ("ARM: dts: Configure system timers for omap3")
    Cc: linux-kernel@vger.kernel.org
    Cc: Daniel Lezcano <daniel.lezcano@linaro.org>
    Cc: Thomas Gleixner <tglx@linutronix.de>
    Cc: Rob Herring <robh+dt@kernel.org>
    Reported-by: Jarkko Nikula <jarkko.nikula@bitmer.com>
    Tested-by: Jarkko Nikula <jarkko.nikula@bitmer.com>
    Signed-off-by: Tony Lindgren <tony@atomide.com>
    Signed-off-by: Sasha Levin <sashal@kernel.org>

diff --git a/Documentation/devicetree/bindings/arm/omap/omap.txt b/Documentation/devicetree/bindings/arm/omap/omap.txt
index e77635c5422c6..fa8b31660cadd 100644
--- a/Documentation/devicetree/bindings/arm/omap/omap.txt
+++ b/Documentation/devicetree/bindings/arm/omap/omap.txt
@@ -119,6 +119,9 @@ Boards (incomplete list of examples):
 - OMAP3 BeagleBoard : Low cost community board
   compatible = "ti,omap3-beagle", "ti,omap3430", "ti,omap3"
 
+- OMAP3 BeagleBoard A to B4 : Early BeagleBoard revisions A to B4 with a timer quirk
+  compatible = "ti,omap3-beagle-ab4", "ti,omap3-beagle", "ti,omap3430", "ti,omap3"
+
 - OMAP3 Tobi with Overo : Commercial expansion board with daughter board
   compatible = "gumstix,omap3-overo-tobi", "gumstix,omap3-overo", "ti,omap3430", "ti,omap3"
 
diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index 0de64f237cd87..a387ebe8919b1 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -794,6 +794,7 @@ dtb-$(CONFIG_ARCH_OMAP3) += \
 	logicpd-som-lv-37xx-devkit.dtb \
 	omap3430-sdp.dtb \
 	omap3-beagle.dtb \
+	omap3-beagle-ab4.dtb \
 	omap3-beagle-xm.dtb \
 	omap3-beagle-xm-ab.dtb \
 	omap3-cm-t3517.dtb \
diff --git a/arch/arm/boot/dts/omap3-beagle-ab4.dts b/arch/arm/boot/dts/omap3-beagle-ab4.dts
new file mode 100644
index 0000000000000..990ff2d846868
--- /dev/null
+++ b/arch/arm/boot/dts/omap3-beagle-ab4.dts
@@ -0,0 +1,47 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/dts-v1/;
+
+#include "omap3-beagle.dts"
+
+/ {
+	model = "TI OMAP3 BeagleBoard A to B4";
+	compatible = "ti,omap3-beagle-ab4", "ti,omap3-beagle", "ti,omap3430", "ti,omap3";
+};
+
+/*
+ * Workaround for capacitor C70 issue, see "Boards revision A and < B5"
+ * section at https://elinux.org/BeagleBoard_Community
+ */
+
+/* Unusable as clocksource because of unreliable oscillator */
+&counter32k {
+	status = "disabled";
+};
+
+/* Unusable as clockevent because of unreliable oscillator, allow to idle */
+&timer1_target {
+	/delete-property/ti,no-reset-on-init;
+	/delete-property/ti,no-idle;
+	timer@0 {
+		/delete-property/ti,timer-alwon;
+	};
+};
+
+/* Preferred always-on timer for clocksource */
+&timer12_target {
+	ti,no-reset-on-init;
+	ti,no-idle;
+	timer@0 {
+		/* Always clocked by secure_32k_fck */
+	};
+};
+
+/* Preferred timer for clockevent */
+&timer2_target {
+	ti,no-reset-on-init;
+	ti,no-idle;
+	timer@0 {
+		assigned-clocks = <&gpt2_fck>;
+		assigned-clock-parents = <&sys_ck>;
+	};
+};
diff --git a/arch/arm/boot/dts/omap3-beagle.dts b/arch/arm/boot/dts/omap3-beagle.dts
index f9f34b8458e91..0548b391334fd 100644
--- a/arch/arm/boot/dts/omap3-beagle.dts
+++ b/arch/arm/boot/dts/omap3-beagle.dts
@@ -304,39 +304,6 @@ &usbhsehci {
 	phys = <0 &hsusb2_phy>;
 };
 
-/* Unusable as clocksource because of unreliable oscillator */
-&counter32k {
-	status = "disabled";
-};
-
-/* Unusable as clockevent because if unreliable oscillator, allow to idle */
-&timer1_target {
-	/delete-property/ti,no-reset-on-init;
-	/delete-property/ti,no-idle;
-	timer@0 {
-		/delete-property/ti,timer-alwon;
-	};
-};
-
-/* Preferred always-on timer for clocksource */
-&timer12_target {
-	ti,no-reset-on-init;
-	ti,no-idle;
-	timer@0 {
-		/* Always clocked by secure_32k_fck */
-	};
-};
-
-/* Preferred timer for clockevent */
-&timer2_target {
-	ti,no-reset-on-init;
-	ti,no-idle;
-	timer@0 {
-		assigned-clocks = <&gpt2_fck>;
-		assigned-clock-parents = <&sys_ck>;
-	};
-};
-
 &twl_gpio {
 	ti,use-leds;
 	/* pullups: BIT(1) */
diff --git a/drivers/clocksource/timer-ti-dm-systimer.c b/drivers/clocksource/timer-ti-dm-systimer.c
index b6f97960d8ee0..5c40ca1d4740e 100644
--- a/drivers/clocksource/timer-ti-dm-systimer.c
+++ b/drivers/clocksource/timer-ti-dm-systimer.c
@@ -241,7 +241,7 @@ static void __init dmtimer_systimer_assign_alwon(void)
 	bool quirk_unreliable_oscillator = false;
 
 	/* Quirk unreliable 32 KiHz oscillator with incomplete dts */
-	if (of_machine_is_compatible("ti,omap3-beagle") ||
+	if (of_machine_is_compatible("ti,omap3-beagle-ab4") ||
 	    of_machine_is_compatible("timll,omap3-devkit8000")) {
 		quirk_unreliable_oscillator = true;
 		counter_32k = -ENODEV;
