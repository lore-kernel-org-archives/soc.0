Return-Path: <SRS0=vACc=FI=pengutronix.de=p.zabel@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3A5CC433FE
	for <soc@archiver.kernel.org>; Fri,  4 Dec 2020 14:25:06 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 9645122B39; Fri,  4 Dec 2020 14:25:06 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [85.220.165.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5D45A22B37
	for <soc@kernel.org>; Fri,  4 Dec 2020 14:25:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5D45A22B37
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=p.zabel@pengutronix.de
Received: from lupine.hi.pengutronix.de ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1klC19-00021M-98; Fri, 04 Dec 2020 15:25:03 +0100
Received: from pza by lupine with local (Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1klC18-0002Tj-VB; Fri, 04 Dec 2020 15:25:02 +0100
Message-ID: <d586ada0073f2ac50a02274f42bf07bfb0603835.camel@pengutronix.de>
Subject: [GIT PULL] Reset controller changes for v5.11
From: Philipp Zabel <p.zabel@pengutronix.de>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, kernel@pengutronix.de
Date: Fri, 04 Dec 2020 15:25:02 +0100
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:3ad5:47ff:feaf:1a17
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: soc@kernel.org

Dear SoC maintainers,

The following changes since commit 3650b228f83adda7e5ee532e2b90429c03f7b9ec=
:

  Linux 5.10-rc1 (2020-10-25 15:14:11 -0700)

are available in the Git repository at:

  git://git.pengutronix.de/pza/linux tags/reset-for-v5.11

for you to fetch changes up to d06c4dec98b655e2808d2a59681ec24197c59c9d:

  reset-controller: ti: force the write operation when assert or deassert (=
2020-12-03 08:44:57 +0100)

----------------------------------------------------------------
Reset controller updates for v5.11

This tag adds support for sharing pulsed resets under certain
conditions. For example, when multiple drivers go through a
suspend-resume cycle, a reset line they share can be triggered
again during resume.
Further, the reset-meson driver now can be built as a module, the
reset-socfpga driver properly releases its memory region in the
probe error path, and reset-ti-syscon driver uses regmap_write_bits()
instead of regmap_update_bits() to support devices without status
readback.

----------------------------------------------------------------
Amjad Ouled-Ameur (1):
      reset: make shared pulsed reset controls re-triggerable

Crystal Guo (1):
      reset-controller: ti: force the write operation when assert or deasse=
rt

Dinh Nguyen (1):
      reset: socfpga: add error handling and release mem-region

Neil Armstrong (1):
      reset: meson: make it possible to build as a module

 drivers/reset/Kconfig           |  3 +-
 drivers/reset/core.c            | 73 +++++++++++++++++++++++++++++++++++++=
++++
 drivers/reset/reset-meson.c     |  8 ++++-
 drivers/reset/reset-socfpga.c   | 11 +++++--
 drivers/reset/reset-ti-syscon.c |  4 +--
 include/linux/reset.h           |  1 +
 6 files changed, 94 insertions(+), 6 deletions(-)
