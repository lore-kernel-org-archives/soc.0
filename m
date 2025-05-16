Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 524E6221F04
	for <soc@lists.linux.dev>; Fri, 16 May 2025 05:53:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747374818; cv=none; b=FPd2R2DtuCq/+CKKd9XhBAIVWO47VUDH4/Zqq0f1s5KtbKCE96DfzZR/lVbLtWqjBHZYUlx5JuYmHMJWRdNa79Ra8cXOZdrd0ZdTxYWWLqocu9JYAAKGvDFM5iOP04g4VwUDCDlPBvBZr9okOCpVr/w9mXeDcuhNjegRvvx9yvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747374818; c=relaxed/simple;
	bh=9eio0ee7vY9Q07cdF26s+6B3n0T5Y3myrjYBHbudpHI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OAN455Ei6A9udsXKmsFZ9PrPPZ+7FJcMoahmovbAFqCRYUxz6yjAIGuYCkbgj96nY3uU0RNNhwh6aDDtaiKTj2G/V/cDP1+IKMKW650mz59ajzgX5diKWDaWrNlLLu/kjojoMsgti3xy9fNBMmHd+5UCkIcPac7WGhvufJ0Z1mY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=qTQZf6gH; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="qTQZf6gH"
Received: by smtp.kernel.org (Postfix)
	id C8FF3C4CEE4; Fri, 16 May 2025 05:53:37 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 362B1C4CEE9
	for <soc@kernel.org>; Fri, 16 May 2025 05:53:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 362B1C4CEE9
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-441d437cfaaso9996285e9.1
        for <soc@kernel.org>; Thu, 15 May 2025 22:53:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1747374813; x=1747979613; darn=kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ysgHzHUJXzI0JJ26R9GmqoNNUsJzhyB8GzW0gLV0Nww=;
        b=qTQZf6gH06fK+QB36F6tlooPKX3zhSZ7vZ8OjmTsXyKwpZcT9yWEULIcK02PK0tWU3
         Z7hwwdAZJxSEE8Jjh4RGIjHmFSsBGWapQmjK9+VWcxcHJkQsLQW//eqtpF8u1nMZ/V4f
         5b50FEW5VbQrrCuWhzS1lDzJ8JQJ9Lopks+2uFAUTV5v0c3O75hw88WwHAwSHG6bCJmH
         ZqFiZjayv6L0x5hXNIRMIh2GU+R0czEYk+lkYURwvzbkjgSLr8D04FPsXXdTTJOR6fIx
         oWjyZmTR/LEF+n7zIMnwaeNev+0FWou/rhO2B5steSoJrdde9Gfba2F01Vobc3Go5Iws
         TI2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747374813; x=1747979613;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ysgHzHUJXzI0JJ26R9GmqoNNUsJzhyB8GzW0gLV0Nww=;
        b=OZt5xrQzqu5GFcgJLVOFHnAaVpyGBEEBYYvsw7Qoyk1EvgzlAThRRAecG0mhy2Ias9
         wMpHKwTrpSuPXzVKeVVVotxHHZol99tocmTgBZmA/Yy0h73C47F7PCkjnAST3oYvtX5L
         mGfL1w3d7ks4GlIcUkqz3prEw4qq7vBzbtRLDvXdctGT/eEJa3RJKASKfr2mwfhi34fx
         ynnG+MrY6rNRwPW8U2IqG9df6TmpgZ8PTLVRiiblB5nuhFu87VdM+5rEzJGAcZyub8U2
         GnBCN6ySVRlAnwhrfXyur1sIMnoyPGFCFobt0FMhI/kdqHHnHNt6k5wdB+wZTSMreNH4
         wX7g==
X-Forwarded-Encrypted: i=1; AJvYcCWBVN+6k6JoV5x8rxgbHOhQ7eqZZUIXZaMz3VMs7pkbIkfnMSOVcLzNWzPMloM7bnnsju0=@kernel.org
X-Gm-Message-State: AOJu0Yy/H7N2atbFahIl4Sfign2OWhIEUxQzdczJqD1YZGniCjAqxLKC
	8EFcOgveRPG5GI2bg8KSVyaDCCghdyFoAqL3Nt2nMWZ1He/HFPtjAPkAH4otWNEZ3lc=
X-Gm-Gg: ASbGncueFh0EGgxyM5brJH8xzvWhX4ZCZHWhMgTD/LFL1xywo7I19vm0TZ2b7FtqZkc
	DheNu79vgY7+a3E4MfE++lPQMBOUKp2FRGzxg6bS8JI2Nb80jVoI7u4CO3xDELy5gywCWXfWwSN
	/Ink6ZzQ66p/T8f7hLQfFaUGPw8h3QrSQO4L0Ms11f7f8pmExrGf142rRY9v6EXe0V7EOMP5nVS
	Cjg4QhS8hu3F6FlRaoC1IhuM2DJ1vg4ec3vg1aZ/0HJny6+oD8czvjr3Ag7UI+n+htgUdK01vwV
	bBGt7suRYgRhO1r1neF6sZOKB0MsLP253Q0g4mOH5zehbJ4ez7+xYpwmRXB3wZL6K26Tfw==
X-Google-Smtp-Source: AGHT+IE06yhwIrfWMR3nQ7nz3IOMaiLivNnlRQajJq9CYMFATW7m0104XfpAAx5jbw6vts7hRg7ArA==
X-Received: by 2002:a05:600c:1d28:b0:43d:ea:51d2 with SMTP id 5b1f17b1804b1-442fefee236mr8833645e9.14.1747374812978;
        Thu, 15 May 2025 22:53:32 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.58])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442fd4fdcccsm21672275e9.6.2025.05.15.22.53.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 May 2025 22:53:32 -0700 (PDT)
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
To: arnd@arndb.de,
	arm@kernel.org,
	soc@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	nicolas.ferre@microchip.com,
	alexandre.belloni@bootlin.com,
	claudiu.beznea@tuxon.dev
Subject: [GIT PULL] Microchip AT91 DT updates for v6.16
Date: Fri, 16 May 2025 08:53:30 +0300
Message-ID: <20250516055330.10852-1-claudiu.beznea@tuxon.dev>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 0af2f6be1b4281385b618cb86ad946eded089ac8:

  Linux 6.15-rc1 (2025-04-06 13:11:33 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/at91/linux.git tags/at91-dt-6.16

for you to fetch changes up to 36e9e1ab594519972b0b468aec9b8e9591ddd0ac:

  ARM: dts: microchip: sama7g54_curiosity: Add fixed-partitions for spi-nor flash (2025-05-16 08:31:29 +0300)

----------------------------------------------------------------
Microchip AT91 device tree updates for v6.16

This update includes:
- more controllers enabled for SAMA7D65 SoC (Ethernet, Flexcoms,
  SRAM, DRAM, RTC, RTT, GBPR)
- cleanups and fixes for Calao boards

----------------------------------------------------------------
Mihai Sain (1):
      ARM: dts: microchip: sama7g54_curiosity: Add fixed-partitions for spi-nor flash

Ryan Wanner (8):
      ARM: dts: microchip: sama7d65: Add gmac interfaces for sama7d65 SoC
      ARM: dts: microchip: sama7d65: Add FLEXCOMs to sama7d65 SoC
      ARM: dts: microchip: sama7d65: Enable GMAC interface
      ARM: dts: microchip: sama7d65: Add MCP16502 to sama7d65 curiosity
      ARM: dts: microchip: sama7d65_curiosity: add EEPROM
      ARM: dts: microchip: sama7d65: Add SRAM and DRAM components support
      ARM: dts: microchip: sama7d65: Add RTT and GPBR Support for sama7d65 SoC
      ARM: dts: microchip: sama7d65: Add RTT timer to curiosity board

Wolfram Sang (7):
      ARM: dts: at91: usb_a9g20: add SPI EEPROM
      ARM: dts: at91: usb_a9263: fix GPIO for Dataflash chip select
      ARM: dts: at91: calao_usb: simplify memory node
      ARM: dts: at91: usb_a9260: use 'stdout-path'
      ARM: dts: at91: calao_usb: simplify chosen node
      ARM: dts: at91: usb_a9g20: move wrong RTC node
      ARM: dts: at91: at91sam9263: fix NAND chip selects

 .../boot/dts/microchip/at91-sama7d65_curiosity.dts | 209 +++++++++++++
 .../boot/dts/microchip/at91-sama7g54_curiosity.dts |  32 ++
 arch/arm/boot/dts/microchip/at91sam9263ek.dts      |   2 +-
 arch/arm/boot/dts/microchip/sama7d65.dtsi          | 346 +++++++++++++++++++++
 arch/arm/boot/dts/microchip/tny_a9263.dts          |   2 +-
 arch/arm/boot/dts/microchip/usb_a9260.dts          |   8 -
 arch/arm/boot/dts/microchip/usb_a9260_common.dtsi  |   9 +
 arch/arm/boot/dts/microchip/usb_a9263.dts          |   4 +-
 arch/arm/boot/dts/microchip/usb_a9g20.dts          |  17 +-
 arch/arm/boot/dts/microchip/usb_a9g20_common.dtsi  |  27 --
 arch/arm/boot/dts/microchip/usb_a9g20_lpw.dts      |  10 +-
 11 files changed, 625 insertions(+), 41 deletions(-)
 delete mode 100644 arch/arm/boot/dts/microchip/usb_a9g20_common.dtsi
