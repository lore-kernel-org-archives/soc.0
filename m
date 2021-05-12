Return-Path: <SRS0=7r4F=KH=pengutronix.de=p.zabel@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84D3BC433B4
	for <soc@archiver.kernel.org>; Wed, 12 May 2021 13:38:43 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 3F855613DA; Wed, 12 May 2021 13:38:43 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [85.220.165.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3898861396
	for <soc@kernel.org>; Wed, 12 May 2021 13:38:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3898861396
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=p.zabel@pengutronix.de
Received: from lupine.hi.pengutronix.de ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1lgp4S-0008Mu-4e; Wed, 12 May 2021 15:38:40 +0200
Received: from pza by lupine with local (Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1lgp4R-0003X7-Sl; Wed, 12 May 2021 15:38:39 +0200
Message-ID: <418cf3a460cfe1d0f91f87e10baaf478bd41f1d5.camel@pengutronix.de>
Subject: [GIT PULL] Reset controller updates for v5.14
From: Philipp Zabel <p.zabel@pengutronix.de>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, kernel@pengutronix.de
Date: Wed, 12 May 2021 15:38:39 +0200
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:3ad5:47ff:feaf:1a17
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: soc@kernel.org

Dear SoC maintainers,

The following changes since commit 6efb943b8616ec53a5e444193dccf1af9ad627b5=
:

  Linux 5.13-rc1 (2021-05-09 14:17:44 -0700)

are available in the Git repository at:

  git://git.pengutronix.de/pza/linux.git tags/reset-for-v5.14

for you to fetch changes up to e207457f9045343a24d936fbb67eb4b412f1c6ad:

  reset: brcmstb: Add missing MODULE_DEVICE_TABLE (2021-05-12 08:01:26 +020=
0)

----------------------------------------------------------------
Reset controller updates for v5.14

This tag adds support for the Microchip Sparx5 Switch Reset controller
and contains some small fixes and cleanups in core and various drivers.

----------------------------------------------------------------
Geert Uytterhoeven (2):
      reset: RESET_BRCMSTB_RESCAL should depend on ARCH_BRCMSTB
      reset: RESET_INTEL_GW should depend on X86

Krzysztof Kozlowski (1):
      reset: a10sr: add missing of_match_table reference

Philipp Zabel (8):
      reset: bcm6345: Make reset_control_ops const
      reset: zynqmp: replace spaces with tabs
      reset: oxnas: replace file name with short description
      reset: whitespace fixes
      reset: berlin: replace unsigned with unsigned int
      reset: ti-syscon: fix to_ti_syscon_reset_data macro
      reset: sti/syscfg: replace comma with semicolon
      reset: uniphier: enclose UNIPHIER_RESET_ID_END value in parentheses

Steen Hegelund (2):
      dt-bindings: reset: microchip sparx5 reset driver bindings
      reset: mchp: sparx5: add switch reset driver

Zou Wei (1):
      reset: brcmstb: Add missing MODULE_DEVICE_TABLE

 .../devicetree/bindings/reset/microchip,rst.yaml   |  58 ++++++++
 drivers/reset/Kconfig                              |  12 +-
 drivers/reset/Makefile                             |   1 +
 drivers/reset/core.c                               |  20 +--
 drivers/reset/reset-a10sr.c                        |   1 +
 drivers/reset/reset-bcm6345.c                      |   2 +-
 drivers/reset/reset-berlin.c                       |   2 +-
 drivers/reset/reset-brcmstb.c                      |   1 +
 drivers/reset/reset-microchip-sparx5.c             | 146 +++++++++++++++++=
++++
 drivers/reset/reset-oxnas.c                        |   2 +-
 drivers/reset/reset-ti-syscon.c                    |   4 +-
 drivers/reset/reset-uniphier.c                     |   2 +-
 drivers/reset/reset-zynqmp.c                       |   4 +-
 drivers/reset/sti/reset-syscfg.c                   |   2 +-
 14 files changed, 237 insertions(+), 20 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/reset/microchip,rst.y=
aml
 create mode 100644 drivers/reset/reset-microchip-sparx5.c
