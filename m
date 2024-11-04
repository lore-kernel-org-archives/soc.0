Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7AAE1CB9E5
	for <soc@lists.linux.dev>; Mon,  4 Nov 2024 18:51:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730746298; cv=none; b=clZ/jqal/VZdjEsCIu/wfzMxNnR+GAhTnjKsHUevqBOlSHXLYZ9FrHs0RVFo63PUPiFOn/Omj7QtNqOLgfJzDwrBlom1Veg2Nc5CDL5q9qJFetDpyFYiiphwjkmFbMTPRZHuM17DubIMi1eZnvaUHvJu4LKaLaWlgK2RjaZMfcQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730746298; c=relaxed/simple;
	bh=a22lLUTFqP/yxTWz5lNuOqkZR4F8l0Y7soEfFfZvwBk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=jTizA0qJs/VY2yAIgaXfvHFKy+JuoZAGlwTFvjJuRwdD+YEmHZpJO2DA0gSyL+jIPr6rcz3iQILVJj9aUlzwwUD66R8hYub2399ODZHltNi3i5LsCpEjJZ7eJjEATzDEBxmeG7U1jO0538nAfiObpUEoyGggcYU1b5vk9CDARpk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=ObK1KmPi; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="ObK1KmPi"
Received: by smtp.kernel.org (Postfix)
	id 66B5FC4CED0; Mon,  4 Nov 2024 18:51:38 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 5D4A7C4CECE
	for <soc@kernel.org>; Mon,  4 Nov 2024 18:51:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 5D4A7C4CECE
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-20cb7139d9dso41489695ad.1
        for <soc@kernel.org>; Mon, 04 Nov 2024 10:51:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1730746295; x=1731351095; darn=kernel.org;
        h=mime-version:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=4GL6OlsCw/1Iw3ML1pJSqsdxrGB8NVV7bwhorGsY4FA=;
        b=ObK1KmPiUvaoavCNWOVsHyekbir/Td8AoXXr0psPPuiZWjcIUnMRLmkzIW2J5XCovz
         tBntK7lSEhsnKaAQd+W/Jd5O7jpmzX1SO/pgqXoTkg/u3MR9TcJqcVezI8muXOg2258I
         /wNLnPg5zU3pLuam34w4rPT85e+LwVtHqAHP3eF9Zt3ZiJPk0Q0Okqor6O0xzy9vGy9U
         aDOpzTEQ43fD3AzsThFyVVZ2iIpp0cuwjlK0Zu874VSw9+l12C0eQQFLVnq7C63h7hq1
         PrbLzhznasYphb5FvKWxLnES4etV+oQLStbM3TC3fIJZD51tGoGX2gBBvCiZoo5mFoPh
         NA8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730746295; x=1731351095;
        h=mime-version:message-id:date:subject:cc:to:from:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4GL6OlsCw/1Iw3ML1pJSqsdxrGB8NVV7bwhorGsY4FA=;
        b=VkzjQdvFL65rkviRg3e5CTwDk/lYhKmGSHygYDS2YMSUY401zgvdJJQFw+2h8u5s8+
         Qs/zoCal/XETdMcz/htlnS62gUaAjBbchy1uGzhvc5T4DHMPSg54pftsM9UFaJ+7cDqx
         iXKH5n0uprgYNzCOz5a4LucRkmYFZGDN5lEl/ZBl3QNbUtOVAH3Y6ckW66zSATA9TTs9
         EVJ0VbOsWwtqLz6ejJCutA7db+46kvFB0qBvW4suB7NlvcXFjz+Hd+p28dJjDpY8kzHj
         7pBxVwjRNk6+hUcaRuIeP2FVrUSILuQNAN+xmGuuNhwE9HlZYNCOVlnLI+coBVAEuBau
         EWpg==
X-Gm-Message-State: AOJu0Yz3sqlUtVbXmQpufJVOX0tjvWaGWNZAJ7ZWnETYsXLdU4eqOnp9
	mhBf+XVZuQKzmb9FIl0L5ejJNUrASEJJl0/MDlJN5EmWoiPtqyXfG151glLOAfueNURvFxZP5zj
	oFQs=
X-Google-Smtp-Source: AGHT+IGzpsJFLBBw3vdrPJOV+n4vGe3wFsVOs9lQV6Gx+kfr37V1BYgA0GZsaPx09/UbeM2AdnSQng==
X-Received: by 2002:a17:903:2445:b0:20c:bcd8:5ccb with SMTP id d9443c01a7336-210c6c0610amr475618745ad.30.1730746295454;
        Mon, 04 Nov 2024 10:51:35 -0800 (PST)
Received: from localhost ([97.126.177.194])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-211057a2b39sm64589225ad.145.2024.11.04.10.51.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Nov 2024 10:51:35 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
To: soc@kernel.org
Cc: linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] ARM: dts: OMAP updates for v6.13
Date: Mon, 04 Nov 2024 10:51:34 -0800
Message-ID: <7hmsieomrt.fsf@baylibre.com>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

The following changes since commit 9852d85ec9d492ebef56dc5f229416c925758edc:

  Linux 6.12-rc1 (2024-09-29 15:06:19 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/khilman/linux-omap.git tags/omap-for-v6.13/dt-signed

for you to fetch changes up to 13746595a1581e09289adf9b5202e237c5e0814b:

  ARM: dts: omap4-kc1: fix twl6030 power node (2024-11-04 10:42:22 -0800)

----------------------------------------------------------------
ARM: dts: OMAP updates for v6.13

Misc. minor updates for OMAP3, OMAP4, AM3 and DRA7 platforms.

----------------------------------------------------------------
Andreas Kemnade (10):
      ARM: dts: omap: omap4-epson-embt2ws: define GPIO regulators
      ARM: dts: omap: omap4-epson-embt2ws: wire up regulators
      ARM: dts: omap: omap4-epson-embt2ws: add unknown gpio outputs
      ARM: dts: omap: omap4-epson-embt2ws: add GPIO expander
      ARM: dts: ti/omap: use standard node name for twl4030 charger
      ARM: dts: ti/omap: dra7: fix redundant clock divider definition
      ARM: ti/omap: omap3-gta04a5: add Bluetooth
      ARM: dts: omap36xx: declare 1GHz OPP as turbo again
      ARM: dts: ti/omap: omap4-epson-embt2ws: add charger
      ARM: dts: omap4-kc1: fix twl6030 power node

Geert Uytterhoeven (1):
      ARM: dts: am335x-bone-common: Increase MDIO reset deassert delay to 50ms

Marcus Folkesson (1):
      ARM: dts: ti: dra7: Remove double include of clock bindings

Rob Herring (Arm) (1):
      ARM: dts: ti/omap: Fix at24 EEPROM node names

Roger Quadros (3):
      ARM: dts: ti: drop linux,mtd-name from NAND nodes
      ARM: dts: ti: omap: am335x-baltos: drop "gpmc,device-nand" from NAND node
      ARM: dts: ti: omap3434-sdp: drop linux,mtd-name from onenand node

 arch/arm/boot/dts/ti/omap/am335x-baltos.dtsi       |   3 +--
 arch/arm/boot/dts/ti/omap/am335x-bone-common.dtsi  |  12 ++++-----
 arch/arm/boot/dts/ti/omap/am335x-boneblue.dts      |   2 +-
 arch/arm/boot/dts/ti/omap/am335x-pdu001.dts        |   6 ++---
 arch/arm/boot/dts/ti/omap/am335x-shc.dts           |   2 +-
 arch/arm/boot/dts/ti/omap/am3517-som.dtsi          |   1 -
 arch/arm/boot/dts/ti/omap/am3874-iceboard.dts      |   8 +++---
 arch/arm/boot/dts/ti/omap/am437x-cm-t43.dts        |   2 +-
 arch/arm/boot/dts/ti/omap/am437x-idk-evm.dts       |   2 +-
 arch/arm/boot/dts/ti/omap/am437x-sbc-t43.dts       |   2 +-
 arch/arm/boot/dts/ti/omap/am437x-sk-evm.dts        |   2 +-
 arch/arm/boot/dts/ti/omap/am43x-epos-evm.dts       |   2 +-
 arch/arm/boot/dts/ti/omap/am57xx-cl-som-am57x.dts  |   2 +-
 arch/arm/boot/dts/ti/omap/am57xx-sbc-am57x.dts     |   2 +-
 arch/arm/boot/dts/ti/omap/dm8148-evm.dts           |   1 -
 arch/arm/boot/dts/ti/omap/dm8168-evm.dts           |   1 -
 arch/arm/boot/dts/ti/omap/dra62x-j5eco-evm.dts     |   1 -
 arch/arm/boot/dts/ti/omap/dra7.dtsi                |   1 -
 arch/arm/boot/dts/ti/omap/dra7xx-clocks.dtsi       |   1 -
 arch/arm/boot/dts/ti/omap/logicpd-som-lv.dtsi      |   1 -
 arch/arm/boot/dts/ti/omap/logicpd-torpedo-som.dtsi |   3 +--
 arch/arm/boot/dts/ti/omap/omap3-cm-t3x.dtsi        |   2 +-
 arch/arm/boot/dts/ti/omap/omap3-evm-37xx.dts       |   1 -
 arch/arm/boot/dts/ti/omap/omap3-evm.dts            |   1 -
 arch/arm/boot/dts/ti/omap/omap3-gta04.dtsi         |   2 +-
 arch/arm/boot/dts/ti/omap/omap3-gta04a5.dts        |  10 ++++++++
 arch/arm/boot/dts/ti/omap/omap3-igep.dtsi          |   1 -
 arch/arm/boot/dts/ti/omap/omap3-ldp.dts            |   1 -
 arch/arm/boot/dts/ti/omap/omap3-overo-base.dtsi    |   1 -
 arch/arm/boot/dts/ti/omap/omap3-sb-t35.dtsi        |   2 +-
 arch/arm/boot/dts/ti/omap/omap3430-sdp.dts         |   2 --
 arch/arm/boot/dts/ti/omap/omap36xx.dtsi            |   1 +
 arch/arm/boot/dts/ti/omap/omap4-epson-embt2ws.dts  | 211 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++----
 arch/arm/boot/dts/ti/omap/omap4-kc1.dts            |   6 +----
 arch/arm/boot/dts/ti/omap/omap5-cm-t54.dts         |   2 +-
 arch/arm/boot/dts/ti/omap/omap5-sbc-t54.dts        |   2 +-
 arch/arm/boot/dts/ti/omap/twl4030.dtsi             |   2 +-
 37 files changed, 248 insertions(+), 56 deletions(-)

