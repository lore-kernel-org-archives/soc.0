Return-Path: <SRS0=IBm+=PH=pengutronix.de=p.zabel@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA827C433EF
	for <soc@archiver.kernel.org>; Tue, 19 Oct 2021 15:12:54 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id B575360FDA; Tue, 19 Oct 2021 15:12:54 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [85.220.165.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AA1B260F25
	for <soc@kernel.org>; Tue, 19 Oct 2021 15:12:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org AA1B260F25
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from lupine.hi.pengutronix.de ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1mcqnL-0005LR-HD; Tue, 19 Oct 2021 17:12:51 +0200
Received: from pza by lupine with local (Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1mcqnL-0000Zn-6S; Tue, 19 Oct 2021 17:12:51 +0200
Message-ID: <b378f2aae54538db6a13c98561b4cbcacbef937c.camel@pengutronix.de>
Subject: [GIT PULL] Reset controller fixes for v5.15
From: Philipp Zabel <p.zabel@pengutronix.de>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, kernel@pengutronix.de
Date: Tue, 19 Oct 2021 17:12:51 +0200
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

  git://git.pengutronix.de/pza/linux tags/reset-fixes-for-v5.15

for you to fetch changes up to 3ad60b4b3570937f3278509fe6797a5093ce53f8:

  reset: socfpga: add empty driver allowing consumers to probe (2021-10-05 =
12:23:16 +0200)

----------------------------------------------------------------
Reset controller fixes for v5.15

Fix the status bit polarity in the brcmstb-rescal driver, re-enable
pistachio driver selection after MACH_PISTACHIO removal, add transfer
error handling in the tegra-bpmp driver, and fix probing of the
reset-socfpga driver after recent device link changes.

----------------------------------------------------------------
Geert Uytterhoeven (1):
      reset: pistachio: Re-enable driver selection

Jim Quinlan (1):
      reset: brcmstb-rescal: fix incorrect polarity of status bit

Mikko Perttunen (1):
      reset: tegra-bpmp: Handle errors in BPMP response

Pawe=C5=82 Anikiel (1):
      reset: socfpga: add empty driver allowing consumers to probe

 drivers/reset/Kconfig                |  4 ++--
 drivers/reset/reset-brcmstb-rescal.c |  2 +-
 drivers/reset/reset-socfpga.c        | 26 ++++++++++++++++++++++++++
 drivers/reset/tegra/reset-bpmp.c     |  9 ++++++++-
 4 files changed, 37 insertions(+), 4 deletions(-)
