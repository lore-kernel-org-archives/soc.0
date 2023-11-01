Return-Path: <SRS0=payE=GO=linaro.org=ulf.hansson@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FC9EC4332F
	for <soc@archiver.kernel.org>; Wed,  1 Nov 2023 11:25:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 4B5FEC433C7; Wed,  1 Nov 2023 11:25:21 +0000 (UTC)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id E6743C433C8
	for <soc@kernel.org>; Wed,  1 Nov 2023 11:25:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org E6743C433C8
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-507bd644a96so9620138e87.3
        for <soc@kernel.org>; Wed, 01 Nov 2023 04:25:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698837918; x=1699442718; darn=kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fTLsGn0av/ptJmCJ6UISKnfoymHQRTy2A0oy+VGOqG4=;
        b=pXWGqkl6j7MNeJHn7dCcux90xrjd4wbJisApEbM2qgHkTmjEefAIR9j9LEPLJp0kcK
         /K+5kL2EJ2+KAWTz6NF5hbMR6Pqdi5yyi5Uwip4opP3XVbErDAzTLaQUbsFRBJzOebA3
         I0qBwsaEYLaxuSoRwpyorEYoYTCkfUeVkiZmF46he7Ry7c73Kg889IZPXmwGPbTxLMLL
         m8kXI5rCiC5PMUR+6Tmbl+NptwZ0jk7wUAVs6u1TPNcoTOwCgQ+qbU0C4COLpYCHcIW9
         LNploDO/y4zyIGL4CwcoJByAVTMHL1rv4RsAdgZ7uyNk7UYmCNMW1n/l53CqaKIcyurK
         bGLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698837918; x=1699442718;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fTLsGn0av/ptJmCJ6UISKnfoymHQRTy2A0oy+VGOqG4=;
        b=FOnUfK8+wNefbz6G0B9CBAEkbeG1q3DjHch6/QSpoksCLpZ5WY/jzp0atzBYRndKDT
         nvg4rpa+NxhAlLMRhRladddpwQrhFuo+TduVEl7Mp+7bb6DoShY6uc7mgQQBllGt7kdy
         48hMvJbcH2Fy76EUnDWCx1/ASx6nF/yiR5D6s0LpFEZhPq89zAIdSM3GLPSLseCXFkbS
         E0gJKcwB9cuEzXmwah8cVJdvaZjzJGw6Kih+l6G09DzTGRJHrOpvTf0O9ewI6lIyty1B
         zWGFO6XAOPM32o1hQ5cbjVsbVGxvrthfhu0e6M9nQNH//xXUf2uvFE76lH2wZn9+FKTx
         lZdw==
X-Gm-Message-State: AOJu0YzcsPl3y2q/DZ48GmIJmr7HzGobwFwK2QlKcX+YHi8/vUDq6nVg
	MNd+NJo2OpRn8xF6h2dF/5Ux8Q==
X-Google-Smtp-Source: AGHT+IEt0cqw0WG0csCOEKOW8isjaA+Q2Oo+yjZZWzoSKz11mj6teGBsW7zTsp3VQwbBCu5UuHs/tg==
X-Received: by 2002:a19:2d45:0:b0:507:9a93:84df with SMTP id t5-20020a192d45000000b005079a9384dfmr10506678lft.25.1698837917926;
        Wed, 01 Nov 2023 04:25:17 -0700 (PDT)
Received: from uffe-tuxpro14.. (h-94-254-63-18.NA.cust.bahnhof.se. [94.254.63.18])
        by smtp.gmail.com with ESMTPSA id f8-20020a0565123b0800b00502e2347ef0sm188744lfv.193.2023.11.01.04.25.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Nov 2023 04:25:17 -0700 (PDT)
From: Ulf Hansson <ulf.hansson@linaro.org>
To: Linus <torvalds@linux-foundation.org>,
	linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org
List-Id: <soc.lore.kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	soc@kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] pmdomain updates for v6.7
Date: Wed,  1 Nov 2023 12:25:16 +0100
Message-Id: <20231101112516.5623-1-ulf.hansson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Linus,

Here's the pull-request with pmdomain updates for v6.7. Details about the
highlights are as usual found in the signed tag.

Please pull this in!

Kind regards
Ulf Hansson


The following changes since commit 767881c470b3140c33795031c4e4d65572731c1c:

  pmdomain: imx: scu-pd: correct DMA2 channel (2023-10-05 00:28:52 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/ulfh/linux-pm.git tags/pmdomain-v6.7

for you to fetch changes up to 9e0cceadb7a5099c637e787191a9adbf9ec424cd:

  pmdomain: Merge branch fixes into next (2023-10-27 11:02:11 +0200)

----------------------------------------------------------------
 - Move Kconfig files into the pmdomain subsystem
 - Drop use of genpd's redundant ->opp_to_performance_state() callback
 - amlogic: Add support for the T7 power-domains controller
 - amlogic: Fix mask for the second NNA mem power-domain
 - bcm: Fixup ASB register read and comparison for bcm2835-power
 - imx: Fix device link problem for consumers of the pgc power-domain
 - mediatek: Add support for the MT8365 power domains
 - qcom: Add support for the rpmhpds for SC8380XP power-domains
 - qcom: Add support for the rpmhpds for SM8650 power-domains
 - qcom: Add support for the rpmhpd clocks for SM7150
 - qcom: Add support for the rpmpds for MSM8917 (families) power-domains
 - starfive: Add support for the JH7110 AON PMU

----------------------------------------------------------------
Abel Vesa (2):
      dt-bindings: power: rpmpd: Add SC8380XP support
      pmdomain: qcom: rpmhpd: Add SC8380XP power domains

Alexandre Bailon (2):
      pmdomain: mediatek: Add support for WAY_EN operations
      pmdomain: mediatek: Add support for MTK_SCPD_STRICT_BUS_PROTECTION cap

Changhuang Liang (6):
      dt-bindings: power: Add power-domain header for JH7110
      pmdomain: starfive: Replace SOC_STARFIVE with ARCH_STARFIVE
      pmdomain: starfive: Extract JH7110 pmu private operations
      pmdomain: starfive: Add JH7110 AON PMU support
      dt-bindings: power: Update prefixes for AON power domain
      pmdomain: starfive: Update prefixes for AON power domain

Danila Tikhonov (2):
      dt-bindings: power: qcom,rpmpd: Add SM7150
      pmdomain: qcom: rpmhpd: Add support for SM7150 rpmh clocks

Fabien Parent (2):
      dt-bindings: power: Add MT8365 power domains
      pmdomain: mediatek: Add support for MT8365

Julia Lawall (1):
      pmdomain: ti: add missing of_node_put

Justin Stitt (1):
      pmdomain: renesas: rmobile-sysc: fix -Wvoid-pointer-to-enum-cast warning

Markus Schneider-Pargmann (4):
      pmdomain: mediatek: Move bools to a flags field
      pmdomain: mediatek: Split bus_prot_mask
      pmdomain: mediatek: Create bus protection operation functions
      pmdomain: mediatek: Unify configuration for infracfg and smi

Maíra Canal (1):
      pmdomain: bcm: bcm2835-power: check if the ASB register is equal to enable

Neil Armstrong (2):
      dt-bindings: power: qcom,rpmpd: document the SM8650 RPMh Power Domains
      pmdomain: qcom: rpmhpd: Add SM8650 RPMh Power Domains

Otto Pflüger (3):
      dt-bindings: power: rpmpd: Add MSM8917, MSM8937 and QM215
      pmdomain: qcom: rpmpd: Add MSM8917 power domains
      pmdomain: qcom: rpmpd: Add QM215 power domains

Pengfei Li (1):
      pmdomain: imx: Make imx pgc power domain also set the fwnode

Rob Herring (2):
      pmdomain: starfive: Explicitly include correct DT includes
      pmdomain: Use device_get_match_data()

Sibi Sankar (1):
      dt-bindings: power: qcom,rpmhpd: Add GMXC PD index

Tomeu Vizoso (1):
      pmdomain: amlogic: Fix mask for the second NNA mem PD domain

Ulf Hansson (28):
      pmdomain: Merge the genpd_dt branch into the next branch
      pmdomain: Prepare to move Kconfig files into the pmdomain subsystem
      pmdomain: actions: Move Kconfig file to the pmdomain subsystem
      pmdomain: amlogic: Move Kconfig options to the pmdomain subsystem
      pmdomain: apple: Move Kconfig option to the pmdomain subsystem
      pmdomain: bcm: Move Kconfig options to the pmdomain subsystem
      pmdomain: imx: Move Kconfig options to the pmdomain subsystem
      pmdomain: mediatek: Move Kconfig options to the pmdomain subsystem
      pmdomain: qcom: Move Kconfig options to the pmdomain subsystem
      pmdomain: renesas: Move Kconfig options to the pmdomain subsystem
      pmdomain: rockchip: Move Kconfig option to the pmdomain subsystem
      pmdomain: samsung: Move Kconfig option to the pmdomain subsystem
      pmdomain: st: Add a Kconfig option for the ux500 power domain
      pmdomain: starfive: Move Kconfig file to the pmdomain subsystem
      pmdomain: sunxi: Move Kconfig option to the pmdomain subsystem
      pmdomain: tegra: Move Kconfig option to the pmdomain subsystem
      pmdomain: ti: Move and add Kconfig options to the pmdomain subsystem
      pmdomain: xilinx: Move Kconfig option to the pmdomain subsystem
      pmdomain: Merge branch genpd_dt into next
      pmdomain: Merge branch genpd_dt into next
      pmdomain: Merge branch fixes into next
      pmdomain: qcom: cpr: Drop the ->opp_to_performance_state() callback
      pmdomain: qcom: rpmpd: Drop the ->opp_to_performance_state() callback
      pmdomain: qcom: rpmhpd: Drop the ->opp_to_performance_state() callback
      pmdomain: Merge branch genpd_dt into next
      pmdomain: Merge branch fixes into next
      pmdomain: Merge branch genpd_dt into next
      pmdomain: Merge branch fixes into next

xianwei.zhao (5):
      dt-bindings: power: add Amlogic T7 power domains
      pmdomain: amlogic: modify some power domains property
      pmdomain: amlogic: add driver to support power parent node
      pmdomain: amlogic: init power domain state
      pmdomain: amlogic: Add support for T7 power domains controller

 .../bindings/power/amlogic,meson-sec-pwrc.yaml     |   3 +-
 .../bindings/power/mediatek,power-controller.yaml  |   6 +
 .../devicetree/bindings/power/qcom,rpmpd.yaml      |  82 +++----
 MAINTAINERS                                        |   6 +-
 drivers/Kconfig                                    |   2 +
 drivers/firmware/imx/Kconfig                       |   6 -
 drivers/pmdomain/Kconfig                           |  21 ++
 drivers/{soc => pmdomain}/actions/Kconfig          |   0
 drivers/pmdomain/actions/owl-sps.c                 |  16 +-
 drivers/pmdomain/amlogic/Kconfig                   |  39 ++++
 drivers/pmdomain/amlogic/meson-ee-pwrc.c           |   2 +-
 drivers/pmdomain/amlogic/meson-secure-pwrc.c       | 127 +++++++++--
 drivers/pmdomain/apple/Kconfig                     |  18 ++
 drivers/pmdomain/bcm/Kconfig                       |  42 ++++
 drivers/pmdomain/bcm/bcm2835-power.c               |   2 +-
 drivers/pmdomain/imx/Kconfig                       |  29 +++
 drivers/pmdomain/imx/gpc.c                         |   8 +-
 drivers/pmdomain/mediatek/Kconfig                  |  29 +++
 drivers/pmdomain/mediatek/mt6795-pm-domains.h      |  16 +-
 drivers/pmdomain/mediatek/mt8167-pm-domains.h      |  20 +-
 drivers/pmdomain/mediatek/mt8173-pm-domains.h      |  16 +-
 drivers/pmdomain/mediatek/mt8183-pm-domains.h      | 125 ++++++-----
 drivers/pmdomain/mediatek/mt8186-pm-domains.h      | 236 ++++++++++++---------
 drivers/pmdomain/mediatek/mt8188-pm-domains.h      | 223 ++++++++++++-------
 drivers/pmdomain/mediatek/mt8192-pm-domains.h      | 112 ++++++----
 drivers/pmdomain/mediatek/mt8195-pm-domains.h      | 199 ++++++++++-------
 drivers/pmdomain/mediatek/mt8365-pm-domains.h      | 197 +++++++++++++++++
 drivers/pmdomain/mediatek/mtk-pm-domains.c         | 157 +++++++++-----
 drivers/pmdomain/mediatek/mtk-pm-domains.h         |  51 +++--
 drivers/pmdomain/qcom/Kconfig                      |  41 ++++
 drivers/pmdomain/qcom/cpr.c                        |   7 -
 drivers/pmdomain/qcom/rpmhpd.c                     |  83 +++++++-
 drivers/pmdomain/qcom/rpmpd.c                      |  98 ++++++++-
 drivers/pmdomain/renesas/Kconfig                   | 109 ++++++++++
 drivers/pmdomain/renesas/rmobile-sysc.c            |   2 +-
 drivers/pmdomain/rockchip/Kconfig                  |  16 ++
 drivers/pmdomain/rockchip/pm-domains.c             |  13 +-
 drivers/pmdomain/samsung/Kconfig                   |   8 +
 drivers/pmdomain/st/Kconfig                        |   5 +
 drivers/pmdomain/st/Makefile                       |   2 +-
 drivers/{soc => pmdomain}/starfive/Kconfig         |   4 +-
 drivers/pmdomain/starfive/jh71xx-pmu.c             | 139 +++++++++---
 drivers/pmdomain/sunxi/Kconfig                     |  10 +
 drivers/pmdomain/tegra/Kconfig                     |   6 +
 drivers/pmdomain/ti/Kconfig                        |  22 ++
 drivers/pmdomain/ti/Makefile                       |   2 +-
 drivers/pmdomain/ti/ti_sci_pm_domains.c            |   8 +-
 drivers/pmdomain/xilinx/Kconfig                    |  10 +
 drivers/soc/Kconfig                                |   2 -
 drivers/soc/amlogic/Kconfig                        |  35 ---
 drivers/soc/apple/Kconfig                          |  13 --
 drivers/soc/bcm/Kconfig                            |  51 -----
 drivers/soc/imx/Kconfig                            |  19 --
 drivers/soc/mediatek/Kconfig                       |  23 --
 drivers/soc/qcom/Kconfig                           |  37 ----
 drivers/soc/renesas/Kconfig                        | 105 ---------
 drivers/soc/rockchip/Kconfig                       |  12 --
 drivers/soc/samsung/Kconfig                        |   4 -
 drivers/soc/sunxi/Kconfig                          |   9 -
 drivers/soc/tegra/Kconfig                          |   5 -
 drivers/soc/ti/Kconfig                             |  12 --
 drivers/soc/xilinx/Kconfig                         |   9 -
 include/dt-bindings/power/amlogic,t7-pwrc.h        |  63 ++++++
 include/dt-bindings/power/mediatek,mt8365-power.h  |  19 ++
 include/dt-bindings/power/qcom,rpmhpd.h            |   2 +
 include/dt-bindings/power/qcom-rpmpd.h             |  21 ++
 include/dt-bindings/power/starfive,jh7110-pmu.h    |   6 +-
 include/linux/soc/mediatek/infracfg.h              |  41 ++++
 68 files changed, 1938 insertions(+), 925 deletions(-)
 create mode 100644 drivers/pmdomain/Kconfig
 rename drivers/{soc => pmdomain}/actions/Kconfig (100%)
 create mode 100644 drivers/pmdomain/amlogic/Kconfig
 create mode 100644 drivers/pmdomain/apple/Kconfig
 create mode 100644 drivers/pmdomain/bcm/Kconfig
 create mode 100644 drivers/pmdomain/imx/Kconfig
 create mode 100644 drivers/pmdomain/mediatek/Kconfig
 create mode 100644 drivers/pmdomain/mediatek/mt8365-pm-domains.h
 create mode 100644 drivers/pmdomain/qcom/Kconfig
 create mode 100644 drivers/pmdomain/renesas/Kconfig
 create mode 100644 drivers/pmdomain/rockchip/Kconfig
 create mode 100644 drivers/pmdomain/samsung/Kconfig
 create mode 100644 drivers/pmdomain/st/Kconfig
 rename drivers/{soc => pmdomain}/starfive/Kconfig (84%)
 create mode 100644 drivers/pmdomain/sunxi/Kconfig
 create mode 100644 drivers/pmdomain/tegra/Kconfig
 create mode 100644 drivers/pmdomain/ti/Kconfig
 create mode 100644 drivers/pmdomain/xilinx/Kconfig
 create mode 100644 include/dt-bindings/power/amlogic,t7-pwrc.h
 create mode 100644 include/dt-bindings/power/mediatek,mt8365-power.h
