Return-Path: <SRS0=v0mk=BG=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0530C77B75
	for <soc@archiver.kernel.org>; Wed, 17 May 2023 13:13:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 805C6C433EF; Wed, 17 May 2023 13:13:08 +0000 (UTC)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id B1F74C4339B
	for <soc@kernel.org>; Wed, 17 May 2023 13:13:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org B1F74C4339B
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-96652cb7673so114851766b.0
        for <soc@kernel.org>; Wed, 17 May 2023 06:13:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684329185; x=1686921185;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IkIVFj4R5Q+55a1je0LcDz57182aKaTQ7taUpc1g5Fw=;
        b=wXQFPuEw70b2+bXUVsYgNP0/1Dn8YFk/Q/HjvBi9uDmSKbij6FIQWShVu5d16LMfTR
         ErnCY1WVDNcWEuSWfRfW05nDGd4fVC9sw8Kf3unBB58rKWX23MCevz4V6tirWmIvjwUg
         afpghlDIPJJZhdysxT3UAqXUj/G8Rd53QtIMpFpYDsjfJ7ZttFv2fFNx5QZM3xmddHRN
         M+nS5u62yleBce4GjlQL/ry9wq9vdxEiUd4eMVgeBBOeBM/cmDzX0qiibPgtNolNfnU8
         Ksn3TFnGNVjjnV3Zo48pq1cY4yvWZJqlcP8x5QwAA/T68RvjxYJyNd86gLjWNozW+WhW
         LRog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684329185; x=1686921185;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IkIVFj4R5Q+55a1je0LcDz57182aKaTQ7taUpc1g5Fw=;
        b=lucIDTcPtwKl1WEuF0T+KvM+teUInfRl1fiJhewTiOcegm8yIfbnsU84cx+XpesSuS
         E13O5xX7wyOi3ZVKJJHRra842btVjlMMCyuAwO+72aSsJn2r4najfBMfLbxUZY14gI8j
         9pKtmQWd5HbvXgQWS+bB1Wf1YB9JSilHT5HXX8UIQj6p/1Fd47vzxux5vgt6/CUV1qaz
         2TZmsaTTFPlRWTGVWCu0igqnB72WsMzD5hRn5SHKkxJ0uMY+rSjn5r3OcFOH5XfdDLKj
         9IirFcCeIyNEAHP0ZtOWmnnkjuah2E6QOovoZPYMpWTd30Fb/Aj6N3Guacy3PCN+Bxr8
         dGbg==
X-Gm-Message-State: AC+VfDzgD7oMiwZcdGlB9+tfQk8H+CR6w7ubQ5A9OjGHJb8d8b2GX/vy
	IeMwQmr/bCKAb6AnmCPcB/8xwA==
X-Google-Smtp-Source: ACHHUZ4VW+5Xqgt7SOM2d9kyGd2bMdASGdzmtGWMx6Czs6SkbiJzsQKBgir8aNyg+gNbGiHeMQVChw==
X-Received: by 2002:a17:907:9488:b0:96a:a0fd:d43e with SMTP id dm8-20020a170907948800b0096aa0fdd43emr17519873ejc.49.1684329184900;
        Wed, 17 May 2023 06:13:04 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:c9ff:4c84:dd21:568d])
        by smtp.gmail.com with ESMTPSA id hs32-20020a1709073ea000b009534211cc97sm12291184ejc.159.2023.05.17.06.13.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 May 2023 06:13:04 -0700 (PDT)
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
	Krzysztof Kozlowski <krzk@kernel.org>,
	Lars Povlsen <lars.povlsen@microchip.com>,
	Steen Hegelund <Steen.Hegelund@microchip.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Daniel Machon <daniel.machon@microchip.com>,
	UNGLinuxDriver@microchip.com
Subject: [GIT PULL 1/2] arm64: dts: cleanup and fixes for v6.5
Date: Wed, 17 May 2023 15:12:54 +0200
Message-Id: <20230517131255.471002-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

Few usual cleanups from me and few other fixes/cleanups from Michael
and Robert. To clarify - I don't want to step on someone's toes, so
me picking up other patches is rather exception. It's just sad when
someone's work gets lost.

There is ongoing discussion how to improve a bit Microchip ARM64 SparX-5 patch
handling process, so the contributions won't get lost.

Best regards,
Krzysztof


The following changes since commit ac9a78681b921877518763ba0e89202254349d1b:

  Linux 6.4-rc1 (2023-05-07 13:34:35 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux-dt.git tags/dt64-cleanup-6.5

for you to fetch changes up to d5e64404e77c19ec5bd687b34a11eec0263f1aa8:

  arm64: dts: sparx5: rename pinctrl nodes (2023-05-17 14:16:13 +0200)

----------------------------------------------------------------
Minor improvements in ARM64 DTS for v6.5

Mostly minor improvements to fix dtbs_check warnings:
1. mba6ulx: use non-deprecated property for GPIO keys wake-up,
2. Add missing cache properties (APM, Amazon, HiSilicon, Realtek,
   Synaptics, AllWinner, Microchip).

Few older minor and major fixes which were waiting on mailing lists for
longer time for Microchip SparX-5:
1. Fix secondary CPU bring-up and crash when talking to PSCI on reference
   boards (Robert Marko),
2. Simplify CPU address-cells (Robert Marko),
3. Align pinctrl node names with bindings (Michael Walle).

----------------------------------------------------------------
Krzysztof Kozlowski (8):
      arm64: dts: mba6ulx: correct GPIO keys wakeup
      arm64: dts: apm: add missing cache properties
      arm64: dts: amazon: add missing cache properties
      arm64: dts: hisilicon: add missing cache properties
      arm64: dts: realtek: add missing cache properties
      arm64: dts: synaptics: add missing cache properties
      arm64: dts: allwinner: a64: add missing cache properties
      arm64: dts: microchip: add missing cache properties

Michael Walle (1):
      arm64: dts: sparx5: rename pinctrl nodes

Robert Marko (2):
      arm64: dts: microchip: sparx5: do not use PSCI on reference boards
      arm64: dts: microchip: sparx5: correct CPU address-cells

 arch/arm/boot/dts/mba6ulx.dtsi                     |  2 +-
 arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi      |  1 +
 arch/arm64/boot/dts/amazon/alpine-v3.dtsi          |  4 ++++
 arch/arm64/boot/dts/apm/apm-shadowcat.dtsi         |  8 +++++++
 arch/arm64/boot/dts/apm/apm-storm.dtsi             |  8 +++++++
 arch/arm64/boot/dts/hisilicon/hi3660.dtsi          |  2 ++
 arch/arm64/boot/dts/hisilicon/hi6220.dtsi          |  2 ++
 arch/arm64/boot/dts/hisilicon/hip05.dtsi           |  4 ++++
 arch/arm64/boot/dts/hisilicon/hip06.dtsi           |  4 ++++
 arch/arm64/boot/dts/hisilicon/hip07.dtsi           | 16 +++++++++++++
 arch/arm64/boot/dts/microchip/sparx5.dtsi          | 10 +++++----
 .../boot/dts/microchip/sparx5_pcb134_board.dtsi    | 26 +++++++++++-----------
 .../boot/dts/microchip/sparx5_pcb135_board.dtsi    | 10 ++++-----
 .../boot/dts/microchip/sparx5_pcb_common.dtsi      | 12 ++++++++++
 arch/arm64/boot/dts/realtek/rtd1293.dtsi           |  2 ++
 arch/arm64/boot/dts/realtek/rtd1295.dtsi           |  2 ++
 arch/arm64/boot/dts/realtek/rtd1296.dtsi           |  2 ++
 arch/arm64/boot/dts/realtek/rtd1395.dtsi           |  2 ++
 arch/arm64/boot/dts/realtek/rtd16xx.dtsi           |  4 ++++
 arch/arm64/boot/dts/synaptics/berlin4ct.dtsi       |  2 ++
 20 files changed, 100 insertions(+), 23 deletions(-)
