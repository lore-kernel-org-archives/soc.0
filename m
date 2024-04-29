Return-Path: <SRS0=cisp=MC=tuxon.dev=claudiu.beznea@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEC40C4345F
	for <soc@archiver.kernel.org>; Mon, 29 Apr 2024 12:14:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id A9B70C4AF1B; Mon, 29 Apr 2024 12:14:34 +0000 (UTC)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 6237DC113CD
	for <soc@kernel.org>; Mon, 29 Apr 2024 12:14:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 6237DC113CD
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-572669fd9f9so2976315a12.0
        for <soc@kernel.org>; Mon, 29 Apr 2024 05:14:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1714392871; x=1714997671; darn=kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rnru7AQeB5sDVzbfKURylOzsCBelpYug0+PLC4dQZ8w=;
        b=Kywn8GmtVVPbNirR+trVT9mcNxLl+9zzdf3DpNjbdksLfeHkxsePZPPnHAQH4l3OX0
         lJ8ag35vdB4etclyht7ibO1s8khm0S+YPNWXreXIDQ3zuS0WPiHoqzHbIifRuFTE/ZNL
         PVwXLqwvlIcCpOGu7kpQICK2ZE76MLvFVxdutkzwu7vBgwRevpahG6QTVPfqdbSrTcqC
         A5jcYHH2xQ162tJ+U0hbh2Nr38By1G1MTesNZRq5mqLUVCfbVQtk9ehKOWWjsppqYnT4
         cc/6TXg8vC8LlrNmSoTgGU2zXPOcNAukoRRqTx0PzUOvObARc8Jk72O0UP4GVxV86gjO
         ZmYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714392871; x=1714997671;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rnru7AQeB5sDVzbfKURylOzsCBelpYug0+PLC4dQZ8w=;
        b=ohetGK/1wg0oslFM0QWdJnH1mWT4sIhd61a+wnLYTXNPOvbdnsSE/9AcO7/w+RgeKZ
         z7UOw24+q1fiDgcvu+jLZTxVkfIwbxBAQDSemyjahLvZPJyJSqsr+BAmFWIrNlXH4mYY
         JUokYiyEBOSsBmt4i5CB+AtfnNVfDmo2461wDLnzQsOyAIuIa06ofDJtebW0vSF0cwmV
         PIscIlGhFUBvpjitlMJ7l+BTfRaX2YnSNFXVPaDDcmNMUiQvpJ/XakPGOY66SZN02JhP
         zhIB48UxH23A4F91dYIbhfpuxDIz9HTNlNKIzBnLo9VS30s9KRQkvB9DpCa95+MaVikZ
         cWrQ==
X-Forwarded-Encrypted: i=1; AJvYcCVIr3CDm9vID/WWVU3UTzUCVFTQ23GY7YjwYS/p0EiiTa3ZMtzKm0f1hHNAh9VrP16KibG8ZuJX3KrQW6bZWg==
X-Gm-Message-State: AOJu0YzRFPv+c4RSFto9fUt5ZtW43tpMVZwXkAYWtzoGd/FzA8mlnb13
	2T7zhiQ5o9hp6kiPZxZKrgB6OovuWPcFMIdgz3//ycHfUn9JT9jqE+WlWox6FbM=
X-Google-Smtp-Source: AGHT+IHIsTLT7TuHiaBj2TLx6gySvXE9mcKLUn9ubEsypGvBfIuYOvwweRwuK9ZZg4X1TGt9xAWbXQ==
X-Received: by 2002:a17:906:1345:b0:a4e:cd5c:da72 with SMTP id x5-20020a170906134500b00a4ecd5cda72mr6800379ejb.63.1714392871302;
        Mon, 29 Apr 2024 05:14:31 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.53])
        by smtp.gmail.com with ESMTPSA id d3-20020a170906640300b00a58ca8e88c2sm4074004ejm.15.2024.04.29.05.14.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Apr 2024 05:14:30 -0700 (PDT)
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
List-Id: <soc.lore.kernel.org>
To: arnd@arndb.de,
	olof@lixom.net,
	arm@kernel.org,
	soc@kernel.org
Cc: nicolas.ferre@microchip.com,
	linux-arm-kernel@lists.infradead.org,
	conor@kernel.org,
	claudiu.beznea@tuxon.dev
Subject: [GIT PULL] Microchip ARM64 DT updates for v6.10
Date: Mon, 29 Apr 2024 15:14:29 +0300
Message-Id: <20240429121429.1941241-1-claudiu.beznea@tuxon.dev>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 4cece764965020c22cff7665b18a012006359095:

  Linux 6.9-rc1 (2024-03-24 14:10:05 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/at91/linux.git tags/microchip-dt64-6.10

for you to fetch changes up to 6c7c4b91aa43543c9f967120a6eabd451a0927d4:

  arm64: dts: microchip: sparx5_pcb135: drop duplicated NOR flash (2024-04-08 16:56:30 +0100)

----------------------------------------------------------------
Microchip ARM64 device tree updates for v6.10

It contains:
- dtbs_check and dtc W=1 warning fixes
- mdio2 and serdes address fixes for sparx5

----------------------------------------------------------------
Krzysztof Kozlowski (10):
      arm64: dts: microchip: sparx5: fix mdio reg
      arm64: dts: microchip: sparx5: correct serdes unit address
      arm64: dts: microchip: sparx5_pcb134: add missing I2C mux unit addresses
      arm64: dts: microchip: sparx5_pcb135: add missing I2C mux unit addresses
      arm64: dts: microchip: sparx5_pcb134: align I2C mux node name with bindings
      arm64: dts: microchip: sparx5_pcb135: align I2C mux node name with bindings
      arm64: dts: microchip: sparx5_pcb134: drop LED unit addresses
      arm64: dts: microchip: sparx5_pcb135: drop LED unit addresses
      arm64: dts: microchip: sparx5_pcb134: drop duplicated NOR flash
      arm64: dts: microchip: sparx5_pcb135: drop duplicated NOR flash

 arch/arm64/boot/dts/microchip/sparx5.dtsi          |   4 +-
 .../boot/dts/microchip/sparx5_pcb134_board.dtsi    | 149 ++++++++++-----------
 .../boot/dts/microchip/sparx5_pcb135_board.dtsi    |  35 ++---
 3 files changed, 85 insertions(+), 103 deletions(-)
