Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B61C913777E
	for <soc@lists.linux.dev>; Thu, 20 Nov 2025 09:51:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763632269; cv=none; b=mmdE2/EMpyBqC6q8CcNras9GscX2cNzfv2DfqYdi3030yP3e9S5sa8IRQ4EarBtrNwGbF90muw9bWaUu0W1J8PiNefUzcKSsno5RQximxCyl6OF/BLtovl8T8x+AKUweHxBWe8FAtXOiq4vmuyWqh5U06yoFPb2A5kbw9Qyw/TQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763632269; c=relaxed/simple;
	bh=6X4BN2oGVT5qwkDLfHWaiMKCHJEupdTqn251KIH086g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Uy6R5BdKEGl6YnmZiHl2gIWfo5Ysbfz9W4si4aqQGOPniV3U7YMEESF7cmNrWpvczYr1rKbEN+51S/xvBsm/tdweSmYPka9cIZnzAwu6rmuwU213pDkk1b6eE6FXRAF0HTo2hcycAe8qyhiuzUYCE6oK3jHDVKU9xmFjlRAkBF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix)
	id 53CFDC116B1; Thu, 20 Nov 2025 09:51:07 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 998B6C4CEF1
	for <soc@kernel.org>; Thu, 20 Nov 2025 09:51:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 998B6C4CEF1
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from dude05.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::54])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vM1Jf-0002La-G0; Thu, 20 Nov 2025 10:51:03 +0100
From: Philipp Zabel <p.zabel@pengutronix.de>
To: soc@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	kernel@pengutronix.de,
	Philipp Zabel <p.zabel@pengutronix.de>
Subject: [GIT PULL] Reset controller updates for v6.19
Date: Thu, 20 Nov 2025 10:50:59 +0100
Message-ID: <20251120095059.2787351-1-p.zabel@pengutronix.de>
X-Mailer: git-send-email 2.47.3
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

The following changes since commit 3a8660878839faadb4f1a6dd72c3179c1df56787:

  Linux 6.18-rc1 (2025-10-12 13:42:36 -0700)

are available in the Git repository at:

  https://git.pengutronix.de/git/pza/linux.git tags/reset-for-v6.19

for you to fetch changes up to 1387cb78f101553c7fc14ec04ba730cab03ea3df:

  Documentation: reset: Remove reset_controller_add_lookup() (2025-11-20 10:02:37 +0100)

----------------------------------------------------------------
Reset controller updates for v6.19

* Add support for LAN969x, eic770 and RZ/G3S reset controllers,
  for the RZ/G3S USB-PHY reset controller, and for the remaining
  TH1520 reset controllers.
* Drop legacy reset control lookup code.
* Include linux/bits.h from linux/reset.h to make it self-contained.

----------------------------------------------------------------
Bartosz Golaszewski (2):
      clk: davinci: psc: drop unused reset lookup
      reset: remove legacy reset lookup code

Claudiu Beznea (3):
      dt-bindings: reset: renesas,rzg2l-usbphy-ctrl: Document RZ/G3S support
      reset: rzg2l-usbphy-ctrl: Add support for USB PWRRDY
      reset: rzg2l-usbphy-ctrl: Add support for RZ/G3S SoC

Dan Carpenter (1):
      reset: rzg2l-usbphy-ctrl: Fix a NULL vs IS_ERR() bug in probe

Encrow Thorne (1):
      reset: fix BIT macro reference

Robert Marko (2):
      dt-bindings: reset: microchip: Add LAN969x support
      reset: sparx5: add LAN969x support

Xuyang Dong (2):
      dt-bindings: reset: eswin: Documentation for eic7700 SoC
      reset: eswin: Add eic7700 reset driver

Yao Zi (4):
      dt-bindings: reset: thead,th1520-reset: Remove non-VO-subsystem resets
      dt-bindings: reset: thead,th1520-reset: Add controllers for more subsys
      reset: th1520: Prepare for supporting multiple controllers
      reset: th1520: Support reset controllers in more subsystems

Yue Haibing (1):
      Documentation: reset: Remove reset_controller_add_lookup()

 .../bindings/reset/eswin,eic7700-reset.yaml        |  42 ++
 .../devicetree/bindings/reset/microchip,rst.yaml   |  11 +-
 .../bindings/reset/renesas,rzg2l-usbphy-ctrl.yaml  |  41 +-
 .../bindings/reset/thead,th1520-reset.yaml         |   8 +-
 Documentation/driver-api/reset.rst                 |   1 -
 drivers/clk/davinci/psc-da850.c                    |   7 -
 drivers/reset/Kconfig                              |  13 +-
 drivers/reset/Makefile                             |   1 +
 drivers/reset/core.c                               | 124 +--
 drivers/reset/reset-eic7700.c                      | 429 +++++++++++
 drivers/reset/reset-rzg2l-usbphy-ctrl.c            |  60 ++
 drivers/reset/reset-th1520.c                       | 837 ++++++++++++++++++++-
 include/dt-bindings/reset/eswin,eic7700-reset.h    | 298 ++++++++
 include/dt-bindings/reset/thead,th1520-reset.h     | 219 +++++-
 include/linux/reset-controller.h                   |  33 -
 include/linux/reset.h                              |   1 +
 16 files changed, 1936 insertions(+), 189 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/reset/eswin,eic7700-reset.yaml
 create mode 100644 drivers/reset/reset-eic7700.c
 create mode 100644 include/dt-bindings/reset/eswin,eic7700-reset.h
