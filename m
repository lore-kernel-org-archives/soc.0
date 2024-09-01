Return-Path: <SRS0=YtWc=P7=tuxon.dev=claudiu.beznea@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB678C54FC6
	for <soc@archiver.kernel.org>; Sun,  1 Sep 2024 13:31:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id C51DAC4CEC8; Sun,  1 Sep 2024 13:31:18 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id AE970C4CEC3
	for <soc@kernel.org>; Sun,  1 Sep 2024 13:31:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org AE970C4CEC3
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-42bb8c6e250so24870065e9.1
        for <soc@kernel.org>; Sun, 01 Sep 2024 06:31:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1725197476; x=1725802276; darn=kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=srJ8ClFnivv5RrPjVdGptfb5dlZteUJyOqTmUESfBBc=;
        b=duMDFMCBVWR/g5MSZt+1nx/OtCbjR55AR/tZtnu6eR79uJJQvPFMro29KnrI36Slp6
         +/F1iWDZJJl1I8NCF9E4O3//YeSpUJqHayzVgBU/yi+ryIF+k0N3PMQDjFOx/Vfpyytp
         N29eU05fOeplkqcDDaikkvcsHSqQsF/q3K2WdmrK5ZZ1yYoE/ueQkB04MG/Smy4GKmt8
         kYgyRW3AOGBWgPVvT+MPsZ77vqS96amcM/BZyUX6gJdsrWjXJ4LJMx2ka5PWE96eicSP
         vppMrgi0wxef7erhMG1+nMJIc6XxyDbGWE4wZW8MXypsdpka+kHm+INXDB7O2kt2Ifop
         9Prw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725197476; x=1725802276;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=srJ8ClFnivv5RrPjVdGptfb5dlZteUJyOqTmUESfBBc=;
        b=ULwqbFnOfLPEcFT9OL6D9G9QIZ3PFbTiVUQPDMswcWQvqrH90csnQvxGD5HNET2wb+
         YmbfGr6Qa5nM4kPB61ytzbwCX92D/t5Xas858PRgF6AQrCfXljYhqG6CCF/tm6X2cOfT
         rpfW9/W/W7ingym+Vis0yTBEvorSwD/giQ9QMj+HBKW9bEKIW6A8u8pl7eckV2vRERX6
         TRTAvc9xBB4mtNqsll8mSRS34BdNnCF0iUttY/36KbN6VjA8Iu6/SsOyP2Gw+QVwyJwV
         xJ+Qk9w4ubUI5blz5ksyiwVmgzJP0yafy450L7GgdV1GTTdhu7smqkWiC9xjDjSPc0Ic
         JQvg==
X-Forwarded-Encrypted: i=1; AJvYcCULtsXAKOunXygVJE0SEP3hZ99AJfAyEsq5isy0m//jE7a1dYpWRLBoIPIkoY3Q9aCnA0Y=@kernel.org
X-Gm-Message-State: AOJu0YzIBu9TKmUXP0O0EKR7sjX+nbr0qeIwywfpGQguJutvMMkZtaA+
	Q75HoY4sgJkavJ65JdO5Jzi6HMHUg6DIoZctrxpN59tZGCwy9WOtr+6xTIU87JU=
X-Google-Smtp-Source: AGHT+IGJWWoMfxrt+hi+5C+cxdujT5XzgpUjsDe+HJreDo0fIhxfWdzAxkbgXAjEvtb03wR9gHSJhQ==
X-Received: by 2002:a05:600c:19d0:b0:426:67ad:38e3 with SMTP id 5b1f17b1804b1-42c82f48459mr7367025e9.3.1725197475781;
        Sun, 01 Sep 2024 06:31:15 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.144])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42bbef54b23sm69120515e9.44.2024.09.01.06.31.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Sep 2024 06:31:15 -0700 (PDT)
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
List-Id: <soc.lore.kernel.org>
To: arnd@arndb.de,
	olof@lixom.net,
	arm@kernel.org,
	soc@kernel.org
Cc: nicolas.ferre@microchip.com,
	alexandre.belloni@bootlin.com,
	claudiu.beznea@tuxon.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] Microchip AT91 SoC updates for v6.12
Date: Sun,  1 Sep 2024 16:31:10 +0300
Message-Id: <20240901133110.2038675-3-claudiu.beznea@tuxon.dev>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240901133110.2038675-1-claudiu.beznea@tuxon.dev>
References: <20240901133110.2038675-1-claudiu.beznea@tuxon.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 8400291e289ee6b2bf9779ff1c83a291501f017b:

  Linux 6.11-rc1 (2024-07-28 14:19:55 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/at91/linux.git tags/at91-soc-6.12

for you to fetch changes up to 1a92f0387b17c8cb4548185675fb42de670f9794:

  ARM: at91: Kconfig: add config flag for SAM9X7 SoC (2024-08-07 19:24:46 +0300)

----------------------------------------------------------------
Microchip AT91 SoC updates for v6.12

It contains:
- support for the Microchip SAM9X7 SoC:
-- power management
-- SoC identification
-- sysreg documentation updates
-- necessary Kconfig updates

----------------------------------------------------------------
Varshini Rajendran (5):
      dt-bindings: atmel-sysreg: add sam9x7
      ARM: at91: pm: add support for sam9x7 SoC family
      ARM: at91: pm: add sam9x7 SoC init config
      ARM: at91: add support in SoC driver for new sam9x7
      ARM: at91: Kconfig: add config flag for SAM9X7 SoC

 .../devicetree/bindings/arm/atmel-sysregs.txt      |  6 ++--
 arch/arm/mach-at91/Kconfig                         | 22 +++++++++++++--
 arch/arm/mach-at91/Makefile                        |  1 +
 arch/arm/mach-at91/generic.h                       |  2 ++
 arch/arm/mach-at91/pm.c                            | 29 +++++++++++++++++++
 arch/arm/mach-at91/sam9x7.c                        | 33 ++++++++++++++++++++++
 drivers/soc/atmel/soc.c                            | 23 +++++++++++++++
 drivers/soc/atmel/soc.h                            |  9 ++++++
 8 files changed, 120 insertions(+), 5 deletions(-)
 create mode 100644 arch/arm/mach-at91/sam9x7.c
