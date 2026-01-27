Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5237E4F881
	for <soc@lists.linux.dev>; Tue, 27 Jan 2026 10:22:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769509376; cv=none; b=cYHsCyH/yK4uEFr3x0D0L0hDMQL6wMf8pAIKtUrpAwiQUbq9svCWZKGNyJ3nV2RLE2eJuOLLyHoDwHQEDsLlWdF1ScBU0tbDNSm/KRiaiHhVcljm+/NCKn7OS/cnc/i93HnGG3vhqO1sP3wczlYIUg5GoJ35b7i5z0iWv5xO6BI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769509376; c=relaxed/simple;
	bh=/svp4PVHzw51Hol85q6Py3sBzjOZEzQ+7ooVo7Qx5qc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PluQZVdMdwtNT3rN4O8jU9uMJBY7lXB5hV1Qbn8mDtvRWYWUuZ3QaH/GrmrHenfcJ7LqmDyVYG9svgh/sGgmZRLTrQKWxgHWulj7/lBDWBiAM7HUOq0AELlQsupkgCteegTj7evWP6nBh9VjZ2zaekBOoSo1xXBVMz6BzlAAPEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix)
	id 48EB4C16AAE; Tue, 27 Jan 2026 10:22:56 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 7C350C116C6
	for <soc@kernel.org>; Tue, 27 Jan 2026 10:22:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 7C350C116C6
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from dude05.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::54])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vkgDb-0005OS-Kx; Tue, 27 Jan 2026 11:22:43 +0100
From: Philipp Zabel <p.zabel@pengutronix.de>
To: soc@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	kernel@pengutronix.de,
	Philipp Zabel <p.zabel@pengutronix.de>
Subject: [GIT PULL] Reset controller updates for v6.20
Date: Tue, 27 Jan 2026 11:22:37 +0100
Message-ID: <20260127102237.3945322-1-p.zabel@pengutronix.de>
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

The following changes since commit 8f0b4cce4481fb22653697cced8d0d04027cb1e8:

  Linux 6.19-rc1 (2025-12-14 16:05:07 +1200)

are available in the Git repository at:

  https://git.pengutronix.de/git/pza/linux.git tags/reset-for-v6.20

for you to fetch changes up to 938ce3b16582657e67f3bd8a7efa59089c467c90:

  reset: spacemit: Add SpacemiT K3 reset driver (2026-01-24 16:53:02 +0100)

----------------------------------------------------------------
Reset controller updates for v6.20

* Add a compatible to the reset-gpio driver, suppress the sysfs bind
  attributes, and propagate GPIO API errors.
* Add support for the i.MX8ULP SIM LPAV reset controller.
* Add RZ/G3S USBPHY suspend/resume support.
* Enable reset-k230 by default on ARCH_CANAAN
* Add support for the SpacemiT K3 SoC reset controller.
* Merge the 'spacemit-clkrst-v6.20-3' tag, shared with the clk tree,
  as a dependency for the SpacemiT changes.

----------------------------------------------------------------
Bartosz Golaszewski (3):
      reset: gpio: add the "compatible" property
      reset: gpio: suppress bind attributes in sysfs
      reset: gpio: check the return value of gpiod_set_value_cansleep()

Claudiu Beznea (2):
      reset: rzg2l-usbphy-ctrl: Propagate the return value of regmap_field_update_bits()
      reset: rzg2l-usbphy-ctrl: Add suspend/resume support

Guodong Xu (4):
      dt-bindings: soc: spacemit: Add K3 reset support and IDs
      reset: Create subdirectory for SpacemiT drivers
      reset: spacemit: Extract common K1 reset code
      reset: spacemit: Add SpacemiT K3 reset driver

Junhui Liu (1):
      reset: canaan: k230: drop OF dependency and enable by default

Laurentiu Mihalcea (4):
      reset: imx8mp-audiomix: Drop unneeded macros
      reset: imx8mp-audiomix: Switch to using regmap API
      reset: imx8mp-audiomix: Extend the driver usage
      reset: imx8mp-audiomix: Support i.MX8ULP SIM LPAV

Philipp Zabel (1):
      Merge tag 'spacemit-clkrst-v6.20-3' into reset/next

Yixun Lan (4):
      clk: spacemit: prepare common ccu header
      reset: spacemit: fix auxiliary device id
      Merge tags 'spacemit-clkrst-v6.20-1' and 'spacemit-clkrst-v6.20-2' into spacemit-clkrst-v6.20
      clk: spacemit: k3: extract common header

 .../bindings/soc/spacemit/spacemit,k1-syscon.yaml  |   8 +-
 drivers/reset/Kconfig                              |  14 +-
 drivers/reset/Makefile                             |   2 +-
 drivers/reset/core.c                               |   7 +-
 drivers/reset/reset-gpio.c                         |   9 +-
 drivers/reset/reset-imx8mp-audiomix.c              | 169 +++++++++----
 drivers/reset/reset-rzg2l-usbphy-ctrl.c            | 110 +++++++--
 drivers/reset/spacemit/Kconfig                     |  36 +++
 drivers/reset/spacemit/Makefile                    |   5 +
 drivers/reset/spacemit/reset-spacemit-common.c     |  77 ++++++
 drivers/reset/spacemit/reset-spacemit-common.h     |  42 ++++
 .../reset-spacemit-k1.c}                           | 109 +-------
 drivers/reset/spacemit/reset-spacemit-k3.c         | 233 ++++++++++++++++++
 include/dt-bindings/reset/spacemit,k3-resets.h     | 171 +++++++++++++
 include/soc/spacemit/ccu.h                         |  21 ++
 include/soc/spacemit/k1-syscon.h                   |  12 +-
 include/soc/spacemit/k3-syscon.h                   | 273 +++++++++++++++++++++
 17 files changed, 1103 insertions(+), 195 deletions(-)
 create mode 100644 drivers/reset/spacemit/Kconfig
 create mode 100644 drivers/reset/spacemit/Makefile
 create mode 100644 drivers/reset/spacemit/reset-spacemit-common.c
 create mode 100644 drivers/reset/spacemit/reset-spacemit-common.h
 rename drivers/reset/{reset-spacemit.c => spacemit/reset-spacemit-k1.c} (78%)
 create mode 100644 drivers/reset/spacemit/reset-spacemit-k3.c
 create mode 100644 include/dt-bindings/reset/spacemit,k3-resets.h
 create mode 100644 include/soc/spacemit/ccu.h
 create mode 100644 include/soc/spacemit/k3-syscon.h
