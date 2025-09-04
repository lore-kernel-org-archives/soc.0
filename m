Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 727AA27FB34
	for <soc@lists.linux.dev>; Thu,  4 Sep 2025 15:41:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757000502; cv=none; b=TixcWpQAF6locYJ9UWjI5C9p8LnwfXkDlVp0JZr3fh4l8Xm2r0xi1gI8ey03H6zJlbUo44H7pbMeO7L5kWT2H9FMYzWMmvYk5tJ58MZleQTLwhbMWwyJgRnYbnoi37OhMnbcmG4Ujiye560MWY4X2vtVQK2/uhjYuxmYgi7YxKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757000502; c=relaxed/simple;
	bh=uBlc77KG4oLqtVwYzOWMdhTmLPN5JrFgUuN1qop/0z4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qyfPa9w+hYabFGyKOHTGnlJ5YtfYop+Wifx+/Fbpm25TvAPulioiLc2zRWHWfvNN4iWjq9yhtFs0nXLP9CCRsIodDMtnu+veZqjepwvzl9go4N5FrsvIPHerOssfDrSc8pf874V2ltVSS6eeESeJYych2i48tMzrejpFklWoZ1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix)
	id 2096FC4CEF1; Thu,  4 Sep 2025 15:41:42 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 2E088C4CEF0
	for <soc@kernel.org>; Thu,  4 Sep 2025 15:41:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 2E088C4CEF0
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from dude05.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::54])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1uuC5i-0006qc-99; Thu, 04 Sep 2025 17:41:38 +0200
From: Philipp Zabel <p.zabel@pengutronix.de>
To: soc@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	kernel@pengutronix.de,
	Philipp Zabel <p.zabel@pengutronix.de>
Subject: [GIT PULL] Reset controller updates for v6.18
Date: Thu,  4 Sep 2025 17:41:35 +0200
Message-ID: <20250904154135.2385905-1-p.zabel@pengutronix.de>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::54
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: soc@kernel.org

Dear arm-soc maintainers,

The following changes since commit 8f5ae30d69d7543eee0d70083daf4de8fe15d585:

  Linux 6.17-rc1 (2025-08-10 19:41:16 +0300)

are available in the Git repository at:

  https://git.pengutronix.de/git/pza/linux.git tags/reset-for-v6.18

for you to fetch changes up to 1527cd3b89f0db8d71828f86a64dc901415f9be1:

  reset: remove unneeded 'fast_io' parameter in regmap_config (2025-08-14 12:21:39 +0200)

----------------------------------------------------------------
Reset controller updates for v6.18

* Fix the reset tree git repository link in MAINTAINERS.
* Add support for bcm63xx ephy reset control to reset-bcm6345.
* Add support for the AST2700 reset controller, as an auxiliary
  device driver to the corresponding clock controller driver.
* Add support for the remaining TH1520 VO subsystem reset controls to
  reset-th1520.
* Drop unnecessary .fast_io setting from MMIO regmap_configs.

----------------------------------------------------------------
Icenowy Zheng (2):
      dt-bindings: reset: thead,th1520-reset: add more VOSYS resets
      reset: th1520: add resets for display pipeline

Kyle Hendry (2):
      dt-bindings: reset: add compatible for bcm63xx ephy control
      reset: bcm6345: add support for bcm63xx ephy control register

Philipp Zabel (1):
      MAINTAINERS: Use https:// protocol for Reset Controller Framework tree

Ryan Chen (1):
      reset: aspeed: register AST2700 reset auxiliary bus device

Wolfram Sang (1):
      reset: remove unneeded 'fast_io' parameter in regmap_config

 .../bindings/reset/brcm,bcm6345-reset.yaml         |   4 +-
 MAINTAINERS                                        |   2 +-
 drivers/reset/Kconfig                              |   7 +
 drivers/reset/Makefile                             |   1 +
 drivers/reset/reset-aspeed.c                       | 253 +++++++++++++++++++++
 drivers/reset/reset-bcm6345.c                      |   1 +
 drivers/reset/reset-intel-gw.c                     |   1 -
 drivers/reset/reset-qcom-pdc.c                     |   1 -
 drivers/reset/reset-th1520.c                       |  41 +++-
 include/dt-bindings/reset/thead,th1520-reset.h     |   7 +
 10 files changed, 312 insertions(+), 6 deletions(-)
 create mode 100644 drivers/reset/reset-aspeed.c
