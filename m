Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECA0B221FC0
	for <soc@lists.linux.dev>; Tue, 13 May 2025 09:25:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747128331; cv=none; b=AxOBqip4bA7I4KhnI+Ltet3wZSgDdP4n1/s9n2mtUzh8RZh5kHdAO7XVL0KUrWMpQQI0a1AUKlImS0moT+I/zxEra/A7RLX9xweQ0g2Um8yUGTAjnnJyr52rPN+UIZAUL34KAvbv2KoZzN4ysEJkWLz1a0wxmZah4sLYDcf86ro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747128331; c=relaxed/simple;
	bh=jATiG6RAbBvN/kdn+1OmFlbilL/2/+yLllnWvB9fAac=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=XKFHhZfpskkVtt/qxM5vF8wL63EyfpkLOm8uInEmLfJATrV4BeN0yHk3V81K9S8Fey/4MiGxca7bP5/ioyqc/H2fewVoIOfomcDoTcSLXFVDDHOCGJSo5iyrMyeN3lBSekfi6JyOBtD45N4gNum/ss9jxOtsURwxG/cCIBLYi/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix)
	id 6A279C4CEED; Tue, 13 May 2025 09:25:30 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 8B015C4CEE4
	for <soc@kernel.org>; Tue, 13 May 2025 09:25:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 8B015C4CEE4
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from dude05.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::54])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1uElt9-0000vC-EO; Tue, 13 May 2025 11:25:27 +0200
From: Philipp Zabel <p.zabel@pengutronix.de>
To: soc@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	kernel@pengutronix.de,
	Philipp Zabel <p.zabel@pengutronix.de>
Subject: [GIT PULL] Reset controller updates for v6.16
Date: Tue, 13 May 2025 11:25:16 +0200
Message-Id: <20250513092516.3331585-1-p.zabel@pengutronix.de>
X-Mailer: git-send-email 2.39.5
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

The following changes since commit 0af2f6be1b4281385b618cb86ad946eded089ac8:

  Linux 6.15-rc1 (2025-04-06 13:11:33 -0700)

are available in the Git repository at:

  git://git.pengutronix.de/pza/linux.git tags/reset-for-v6.16

for you to fetch changes up to 1c64de886b8893c0158097edd6ba08d527a2c97a:

  dt-bindings: reset: sophgo: Add SG2044 bindings. (2025-05-05 15:22:33 +0200)

----------------------------------------------------------------
Reset controller updates for v6.16

* Add T-HEAD TH1520 and Renesas RZ/V2H(P) USB2PHY reset controller
  drivers.
* Add devm_reset_control_array_get_exclusive_released() variant to allow
  using the acquire/release hand-off mechanism for exclusive reset
  controls bundled into reset control arrays.
* Add Sophgo SG2044 reset controller to device tree bindings.

----------------------------------------------------------------
Inochi Amaoto (1):
      dt-bindings: reset: sophgo: Add SG2044 bindings.

Lad Prabhakar (3):
      dt-bindings: reset: Document RZ/V2H(P) USB2PHY reset
      reset: Add USB2PHY port reset driver for Renesas RZ/V2H(P)
      MAINTAINERS: Add entry for Renesas RZ/V2H(P) USB2PHY Port Reset driver

Michal Wilczynski (2):
      dt-bindings: reset: Add T-HEAD TH1520 SoC Reset Controller
      reset: thead: Add TH1520 reset controller driver

Patrice Chotard (1):
      reset: Add devm_reset_control_array_get_exclusive_released()

 .../reset/renesas,rzv2h-usb2phy-reset.yaml         |  56 +++++
 .../bindings/reset/sophgo,sg2042-reset.yaml        |   7 +-
 .../bindings/reset/thead,th1520-reset.yaml         |  44 ++++
 MAINTAINERS                                        |  11 +
 drivers/reset/Kconfig                              |  17 ++
 drivers/reset/Makefile                             |   2 +
 drivers/reset/reset-rzv2h-usb2phy.c                | 236 +++++++++++++++++++++
 drivers/reset/reset-th1520.c                       | 135 ++++++++++++
 include/dt-bindings/reset/thead,th1520-reset.h     |  16 ++
 include/linux/reset.h                              |   6 +
 10 files changed, 529 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/reset/renesas,rzv2h-usb2phy-reset.yaml
 create mode 100644 Documentation/devicetree/bindings/reset/thead,th1520-reset.yaml
 create mode 100644 drivers/reset/reset-rzv2h-usb2phy.c
 create mode 100644 drivers/reset/reset-th1520.c
 create mode 100644 include/dt-bindings/reset/thead,th1520-reset.h
