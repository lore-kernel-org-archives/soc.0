Return-Path: <SRS0=KDbC=PI=pengutronix.de=p.zabel@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FDC0C433F5
	for <soc@archiver.kernel.org>; Wed, 20 Oct 2021 16:23:14 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id E51776128B; Wed, 20 Oct 2021 16:23:13 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [85.220.165.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D1B0B611F2
	for <soc@kernel.org>; Wed, 20 Oct 2021 16:23:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D1B0B611F2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from lupine.hi.pengutronix.de ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1mdEMw-0000xn-Eq; Wed, 20 Oct 2021 18:23:10 +0200
Received: from pza by lupine with local (Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1mdEMv-0000lF-QX; Wed, 20 Oct 2021 18:23:09 +0200
Message-ID: <96e686f78f0e42bad666df5ec0cbcb2dcdc270a3.camel@pengutronix.de>
Subject: Reset controller updates for v5.16
From: Philipp Zabel <p.zabel@pengutronix.de>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, kernel@pengutronix.de
Date: Wed, 20 Oct 2021 18:23:09 +0200
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:3ad5:47ff:feaf:1a17
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: soc@kernel.org

Dear SoC maintainers,

The following changes since commit 6880fa6c56601bb8ed59df6c30fd390cc5f6dd8f=
:

  Linux 5.15-rc1 (2021-09-12 16:28:37 -0700)

are available in the Git repository at:

  git://git.pengutronix.de/pza/linux tags/reset-for-v5.16

for you to fetch changes up to 8c81620ac1ace77dd0cbcc2193d4c7311f77d49b:

  reset: mchp: sparx5: Extend support for lan966x (2021-10-18 14:09:57 +020=
0)

----------------------------------------------------------------
Reset controller updates for v5.16

Allow building the reset-brcmstb-rescal driver as module, add reset
lines for the Uniphier PXs3 audio and video input subsystems and
bindings for the Uniphier NX1 SoC, and add lan966x switch reset support
to the reset-microchip-sparx5 driver.

----------------------------------------------------------------
Florian Fainelli (1):
      reset: Allow building Broadcom STB RESCAL as module

Horatiu Vultur (2):
      dt-bindings: reset: Add lan966x support
      reset: mchp: sparx5: Extend support for lan966x

Kunihiko Hayashi (3):
      reset: uniphier: Add audio system and video input reset control for P=
Xs3
      dt-bindings: reset: uniphier: Add NX1 reset control binding
      reset: uniphier: Add NX1 reset support

 .../devicetree/bindings/reset/microchip,rst.yaml   |  4 ++-
 .../reset/socionext,uniphier-glue-reset.yaml       |  1 +
 .../bindings/reset/socionext,uniphier-reset.yaml   |  3 ++
 drivers/reset/Kconfig                              |  4 +--
 drivers/reset/reset-microchip-sparx5.c             | 40 +++++++++++++++++-=
----
 drivers/reset/reset-uniphier-glue.c                |  4 +++
 drivers/reset/reset-uniphier.c                     | 27 +++++++++++++++
 7 files changed, 72 insertions(+), 11 deletions(-)
