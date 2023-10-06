Return-Path: <SRS0=u+Dz=FU=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CA0DE92FFD
	for <soc@archiver.kernel.org>; Fri,  6 Oct 2023 09:28:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 31BB5C43397; Fri,  6 Oct 2023 09:28:31 +0000 (UTC)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id EEE20C433D9
	for <soc@kernel.org>; Fri,  6 Oct 2023 09:28:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org EEE20C433D9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-99bdcade7fbso332931666b.1
        for <soc@kernel.org>; Fri, 06 Oct 2023 02:28:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696584508; x=1697189308; darn=kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8bSbH7Mb5GSQSJoLnedL80ZckH8kE8PXIhbQkOYsiAY=;
        b=ngNPjWVpo6mTSPCYQgrP3jsWen3AHR23/Id2f+JIDMhQlW8SM3HHc461L4079WAuJY
         zmTVEgy3YNPMceBaM/q3rF+v8HVOECTggLwbXgZ6Y5y+vs9096KplCRuMEQn1rbkdqap
         2T3edDH8KcBANgEzOZZBsT61MaHWazRQni4PWCnm9gBlEUTG5TEWS06wZ6UDNaZb4UiH
         hdS2LvVpqMOb1nx0BD7OQzSYlBD3LS3hAriVUvUvUkjmOFaDg5LNCA+E3Mj/sM/dwU3E
         d66d3yhNtpW7h+2bTeTWOK6+CFzwdUhjVF3585Q+N2tLxLVghScsTHbtqD8i9CCfFfzg
         wS+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696584508; x=1697189308;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8bSbH7Mb5GSQSJoLnedL80ZckH8kE8PXIhbQkOYsiAY=;
        b=xLAJaXjBwysmqHgqJF6kgxrmZwS+nVCaA2Jx/kKEFYqZ4fIlBi8EOOLIiBZEPPPmiR
         V71y4z953i4qrMSaW/1zfzYDZvNbAiDd6qAzliAhuo0yWlwPKVdsnnbzEIxGO0l5/hnB
         cbYJC9fZXTiIEtACkk+BKzzLEuSqjnuhvaUbGP8GIj0l6INs3wymCpo6DFcTmkAcOU12
         gRmoHzkAdob47IKsxMYO0pPIH65wvUQLpQFyOgGbFOhfRUg7DtUIHyCj2PtEWYLXXXf9
         qhUJHrR8yUGpsxIlBhL9CRqPuUgXjCZH0UVWFFXp8f/xYmzvQmTWlXUvTcLVFHM1qiYy
         XBBw==
X-Gm-Message-State: AOJu0YyfB4UMPZ6KnDnQlWLbusd6vwIDpUK4/eeQ01SImi256oROcFk2
	gBtEUd9O41E9rn07GDb2WMPJhg==
X-Google-Smtp-Source: AGHT+IEWs2nqngYhYzn5PhBtTkMncovhJGe77kZVyEsxhmq2G52pUMuisPqS3lS0pHUT7j2+rUcvfQ==
X-Received: by 2002:a17:906:3f04:b0:9ae:5568:b6a8 with SMTP id c4-20020a1709063f0400b009ae5568b6a8mr7480532ejj.10.1696584508014;
        Fri, 06 Oct 2023 02:28:28 -0700 (PDT)
Received: from krzk-bin.. (5-157-101-10.dyn.eolo.it. [5.157.101.10])
        by smtp.gmail.com with ESMTPSA id u25-20020a1709063b9900b0099bc2d1429csm2573006ejf.72.2023.10.06.02.28.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Oct 2023 02:28:27 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
To: Olof Johansson <olof@lixom.net>,
	Arnd Bergmann <arnd@arndb.de>,
	arm@kernel.org,
	soc@kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: [GIT PULL 2/2] ARM: dts: minor cleanup for v6.7
Date: Fri,  6 Oct 2023 11:28:23 +0200
Message-Id: <20231006092823.94839-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231006092823.94839-1-krzysztof.kozlowski@linaro.org>
References: <20231006092823.94839-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 0bb80ecc33a8fb5a682236443c1e740d5c917d1d:

  Linux 6.6-rc1 (2023-09-10 16:28:41 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux-dt.git tags/dt-cleanup-6.7

for you to fetch changes up to 73f20a373811b303fc5bd8f3d5a4c5c1582f1ba2:

  ARM: dts: nuvoton: add missing space before { (2023-09-24 20:56:01 +0200)

----------------------------------------------------------------
Minor improvements in ARM DTS for v6.7

Few cleanups and improvements: split joined reg entries for Ethernet in
omap3-devkit8000, add missing spaces before '{' (MediaTek, Nuvoton) and
cleanup whitespace around '=' (MediaTek).

----------------------------------------------------------------
Krzysztof Kozlowski (4):
      ARM: dts: omap3-devkit8000: correct ethernet reg addresses (split)
      ARM: dts: mediatek: add missing space before {
      ARM: dts: mediatek: minor whitespace cleanup around '='
      ARM: dts: nuvoton: add missing space before {

 arch/arm/boot/dts/mediatek/mt2701-evb.dts          |  2 +-
 arch/arm/boot/dts/mediatek/mt6323.dtsi             | 58 +++++++++++-----------
 arch/arm/boot/dts/mediatek/mt7623n.dtsi            |  4 +-
 arch/arm/boot/dts/mediatek/mt7629-rfb.dts          |  2 +-
 arch/arm/boot/dts/nuvoton/nuvoton-npcm730-gsj.dts  |  4 +-
 arch/arm/boot/dts/nuvoton/nuvoton-npcm730-kudo.dts |  2 +-
 .../dts/nuvoton/nuvoton-npcm750-runbmc-olympus.dts |  4 +-
 .../boot/dts/ti/omap/omap3-devkit8000-common.dtsi  |  4 +-
 8 files changed, 40 insertions(+), 40 deletions(-)
