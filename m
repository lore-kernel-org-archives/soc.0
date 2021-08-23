Return-Path: <SRS0=34nA=NO=pengutronix.de=p.zabel@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFE44C4338F
	for <soc@archiver.kernel.org>; Mon, 23 Aug 2021 16:12:33 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id B45F86124D; Mon, 23 Aug 2021 16:12:33 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [85.220.165.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 29A64613CD
	for <soc@kernel.org>; Mon, 23 Aug 2021 16:12:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 29A64613CD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from lupine.hi.pengutronix.de ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1mICYp-0008Nz-CJ; Mon, 23 Aug 2021 18:12:31 +0200
Received: from pza by lupine with local (Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1mICYp-0002hr-1f; Mon, 23 Aug 2021 18:12:31 +0200
Message-ID: <e543959c5b5ee7b25686f81049bf187d602daeda.camel@pengutronix.de>
Subject: [GIT PULL] Reset controller fixes for v5.14
From: Philipp Zabel <p.zabel@pengutronix.de>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, kernel@pengutronix.de
Date: Mon, 23 Aug 2021 18:12:30 +0200
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

  git://git.pengutronix.de/pza/linux tags/reset-fixes-for-v5.14

for you to fetch changes up to ed104ca4bd9c405b41e968ad4ece51f6462e90b6:

  reset: reset-zynqmp: Fixed the argument data type (2021-08-23 12:55:18 +0=
200)

----------------------------------------------------------------
Reset controller fixes for v5.14

Hide the Sparx5 reset driver unless the ARCH_SPARX5 or COMPILE_TEST
options are enabled, to avoid unnecessarily asking users about this
driver. Fix a return value argument type in the ZynqMP reset driver.

----------------------------------------------------------------
Geert Uytterhoeven (1):
      reset: RESET_MCHP_SPARX5 should depend on ARCH_SPARX5

Sai Krishna Potthuri (1):
      reset: reset-zynqmp: Fixed the argument data type

 drivers/reset/Kconfig        | 2 +-
 drivers/reset/reset-zynqmp.c | 3 ++-
 2 files changed, 3 insertions(+), 2 deletions(-)
