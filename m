Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 852741632F9
	for <soc@lists.linux.dev>; Wed, 13 Nov 2024 18:20:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731522058; cv=none; b=bP4HvgN9zFQ8XrG9AvQz4rLnsKvZEe8C73eyqZtUNk/LMycyimFKicZGTj9rY/SwNzlxRPNrGr/3nvTRTtXoh5leiBu1eyz6zMs5o5xbm4zrjTrVqnGOk+6lBSKsXC1BkN7LSF5IfyRjOUBbC/wq0j1LyjzdHoE8BG6PdWP/FGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731522058; c=relaxed/simple;
	bh=eR4ZYRUcESR/u+rF277QYjNnu7TxT2UUJemokbSqTTE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=fYGi7UbIIgQO4TOi0NbLf1NnwjB8FdoTVRUxiYbi61ySl/68MPcIT0oWUjd+9mWtJm5hxy/s+XTRLlVzE8B4mNLXOnzGDKvs/F2EBICxA8IAiLne3psYQBZcyP9ysQ3KDd2Pe6AYgdPrKi+do8rD+AxFgFQt6KGkIxQMO5lSMIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=cFn/VDlb; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="cFn/VDlb"
Received: by smtp.kernel.org (Postfix)
	id 420F9C4CED0; Wed, 13 Nov 2024 18:20:58 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 1045BC4CED2
	for <soc@kernel.org>; Wed, 13 Nov 2024 18:20:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 1045BC4CED2
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-37d4fd00574so731125f8f.0
        for <soc@kernel.org>; Wed, 13 Nov 2024 10:20:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1731522054; x=1732126854; darn=kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CRSsyiVRXVuj9Plcgs97NkJBdvJMyvNwRVL0mSw0o3s=;
        b=cFn/VDlbab/xKOZZwA+NSJ2iiZP7Bo5C1LxJMDij2N0LUbuUgHKD0GdCW4HypYaeXR
         lit8Q8BUZy/acgHGWjCbiNCX/4A7oi29QMDo8jBkT/UFLQQMCEGFfU9Hqv4duOv6Ef2e
         41ufT7mlG+MRlKpqvMXCMdIofT6+ySGz8J+0WzqKfczKGzfIleXTETOITohhaL3X4eVu
         au0K68pwEl3etAo160FOAe4H2SaP1I3ju0qeONtKR+o2oZEK+MFw+58rLcQZEytpNCWk
         5chIPTkBAZLT7aynbfVuLghoHt9K0hynchHrOYt/zrWItfYZ+IHqigEvCQ3tW36/BgIi
         8zJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731522054; x=1732126854;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CRSsyiVRXVuj9Plcgs97NkJBdvJMyvNwRVL0mSw0o3s=;
        b=U1tXV8UNeZzx/CcHm+UAT4WSUQBf5nvzYu0bLiKJ8cojficQwedlvhVInJrxc1JhFT
         vt46YZhhAbBQKYKBQXTgLM04MdX95qSNm8jaMmf1ODEFCSn514/KIiJW+QtEQXfup1ch
         8utFuzUL/vRg3kkf29us6RZP0Zg1LgI9ZklPnWvVsOVeTqFlY4xKpQo1lk/kjm0xF0ad
         wNaoQDdP7uje6sHIV0t5GsjtSOsCQMX1fDsKF1Igkd3kpgkCkD+t99QoxeBWOaUCbR0G
         J54pAfnY9Or4AfHcdeBIJOJmfz3/xW5A1hMHuwlgOqHQZD7twp6VDO/0kN0iV1Z7yllJ
         FfxA==
X-Forwarded-Encrypted: i=1; AJvYcCWqg7iBqRUNJDIts5O4++/2vD1QTlenf5UHeAwPIKuTaDtNJIbNfiQX2HKfpa6eZjiXczY=@kernel.org
X-Gm-Message-State: AOJu0YyEjFioXvh61KP9ZaLTex9P65h8hLn5KnE6HotSZ7aQyxAKiweu
	wI3Bx/goQDHEhReKudOoLhzbymd+ZS6F6P6XqRG+3L1XUvQuzIhUorjU1Q8D1IA=
X-Google-Smtp-Source: AGHT+IGs42OiyjmTYqrzp5AjQ4xqYDDNdjCkuNv3dM1AQd51DZTiBOSiBwMp2YgjVpVfGFa/6J9trg==
X-Received: by 2002:a5d:598c:0:b0:371:8685:84c with SMTP id ffacd0b85a97d-382140394cdmr310076f8f.15.1731522054097;
        Wed, 13 Nov 2024 10:20:54 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.28])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-381ed9978c6sm19009502f8f.50.2024.11.13.10.20.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Nov 2024 10:20:53 -0800 (PST)
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
To: arnd@arndb.de,
	olof@lixom.net,
	arm@kernel.org,
	soc@kernel.org
Cc: nicolas.ferre@microchip.com,
	alexandre.belloni@bootlin.com,
	linux-arm-kernel@lists.infradead.org,
	claudiu.beznea@tuxon.dev
Subject: [RESEND GIT PULL v2] Microchip AT91 DT updates for v6.13
Date: Wed, 13 Nov 2024 20:20:49 +0200
Message-Id: <20241113182050.2176500-2-claudiu.beznea@tuxon.dev>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20241113182050.2176500-1-claudiu.beznea@tuxon.dev>
References: <20241113182050.2176500-1-claudiu.beznea@tuxon.dev>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 9852d85ec9d492ebef56dc5f229416c925758edc:

  Linux 6.12-rc1 (2024-09-29 15:06:19 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/at91/linux.git tags/at91-dt-6.13

for you to fetch changes up to 371a47c9a58a13e339fce2a3118c9ee6a8422258:

  ARM: dts: microchip: sam9x75_curiosity: add sam9x75 curiosity board (2024-11-05 13:51:12 +0200)

----------------------------------------------------------------
Microchip AT91 device tree updates for v6.13

It contains:
- device tree support for the Microchip SAM9X7 SoC and the Microchip
  SAM9X75 Curiosity board
- enable power monitor support for SAM9X60-EK, SAMA5D2-ICP,
  SAMA7G45 Curiosity, SAMA7G5-EK boards
- updates the uart nodes with missing properties
- device tree cleanups

Changes in v2:
- added SAM9X7 support

----------------------------------------------------------------
Alexander Dahl (2):
      ARM: dts: microchip: Add trng labels for all at91 SoCs
      ARM: dts: microchip: Unify rng node names

Andrei Simion (4):
      ARM: dts: microchip: sam9x60: Add missing property atmel,usart-mode
      ARM: dts: microchip: Rename the eeprom nodename
      ARM: dts: microchip: Rename the pmic node
      ARM: dts: microchip: Rename LED sub nodes name

Mihai Sain (4):
      ARM: dts: microchip: sam9x60ek: Add power monitor support
      ARM: dts: microchip: sama5d2_icp: Add power monitor support
      ARM: dts: microchip: sama7g54_curiosity: Add power monitor support
      ARM: dts: microchip: sama7g5ek: Add power monitor support

Varshini Rajendran (3):
      ARM: dts: at91: sam9x7: add device tree for SoC
      dt-bindings: arm: add sam9x75 curiosity board
      ARM: dts: microchip: sam9x75_curiosity: add sam9x75 curiosity board

 .../devicetree/bindings/arm/atmel-at91.yaml        |    6 +
 arch/arm/boot/dts/microchip/Makefile               |    3 +
 arch/arm/boot/dts/microchip/aks-cdu.dts            |   12 +-
 arch/arm/boot/dts/microchip/animeo_ip.dts          |    8 +-
 .../boot/dts/microchip/at91-kizbox2-common.dtsi    |    2 +-
 arch/arm/boot/dts/microchip/at91-sam9x60ek.dts     |   37 +-
 .../boot/dts/microchip/at91-sam9x75_curiosity.dts  |  324 ++++++
 .../arm/boot/dts/microchip/at91-sama5d27_som1.dtsi |    2 +-
 .../boot/dts/microchip/at91-sama5d27_wlsom1.dtsi   |    2 +-
 .../boot/dts/microchip/at91-sama5d29_curiosity.dts |    2 +-
 arch/arm/boot/dts/microchip/at91-sama5d2_icp.dts   |   33 +-
 .../arm/boot/dts/microchip/at91-sama5d2_ptc_ek.dts |    2 +-
 .../boot/dts/microchip/at91-sama5d2_xplained.dts   |    2 +-
 .../boot/dts/microchip/at91-sama5d3_xplained.dts   |    2 +-
 .../boot/dts/microchip/at91-sama7g54_curiosity.dts |   31 +
 arch/arm/boot/dts/microchip/at91-sama7g5ek.dts     |   33 +-
 arch/arm/boot/dts/microchip/at91rm9200ek.dts       |    6 +-
 arch/arm/boot/dts/microchip/at91sam9260ek.dts      |    6 +-
 arch/arm/boot/dts/microchip/at91sam9261ek.dts      |    6 +-
 arch/arm/boot/dts/microchip/at91sam9263ek.dts      |    6 +-
 arch/arm/boot/dts/microchip/at91sam9g20ek.dts      |    4 +-
 .../boot/dts/microchip/at91sam9g20ek_common.dtsi   |    2 +-
 arch/arm/boot/dts/microchip/at91sam9g45.dtsi       |    2 +-
 arch/arm/boot/dts/microchip/sam9x60.dtsi           |   14 +-
 arch/arm/boot/dts/microchip/sam9x7.dtsi            | 1220 ++++++++++++++++++++
 arch/arm/boot/dts/microchip/sama5d2.dtsi           |    2 +-
 arch/arm/boot/dts/microchip/sama5d3.dtsi           |    2 +-
 arch/arm/boot/dts/microchip/sama5d34ek.dts         |    2 +-
 arch/arm/boot/dts/microchip/sama5d3xcm_cmp.dtsi    |    2 +-
 arch/arm/boot/dts/microchip/sama5d4.dtsi           |    2 +-
 30 files changed, 1735 insertions(+), 42 deletions(-)
 create mode 100644 arch/arm/boot/dts/microchip/at91-sam9x75_curiosity.dts
 create mode 100644 arch/arm/boot/dts/microchip/sam9x7.dtsi
