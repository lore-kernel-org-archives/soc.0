Return-Path: <SRS0=hIKJ=6H=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E696C636CC
	for <soc@archiver.kernel.org>; Sat, 11 Feb 2023 11:31:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id F3927C433EF; Sat, 11 Feb 2023 11:31:11 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 35EF3C4339C
	for <soc@kernel.org>; Sat, 11 Feb 2023 11:31:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 35EF3C4339C
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f45.google.com with SMTP id s13-20020a05600c45cd00b003ddca7a2bcbso465820wmo.3
        for <soc@kernel.org>; Sat, 11 Feb 2023 03:31:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uSR8IXziBIMVhSmEufg1SN4JgfbW84fvRPnBN9WPavc=;
        b=llZ1PmrXT6iaZ/VVXG773oV6lIt2qBbjISC1I5Hqo4JFLve1LrZd5wmE9fF9k2U8Ia
         ChNmhncH9r6Sj76ZORUKPHTgWg8cc2EbFPUXXLfIGzH9LPp7hG7cyXIFj+Sq5O6pCte+
         9qRFvftZQTJP6o3LU/NV93/SzEFMuFBs5h1cxuv3j8oL2IfLPEtjpEm8APB1JCYeqKdD
         cD7jhTLBIAA5gASzXSm4uyl7kaegJaTvXACCS7J/0so1T63Gnap5P7nx3+nK3PRL0FNM
         +md7PWH5FIhsKrTFdLENc+NzzvmqKOXhr5IvbuGP43VMnbx3dwJev7AORn1Vmsy68BCR
         Jr1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uSR8IXziBIMVhSmEufg1SN4JgfbW84fvRPnBN9WPavc=;
        b=EiNBOGJObroZEwhe0f2kiSODVtBzFYmAF93QYwmy2QME+xmp2jI8hEBd+q6Al69QDY
         K50mzVFERfZjk/2d1OWU7GsIywVMZoQmyoRvprCcVWPIummTcAePQHszAOrPraDUajJZ
         yW0HkCPaKBIYsgTnwVz+yRQJSSKvAnc8Dr/nGB0PyFxEanSocAkrno0/BVb98KoIPNhn
         awtiTxPn4gtoQiaz/s2973StJ4c8bMa3FoSA5rjuJu+6+kMeZkKIV630u1vzpZifiMpp
         JffEcLPSjci4fR39YTIyWqKUNWPQlVvSCrhvntb8XURxNaSDP54b4u0/VG3+a15dvTg6
         +XqQ==
X-Gm-Message-State: AO0yUKUgZNnB3VpXKvLYdtIG6rcK5lKGQbWbqBFGmwGBqO4tT0tl2Ph8
	Ym1ciSS6sNb6S5Rd45lv2Bn0HQ==
X-Google-Smtp-Source: AK7set/rJMtqF6GRUHR9/M1BvLLThNbbHt3y3RnWKuDtmYwLPRB6rtW0jKn4dtbyQJWbDbQnqPvl3Q==
X-Received: by 2002:a05:600c:2b46:b0:3df:12ac:7cc9 with SMTP id e6-20020a05600c2b4600b003df12ac7cc9mr15122532wmf.15.1676115068397;
        Sat, 11 Feb 2023 03:31:08 -0800 (PST)
Received: from krzk-bin.. ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id l40-20020a05600c1d2800b003dd1b00bd9asm9033559wms.32.2023.02.11.03.31.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Feb 2023 03:31:08 -0800 (PST)
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
	Alim Akhtar <alim.akhtar@samsung.com>,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: [GIT PULL] ARM: dts: samsung: Late DTS for v6.3
Date: Sat, 11 Feb 2023 12:31:03 +0100
Message-Id: <20230211113103.58894-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

Late pull with DTS cleanups and minor fixes for Exynos ARM boards.  I know it
is late in the cycle but:
1. I am really pushing recently towards full DTS compliance with `dtbs_check`
   and I am almost there,
2. All these should be low-risk cleanups or fixes, so I don't expect anything
   broken (previous round of my cleanups affected devfreq/exynos-bus on
   Exynos4412, but this is some weird driver problem which I am still
   investigating).

Best regards,
Krzysztof


The following changes since commit 27be20e3b9d125f2c1b066d1d238c67bf5b89dc3:

  ARM: dts: exynos: add unit address to DWC3 node wrapper in Exynos54xx (2023-01-29 11:34:12 +0100)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-dt-6.3-2

for you to fetch changes up to 301d3dd05525e3a046f6cfa6ee4dea6a3b7111ee:

  ARM: dts: exynos: correct max98090 DAI argument in Snow (2023-02-09 12:58:30 +0100)

----------------------------------------------------------------
Samsung DTS ARM changes for v6.3, part two

Several cleanups pointed out by `make dtbs_check`:
1. Align LED status node name with bindings.
2. Drop redundant properties.
3. Move i2c-gpio node out of soc to top-level, as soc node is expected
   to have only MMIO nodes.
4. Correct SPI NOR flash compatible in SMDK5250 and SMDKv310.
5. Align GPIO property names in WM1811-family codec nodes with bindings.
6. Correct MAX98090 codec DAI cells in Snow.

----------------------------------------------------------------
Krzysztof Kozlowski (10):
      ARM: dts: exynos: align status led name with bindings on Origen4210
      ARM: dts: exynos: drop default status from I2C10 on Arndale
      ARM: dts: exynos: drop redundant address/size cells from I2C10 on Arndale
      ARM: dts: exynos: move I2C10 out of soc node on Arndale
      ARM: dts: exynos: correct SPI nor compatible in SMDKv310
      ARM: dts: exynos: correct SPI nor compatible in SMDK5250
      ARM: dts: exynos: add "gpios" suffix to wlf,ldo1ena on Midas
      ARM: dts: exynos: add "gpios" suffix to wlf,ldo1ena on Arndale
      ARM: dts: s5pv210: add "gpios" suffix to wlf,ldo1ena on Aries
      ARM: dts: exynos: correct max98090 DAI argument in Snow

 arch/arm/boot/dts/exynos4210-origen.dts    |  2 +-
 arch/arm/boot/dts/exynos4210-smdkv310.dts  |  2 +-
 arch/arm/boot/dts/exynos4412-midas.dtsi    |  4 ++--
 arch/arm/boot/dts/exynos5250-arndale.dts   | 35 +++++++++++++-----------------
 arch/arm/boot/dts/exynos5250-smdk5250.dts  |  2 +-
 arch/arm/boot/dts/exynos5250-snow-rev5.dts |  4 ++--
 arch/arm/boot/dts/s5pv210-aries.dtsi       |  4 ++--
 7 files changed, 24 insertions(+), 29 deletions(-)
