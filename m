Return-Path: <SRS0=34nA=NO=pengutronix.de=p.zabel@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BAEEC4338F
	for <soc@archiver.kernel.org>; Mon, 23 Aug 2021 16:12:58 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 0B68B613CD; Mon, 23 Aug 2021 16:12:58 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [85.220.165.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8E4D76124D
	for <soc@kernel.org>; Mon, 23 Aug 2021 16:12:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8E4D76124D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from lupine.hi.pengutronix.de ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1mICZD-0008R2-Lw; Mon, 23 Aug 2021 18:12:55 +0200
Received: from pza by lupine with local (Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1mICZD-0002ja-Da; Mon, 23 Aug 2021 18:12:55 +0200
Message-ID: <d42a75fc17ce718ef1b3fa4c5d3f5c7fb0bd2bc2.camel@pengutronix.de>
Subject: [GIT PULL] Reset controller updates for v5.15
From: Philipp Zabel <p.zabel@pengutronix.de>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, kernel@pengutronix.de
Date: Mon, 23 Aug 2021 18:12:55 +0200
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:3ad5:47ff:feaf:1a17
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: soc@kernel.org

Dear SoC maintainers,

The following changes since commit e73f0f0ee7541171d89f2e2491130c7771ba58d3=
:

  Linux 5.14-rc1 (2021-07-11 15:07:40 -0700)

are available in the Git repository at:

  git://git.pengutronix.de/pza/linux tags/reset-for-v5.15

for you to fetch changes up to 09f3824342f665d222fb7ac17c91f8334779630b:

  reset: simple: remove ZTE details in Kconfig help (2021-08-23 12:53:32 +0=
200)

----------------------------------------------------------------
Reset controller updates for v5.15

Add support for the SC7280 PDC Global and RZ/G2L USB/PHY reset
controllers, convert UniPhier glue device tree bindings to json-schema
and remove a leftover mention of ZTE zx2967 from Kconfig.

----------------------------------------------------------------
Biju Das (2):
      dt-bindings: reset: Document RZ/G2L USBPHY Control bindings
      reset: renesas: Add RZ/G2L usbphy control driver

Kunihiko Hayashi (1):
      dt-bindings: reset: Convert UniPhier glue reset to json-schema

Peter Robinson (1):
      reset: simple: remove ZTE details in Kconfig help

Sibi Sankar (3):
      dt-bindings: reset: aoss: Add AOSS reset controller binding
      dt-bindings: reset: pdc: Add PDC Global bindings
      reset: qcom: Add PDC Global reset signals for WPSS

 .../devicetree/bindings/reset/qcom,aoss-reset.yaml |   5 +
 .../devicetree/bindings/reset/qcom,pdc-global.yaml |   4 +
 .../bindings/reset/renesas,rzg2l-usbphy-ctrl.yaml  |  65 ++++++++
 .../reset/socionext,uniphier-glue-reset.yaml       |  88 +++++++++++
 .../devicetree/bindings/reset/uniphier-reset.txt   |  61 -------
 drivers/reset/Kconfig                              |   8 +-
 drivers/reset/Makefile                             |   1 +
 drivers/reset/reset-qcom-pdc.c                     |  62 ++++++--
 drivers/reset/reset-rzg2l-usbphy-ctrl.c            | 175 +++++++++++++++++=
++++
 include/dt-bindings/reset/qcom,sdm845-pdc.h        |   2 +
 10 files changed, 398 insertions(+), 73 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/reset/renesas,rzg2l-u=
sbphy-ctrl.yaml
 create mode 100644 Documentation/devicetree/bindings/reset/socionext,uniph=
ier-glue-reset.yaml
 delete mode 100644 Documentation/devicetree/bindings/reset/uniphier-reset.=
txt
 create mode 100644 drivers/reset/reset-rzg2l-usbphy-ctrl.c
