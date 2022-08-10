Return-Path: <SRS0=H8Po=YO=microchip.com=Conor.Dooley@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E1D2C00140
	for <soc@archiver.kernel.org>; Wed, 10 Aug 2022 14:03:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 6752CC433B5; Wed, 10 Aug 2022 14:03:54 +0000 (UTC)
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 65909C433C1;
	Wed, 10 Aug 2022 14:03:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 65909C433C1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1660140232; x=1691676232;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=6wm8qFNBUY4i8KtmlFHnTGwoCmChYaNk0zbrd4k51PQ=;
  b=Op9Pr4xEIKq4D8iQfr0S6CAv23riv2gW8NzGb1cubViHaA8yXTg8kSDv
   sx0Kg75d2ZT9oJ2tmXiJFf+YN49YSLEm2uTgfdyF7lPR8DJaN2Udu/LwC
   YfUQG4XgJ8U3R0GZSEvPGhCKW+8WhemLFaAuS75kDi5AS0xIJJMQooopg
   KAqiEGaZlUw8XAYs/GhXOe06+EvsjUu7ZDRx7nn4umlNUBALk8XyhqOBx
   FDR1JjG3lDGyfQNYh1nRTCEpIGPqmzCRhguAzN3LRfGu8jCGrbOONUeCB
   9uNS/sw5yqP/6VKO+XkQXywRZ4GVm5Wuyr2gjAZarvOA0nsqr+70rDTIl
   g==;
X-IronPort-AV: E=Sophos;i="5.93,227,1654585200"; 
   d="scan'208";a="108427959"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 10 Aug 2022 07:03:48 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Wed, 10 Aug 2022 07:03:48 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server id 15.1.2375.28 via Frontend
 Transport; Wed, 10 Aug 2022 07:03:45 -0700
From: Conor Dooley <conor.dooley@microchip.com>
List-Id: <soc.lore.kernel.org>
To: <soc@kernel.org>, Daire McNamara <daire.mcnamara@microchip.com>
CC: Mark Brown <broonie@kernel.org>, Wolfram Sang <wsa@kernel.org>, "Thierry
 Reding" <thierry.reding@gmail.com>, =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?=
	<u.kleine-koenig@pengutronix.de>, Jassi Brar <jassisinghbrar@gmail.com>,
	Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski
	<brgl@bgdev.pl>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Arnd
 Bergmann" <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, Michael Turquette
	<mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
	<devicetree@vger.kernel.org>, <linux-riscv@lists.infradead.org>, Conor Dooley
	<conor.dooley@microchip.com>, Marc Kleine-Budde <mkl@pengutronix.de>
Subject: [RESEND PATCH 1/2] MAINTAINERS: add PolarFire SoC dt bindings
Date: Wed, 10 Aug 2022 15:02:43 +0100
Message-ID: <20220810140243.2685416-2-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220810140243.2685416-1-conor.dooley@microchip.com>
References: <20220810140243.2685416-1-conor.dooley@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

So far when I added bindings for the platform I never added them to
our MAINTAINERS entry. No time like the present to improve the coverage.

CC: Mark Brown <broonie@kernel.org>
CC: Wolfram Sang <wsa@kernel.org>
CC: Thierry Reding <thierry.reding@gmail.com>
CC: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
CC: Jassi Brar <jassisinghbrar@gmail.com>
CC: Linus Walleij <linus.walleij@linaro.org>
CC: Bartosz Golaszewski <brgl@bgdev.pl>
CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC: Arnd Bergmann <arnd@arndb.de>
CC: Olof Johansson <olof@lixom.net>
CC: Michael Turquette <mturquette@baylibre.com>
CC: Stephen Boyd <sboyd@kernel.org>
Suggested-by: Mark Brown <broonie@kernel.org>
Acked-by: Marc Kleine-Budde <mkl@pengutronix.de> # for can
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 MAINTAINERS | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 868bbf31603d..fd0f10a110e7 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -17512,6 +17512,15 @@ M:	Conor Dooley <conor.dooley@microchip.com>
 M:	Daire McNamara <daire.mcnamara@microchip.com>
 L:	linux-riscv@lists.infradead.org
 S:	Supported
+F:	Documentation/devicetree/bindings/clock/microchip,mpfs.yaml
+F:	Documentation/devicetree/bindings/gpio/microchip,mpfs-gpio.yaml
+F:	Documentation/devicetree/bindings/i2c/microchip,corei2c.yaml
+F:	Documentation/devicetree/bindings/mailbox/microchip,mpfs-mailbox.yaml
+F:	Documentation/devicetree/bindings/net/can/microchip,mpfs-can.yaml
+F:	Documentation/devicetree/bindings/pwm/microchip,corepwm.yaml
+F:	Documentation/devicetree/bindings/soc/microchip/microchip,mpfs-sys-controller.yaml
+F:	Documentation/devicetree/bindings/spi/microchip,mpfs-spi.yaml
+F:	Documentation/devicetree/bindings/usb/microchip,mpfs-musb.yaml
 F:	arch/riscv/boot/dts/microchip/
 F:	drivers/char/hw_random/mpfs-rng.c
 F:	drivers/clk/microchip/clk-mpfs.c
-- 
2.36.1

