Return-Path: <SRS0=IuT9=LL=pengutronix.de=p.zabel@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA05CC2B9F4
	for <soc@archiver.kernel.org>; Thu, 17 Jun 2021 12:56:40 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 94BFE61263; Thu, 17 Jun 2021 12:56:40 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [85.220.165.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 08C7161351
	for <soc@kernel.org>; Thu, 17 Jun 2021 12:56:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 08C7161351
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=p.zabel@pengutronix.de
Received: from lupine.hi.pengutronix.de ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1ltrZW-00062I-9U; Thu, 17 Jun 2021 14:56:38 +0200
Received: from pza by lupine with local (Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1ltrZV-0008O5-Vc; Thu, 17 Jun 2021 14:56:37 +0200
Message-ID: <14d33ac19b2a107e97ce1ab264987b707baa9ba7.camel@pengutronix.de>
Subject: [GIT PULL] Reset controller updates for v5.14, part 2
From: Philipp Zabel <p.zabel@pengutronix.de>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, kernel@pengutronix.de
Date: Thu, 17 Jun 2021 14:56:37 +0200
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:3ad5:47ff:feaf:1a17
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: soc@kernel.org

Dear SoC maintainers,

The following changes since commit e207457f9045343a24d936fbb67eb4b412f1c6ad=
:

  reset: brcmstb: Add missing MODULE_DEVICE_TABLE (2021-05-12 08:01:26 +020=
0)

are available in the Git repository at:

  git://git.pengutronix.de/pza/linux.git tags/reset-for-v5.14-2

for you to fetch changes up to 48a74b1147f7db4623eaed591cc01eb740b871c0:

  reset: Add compile-test stubs (2021-06-09 13:37:16 +0200)

----------------------------------------------------------------
Reset controller updates for v5.14, part2

This tag contains a few small fixes, allows to build the Berlin reset
driver as a module, and adds stubs to the reset controller API to allow
compile-testing drivers outside of drivers/reset without enabling the
reset framework.

----------------------------------------------------------------
Hao Fang (1):
      reset: hi6220: Use the correct HiSilicon copyright

Jisheng Zhang (1):
      reset: berlin: support module build

Philipp Zabel (1):
      reset: bail if try_module_get() fails

Thierry Reding (1):
      reset: Add compile-test stubs

Wei Yongjun (1):
      reset: mchp: sparx5: fix return value check in mchp_sparx5_map_io()

Yang Yingliang (1):
      reset: lantiq: use devm_reset_controller_register()

 drivers/reset/Kconfig                  |  5 +++--
 drivers/reset/core.c                   |  5 ++++-
 drivers/reset/hisilicon/hi6220_reset.c |  2 +-
 drivers/reset/reset-berlin.c           | 10 ++++++++--
 drivers/reset/reset-lantiq.c           |  2 +-
 drivers/reset/reset-microchip-sparx5.c |  4 ++--
 include/linux/reset-controller.h       | 22 ++++++++++++++++++++++
 7 files changed, 41 insertions(+), 9 deletions(-)
