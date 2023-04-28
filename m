Return-Path: <SRS0=iHIr=AT=baylibre.com=jpanis@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBC86C77B61
	for <soc@archiver.kernel.org>; Fri, 28 Apr 2023 10:55:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id A0A61C433D2; Fri, 28 Apr 2023 10:55:00 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 4D94BC433EF
	for <soc@kernel.org>; Fri, 28 Apr 2023 10:54:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 4D94BC433EF
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-3f18dacd392so60904905e9.0
        for <soc@kernel.org>; Fri, 28 Apr 2023 03:54:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1682679295; x=1685271295;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fFNBJS20WLgq1YWyfU1SnWpJA65lDW01dwN6L86FEiI=;
        b=Uja4PbpFNjG0tUrWzV09vLbGbxy8/XMyaRlpnY3ur3T4I31yDWe6lI+tDUCB7ZRQgw
         wKktKgeKeY9r/rtr6ND+Tyxq8CfoAZG/TOIxEL9HCum80TT2EZ3djIAPJxECmr13rzGA
         hWQSzjg44ObkZ4UmDX68wPFnFJyplsR9kXT5iiUUqis1H+ZugoybNAjr5xvm7hQXK64l
         /wwVh/UoO44nN8KWR+ZNdW0MEaHuoUhVyS2rVzfrQ6uDNEyt2J98448fQ4FUE5rMikUl
         xGzAn4opGhPtOvyVKfTl1Uik6WT6VDUv0pl2inM93MxyMi3tjYcyUROvR383dkmVaFun
         71zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682679295; x=1685271295;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fFNBJS20WLgq1YWyfU1SnWpJA65lDW01dwN6L86FEiI=;
        b=IORwzCgBQhtzNODdOVw93hvwvooV83XCSKinKn1t/d39zu8cVQv5Ii7/R/iZRPzWbq
         A5wkyDwMCxu6/C3KJCIdxfoYYr6vwZe54tUHeCldfSwyM1NSLdMHgfPXhcIHw9wW6Ni6
         nx9Q816txfKzsObjrzjKr6U9KQC1EioUxjn4u69xOg8M2F1/F7U/2BeVCA1Tj5ljuxWN
         9mtJtsWApUzyyIldWLbcLsZhQw6ZoASJH2ricIdeJYZ4MSHhw+mDDugROgGg1GT2wzui
         Tggj+a67Wa1WAVQGJnzYT8y0HcNjvdMWaSrQrjuUMWcO5PW4+hR/DixHIp1IpXmqD785
         vTYA==
X-Gm-Message-State: AC+VfDwbJLvMdvw65AwWv89bKA2H95yGwOnBvzsdC2g97tBrXmNDG1kE
	2Y9Oqx5Qm7xgx0WjkVfKNKxV+Q==
X-Google-Smtp-Source: ACHHUZ7pVr9Uf8iWfR262MteoPdvkPdUB1g3VnlbDTqQ6Aacto3mpYT36+LLcoSnXyQC7MluFI1Vlw==
X-Received: by 2002:a05:600c:2042:b0:3f1:7e3a:2ef2 with SMTP id p2-20020a05600c204200b003f17e3a2ef2mr3895061wmg.14.1682679295180;
        Fri, 28 Apr 2023 03:54:55 -0700 (PDT)
Received: from baylibre-ThinkPad-T14s-Gen-2i.. (151.31.102.84.rev.sfr.net. [84.102.31.151])
        by smtp.gmail.com with ESMTPSA id z9-20020a05600c114900b003f1745c7df3sm703323wmz.23.2023.04.28.03.54.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Apr 2023 03:54:54 -0700 (PDT)
From: Julien Panis <jpanis@baylibre.com>
List-Id: <soc.lore.kernel.org>
To: arnd@arndb.de,
	olof@lixom.net,
	soc@kernel.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	tony@atomide.com
Cc: linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-omap@vger.kernel.org
Subject: [PATCH] arm: dts: Add am335x-boneblack-pps.dts
Date: Fri, 28 Apr 2023 12:54:53 +0200
Message-Id: <20230428105453.110254-1-jpanis@baylibre.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lokesh Vutla <lokeshvutla@ti.com>

Add a new am335x-boneblack-pps.dts that can be used to configure TIMER7
in PWM mode. This PWM signal can be used as a PPS signal when
synchronized to PTP clock. Typically this synchronization is done by a
userspace program. This PPS signal can be observed on pin P8.8.

Signed-off-by: Lokesh Vutla <lokeshvutla@ti.com>
Signed-off-by: Vignesh Raghavendra <vigneshr@ti.com>
Signed-off-by: Adrien Ricciardi <aricciardi@baylibre.com>
Signed-off-by: Julien Panis <jpanis@baylibre.com>
---
 arch/arm/boot/dts/Makefile                 |  1 +
 arch/arm/boot/dts/am335x-boneblack-pps.dts | 25 ++++++++++++++++++++++
 2 files changed, 26 insertions(+)
 create mode 100644 arch/arm/boot/dts/am335x-boneblack-pps.dts

diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index efe4152e5846..d74158aae72d 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -939,6 +939,7 @@ dtb-$(CONFIG_SOC_AM33XX) += \
 	am335x-base0033.dtb \
 	am335x-bone.dtb \
 	am335x-boneblack.dtb \
+	am335x-boneblack-pps.dtb \
 	am335x-boneblack-wireless.dtb \
 	am335x-boneblue.dtb \
 	am335x-bonegreen.dtb \
diff --git a/arch/arm/boot/dts/am335x-boneblack-pps.dts b/arch/arm/boot/dts/am335x-boneblack-pps.dts
new file mode 100644
index 000000000000..88d2bc3fd759
--- /dev/null
+++ b/arch/arm/boot/dts/am335x-boneblack-pps.dts
@@ -0,0 +1,25 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2023 Texas Instruments Incorporated - http://www.ti.com/
+ */
+
+#include "am335x-boneblack.dts"
+
+&am33xx_pinmux {
+	pwm7_pins: pinmux_pwm7_pins {
+		pinctrl-single,pins = <
+			AM33XX_PADCONF(AM335X_PIN_GPMC_OEN_REN, PIN_OUTPUT_PULLDOWN, MUX_MODE2)
+		>;
+	};
+};
+
+/{
+	pwm7: dmtimer-pwm7 {
+		compatible = "ti,omap-dmtimer-pwm";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pwm7_pins>;
+		#pwm-cells = <3>;
+		ti,timers = <&timer7>;
+		ti,clock-source = <0x00>; /* timer_sys_ck */
+	};
+};

base-commit: fe15c26ee26efa11741a7b632e9f23b01aca4cc6
-- 
2.37.3

