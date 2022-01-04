Return-Path: <SRS0=TDcZ=RU=linaro.org=linus.walleij@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34A8DC433F5
	for <soc@archiver.kernel.org>; Tue,  4 Jan 2022 17:05:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id C75C6C36B05; Tue,  4 Jan 2022 17:04:59 +0000 (UTC)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 2A013C36AED
	for <soc@kernel.org>; Tue,  4 Jan 2022 17:04:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 2A013C36AED
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f53.google.com with SMTP id u13so82956840lff.12
        for <soc@kernel.org>; Tue, 04 Jan 2022 09:04:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ziUzwrSrZbAOE3wgxvLgQNaxMFo4GBwpI7qj4Mjw0U0=;
        b=MtYM8pxOhrgjoBB8bel1gaFOc5dvayHJU1svfIem0xR2pfhzdfHUFk7LPxaSj1At2C
         q1vNsbE+EgME7ydXOYOW0PI1YMPR+jiWs4Mx+f3qkM5nliLNd7BPkof1o8phw8veZmE9
         KNY+/0tF7IOvt+aN50MhN7fN/sTwSs7QLBc+3z1cCnOZYvibGb7ewITPNaQZDeF22AJa
         g2pFuNRZaD+DrUg7R6JKEtvzsZH4kv2966k0Z+TwMY3PA6kYXtoBStVrXAtEhIcxxxU0
         aa0uxwC1fLgLBL7k0hokstRrRj/11+bKnFtJIIzhjhxWzqkF/f7Y5y7KY2x6pVOCWcRf
         r5Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ziUzwrSrZbAOE3wgxvLgQNaxMFo4GBwpI7qj4Mjw0U0=;
        b=hrkNDTy+t1NtEAW0mc625SeR4bdbtka1cugysajkSuyOqzd0bczPH0A9qkVkYyNjjh
         oYfsF8wBfzYYhWWiyVZw880KEz8lpPX3pw0R2yz1LXi1pJF6/QUBHE04LogRDZGbTaDm
         0v3FFvgVFD271sDozNn/3UddsZ20KTwUG7DGe/EoX7v5aiAMbLwc+6OhipF9dn3tmZYY
         DxY8GuZHY2oy/xLkJiWbAvLRWdPpBRt5SdqpI78cA8rWvPAlnSoUdlRR4WcOFLZlatyW
         D26s0v0qbYtkaFfMdDiScBDOV/4w2KjnT7uHWvQj0QHrOjqKF8TXk3ixpETRlk5nl9es
         dqWA==
X-Gm-Message-State: AOAM533BDLe17owwAeN8EXQwSIE/7BpItoE01G6+Y9Lz0AWkbpbfqN8x
	wJuFnFI6eeQFrMUkXK2LHW4aFg==
X-Google-Smtp-Source: ABdhPJxtUFMjPkLxRI4XvKKEY0ZxxlROU/qBEsC+7S/lFN4Uh6HHmw2zPcv7AXMjOGkcewuvSWlnVw==
X-Received: by 2002:ac2:511b:: with SMTP id q27mr44849005lfb.69.1641315895061;
        Tue, 04 Jan 2022 09:04:55 -0800 (PST)
Received: from localhost.localdomain (c-fdcc225c.014-348-6c756e10.bbcust.telenor.se. [92.34.204.253])
        by smtp.gmail.com with ESMTPSA id p21sm3093400lfg.98.2022.01.04.09.04.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Jan 2022 09:04:53 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	Phil Elwell <phil@raspberrypi.com>,
	Stefan Wahren <stefan.wahren@i2se.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Jan Kiszka <jan.kiszka@web.de>,
	Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH] ARM: dts: gpio-ranges property is now required
Date: Tue,  4 Jan 2022 18:02:47 +0100
Message-Id: <20220104170247.956760-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Phil Elwell <phil@raspberrypi.com>

Since [1], added in 5.7, the absence of a gpio-ranges property has
prevented GPIOs from being restored to inputs when released.
Add those properties for BCM283x and BCM2711 devices.

[1] commit 2ab73c6d8323 ("gpio: Support GPIO controllers without
    pin-ranges")

Fixes: 2ab73c6d8323 ("gpio: Support GPIO controllers without pin-ranges")
Fixes: 266423e60ea1 ("pinctrl: bcm2835: Change init order for gpio hogs")
Reported-by: Stefan Wahren <stefan.wahren@i2se.com>
Reported-by: Florian Fainelli <f.fainelli@gmail.com>
Reported-by: Jan Kiszka <jan.kiszka@web.de>
Signed-off-by: Phil Elwell <phil@raspberrypi.com>
Acked-by: Florian Fainelli <f.fainelli@gmail.com>
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Link: https://lore.kernel.org/r/20211206092237.4105895-3-phil@raspberrypi.com
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
Hi SoC maintainers, please apply this directly for fixes, the
missing patch is wreacking havoc in the RPi world.
---
 arch/arm/boot/dts/bcm2711.dtsi | 2 ++
 arch/arm/boot/dts/bcm283x.dtsi | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/bcm2711.dtsi b/arch/arm/boot/dts/bcm2711.dtsi
index 9e01dbca4a01..dff18fc9a906 100644
--- a/arch/arm/boot/dts/bcm2711.dtsi
+++ b/arch/arm/boot/dts/bcm2711.dtsi
@@ -582,6 +582,8 @@ &gpio {
 		     <GIC_SPI 115 IRQ_TYPE_LEVEL_HIGH>,
 		     <GIC_SPI 116 IRQ_TYPE_LEVEL_HIGH>;
 
+	gpio-ranges = <&gpio 0 0 58>;
+
 	gpclk0_gpio49: gpclk0_gpio49 {
 		pin-gpclk {
 			pins = "gpio49";
diff --git a/arch/arm/boot/dts/bcm283x.dtsi b/arch/arm/boot/dts/bcm283x.dtsi
index a3e06b680947..c113661a6668 100644
--- a/arch/arm/boot/dts/bcm283x.dtsi
+++ b/arch/arm/boot/dts/bcm283x.dtsi
@@ -126,6 +126,8 @@ gpio: gpio@7e200000 {
 			interrupt-controller;
 			#interrupt-cells = <2>;
 
+			gpio-ranges = <&gpio 0 0 54>;
+
 			/* Defines common pin muxing groups
 			 *
 			 * While each pin can have its mux selected
-- 
2.33.1

