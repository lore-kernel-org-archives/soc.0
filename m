Return-Path: <SRS0=XzzO=MB=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-22.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B0BDC07E9C
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Jul 2021 23:43:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0A103613C2
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Jul 2021 23:43:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0A103613C2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lixom.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IMZ0JWV3Pji3X1BNIM9cv/B79VPhykw6G1K6hApwzeg=; b=4X5bpbORzaGNrE
	laGLqL/AnHyphRqOg7+7G2efEb4P2LF70RJh8tmX/Q4eqpWNcLk6/0EgRi5N6BoQi0O2g1cdAnxDR
	KWiaCBI6GXpWIltFEVVuxj2/rexWRzS5KSzfnunOMJDkhu4S9ssTwY5uv2OeBdVK2PldpXKtS3jQ5
	VXyGetuXxLqTPwlkg0SRkUJCSHrngm9jxhB1/TJ3CJXhl05VyqUJk+TPG1ZZQu9kImGYUN/B2Kczr
	Knfc9vKWIvSMizvxSqcxaAvswFPnCLmDm0blZQMp+9Q+fc4BdF+I8iaPy+YtEZhX+oeDGUWw+0Lec
	i7NSfNkfkngR+G0L5SfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m207v-002cmi-PZ; Fri, 09 Jul 2021 23:41:47 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m207P-002ciL-Ft
 for linux-arm-kernel@lists.infradead.org; Fri, 09 Jul 2021 23:41:17 +0000
Received: by mail-pj1-x1029.google.com with SMTP id
 i16-20020a17090acf90b02901736d9d2218so1940753pju.1
 for <linux-arm-kernel@lists.infradead.org>;
 Fri, 09 Jul 2021 16:41:15 -0700 (PDT)
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
 b=d7FUmtQ0dMgocASjmVdk/FuSDphMYElDTQ3sdbTwdRmsX4T2LwrqD4aNBdlFi+t/Xo
 w6hoRpjRbIff4aCZIpbLOomb8I6nAEooCKs5mgSYhxdOSTOYHG8HPv7g7O4Qwy3lPTns
 E0Rz18H3YKlqZ5Wl9DvSF8+de67Ma7CFzwEviUdkeciVVUflOICDUGLTxCcCo07gFDj7
 L7J1bAMWuSJPi2ZZiSIsH3xr+rV4VZoT46NqROFObCGaVZG9tQhF77g4568sM+QqUwIg
 8pB10nEikfCqSq5N6AUVpHIifm3+QB2c4ttN/gKUIt55RTq0jpbdhMT/aXDcWvMTQX90
 z4Vg==
X-Gm-Message-State: AOAM532IA7EFRMGn9aH7zuEbXbzLKCGOW21Xguk/rzq8yS6lRkxY6c8I
 GGkKRl/XGoaUGuRpXGa2wlTCTw==
X-Google-Smtp-Source: ABdhPJwW0ABilQNX+m1kxPMZdzjggEYDwVY0VbKYgTf/UNNUHZV/F+SXBL/oJMVAm5IBOQJ//qgd0A==
X-Received: by 2002:a17:90a:b906:: with SMTP id
 p6mr1293279pjr.143.1625874074725; 
 Fri, 09 Jul 2021 16:41:14 -0700 (PDT)
Received: from lx2k.lixom.net (99-152-116-91.lightspeed.sntcca.sbcglobal.net.
 [99.152.116.91])
 by smtp.gmail.com with ESMTPSA id n5sm2036381pfv.29.2021.07.09.16.41.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Jul 2021 16:41:12 -0700 (PDT)
From: Olof Johansson <olof@lixom.net>
To: torvalds@linux-foundation.org
List-Id: <soc.lore.kernel.org>
Cc: arm@kernel.org, soc@kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Olof Johansson <olof@lixom.net>
Subject: [GIT PULL 4/4] ARM: Defconfig changes for 5.14
Date: Fri,  9 Jul 2021 16:40:54 -0700
Message-ID: <20210709234054.10288-4-olof@lixom.net>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210709234054.10288-1-olof@lixom.net>
References: <20210709234054.10288-1-olof@lixom.net>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210709_164115_579499_E86388B5 
X-CRM114-Status: GOOD (  13.16  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210709234054.niPNEj1-cHCUi3GNu3Ljp8jBkvCgpepeHDITF4YDdlo@z>

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

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
