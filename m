Return-Path: <SRS0=wTi4=DV=tuxon.dev=claudiu.beznea@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68EC2C001DB
	for <soc@archiver.kernel.org>; Fri,  4 Aug 2023 04:41:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 23685C433CA; Fri,  4 Aug 2023 04:41:10 +0000 (UTC)
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id AB42DC433C8
	for <soc@kernel.org>; Fri,  4 Aug 2023 04:41:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org AB42DC433C8
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2b9338e4695so26405131fa.2
        for <soc@kernel.org>; Thu, 03 Aug 2023 21:41:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1691124066; x=1691728866;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Y//Ef/m08tH570cIajL9peMED6VSlTfIh/KtBqlS0rM=;
        b=ABepWHc4oGOvCHPRQPOZtRwjyF47+Vof9s8ejjg8HBqMS4MOdEVxFxpqgQMgTc3/Xl
         Sz8NZycZ6mXpG+SBXM9Q9HFjBrzWIDsEj6aulLSt64DOIxhreG49nVlQkV7WI1pYTZmt
         1Gox6rCrJAJjgN2e6+BxH2l3kBIUkl/QDt8A+3VWu/fGtspao4crLwCZ8tmRR9dpjtmK
         wvzFCmG8CedQx38Q81g0JjBqsFyq6I3MX4RkUhQj+bQ1hKo8TmT/kEF8EgzBaNuNEgQU
         F+OP5zqxnjz5fY5i0n3pSSVwjStxOp2qc9LBqpJTU/lEnQFSkdmnuQsVwZvegZ/Gf3J0
         AWyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691124066; x=1691728866;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Y//Ef/m08tH570cIajL9peMED6VSlTfIh/KtBqlS0rM=;
        b=LOO6xYaIiK7U5B3zzGzlDQAHo4Bk48T6nDdBA0mUJyuI+7D1FLAyVCK+w3mmHWiCOk
         4Z98UCfMEgYPYH7xGC7IZGOoObLOyovhdGl0tBUo2MS78MDxjNTNdMpkAzWMrvsybrcl
         boesPwq0I/nCqRJZsS0XiWiHO0gopjct2dd4c+6w4mqxB/otGoXVSVIl6AFFkWQKmEHG
         oY16vk5Ju6nJD5r9/3/zSMVQ5lEmo633ntLvQzCzbmJMVcUFchGiGGiNqVn5EbF/Lyga
         QB6jjnWI6IasT6vAvzpzzS0pNETRjqHUEbbAJaH7j3CMIg8waH9eV6Ywtd8Rl3ca08Tv
         ML1A==
X-Gm-Message-State: AOJu0YwIgmZUdyS4dOIK8eZXjYJ+AkpPQFBwaq7uuN03/Xzxmob21ijw
	KUIXoQYH4URUqNClyflXHPjpmA==
X-Google-Smtp-Source: AGHT+IExIe2+z6eoxGxW4nRyDb89ICf+g8DSQ9RLj82QwpLhjYV7JRp1REoG/+4LFXrU4RuLe66Gbg==
X-Received: by 2002:a2e:a306:0:b0:2b9:e304:5f83 with SMTP id l6-20020a2ea306000000b002b9e3045f83mr548957lje.26.1691124066260;
        Thu, 03 Aug 2023 21:41:06 -0700 (PDT)
Received: from localhost.localdomain ([82.78.167.79])
        by smtp.gmail.com with ESMTPSA id u5-20020a7bc045000000b003fe1cdbc33dsm5707838wmc.9.2023.08.03.21.41.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Aug 2023 21:41:05 -0700 (PDT)
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
Subject: [GIT PULL] AT91 DT updates for 6.6
Date: Fri,  4 Aug 2023 07:41:02 +0300
Message-Id: <20230804044102.231448-1-claudiu.beznea@tuxon.dev>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 06c2afb862f9da8dc5efa4b6076a0e48c3fbaaa5:

  Linux 6.5-rc1 (2023-07-09 13:53:13 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/at91/linux.git tags/at91-dt-6.6

for you to fetch changes up to 2ad41a9872096bf429e9806de01cd6eb50f3af03:

  ARM: dts: at91: remove duplicated entries (2023-08-04 07:18:03 +0300)

----------------------------------------------------------------
AT91 device tree updates for 6.6

It contains:
- TCB timer nodes adition for at91-sama5d3_ksz9477_evb board
- device tee cleanups

----------------------------------------------------------------
Claudiu Beznea (1):
      ARM: dts: at91: remove duplicated entries

Krzysztof Kozlowski (3):
      ARM: dts: microchip: minor whitespace cleanup around '='
      ARM: dts: microchip: add missing space before {
      ARM: dts: microchip: split interrupts per cells

Lukasz Majewski (2):
      ARM: dts: at91: ksz9477_evb: Add missing timer nodes
      ARM: dts: at91: ksz9477_evb: Add tx-internal-delay-ps property for port5

Rob Herring (1):
      ARM: dts: at91-vinco: Fix "status" values

 arch/arm/boot/dts/microchip/Makefile               | 15 +-------
 .../dts/microchip/at91-sama5d3_ksz9477_evb.dts     | 13 +++++++
 arch/arm/boot/dts/microchip/at91-vinco.dts         |  4 +--
 arch/arm/boot/dts/microchip/at91rm9200.dtsi        | 12 +++----
 arch/arm/boot/dts/microchip/at91sam9260.dtsi       | 14 ++++----
 arch/arm/boot/dts/microchip/at91sam9261.dtsi       |  2 +-
 arch/arm/boot/dts/microchip/at91sam9g20ek_2mmc.dts |  2 +-
 arch/arm/boot/dts/microchip/at91sam9g45.dtsi       |  2 +-
 arch/arm/boot/dts/microchip/at91sam9m10g45ek.dts   |  2 +-
 arch/arm/boot/dts/microchip/at91sam9rl.dtsi        |  2 +-
 arch/arm/boot/dts/microchip/at91sam9x5.dtsi        |  2 +-
 arch/arm/boot/dts/microchip/lan966x-pcb8290.dts    |  2 +-
 arch/arm/boot/dts/microchip/sama5d2.dtsi           |  6 ++--
 arch/arm/boot/dts/microchip/sama5d3.dtsi           |  2 +-
 arch/arm/boot/dts/microchip/sama5d4.dtsi           |  2 +-
 arch/arm/boot/dts/microchip/sama7g5.dtsi           | 40 +++++++++++-----------
 16 files changed, 61 insertions(+), 61 deletions(-)
