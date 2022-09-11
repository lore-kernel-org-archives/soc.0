Return-Path: <SRS0=0Srs=ZO=linaro.org=linus.walleij@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6350AC6FA83
	for <soc@archiver.kernel.org>; Sun, 11 Sep 2022 21:42:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 2EDE9C433D6; Sun, 11 Sep 2022 21:42:53 +0000 (UTC)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 0219DC433D7
	for <soc@kernel.org>; Sun, 11 Sep 2022 21:42:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 0219DC433D7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f54.google.com with SMTP id s6so670606lfo.7
        for <soc@kernel.org>; Sun, 11 Sep 2022 14:42:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=GuE+gfSl9k+d6IIypH4U+Dtc6dcjxSmbaD9w4HOwDak=;
        b=xYb/gl0FVq0d6mpdLwP53d6Lw1UQ2+Gjawjl6j6mcFSFk1BkTL1dD9RtE24ZMj6TN1
         FbqsGTkBYz64w0TTBYHwF28p11AKX18WpSKchZG1AtZ/ie9LrFBqbenjUPh84Es0jl4S
         rktClKNwktajTlZHwZwQxuYIQk+Rwv1xiJanxswsSb8vlPPUMVdgZALIR32xOz1d8Svg
         Vp0ByVh6ab8dilEht6OFMfbtt5OsxZCGqE4GfUyYZ5LrSUQUoBe1c0l4h1Z1xIUXdjD1
         M8/sAgaakHQZEoy5tcSDC2BT9UOWH7t2BEcd0PtjxtRFIOAFbajKi17wLzHinn4iz4Ot
         Nefw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=GuE+gfSl9k+d6IIypH4U+Dtc6dcjxSmbaD9w4HOwDak=;
        b=LjbuI6n2FAOGEjrZdWa5TM88H6cKPpWKLmx3SbhzuhaLQhd39AF15MqdJu+pgIDRV/
         LDXU9X7Kibc/OchawlNIMZNVo72E2b8oS/TtPlBP+fe2HEorBn8qkoxUcYnEmcRdqM8l
         FFNZWONcqVjCjWjDPq2MrzEiaxLRebnfvZXbtfcXg40SFFgNmIqYHqJJcvWiYEETL09C
         yjgnRhnTyhK5EjurxvXORXVNv10CHzuEQ+d+aJxls2QITUz6B/CupK0yjZ87DyuvxX07
         2TCyW7Ran/801AQGUA1wpA7HDo36/BoIUzvmuNHuJcH2NNQo4WS9hV/oxDEUx5jVGPwv
         UOWQ==
X-Gm-Message-State: ACgBeo17o4MQVMKxWmAvISBn3QU8v6JLdbtNYnhRw3B5kXT9WiyWDcVP
	6HGh+filumBERWMhElsdiEeAWA==
X-Google-Smtp-Source: AA6agR4nNmfWfCtnjpMR8zlMxFyhd2nLzlofaFuxbwtuDth+QBJP44jo7ZicJaQoRZ2KibZJCZb0Bw==
X-Received: by 2002:a05:6512:3f8c:b0:492:b392:bb84 with SMTP id x12-20020a0565123f8c00b00492b392bb84mr7525880lfa.368.1662932568957;
        Sun, 11 Sep 2022 14:42:48 -0700 (PDT)
Received: from localhost.localdomain (c-fdcc225c.014-348-6c756e10.bbcust.telenor.se. [92.34.204.253])
        by smtp.gmail.com with ESMTPSA id a12-20020ac2520c000000b0048a891e4d88sm733196lfl.193.2022.09.11.14.42.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Sep 2022 14:42:48 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH] ARM: config: ixp4xx: Disable legacy EEPROM driver
Date: Sun, 11 Sep 2022 23:40:42 +0200
Message-Id: <20220911214042.1857352-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This disables the legacy EEPROM driver, we only need
the new AT24 driver.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
SoC folks: please apply this directly for 6.1.
---
 arch/arm/configs/ixp4xx_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/configs/ixp4xx_defconfig b/arch/arm/configs/ixp4xx_defconfig
index 6b65ac2a72e7..3cb995b9616a 100644
--- a/arch/arm/configs/ixp4xx_defconfig
+++ b/arch/arm/configs/ixp4xx_defconfig
@@ -99,7 +99,7 @@ CONFIG_BLK_DEV_LOOP=y
 CONFIG_BLK_DEV_RAM=y
 CONFIG_BLK_DEV_RAM_SIZE=8192
 CONFIG_EEPROM_AT24=y
-CONFIG_EEPROM_LEGACY=y
+# CONFIG_EEPROM_LEGACY is not set
 # CONFIG_SCSI_PROC_FS is not set
 CONFIG_BLK_DEV_SD=y
 # CONFIG_BLK_DEV_BSG is not set
-- 
2.37.2

