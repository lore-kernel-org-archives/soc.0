Return-Path: <SRS0=wTi4=DV=tuxon.dev=claudiu.beznea@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F605C04A6A
	for <soc@archiver.kernel.org>; Fri,  4 Aug 2023 04:41:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id E8FE4C433CA; Fri,  4 Aug 2023 04:41:24 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id D6343C433C7
	for <soc@kernel.org>; Fri,  4 Aug 2023 04:41:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org D6343C433C7
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3177f520802so1728175f8f.1
        for <soc@kernel.org>; Thu, 03 Aug 2023 21:41:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1691124082; x=1691728882;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GuUkjLKvvj53js6mS/Wlzq1xQY3/sPXxpSdl4PogWZQ=;
        b=TLXNO7vPgQxtEDKBEovMORlEKm1n4ptTRlY+aeG1I0ktprM5KDYIcHKuskBmXVwGXo
         mga070AXus2DVrj6K92Hx7VjJPh9mdCzswEu7eOa3NNkrricMHKKMvz5n/whE8O3GvzR
         5/nkkbS4pJaRYVlqHV8zvRCQkKa67kCBnKJj6tpPBmLIZwxTxDZxNOnr8YiTNUi0ktMt
         5VgPM8Zj8mlB5yFmUammtel5G3THQrS0BliSv8LMTPQUXJCsQs87BhTyp6iyonGl3EQe
         h7ZSJOQLkbPi5iyrWfNnKUdEzyP13yHayTzGGSIILYDD2cXmm5q4O5BbDAoaS1nghM84
         5isQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691124082; x=1691728882;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GuUkjLKvvj53js6mS/Wlzq1xQY3/sPXxpSdl4PogWZQ=;
        b=HKhnveZQ9ESmvIfXTctOxH9cxyn+saygRQ0R+gLt5Zq+uUhqsKU9mFK1G4SQ4amvOz
         SZtlFQ4suksp3Zwmsx1S6hSzNHmNqJ449WoEXjsFUn22a/oPxXsBH7RBUuSYQTqQGRyo
         gCf75F4dyhJL9y+fSB5xrSiOxcrxH7H5kyXHF5GXvQ1HO8ZWNnvSDlX4Ko22cEItz/nI
         ac3mLAy7M4QihmL8T3GFZ6B5cBpNbbDoX7ha8L0jFhOe2+cU8NOvf9W8aYtdNfvyIzSx
         r4Oelm3MIip+cyFRwu+0h5jig5tuLIsmXrnYkRNMvPIQAwxEEvsUB8lfVekzTx4eXELF
         EFnw==
X-Gm-Message-State: AOJu0Ywn2zZHrA3m2qfurPA56pXgR5Bo36pdw1Q3hIMxlLimPdcMIYBR
	nITPvrXK47gy6iy0V83M6gtawg==
X-Google-Smtp-Source: AGHT+IGamI9C872pC5ZcSZAkjHfnwEkEQEinfAaVXa3kmQiKvAtG9kV2mUV+vNQjilNcpvVYxOjpUQ==
X-Received: by 2002:a5d:6942:0:b0:314:c6b:b9a2 with SMTP id r2-20020a5d6942000000b003140c6bb9a2mr593637wrw.13.1691124081847;
        Thu, 03 Aug 2023 21:41:21 -0700 (PDT)
Received: from localhost.localdomain ([82.78.167.79])
        by smtp.gmail.com with ESMTPSA id r15-20020adfdc8f000000b00317909f9985sm1421444wrj.113.2023.08.03.21.41.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Aug 2023 21:41:21 -0700 (PDT)
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
List-Id: <soc.lore.kernel.org>
To: arnd@arndb.de,
	olof@lixom.net,
	arm@kernel.org,
	soc@kernel.org
Cc: nicolas.ferre@microchip.com,
	alexandre.belloni@bootlin.com,
	conor.dooley@microchip.com,
	cristian.birsan@microchip.com
Subject: [GIT PULL] AT91 SoC updates for 6.6
Date: Fri,  4 Aug 2023 07:41:18 +0300
Message-Id: <20230804044118.231478-1-claudiu.beznea@tuxon.dev>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 06c2afb862f9da8dc5efa4b6076a0e48c3fbaaa5:

  Linux 6.5-rc1 (2023-07-09 13:53:13 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/at91/linux.git tags/at91-soc-6.6

for you to fetch changes up to 96a49448c4777940b16eecdfc61f935fa380d864:

  ARM: at91: Remove unused extern declarations (2023-07-29 16:56:09 +0300)

----------------------------------------------------------------
AT91 SoC updates for 6.6:

It contains:
- explicitly include correct DT includes from Rob
- one cleanup which removes unused extern declaration on atmel_tcb.h

----------------------------------------------------------------
Rob Herring (2):
      soc: microchip: Explicitly include correct DT includes
      ARM: at91: Explicitly include correct DT includes

YueHaibing (1):
      ARM: at91: Remove unused extern declarations

 arch/arm/mach-at91/pm.c                     | 1 +
 arch/arm/mach-at91/samv7.c                  | 7 -------
 drivers/soc/atmel/sfr.c                     | 1 -
 drivers/soc/microchip/mpfs-sys-controller.c | 2 +-
 include/soc/at91/atmel_tcb.h                | 3 ---
 5 files changed, 2 insertions(+), 12 deletions(-)
