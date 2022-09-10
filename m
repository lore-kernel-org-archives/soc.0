Return-Path: <SRS0=3mQs=ZN=sntech.de=heiko@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B7ABC6FA86
	for <soc@archiver.kernel.org>; Sat, 10 Sep 2022 01:22:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 2DA49C433D6; Sat, 10 Sep 2022 01:22:47 +0000 (UTC)
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 12576C433C1;
	Sat, 10 Sep 2022 01:22:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 12576C433C1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=sntech.de
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88] helo=phil.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1oWpCj-0001A3-OZ; Sat, 10 Sep 2022 03:22:41 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: arm@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org, linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] Rockchip driver changes for 6.1 #1
Date: Sat, 10 Sep 2022 03:22:41 +0200
Message-ID: <2252399.ElGaqSPkdT@phil>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

The following changes since commit 1c23f9e627a7b412978b4e852793c5e3c3efc555:

  Linux 6.0-rc2 (2022-08-21 17:32:54 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git tags/v6.1-rockchip-drivers1

for you to fetch changes up to 6541b424ce1dda616d3946e839f015c984df7a99:

  soc: rockchip: power-domain: add power domain support for rk3588 (2022-09-09 19:06:41 +0200)

----------------------------------------------------------------
Powerdomain drivers for rv1126 and rk3588 socs, keep current state of
power-domains instead of always enabling when adding them, add rv1126
io domains and add binding for another "general register files" syscon.

----------------------------------------------------------------
Elaine Zhang (1):
      soc: rockchip: power-domain: do not enable domain when adding it

Finley Xiao (2):
      dt-bindings: power: add power-domain header for rk3588
      soc: rockchip: power-domain: add power domain support for rk3588

Frank Wunderlich (1):
      dt-bindings: soc: grf: add pcie30-{phy,pipe}-grf

Heiko Stuebner (2):
      Merge branch 'v6.1-shared/powerdomain' into v6.1-armsoc/drivers
      Merge branch 'v6.1-shared/powerdomain' into v6.1-armsoc/drivers

Jagan Teki (4):
      dt-bindings: power: Add power-domain header for RV1126
      dt-bindings: power: rockchip: Document RV1126 power-controller
      soc: rockchip: power-domain: Add RV1126 power domains
      dt-bindings: power: rockchip: Document RV1126 PMU IO domains

Jianqun Xu (1):
      soc: rockchip: io-domain: Add RV1126 IO domains

Sebastian Reichel (2):
      dt-bindings: arm: rockchip: add rk5388 compatible string to pmu.yaml
      dt-bindings: power: rockchip: Add bindings for rk3588

 .../devicetree/bindings/arm/rockchip/pmu.yaml      |   2 +
 .../bindings/power/rockchip,power-controller.yaml  |   4 +
 .../bindings/power/rockchip-io-domain.yaml         |  30 +++++
 .../devicetree/bindings/soc/rockchip/grf.yaml      |   3 +
 drivers/soc/rockchip/io-domain.c                   |  20 ++++
 drivers/soc/rockchip/pm_domains.c                  | 130 ++++++++++++++++++---
 include/dt-bindings/power/rk3588-power.h           |  69 +++++++++++
 include/dt-bindings/power/rockchip,rv1126-power.h  |  35 ++++++
 8 files changed, 280 insertions(+), 13 deletions(-)
 create mode 100644 include/dt-bindings/power/rk3588-power.h
 create mode 100644 include/dt-bindings/power/rockchip,rv1126-power.h



