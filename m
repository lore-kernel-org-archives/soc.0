Return-Path: <SRS0=dLfn=4C=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43639C4332F
	for <soc@archiver.kernel.org>; Sun,  4 Dec 2022 08:29:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id EA48BC433B5; Sun,  4 Dec 2022 08:29:18 +0000 (UTC)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id B780FC433C1
	for <soc@kernel.org>; Sun,  4 Dec 2022 08:29:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org B780FC433C1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f48.google.com with SMTP id f21so13161146lfm.9
        for <soc@kernel.org>; Sun, 04 Dec 2022 00:29:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uB/aOmhuc/lIwYa7cjtgI3/zSgF7chfDnm9pJPWT000=;
        b=iWiyVLtGi+CbjSF3LefwU1h8UF6+xG8GaHHWyRoXaPJmF7N1pZIAL5u97lRhUtIETH
         096bcKYKVHLB+uon57U77rW4WSFUh43v69WmCgJJuKpLqNOk+JMDYcxvW94RCyPnMbGV
         IIENM/TiLaUonKsZ5v9eyvZ+QjPuGKaBRw45sylDdZmBriSEEvCqIE/nu2Bsh6f5hyc6
         UY+aaHKkhujaNVpvz6ORFwrOxlo3JuDyob5T7Z1fZZDne40tpfh0UkqQ/1+7EwecBfkT
         fzZCqzDOa/scUYHWhkSkVbmHIF/k6ln1uH5DdzqE7zG8xFJmQm9TA8XLr1MnPl57Ftzq
         e3VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uB/aOmhuc/lIwYa7cjtgI3/zSgF7chfDnm9pJPWT000=;
        b=aZoBNCTFiL/vj2gyvSX4DvnMKCW7f6ltaOmgdxDV7DYnuiRPHuda1qGZov5BHEkYPl
         nfapkuKJDn1+BnRkO9fCSCxQtQuDaRLlUMRNPlVOcF6PiVw4lmHMaE3N6Un0m2CtKjO7
         vsE64Zd80YLRw9Hur1Flhnla4C8tknpVSubBOJSXyp87cjK4hBZRDTgYpSCFXm56FOg7
         xIF5DKZ3Q5rSZqeGRq8pwMXXrQzMi1x7lbycttfvrkFXEiPOQTUHcDrBv24Q8MJ5a9Ay
         S6AjwDcCwLE90mZqfBxZ2bvJ70mSXSHjR+D3mQdgG4Kb4z1nlXg2p/GF55v2CHanvaki
         F3hQ==
X-Gm-Message-State: ANoB5pnVeGV0BoNkSm5jB+STdP8S96p0M8J2fUjG7lEU3sHzRPs75fC7
	9g7cjWH/ufqdJxRxRkz7d6oAbg==
X-Google-Smtp-Source: AA0mqf40k/EVXZZA+iO1Hh7riI/DoSG3qM6w+9oRN7gdip/swv1D8iq3Ax6N/AL/gcGi3aarmuZA+g==
X-Received: by 2002:a05:6512:3133:b0:4a4:7f36:c62e with SMTP id p19-20020a056512313300b004a47f36c62emr24828258lfd.389.1670142555788;
        Sun, 04 Dec 2022 00:29:15 -0800 (PST)
Received: from krzk-bin.NAT.warszawa.vectranet.pl (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id z8-20020a056512370800b004a91d1b3070sm1694540lfr.308.2022.12.04.00.29.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Dec 2022 00:29:15 -0800 (PST)
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
Subject: [GIT PULL] ARM: dts: Second cleanup for v6.2
Date: Sun,  4 Dec 2022 09:29:09 +0100
Message-Id: <20221204082909.5649-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

I had few remaining cleanup patches for ARM DTS.  The imx and lpc32xx one did
not get maintainer acks, but the rest got.

On top of previous pull request / tag.

Best regards,
Krzysztof


The following changes since commit 001b38cea30961e0f4e562a1872f2409a8024ff0:

  dt-bindings: arm: aspeed: adjust qcom,dc-scm-v1-bmc compatible after rename (2022-11-10 10:18:49 +0100)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux-dt.git tags/dt-cleanup-6.2-2

for you to fetch changes up to 91bf30a42b16257f98345c9ba519d72babbbaf8a:

  ARM: dts: sti: align LED node names with dtschema (2022-12-01 18:04:47 +0100)

----------------------------------------------------------------
Minor improvements in ARM DTS for v6.2, part two

Few cleanups which should not have any functional impact:
1. Trim addresses in "reg" to 8 digits.
2. Align LED node names with dtschema.
3. omap: echo: Use preferred enable-gpios property for LP5523 LED.

----------------------------------------------------------------
Krzysztof Kozlowski (8):
      ARM: dts: omap: trim addresses to 8 digits
      ARM: dts: imx: trim addresses to 8 digits
      ARM: dts: lpc32xx: trim addresses to 8 digits
      ARM: dts: logicpd: align LED node names with dtschema
      ARM: dts: omap: align LED node names with dtschema
      ARM: dts: omap: echo: use preferred enable-gpios for LP5523 LED
      ARM: dts: am335x: align LED node names with dtschema
      ARM: dts: sti: align LED node names with dtschema

 arch/arm/boot/dts/am335x-baltos-leds.dtsi            | 6 +++---
 arch/arm/boot/dts/am335x-evm.dts                     | 2 +-
 arch/arm/boot/dts/am335x-igep0033.dtsi               | 4 ++--
 arch/arm/boot/dts/am335x-pocketbeagle.dts            | 8 ++++----
 arch/arm/boot/dts/am437x-idk-evm.dts                 | 2 +-
 arch/arm/boot/dts/am437x-sk-evm.dts                  | 2 +-
 arch/arm/boot/dts/am43x-epos-evm.dts                 | 2 +-
 arch/arm/boot/dts/am57xx-idk-common.dtsi             | 2 +-
 arch/arm/boot/dts/dra7-evm-common.dtsi               | 2 +-
 arch/arm/boot/dts/dra7-evm.dts                       | 2 +-
 arch/arm/boot/dts/dra72-evm-common.dtsi              | 4 ++--
 arch/arm/boot/dts/imx6sx.dtsi                        | 2 +-
 arch/arm/boot/dts/logicpd-torpedo-som.dtsi           | 2 +-
 arch/arm/boot/dts/lpc32xx.dtsi                       | 2 +-
 arch/arm/boot/dts/omap3-beagle.dts                   | 6 +++---
 arch/arm/boot/dts/omap3-devkit8000-common.dtsi       | 8 ++++----
 arch/arm/boot/dts/omap3-echo.dts                     | 2 +-
 arch/arm/boot/dts/omap3-n900.dts                     | 2 +-
 arch/arm/boot/dts/omap3-overo-alto35-common.dtsi     | 8 ++++----
 arch/arm/boot/dts/omap3-overo-chestnut43-common.dtsi | 4 ++--
 arch/arm/boot/dts/omap3-overo-gallop43-common.dtsi   | 4 ++--
 arch/arm/boot/dts/omap3-overo-palo35-common.dtsi     | 4 ++--
 arch/arm/boot/dts/omap3-overo-palo43-common.dtsi     | 4 ++--
 arch/arm/boot/dts/omap3-overo-summit-common.dtsi     | 2 +-
 arch/arm/boot/dts/omap3-overo-tobi-common.dtsi       | 2 +-
 arch/arm/boot/dts/omap4-panda-common.dtsi            | 4 ++--
 arch/arm/boot/dts/omap4-panda-es.dts                 | 4 ++--
 arch/arm/boot/dts/stih410-b2260.dts                  | 8 ++++----
 arch/arm/boot/dts/stih418-b2199.dts                  | 4 ++--
 arch/arm/boot/dts/stih418-b2264.dts                  | 2 +-
 arch/arm/boot/dts/stihxxx-b2120.dtsi                 | 4 ++--
 31 files changed, 57 insertions(+), 57 deletions(-)
