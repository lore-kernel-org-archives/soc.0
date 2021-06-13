Return-Path: <SRS0=VOD1=LH=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E26E3C48BCF
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 13 Jun 2021 12:43:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9229461245
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 13 Jun 2021 12:43:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9229461245
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=902ZFNhby8dQIAo2Ws4D3hu00OX/FifrUDLv5V231f8=; b=e+qHAeDCJXL87n
	IkqcywZpv6ARBtVAlpU3CDqDMlhMmRL+K7jXNJ+D8xlYfvrM2H7nmytxoiuJeTgbFDLBkgv85p1JL
	xUxc41rjV6Y4QgkPX1dNMTiqDyR7v8RLyiSB9krz38gEzBDxNQMepvssaALDT2nxbWp9JxsZq5bMb
	f455/lIyk0NouReTwGUu/mHA64D2nyStFE+DHzOW9VeF2hNmjvSjTS9xsWRrOcuGri5WOn0EK5eju
	0WiLHwph0jvS3WrDvJyJObgq4z23p04h48QUeQ8udCYp9F1LvpNA0hS1b9XP6A5QvMxHd1ZNvTNZK
	0rdGUS4ha7FgGSv5E77g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lsPOP-00ARG5-B6; Sun, 13 Jun 2021 12:39:09 +0000
Received: from mail-lf1-f41.google.com ([209.85.167.41])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lsPOK-00ARBJ-Sl
 for linux-arm-kernel@lists.infradead.org; Sun, 13 Jun 2021 12:39:06 +0000
Received: by mail-lf1-f41.google.com with SMTP id k40so16263707lfv.7
 for <linux-arm-kernel@lists.infradead.org>;
 Sun, 13 Jun 2021 05:37:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
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
 b=luxkg7fF+VqTOlDsh98vS8qAHCIw6PY0l0tWiIhSIasESh4YmMrvkw3tH1b/RTAQEu
 QTcAJ3meZCqvkhC6zRVoR+FeyeuGrO2x9EUu3mJ0LN+jmZ4QHvJIOOyUmFv8r/Cs5NWr
 vYmdxGJvLB4KfFGlTq0byroyEWl1IYlMANi7gqHaT6Cs3AalP2OSwmifiRZorHfm3Gj/
 264FIUZpK37n9fgNXm//ZAWO31LpukX1O7mxTwrYz+EKJqagR1wcjBaOvpUs+5cAqMCa
 t9/QFgw6WatOPYtbNOsn1nTWADJNBkTWnG8chy4opDprIPxw1Q7dSJf2YQ5ukD/CgySK
 tUhQ==
X-Gm-Message-State: AOAM533rER8yEPQ3+42GteRrTYGfwAQK8OUV5pThhxzvRwkCvvh0Otoa
 b7KwOpoLrgP3qjKUdOnbTGx9mQ==
X-Google-Smtp-Source: ABdhPJz2Y0JbGMbYbE/+wXn426tO3m18cLMYU082mkchHyLAcHeaTkSdSY0jLpX4Sk5Af+TcdGBQVw==
X-Received: by 2002:a05:6512:16a6:: with SMTP id
 bu38mr8659619lfb.92.1623587758885; 
 Sun, 13 Jun 2021 05:35:58 -0700 (PDT)
Received: from localhost.localdomain
 (c-fdcc225c.014-348-6c756e10.bbcust.telenor.se. [92.34.204.253])
 by smtp.gmail.com with ESMTPSA id u12sm1437103ljo.37.2021.06.13.05.35.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 13 Jun 2021 05:35:58 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
 Linus Walleij <linus.walleij@linaro.org>, stable@vger.kernel.org,
 Dan Murphy <dmurphy@ti.com>
Subject: [PATCH] ARM: dts: ux500: Fix LED probing
Date: Sun, 13 Jun 2021 14:33:56 +0200
Message-ID: <20210613123356.880933-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210613_053904_955639_A803AFC2 
X-CRM114-Status: GOOD (  12.00  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210613123356.9RQcbCajOhcdL4mNMJoqKFBd4dzAZiOe4rirQzNOwJA@z>

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


_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
