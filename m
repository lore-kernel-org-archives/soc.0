Return-Path: <SRS0=GM+A=OC=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DDDEC3065C
	for <soc@archiver.kernel.org>; Tue,  2 Jul 2024 06:54:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 0ED83C4AF11; Tue,  2 Jul 2024 06:54:11 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id EDADBC4AF0A
	for <soc@kernel.org>; Tue,  2 Jul 2024 06:54:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org EDADBC4AF0A
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-42122ac2f38so22560875e9.1
        for <soc@kernel.org>; Mon, 01 Jul 2024 23:54:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719903248; x=1720508048; darn=kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QWaI/qlLVf0rq2AzLp1L2BkFMQdEl1Lem1uDXasq8so=;
        b=OIVGitNYpFMTlfyX4lvMRsmVrt/gcsXlXmFksHMABZ7ZoRH5cHTXEYD6hkFdeMzZp2
         i9kpi5bspxXkvDSnil5ecFV1LaYD8fC/pWA1sDqS2ftZUKITQGWtwKolLWxukvbuPskk
         N+g9M5yG/dqQZrStGlNM2Z3/TcEFBZBlxDaXeWX695NCthjc+QQi4Ot7Ip8f2Uy3WkT9
         LDkch5ioBHOloYd+wQoABz8Huz7OrD7Ba9QTvnEnGhzXnxLnbDMTvNosBWXd9dUt2PLY
         OrgrRrlbGYyEKdA+m9oTPyPKMKfmnsy/zQ4AsXFz2rS8etzTVEaBe298LJP6QMA2JNjB
         vy+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719903248; x=1720508048;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QWaI/qlLVf0rq2AzLp1L2BkFMQdEl1Lem1uDXasq8so=;
        b=mXeHC+mmz10pDPHSPE7mZ52AZOmCF/IOiarSrhO8QrqhF8DxmiRosiOTVxNEvy/2dc
         BHWRa0eF2EKdNITndx2JC1RwAld3Ry6TP3Y3aRIxRlLXWF9eCbS1HCI7k5tDm1aP6rXP
         P4QKj89bWDm+PR1WKtBvuJOPQWcEbp4qiFalOdMni3EvWvFeNy/YLhP/p4tgOMJOuLyX
         QBALzZAtPjwYbsRPK/kBm24nPQTGuDyoKgwdlwfuDwbq/xGdaSJT+j7nmx9xx0u7JSsz
         aCrTxiGE7HGuyV7QA3uRJMWdjMMg7JbQ0PqqCQpyHAnKXE+ARnjtfc4GlGDYvaBPvlli
         tZFA==
X-Forwarded-Encrypted: i=1; AJvYcCU8C8unfjNktFp8a+x94AQbrBKjH5ITnLGh+5bCr4Ftx4lrFHmb7t/b4+q8r1FY6LC6RAzYTOLmchwkX8d7kQ==
X-Gm-Message-State: AOJu0YxgvpjER4p9QBmwvXf9wsO0hBoHAb/UG1NgSdyQRweFFeZc4VwW
	AN522TK/TSB9qwxGQDZ+pC8gMFHyNOYiZF0VW4+0NO9iJ/61EvqyNjjHA3fm2g4=
X-Google-Smtp-Source: AGHT+IH57wRglnyqOE2lDq2ywjfF5VEUaurwyMspF8FM1R0agOZ3qIzCZ4gQRYgXHQV4iMeKULJWeg==
X-Received: by 2002:a05:600c:3595:b0:424:8743:86b4 with SMTP id 5b1f17b1804b1-4256d4d35a7mr90267845e9.6.1719903248197;
        Mon, 01 Jul 2024 23:54:08 -0700 (PDT)
Received: from krzk-bin.. ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4256af55aeasm181446185e9.17.2024.07.01.23.54.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jul 2024 23:54:07 -0700 (PDT)
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
Subject: [GIT PULL] 2/2 ARM: dts: various cleanup for v6.11
Date: Tue,  2 Jul 2024 08:53:58 +0200
Message-ID: <20240702065359.7378-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240702065359.7378-1-krzysztof.kozlowski@linaro.org>
References: <20240702065359.7378-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

Bug report for Aspeed-related user-space on using incorrect sysfs ABI is here:
https://github.com/openbmc/phosphor-state-manager/issues/27

Best regards,
Krzysztof


The following changes since commit 1613e604df0cd359cf2a7fbd9be7a0bcfacfabd0:

  Linux 6.10-rc1 (2024-05-26 15:20:12 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux-dt.git tags/dt-cleanup-6.11

for you to fetch changes up to 90b6de4550aac6ac97448d3d26429a0a55dbaa34:

  ARM: dts: omap am5729-beagleboneai: drop unneeded ti,enable-id-detection (2024-06-26 18:57:21 +0200)

----------------------------------------------------------------
Minor improvements in ARM DTS for v6.11

Few cleanups and improvements which were missed by their maintainers:

1. Add Krzysztof as odd-fixer for old ARM platforms: Alphascale, AXM
   LSI, Moxa, TI Nspire and VT8500 (with Alexey Charkov).

2. VT8500: align node names with bindings (USB, panel timings).

3. Cirrus: align node names with bindings (panel timings).

4. TI Nspire: correct unit addresses, correct watchdog compatible and
   properties while making it disabled (never tested).

5. Nuvoton, Aspeed: align node names with bindings (I2C).

   IMPORTANT: At least for Aspeed it is known to affect some user-space
   tools, because that user-space looks for specific node path via
   /sys/firmware/devicetree. The /sys/firmware/devicetree is not the ABI
   and any user-space relying on it:
    - Prevents any changes in DTS, e.g. node renaming or moving,
      changing unit addresses (re-arranging child bus addressing).
    - Is using undocumented interface.
    - Is neither reliable nor understandable.

6. TI OMAP and Davinci: align node names with bindings (panel timings),
   drop incorrect property.

7. STI: document in bindings codec child to fix dtbs_checks.

----------------------------------------------------------------
Andrew Davis (2):
      ARM: dts: nspire: Add unit name addresses to memory nodes
      ARM: dts: nspire: Add full compatible for watchdog node

Krzysztof Kozlowski (10):
      ARM: dts: vt8500: align panel timings node name with dtschema
      ARM: dts: cirrus: align panel timings node name with dtschema
      MAINTAINERS: ARM: moxa: add Krzysztof Kozlowski as maintainer
      MAINTAINERS: ARM: axm: add Krzysztof Kozlowski as maintainer
      MAINTAINERS: ARM: vt8500: add Alexey and Krzysztof as maintainers
      MAINTAINERS: ARM: nspire: add Krzysztof Kozlowski as maintainer
      MAINTAINERS: ARM: alphascale: add Krzysztof Kozlowski as maintainer
      ARM: dts: ti: align panel timings node name with dtschema
      dt-bindings: soc: sti: st,sti-syscon: document codec node
      ARM: dts: omap am5729-beagleboneai: drop unneeded ti,enable-id-detection

Mohammad Shehar Yaar Tausif (1):
      ARM: dts: vt8500: replace "uhci" nodename with generic name "usb"

Rob Herring (Arm) (2):
      arm: dts: nuvoton: Use standard 'i2c' bus node name
      arm: dts: aspeed: Use standard 'i2c' bus node name

 .../devicetree/bindings/soc/sti/st,sti-syscon.yaml |  9 +++++
 MAINTAINERS                                        | 41 +++++++++++++++++++++-
 arch/arm/boot/dts/aspeed/aspeed-g4.dtsi            | 28 +++++++--------
 arch/arm/boot/dts/aspeed/aspeed-g5.dtsi            | 28 +++++++--------
 arch/arm/boot/dts/aspeed/aspeed-g6.dtsi            | 32 ++++++++---------
 arch/arm/boot/dts/cirrus/ep7211-edb7211.dts        |  2 +-
 arch/arm/boot/dts/nspire/nspire-classic.dtsi       |  2 +-
 arch/arm/boot/dts/nspire/nspire-cx.dts             |  2 +-
 arch/arm/boot/dts/nspire/nspire.dtsi               |  5 ++-
 arch/arm/boot/dts/nuvoton/nuvoton-npcm730-kudo.dts | 22 ++++++------
 .../dts/nuvoton/nuvoton-npcm750-runbmc-olympus.dts | 22 ++++++------
 arch/arm/boot/dts/ti/davinci/da850-evm.dts         |  2 +-
 arch/arm/boot/dts/ti/omap/am335x-guardian.dts      |  2 +-
 arch/arm/boot/dts/ti/omap/am335x-pdu001.dts        |  2 +-
 arch/arm/boot/dts/ti/omap/am335x-pepper.dts        |  2 +-
 arch/arm/boot/dts/ti/omap/am5729-beagleboneai.dts  |  1 -
 arch/arm/boot/dts/vt8500/vt8500-bv07.dts           |  2 +-
 arch/arm/boot/dts/vt8500/vt8500.dtsi               |  2 +-
 arch/arm/boot/dts/vt8500/wm8505-ref.dts            |  2 +-
 arch/arm/boot/dts/vt8500/wm8505.dtsi               |  2 +-
 arch/arm/boot/dts/vt8500/wm8650-mid.dts            |  2 +-
 arch/arm/boot/dts/vt8500/wm8650.dtsi               |  2 +-
 arch/arm/boot/dts/vt8500/wm8750.dtsi               |  4 +--
 arch/arm/boot/dts/vt8500/wm8850-w70v2.dts          |  2 +-
 arch/arm/boot/dts/vt8500/wm8850.dtsi               |  4 +--
 25 files changed, 137 insertions(+), 87 deletions(-)
