Return-Path: <SRS0=pPb6=OZ=semihalf.com=pan@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69F4FC433F5
	for <soc@archiver.kernel.org>; Tue,  5 Oct 2021 14:38:16 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 4CC2561381; Tue,  5 Oct 2021 14:38:16 +0000 (UTC)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2E23E61372
	for <soc@kernel.org>; Tue,  5 Oct 2021 14:38:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2E23E61372
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=semihalf.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=semihalf.com
Received: by mail-lf1-f53.google.com with SMTP id x27so87334943lfu.5
        for <soc@kernel.org>; Tue, 05 Oct 2021 07:38:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=semihalf-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=klTjczTUx8b1c2tX38XlKQEw8mKHpQEoY//ZV2AWwv8=;
        b=Dt8fAg1I9xPaomCa7reH7OK7NJBIuG3OckiqCfqYhOscZS+aDefAdl2iB6gSGYc9N8
         FWy4PDKwKyaeGINQDfSU+6/FBU8W2XimCAdNYeQAQ/yWL5WwZd6iCnfQQBRBP1g7DC6f
         vLM0zBqkF++xS5L5lTB3R/2D1vO5dxzLFDjFb50sfpu7WYK0pdYEvIi1gcO8GBaDGfnm
         fh1wWuUp7K97RzDezKc/7D1y1AK9c82a9Y8QmOT7ySgQYgQTM4LKqn1uWWEEW2t8q1uy
         FXPACkkrzTjyQMyaektNdKcOQ3M9x7HIp3bTHhSlCyhsoNjUWaaeTrWdBF6eUGbNP2SE
         ePWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=klTjczTUx8b1c2tX38XlKQEw8mKHpQEoY//ZV2AWwv8=;
        b=yscaTKWAU28FD+nDKpq68uJWelb8g1ZFOQSkm9UtWO0vUQh0bnuiqUx0DV6DyCJj8A
         jC0iElW0Hdz26hxbnwhei6CAFMiI0c+Dtlw+EqbJk4nfnQr2MrVXstI/vfblGqRUcJKX
         mpqOgv8FtX5XyE9xZPQ9CknuAIP3EUtoijMB9atCtkLOSetHll4qAnbULnFt/wWIlhaz
         mUTBD2xETNItSHutIrGliRZKgFHz35QU45o79IeV16GYfkFMUv3kKetD1UONLjvbEgwi
         aIx6yrgoFkdIMTWF3r+tDeOm2v/gYz6/K4xlJ4y9ebhzHNGDLfSKlI7jZ4jPNBadNq8f
         qtww==
X-Gm-Message-State: AOAM531dTTYDBhEvMhJrk6QrYeWrqQeK4RFxlA+gB33Gd9JXu690TzSN
	iqnKweNE4bF1AohcnA5ul3MbJA==
X-Google-Smtp-Source: ABdhPJyClsOWQd1HOJx8+kEKXL8GXAvDh/ETWKrerqxRvGr3pDmCfDtf3PwnNF8948g8MDS7LYIO4w==
X-Received: by 2002:a05:6512:32c1:: with SMTP id f1mr3769373lfg.471.1633444692745;
        Tue, 05 Oct 2021 07:38:12 -0700 (PDT)
Received: from grasshopper.googchameleon.semihalf.net ([83.142.187.85])
        by smtp.gmail.com with ESMTPSA id u25sm1973835lfc.176.2021.10.05.07.38.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Oct 2021 07:38:12 -0700 (PDT)
From: =?UTF-8?q?Pawe=C5=82=20Anikiel?= <pan@semihalf.com>
List-Id: <soc.lore.kernel.org>
To: jarkko.nikula@linux.intel.com,
	andriy.shevchenko@linux.intel.com,
	mika.westerberg@linux.intel.com,
	robh+dt@kernel.org,
	p.zabel@pengutronix.de,
	arnd@arndb.de,
	olof@lixom.net,
	soc@kernel.org,
	dinguyen@kernel.org,
	p.yadav@ti.com,
	Tudor.Ambarus@microchip.com
Cc: linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	alexandre.belloni@bootlin.com,
	sre@kernel.org,
	thunder.leizhen@huawei.com,
	Jonathan.Cameron@huawei.com,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	ka@semihalf.com,
	tn@semihalf.com,
	jam@semihalf.com,
	amstan@google.com,
	=?UTF-8?q?Pawe=C5=82=20Anikiel?= <pan@semihalf.com>
Subject: [PATCH v2 1/4] i2c: check bus number property in DesignWare I2C Controller
Date: Tue,  5 Oct 2021 16:37:45 +0200
Message-Id: <20211005143748.2471647-2-pan@semihalf.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211005143748.2471647-1-pan@semihalf.com>
References: <20211005143748.2471647-1-pan@semihalf.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On SoCFPGA systems, it's desireable to have fixed numbering for
i2c busses, while being able to enable/disable them (e.g. have i2c1
be mapped to /dev/i2c-1, even though i2c0 is disabled). This can also
be achieved using devicetree aliases (see i2c_add_adapter). However,
having the driver be self-contained without relying on aliases is more
robust.

Signed-off-by: Paweł Anikiel <pan@semihalf.com>
---
 drivers/i2c/busses/i2c-designware-platdrv.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-designware-platdrv.c b/drivers/i2c/busses/i2c-designware-platdrv.c
index 21113665ddea..f27e6bc9ad9d 100644
--- a/drivers/i2c/busses/i2c-designware-platdrv.c
+++ b/drivers/i2c/busses/i2c-designware-platdrv.c
@@ -280,7 +280,8 @@ static int dw_i2c_plat_probe(struct platform_device *pdev)
 					I2C_CLASS_HWMON : I2C_CLASS_DEPRECATED;
 	ACPI_COMPANION_SET(&adap->dev, ACPI_COMPANION(&pdev->dev));
 	adap->dev.of_node = pdev->dev.of_node;
-	adap->nr = -1;
+	if (of_property_read_u32(pdev->dev.of_node, "busno", &adap->nr))
+		adap->nr = -1;
 
 	if (dev->flags & ACCESS_NO_IRQ_SUSPEND) {
 		dev_pm_set_driver_flags(&pdev->dev,
-- 
2.25.1

