Return-Path: <SRS0=7r4F=KH=pengutronix.de=p.zabel@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CAB3C5478C
	for <soc@archiver.kernel.org>; Fri,  1 Mar 2024 11:13:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id EB30CC43390; Fri,  1 Mar 2024 11:13:08 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id A052BC433F1
	for <soc@kernel.org>; Fri,  1 Mar 2024 11:13:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org A052BC433F1
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from dude05.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::54])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1rg0p5-0004HB-U2; Fri, 01 Mar 2024 12:13:03 +0100
From: Philipp Zabel <p.zabel@pengutronix.de>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	kernel@pengutronix.de,
	Philipp Zabel <p.zabel@pengutronix.de>
Subject: [GIT PULL] Reset controller updates for v6.9
Date: Fri,  1 Mar 2024 12:13:00 +0100
Message-Id: <20240301111300.4038207-1-p.zabel@pengutronix.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::54
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: soc@kernel.org

Dear arm-soc maintainers,

The following changes since commit b401b621758e46812da61fa58a67c3fd8d91de0d:

  Linux 6.8-rc5 (2024-02-18 12:56:25 -0800)

are available in the Git repository at:

  git://git.pengutronix.de/pza/linux.git tags/reset-for-v6.9

for you to fetch changes up to c721f189e89c0d4db119d7bb2b46768d0fb5f6b1:

  reset: Instantiate reset GPIO controller for shared reset-gpios (2024-02-21 11:53:25 +0100)

----------------------------------------------------------------
Reset controller updates for v6.9

Enable support for the Sophgo SG2042 reset controller via reset-simple,
add a GPIO-based reset controller criver for shared GPIO resets, extract
an of_phandle_args_equal() helper function out of cpufreq, and use it in
reset-gpio.

Based on v6.8-rc5 because reset-gpio depends on commits in the
gpio-driver-h-stubs-for-v6.8-rc5 tag.

----------------------------------------------------------------
Chen Wang (2):
      dt-bindings: reset: sophgo: support SG2042
      reset: simple: add support for Sophgo SG2042

Krzysztof Kozlowski (4):
      of: Add of_phandle_args_equal() helper
      cpufreq: do not open-code of_phandle_args_equal()
      reset: gpio: Add GPIO-based reset controller
      reset: Instantiate reset GPIO controller for shared reset-gpios

 .../bindings/reset/sophgo,sg2042-reset.yaml        |  35 ++++
 MAINTAINERS                                        |   5 +
 drivers/reset/Kconfig                              |  12 +-
 drivers/reset/Makefile                             |   1 +
 drivers/reset/core.c                               | 224 +++++++++++++++++++--
 drivers/reset/reset-gpio.c                         | 119 +++++++++++
 drivers/reset/reset-simple.c                       |   2 +
 include/dt-bindings/reset/sophgo,sg2042-reset.h    |  87 ++++++++
 include/linux/cpufreq.h                            |   3 +-
 include/linux/of.h                                 |  16 ++
 include/linux/reset-controller.h                   |   4 +
 11 files changed, 492 insertions(+), 16 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/reset/sophgo,sg2042-reset.yaml
 create mode 100644 drivers/reset/reset-gpio.c
 create mode 100644 include/dt-bindings/reset/sophgo,sg2042-reset.h
