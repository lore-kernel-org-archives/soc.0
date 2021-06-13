Return-Path: <SRS0=Z+I5=LH=linaro.org=linus.walleij@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B8B4C48BCF
	for <soc@archiver.kernel.org>; Sun, 13 Jun 2021 12:36:01 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id E57216127C; Sun, 13 Jun 2021 12:36:00 +0000 (UTC)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AD2C561075
	for <soc@kernel.org>; Sun, 13 Jun 2021 12:36:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AD2C561075
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=linus.walleij@linaro.org
Received: by mail-lf1-f45.google.com with SMTP id f30so16305101lfj.1
        for <soc@kernel.org>; Sun, 13 Jun 2021 05:36:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=psREgUUJe6MVeVSfHryr4eKsn7I0gsCysICo1D9MNkY=;
        b=JH5wSKWmYb5fhVe1bG/uxfKqWA1UBPjNfABzxFY9tykLp+HWJfq4Vr1hAYPH/aYn6f
         YwTmnfuyth8/GYhWrOTeajOxfHNh4O13WY99kvCh1HiLXmWyPb2lpvvWmprwFTwszuLE
         JxfIoPSwmQ2YpGdIMnjA5gqQwymWYM0AiBHmkqgIK4K5QAJdmUkxKzVRanFTnOrWzW/i
         PbWNSpNUzx3YEYGOXc8beqwY5ew1z952lAHLFaD/SjWiMYf4ZG7Znxn+EUpcWMJt+EJ7
         zVcW9hy9u5YUtNc5S+D83fGhOM+pRZoU7+coKulknXfcuXlZmp3mDMGPPJUEbu1W3osD
         FtUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=psREgUUJe6MVeVSfHryr4eKsn7I0gsCysICo1D9MNkY=;
        b=MC0A/9KosPrW++3i0Ut0uz+9jIGtocEC8xnNXcCjaW+ccFER+84AcmkdbYhYZqkQjJ
         fqoYY5MmG/WGvvq4dfZZ3/c9+s9SF2+spEZ7cd7sVCF/qM9jaS28AjCPrwAeSEJsC6kK
         9FisVthgA8ddN0d9GL5eLZ0aA0vkyYvaZjUQJiJyrA6G7/Q9BiymgCmXbKmeuuHBg1Xq
         kObG95NGrBN2fEtNqRxuqvfdJWfIWSWgW8RwnZu3TL/tj0AvHeJIz/kykEw02VG3vZdV
         4UOAlbjDmIkZeSWxMzjJddp+s43zR7pm2eQTtsqhYdR5VoAt0wEDWAyIvRIQ1H+72vCc
         SVVw==
X-Gm-Message-State: AOAM530JjmypyVpsS9I7BB46hH5XnIz33/R1u4CcmsTFJuxDHlPK++vc
	GT3IGjqUb16quPP93+qyt/5eGw==
X-Google-Smtp-Source: ABdhPJz2Y0JbGMbYbE/+wXn426tO3m18cLMYU082mkchHyLAcHeaTkSdSY0jLpX4Sk5Af+TcdGBQVw==
X-Received: by 2002:a05:6512:16a6:: with SMTP id bu38mr8659619lfb.92.1623587758885;
        Sun, 13 Jun 2021 05:35:58 -0700 (PDT)
Received: from localhost.localdomain (c-fdcc225c.014-348-6c756e10.bbcust.telenor.se. [92.34.204.253])
        by smtp.gmail.com with ESMTPSA id u12sm1437103ljo.37.2021.06.13.05.35.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Jun 2021 05:35:58 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	Linus Walleij <linus.walleij@linaro.org>,
	stable@vger.kernel.org,
	Dan Murphy <dmurphy@ti.com>
Subject: [PATCH] ARM: dts: ux500: Fix LED probing
Date: Sun, 13 Jun 2021 14:33:56 +0200
Message-Id: <20210613123356.880933-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Ux500 HREF LEDs have not been probing properly for a
while as this was introduce:

     ret = of_property_read_u32(np, "color", &led_color);
     if (ret)
             return ret;

Since the device tree did not define the new invented color
attribute, probe was failing.

Define color attributes for the LEDs so they work again.

Fixes: 92a81562e695 ("leds: lp55xx: Add multicolor framework support to lp55xx")
Cc: stable@vger.kernel.org
Cc: Dan Murphy <dmurphy@ti.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
SoC maintainers: please apply this directly for fixes.
---
 arch/arm/boot/dts/ste-href.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm/boot/dts/ste-href.dtsi b/arch/arm/boot/dts/ste-href.dtsi
index 00e7d76e8656..48408fd391d6 100644
--- a/arch/arm/boot/dts/ste-href.dtsi
+++ b/arch/arm/boot/dts/ste-href.dtsi
@@ -4,6 +4,7 @@
  */
 
 #include <dt-bindings/interrupt-controller/irq.h>
+#include <dt-bindings/leds/common.h>
 #include "ste-href-family-pinctrl.dtsi"
 
 / {
@@ -69,17 +70,20 @@ chan@0 {
 					reg = <0>;
 					led-cur = /bits/ 8 <0x2f>;
 					max-cur = /bits/ 8 <0x5f>;
+					color = <LED_COLOR_ID_BLUE>;
 					linux,default-trigger = "heartbeat";
 				};
 				chan@1 {
 					reg = <1>;
 					led-cur = /bits/ 8 <0x2f>;
 					max-cur = /bits/ 8 <0x5f>;
+					color = <LED_COLOR_ID_BLUE>;
 				};
 				chan@2 {
 					reg = <2>;
 					led-cur = /bits/ 8 <0x2f>;
 					max-cur = /bits/ 8 <0x5f>;
+					color = <LED_COLOR_ID_BLUE>;
 				};
 			};
 			lp5521@34 {
@@ -93,16 +97,19 @@ chan@0 {
 					reg = <0>;
 					led-cur = /bits/ 8 <0x2f>;
 					max-cur = /bits/ 8 <0x5f>;
+					color = <LED_COLOR_ID_BLUE>;
 				};
 				chan@1 {
 					reg = <1>;
 					led-cur = /bits/ 8 <0x2f>;
 					max-cur = /bits/ 8 <0x5f>;
+					color = <LED_COLOR_ID_BLUE>;
 				};
 				chan@2 {
 					reg = <2>;
 					led-cur = /bits/ 8 <0x2f>;
 					max-cur = /bits/ 8 <0x5f>;
+					color = <LED_COLOR_ID_BLUE>;
 				};
 			};
 			bh1780@29 {
-- 
2.31.1

