Return-Path: <SRS0=UM3R=MB=lixom.net=olof@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-21.0 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 612ACC07E99
	for <soc@archiver.kernel.org>; Fri,  9 Jul 2021 23:41:15 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 32A8A613CC; Fri,  9 Jul 2021 23:41:15 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 10BC1613BC
	for <soc@kernel.org>; Fri,  9 Jul 2021 23:41:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 10BC1613BC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lixom.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=olof@lixom.net
Received: by mail-pl1-f180.google.com with SMTP id x16so4958936plg.3
        for <soc@kernel.org>; Fri, 09 Jul 2021 16:41:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lixom-net.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=RLnXv1SzF9qxYYtzOl/+0oOxTrnnAS5mnFYqRGSbmEs=;
        b=yf7zWzdl90KQ0dBCQobubD64v+LVUZPgXIzJlYkegEGZOFaOVUTvzlt5EENlu9dyAz
         TAKxEWNxa94pokBCbTR6LViLwV0byIIRJubHSW+TMsswZJmakqC08hcNaJcFdRMd9uxm
         XBzmjRzEdC+SI/bAqZ2Rg3hJXrfoFkNgSQgWi7XDax2IOtB1GH5cEdjfCo36LHOsYPoe
         coNwawiJo0kpmjKM4oKq7yenhJsqIlCYGbWKYQlYF7omiz3DLkYFza0wUiLTKcjjmaXJ
         SWmI80TXV0P/5Qq0rpLTdd1ChYbI1aRT7R8UKsbUORavnST7G2RGTh6vOFJEKPjiagid
         /IPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=RLnXv1SzF9qxYYtzOl/+0oOxTrnnAS5mnFYqRGSbmEs=;
        b=KbzH8mufgKLjy9XS6ftbkN1jBEzd8jR8n3qdT/9rCcHvMunV3qNEU8cu4VpIBkj/Po
         tG/8jqx1u1auUjpbZytSDL92xtOm5f4m9LqhI/0pnocKt4KCLL3c+l76Fe/ZKuW1EuJl
         aAy36N02Yh22doTpNKzJLEzwcvOGreebVqT7ASslNSW16wc5baFzIW9+MIbakte4+/E1
         SUdMp8ROw76u424Wcevr5FiWVsTHOn9pVMThzkPJEcUt358Ks/qYt+2kRJaDZtwRso7A
         7my37ISrtwP2qT6wWWJB2aTjDdXwX0dfexY5ZT1QtjUJrEUYKW2kqkthIwu8NAqX+kQg
         Lq2w==
X-Gm-Message-State: AOAM532RJ33gv6pp2+6L2nP2hzretguvFOsRfhyukgJQ5Lz7TRfqRhLy
	BuCYGcO0Fy19+4YouIVHxFyyKA==
X-Google-Smtp-Source: ABdhPJwW0ABilQNX+m1kxPMZdzjggEYDwVY0VbKYgTf/UNNUHZV/F+SXBL/oJMVAm5IBOQJ//qgd0A==
X-Received: by 2002:a17:90a:b906:: with SMTP id p6mr1293279pjr.143.1625874074725;
        Fri, 09 Jul 2021 16:41:14 -0700 (PDT)
Received: from lx2k.lixom.net (99-152-116-91.lightspeed.sntcca.sbcglobal.net. [99.152.116.91])
        by smtp.gmail.com with ESMTPSA id n5sm2036381pfv.29.2021.07.09.16.41.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jul 2021 16:41:12 -0700 (PDT)
From: Olof Johansson <olof@lixom.net>
To: torvalds@linux-foundation.org
List-Id: <soc.lore.kernel.org>
Cc: arm@kernel.org,
	soc@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Olof Johansson <olof@lixom.net>
Subject: [GIT PULL 4/4] ARM: Defconfig changes for 5.14
Date: Fri,  9 Jul 2021 16:40:54 -0700
Message-Id: <20210709234054.10288-4-olof@lixom.net>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210709234054.10288-1-olof@lixom.net>
References: <20210709234054.10288-1-olof@lixom.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A set of defconfig changes, we keep them in a separate branch to avoid
conflicts between topics by separating them out. These changes are
almost exclusively turning on new drivers for various platforms, or
turning on modules for new drivers for the shared generic configs.

----------------------------------------------------------------

The following changes since commit 113dd10b4e96dd90a98ed514bc40caa07e4fbc56:

  Merge tag 'arm-dt-5.14' into HEAD

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/arm-defconfig-5.14

for you to fetch changes up to e6adbcb7e2d71b0e0e0deb6f904783aeb79728be:

  Merge tag 'qcom-arm64-defconfig-for-5.14-1' of https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux into arm/defconfig

----------------------------------------------------------------

Adam Ford (1):
      arm64: defconfig: Enable usb2_clksel for R-Car Gen3 and RZ/G2

Adrien Grassein (1):
      arm64: defconfig: Enable LT8912B DRM bridge driver

Alim Akhtar (1):
      arm64: defconfig: Enable Exynos UFS driver

Claudiu Beznea (1):
      ARM: configs: at91_dt_defconfig: configs for sam9x60

Corentin Labbe (2):
      ARM: ixp4xx_defconfig: add CONFIG_SERIAL_OF_PLATFORM
      ARM: ixp4xx_defconfig: add MTD_PHYSMAP

Dmitry Osipenko (1):
      ARM: tegra_defconfig: Enable CONFIG_DEVFREQ_THERMAL

Enric Balletbo i Serra (2):
      arm64: defconfig: Do not override the MTK_PMIC_WRAP symbol
      arm64: defconfig: Allow Mediatek boards to boot from the mmc

Fabio Estevam (1):
      ARM: imx_v6_v7_defconfig: Select the Wifi ath10k sdio driver

Geert Uytterhoeven (1):
      ARM: shmobile: defconfig: Refresh for v5.13-rc1

Joel Stanley (1):
      ARM: config: aspeed: Add DEBUG_FS and EXT4

Lad Prabhakar (1):
      arm64: defconfig: Enable ARCH_R9A07G044

Marek Szyprowski (2):
      ARM: exynos_defconfig: restore framebuffer support
      arm64: defconfig: add drivers needed for DragonBoard410c

Michael Walle (1):
      arm64: defconfig: enable Layerscape EDAC driver

Nobuhiro Iwamatsu (2):
      arm64: defconfig: Visconti: Enable PWM
      arm64: defconfig: Visconti: Enable GPIO

Olof Johansson (11):
      Merge tag 'renesas-arm-defconfig-for-v5.14-tag1' of git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel into arm/defconfig
      Merge tag 'omap-for-v5.14/defconfig-signed' of git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap into arm/defconfig
      Merge tag 'renesas-arm-defconfig-for-v5.14-tag2' of git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel into arm/defconfig
      Merge tag 'v5.13-next-defconfig' of https://git.kernel.org/pub/scm/linux/kernel/git/matthias.bgg/linux into arm/defconfig
      Merge tag 'at91-defconfig-5.14' of git://git.kernel.org/pub/scm/linux/kernel/git/at91/linux into arm/defconfig
      Merge tag 'imx-defconfig-5.14' of git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux into arm/defconfig
      Merge tag 'samsung-defconfig-5.14' of https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux into arm/defconfig
      Merge tag 'qcom-arm64-defconfig-for-5.14' of https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux into arm/defconfig
      Merge tag 'tegra-for-5.14-arm-defconfig' of git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux into arm/defconfig
      Merge tag 'visconti-arm-defconfig-for-v5.14' of https://git.kernel.org/pub/scm/linux/kernel/git/iwamatsu/linux-visconti into arm/defconfig
      Merge tag 'qcom-arm64-defconfig-for-5.14-1' of https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux into arm/defconfig

Sicelo A. Mhlongo (2):
      ARM: omap2plus_defconfig: Add WL1251 and WEXT modules
      ARM: omap2plus_defconfig: Add LP5523 LED driver

Vinod Koul (2):
      arm64: defconfig: qcom: enable interconnect for SM8350
      arm64: defconfig: Enable renesas usb xhci pci host controller


 arch/arm/configs/aspeed_g4_defconfig |  1 +
 arch/arm/configs/aspeed_g5_defconfig |  2 ++
 arch/arm/configs/at91_dt_defconfig   |  2 ++
 arch/arm/configs/exynos_defconfig    |  1 +
 arch/arm/configs/imx_v6_v7_defconfig |  2 ++
 arch/arm/configs/ixp4xx_defconfig    |  3 +++
 arch/arm/configs/omap2plus_defconfig |  5 +++++
 arch/arm/configs/shmobile_defconfig  |  1 -
 arch/arm/configs/tegra_defconfig     |  1 +
 arch/arm64/configs/defconfig         | 17 ++++++++++++++++-
 10 files changed, 33 insertions(+), 2 deletions(-)
