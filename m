Return-Path: <SRS0=15kR=CE=microchip.com=Cristian.Birsan@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2540EEB64D8
	for <soc@archiver.kernel.org>; Fri, 16 Jun 2023 15:29:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id E541DC433C9; Fri, 16 Jun 2023 15:29:50 +0000 (UTC)
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id EBCD7C433CB;
	Fri, 16 Jun 2023 15:29:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org EBCD7C433CB
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1686929388; x=1718465388;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=rI9R9UXytJokNpAttrGnBytdwyPaCRl1wE974W1E3pU=;
  b=KK8/B1/TOSPU7Q62zGDAkDd+3JDuOykwCdeKu7svED3Q4NHyywVFtzmB
   wdvPtaGN8GjJrNOHq1VD+dv0wmnDK8DTzdC7zRmtth7ldiypg/tI3RcPI
   f+9VslrzKGYAj5kRRa0dQuWwmanuFLviXTM+cI2r2aC1UUGJMED8RkLvJ
   GpW6S7vt2HbK+EQKegW4puXIA5ecM3CrlgJ+mEuu09nPnHPdsfjAqnqqM
   6eSDEMlpvvo3XNyWQJIHwTZMI73AxrysnXsPQk/kpcJisI7cF5ue5pHxG
   VfDUKX0fV/4nQIU29A2LElw0zRB9vhe/a8PP8yHNOM6o7CCvmkOlXpyDQ
   g==;
X-IronPort-AV: E=Sophos;i="6.00,247,1681196400"; 
   d="scan'208";a="218283789"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 16 Jun 2023 08:29:44 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Fri, 16 Jun 2023 08:29:44 -0700
Received: from rob-ult-m91496.microchip.com (10.10.115.15) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.21 via Frontend Transport; Fri, 16 Jun 2023 08:29:42 -0700
From: <cristian.birsan@microchip.com>
List-Id: <soc.lore.kernel.org>
To: <arnd@arndb.de>, <olof@lixom.net>, <soc@kernel.org>, <robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <conor+dt@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Cristian Birsan
	<cristian.birsan@microchip.com>
Subject: [PATCH] arm: dts: Enable device-tree overlay support for AT91 boards
Date: Fri, 16 Jun 2023 18:29:32 +0300
Message-ID: <20230616152932.1484154-1-cristian.birsan@microchip.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Cristian Birsan <cristian.birsan@microchip.com>

Add the '-@' DTC option for AT91 boards that have device-tree overlays.
This option populates the '__symbols__' node that contains all the
necessary symbols for supporting device-tree overlays (from bootloader)
on these devices.

This change increases the size of the resulting DTB with ~30%-40%. Below
are the measurements performed v6.4-rc6:

at91-sam9x60_curiosity.dtb	28499 -> 36641 bytes
at91-sam9x60ek.dtb		30867 -> 39609 bytes
at91-sama5d27_som1_ek.dtb	26086 -> 34166 bytes
at91-sama5d27_wlsom1_ek.dtb	26045 -> 33184 bytes
at91-sama5d2_icp.dtb		27521 -> 36155 bytes
at91-sama5d2_ptc_ek.dtb		23237 -> 29612 bytes
at91-sama5d2_xplained.dtb	27262 -> 35326 bytes
at91-sama5d3_eds.dtb		27924 -> 39939 bytes
at91-sama5d3_xplained.dtb	28400 -> 40650 bytes
at91-sama5d4_xplained.dtb	26456 -> 36107 bytes
at91-sama7g5ek.dtb		29212 -> 37289 bytes

Signed-off-by: Cristian Birsan <cristian.birsan@microchip.com>
---
 arch/arm/boot/dts/Makefile | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index 59829fc90315..38b82af2bf69 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -50,9 +50,21 @@ dtb-$(CONFIG_SOC_AT91SAM9) += \
 	at91sam9g35ek.dtb \
 	at91sam9x25ek.dtb \
 	at91sam9x35ek.dtb
+# Enables support for device-tree overlays
+DTC_FLAGS_at91-sam9x60_curiosity := -@
+DTC_FLAGS_at91-sam9x60ek := -@
 dtb-$(CONFIG_SOC_SAM9X60) += \
 	at91-sam9x60_curiosity.dtb \
 	at91-sam9x60ek.dtb
+# Enables support for device-tree overlays
+DTC_FLAGS_at91-sama5d27_som1_ek := -@
+DTC_FLAGS_at91-sama5d27_wlsom1_ek := -@
+DTC_FLAGS_at91-sama5d2_icp := -@
+DTC_FLAGS_at91-sama5d2_ptc_ek := -@
+DTC_FLAGS_at91-sama5d2_xplained := -@
+DTC_FLAGS_at91-sama5d3_eds := -@
+DTC_FLAGS_at91-sama5d3_xplained := -@
+DTC_FLAGS_at91-sama5d4_xplained := -@
 dtb-$(CONFIG_SOC_SAM_V7) += \
 	at91-kizbox2-2.dtb \
 	at91-kizbox3-hs.dtb \
@@ -79,6 +91,8 @@ dtb-$(CONFIG_SOC_SAM_V7) += \
 	at91-sama5d4_xplained.dtb \
 	at91-sama5d4ek.dtb \
 	at91-vinco.dtb
+# Enables support for device-tree overlays
+DTC_FLAGS_at91-sama7g5ek := -@
 dtb-$(CONFIG_SOC_SAMA7G5) += \
 	at91-sama7g5ek.dtb
 dtb-$(CONFIG_SOC_SP7021) += \
-- 
2.34.1

