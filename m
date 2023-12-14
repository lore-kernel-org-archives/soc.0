Return-Path: <SRS0=0UJg=HZ=tuxon.dev=claudiu.beznea@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B542C4332F
	for <soc@archiver.kernel.org>; Thu, 14 Dec 2023 17:49:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 71FABC433C8; Thu, 14 Dec 2023 17:49:58 +0000 (UTC)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id AD82FC433C9
	for <soc@kernel.org>; Thu, 14 Dec 2023 17:49:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org AD82FC433C9
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-a1db6c63028so973256566b.2
        for <soc@kernel.org>; Thu, 14 Dec 2023 09:49:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1702576196; x=1703180996; darn=kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gY+EQ9tiO01vYIK8u4szNz/ehCOiQOkcf01+rKYe10Y=;
        b=gUGC7m9gSM9l0qD53FBX3kj9gUKbyfMA9gYpfsSyTwYwTQ94qlPsM2s/CTrs3N93cu
         +adhJvHJAEa83Woq+nF4kfLh8D+dnNj0cgyTZqjl5l3tOnds8CvIfvyqLtyAGl/C1/Gt
         RgyrCwcfl0TZRp01vnJd9OkR9g2gg3jGb8m9q95pFFaeupFG2Uk7CeQ01uY4JSD61hqH
         64daI91/EqqAOQeI2y34ML61GeXOhQnJXsOJmz1fbnRUD6ygliyII7VRa7euW3v4urTj
         /GpZQXmEshU1cAOxKG/4eyW3u1EmDPCEY/NwXPg+X1+Kg75u6SWfS9Phsk5XAS9EmJZ3
         N4Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702576196; x=1703180996;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gY+EQ9tiO01vYIK8u4szNz/ehCOiQOkcf01+rKYe10Y=;
        b=P7GX+ihVMPHVaLVGOpnoEbNY/bCDQT/13cY7CFn2tAa7mnpsbHorOQWi4DdBnetS3N
         1Qz2z3H2Nc6tDp7+Z/Ki/820C0G7/VCyfh8F18cpWM8hCvTaLKHxiJFOaKNHJRqDG7if
         kxa8mJea/ujj1tVaeUuzHQ2sA4mhNTfM3FVZH6yFLVpOqdU4Ti7y1MYExV10fC+1Y7M9
         wz/h7UMq1LQOPkUHA1jH+EfxGvrOMFT1YuvRyoz5iRqWB6T+jIaAuowCgs5dOlq0ysyt
         NtoaxQMBbSKtZ6hUXlKFu8Jw8/8iGqp8IAx86wBu6VGezAeA7ILTdJP9Sd9uMnEAZQU3
         1bLQ==
X-Gm-Message-State: AOJu0Yz3tB0gti6ClOVL7iZ9VwojQvNk/l/PpabESTQ4fN7O8a9O1yYp
	nTVyiUclEZg6J2Q83OMqxKXHyA==
X-Google-Smtp-Source: AGHT+IE0TKFpAc+umVRrMkrnztIi5g9iuqQRHyaGpTZt8jfBi4jj2EW+2y7SaPnjKOitjWRrJdmlNw==
X-Received: by 2002:a17:906:5190:b0:a19:a19a:ea9e with SMTP id y16-20020a170906519000b00a19a19aea9emr4146217ejk.87.1702576195749;
        Thu, 14 Dec 2023 09:49:55 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.103])
        by smtp.gmail.com with ESMTPSA id ci13-20020a170906c34d00b00a0988d69549sm9618843ejb.189.2023.12.14.09.49.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Dec 2023 09:49:55 -0800 (PST)
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
List-Id: <soc.lore.kernel.org>
To: arnd@arndb.de,
	olof@lixom.net,
	arm@kernel.org,
	soc@kernel.org
Cc: nicolas.ferre@microchip.com,
	alexandre.belloni@bootlin.com,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] Microchip AT91 DT updates for v6.8
Date: Thu, 14 Dec 2023 19:49:54 +0200
Message-Id: <20231214174954.3045355-1-claudiu.beznea@tuxon.dev>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit b85ea95d086471afb4ad062012a4d73cd328fa86:

  Linux 6.7-rc1 (2023-11-12 16:19:07 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/at91/linux.git tags/at91-dt-6.8

for you to fetch changes up to abe18175269ac8433c9cd52efd72d16b1731d479:

  ARM: dts: microchip: sama5d27_som1_ek: Remove mmc-ddr-3_3v property from sdmmc0 node (2023-12-12 17:52:50 +0200)

----------------------------------------------------------------
Microchip AT91 device tree updates for v6.8

It contains:
- IRQ support for Ethernet PHYs on SAM9X60-EK and SAM9X60-Curiosity
  boards
- removal of the mmc-ddr-3_3v property from SD controllers connected to SD
  slots, for SAMA5D27-WLSOM1-EK and SAMA5D27-SOM1-EK boards, as this
  property is for eMMC devices

----------------------------------------------------------------
Mihai Sain (4):
      ARM: dts: microchip: sam9x60_curiosity: Add IRQ support for ethernet PHY
      ARM: dts: microchip: sam9x60ek: Add IRQ support for ethernet PHY
      ARM: dts: microchip: sama5d27_wlsom1_ek: Remove mmc-ddr-3_3v property from sdmmc0 node
      ARM: dts: microchip: sama5d27_som1_ek: Remove mmc-ddr-3_3v property from sdmmc0 node

 arch/arm/boot/dts/microchip/at91-sam9x60_curiosity.dts  | 3 +++
 arch/arm/boot/dts/microchip/at91-sam9x60ek.dts          | 3 +++
 arch/arm/boot/dts/microchip/at91-sama5d27_som1_ek.dts   | 1 -
 arch/arm/boot/dts/microchip/at91-sama5d27_wlsom1_ek.dts | 1 -
 4 files changed, 6 insertions(+), 2 deletions(-)
