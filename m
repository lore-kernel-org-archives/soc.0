Return-Path: <SRS0=jTtt=HA=pengutronix.de=pza@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37632C433E0
	for <soc@archiver.kernel.org>; Fri, 29 Jan 2021 15:31:14 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 0315164DE9; Fri, 29 Jan 2021 15:31:14 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [85.220.165.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9E91D60C3D
	for <soc@kernel.org>; Fri, 29 Jan 2021 15:31:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9E91D60C3D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=pza@pengutronix.de
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <pza@pengutronix.de>)
	id 1l5Vjq-0006IM-B9; Fri, 29 Jan 2021 16:31:10 +0100
Received: from pza by dude02.hi.pengutronix.de with local (Exim 4.92)
	(envelope-from <pza@pengutronix.de>)
	id 1l5Vjo-0007NS-0w; Fri, 29 Jan 2021 16:31:08 +0100
Date: Fri, 29 Jan 2021 16:31:08 +0100
From: Philipp Zabel <pza@pengutronix.de>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	kernel@pengutronix.de
Subject: [GIT PULL] Reset controller updates for v5.12
Message-ID: <20210129153108.GA26994@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-IRC: #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 16:28:07 up 58 days,  3:44, 96 users,  load average: 12.71, 13.74,
 12.90
User-Agent: Mutt/1.10.1 (2018-07-13)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::28
X-SA-Exim-Mail-From: pza@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: soc@kernel.org

Dear arm-soc maintainers,

The following changes since commit 5c8fe583cce542aa0b84adc939ce85293de36e5e:

  Linux 5.11-rc1 (2020-12-27 15:30:22 -0800)

are available in the Git repository at:

  git://git.pengutronix.de/pza/linux.git tags/reset-for-v5.12

for you to fetch changes up to d17655759b3fc660ea49bd7be665c193030c77c0:

  reset: Add devm_reset_control_get_optional_exclusive_released() (2021-01-25 17:32:10 +0100)

----------------------------------------------------------------
Reset controller updates for v5.12

This tag adds support for Broadcom BCM4908 PCIe resets, corrects
the Hisilicon vendor prefix, adds a missing API function
devm_reset_control_get_optional_exclusive_released(), and fixes
the kernel-doc markup for the __device_reset() function.

----------------------------------------------------------------
Dmitry Osipenko (1):
      reset: Add devm_reset_control_get_optional_exclusive_released()

Mauro Carvalho Chehab (1):
      reset: core: fix a kernel-doc markup

Rafał Miłecki (2):
      dt-bindings: reset: document Broadcom's BCM4908 PCIe reset binding
      reset: simple: add BCM4908 MISC PCIe reset controller support

Zhen Lei (3):
      reset: hisilicon: correct vendor prefix
      dt-bindings: reset: correct vendor prefix hisi to hisilicon
      dt-bindings: reset: convert Hisilicon reset controller bindings to json-schema

 .../reset/brcm,bcm4908-misc-pcie-reset.yaml        | 39 +++++++++++
 .../bindings/reset/hisilicon,hi3660-reset.txt      | 44 -------------
 .../bindings/reset/hisilicon,hi3660-reset.yaml     | 77 ++++++++++++++++++++++
 drivers/reset/Kconfig                              |  2 +-
 drivers/reset/core.c                               |  4 +-
 drivers/reset/hisilicon/reset-hi3660.c             |  9 ++-
 drivers/reset/reset-simple.c                       |  2 +
 include/linux/reset.h                              | 19 ++++++
 8 files changed, 147 insertions(+), 49 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/reset/brcm,bcm4908-misc-pcie-reset.yaml
 delete mode 100644 Documentation/devicetree/bindings/reset/hisilicon,hi3660-reset.txt
 create mode 100644 Documentation/devicetree/bindings/reset/hisilicon,hi3660-reset.yaml
