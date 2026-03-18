Received: from fhigh-a6-smtp.messagingengine.com (fhigh-a6-smtp.messagingengine.com [103.168.172.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC0453DD501
	for <soc@lists.linux.dev>; Wed, 18 Mar 2026 14:42:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773844931; cv=none; b=VrAhcLWBHhlcyzi7oKTCqxnpn39XTPO69zuvqtLvBaXjlEJJJX6EWDgxFmQRm13J264/uKlA8P+6qPo1uddTjQ3qsAqbvvvb/WIZJNqa9x0XYcqYf3qX++k0WIPwxiySDzsJfg+G//r4pPmYlsRZLqg6taphvMwRBAgpFi/7XtY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773844931; c=relaxed/simple;
	bh=FWqfIqLBCqcDLw5/Rd3PfnXAze7SKztZSmyfSkCavyI=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:Subject:Content-Type; b=mJQ6lnxwbkfkz1dgdkBsQmZJ5olAS+YmpnImqNmCP0dwhEJpTA19YVnKr30YISltx95v9Shk0604s+hMqc3usUUAI7nE/LypGK9vxKiZu+kNg2LPkVy+3SnNHitUxoWwMK49XyQxgDl0yWfYu5yZuzEOEDqpeAi3DSxuCn6qNhA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=Tk7ykoOe; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=h+H+o9/L; arc=none smtp.client-ip=103.168.172.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="Tk7ykoOe";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="h+H+o9/L"
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.phl.internal (Postfix) with ESMTP id AEB711400207;
	Wed, 18 Mar 2026 10:42:08 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-04.internal (MEProxy); Wed, 18 Mar 2026 10:42:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm3; t=1773844928; x=1773931328; bh=vS
	zDjyJNks6QPStNfUc+wlwDqAdgG1JJRQ/ke1UWmTQ=; b=Tk7ykoOek8zc4nZwOQ
	NHdO+mFM8rWC0UxThOP/g530WZyLgsHxT+icx6/WfX8tEPAHdCxxgdR1vwvidSQ6
	gEwk4xj5yKUI8D/rLezI2edLr+iyuaUiwXX5sE9S/kQc4RXPYc+p8s+rClC2AN4P
	2PR+rky1vMOyTzktPBRSiJOpm57Og+V0N5hZPTTyYMxjqXF+wwEi1nZ0PoSo6HNM
	x61m+1VhUQZwL9247eosu2ebkN5K9iwYAmM39WCorGz/DzZhPhEkpALuIqTb2DRK
	2qzpg9rZW09yQPU3gsMVVeJqwgcNa30oLAkH4OLQtCKOovpyo3n2ewltQflXPABg
	zamQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1773844928; x=1773931328; bh=vSzDjyJNks6QPStNfUc+wlwDqAdg
	G1JJRQ/ke1UWmTQ=; b=h+H+o9/LlWpgC2nrfBLBA60PlzBqC2BkLvV5r0Tb5/A9
	5m/8rEZ80KlrUrGz2SxsdZSRO8b8xSA0ataN2SJn30ImNAyrteIQ7NJwhj9LAGvU
	L63fDRPiAY7gtJKLa10G0n7HfKzKQBYtVK+3DmH2SDM7mtNhyIi62Xlp9GYoytR3
	FiHQn6/Qn6gE5xoDsKUhiayqvcCBo/B0JK4N49yA03rJHCa47L3rBQY3wxVDv4Tl
	YUs4dt/Rikby94g7L23ou9Bkxygua8Kro+OQ3XmK91WmlI1WCbiQtRGTgMHnYz61
	pC3JqV7eGCRTowK2UpVyWLwz6nHBre9zgilfxIdtvQ==
X-ME-Sender: <xms:wLm6aW1gyEkBRKQhEVuA0JG4Uo42BxtQizr9HG_Hz_OsWRoxGzmNFg>
    <xme:wLm6aT7Q_bZf9K7u6uCLqjDk5fVJZWesrk9M4I8JsReaPiYx3nQXFcdbXNapVv8sQ
    N7EKAR9aVlrnern_95ewFAXBHjKOHG4eatoalTJROjlUDFr7q9_bEk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdeftdeggedtucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepofggfffhvfevkffutgfgsehtjeertdertddtnecuhfhrohhmpedftehrnhguuceu
    vghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrthhtvghrnh
    epgefggefgieehieduffekieefheevteffueehgfehueetgfevteejkeehfedvtdehnecu
    ffhomhgrihhnpehkvghrnhgvlhdrohhrghdpphgvnhhguhhtrhhonhhigidruggvnecuve
    hluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghrnhgusegr
    rhhnuggsrdguvgdpnhgspghrtghpthhtohepgedpmhhouggvpehsmhhtphhouhhtpdhrtg
    hpthhtohepthhorhhvrghlughssehlihhnuhigqdhfohhunhgurghtihhonhdrohhrghdp
    rhgtphhtthhopehlihhnuhigqdgrrhhmqdhkvghrnhgvlheslhhishhtshdrihhnfhhrrg
    guvggrugdrohhrghdprhgtphhtthhopehsohgtsehlihhsthhsrdhlihhnuhigrdguvghv
    pdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorh
    hg
X-ME-Proxy: <xmx:wLm6aYg1shuOE8UwAU7xoj5QEhpMlNeywFtecgXAuFRnEZ8xOFtkwg>
    <xmx:wLm6aX7hhUu09ZeJQo2JrtiQ7Y4bHJBZUw5AyxO40eWoflgeZnPSfQ>
    <xmx:wLm6aYbJ0jcmjIR34SvjeM2H5SPnH3S-ZXOvq663pyNsE6gn_He73Q>
    <xmx:wLm6aU5c96ZYESKAw2aZPkdIoev9dfihakxitKt7hFEfdi-QEEhPnw>
    <xmx:wLm6aWLly9eINSZY59JQKboM8pX3Lz7v10lQKeRjz741bBagkzo0848S>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 621C5700065; Wed, 18 Mar 2026 10:42:08 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Date: Wed, 18 Mar 2026 15:41:48 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Linus Torvalds" <torvalds@linux-foundation.org>
Cc: soc@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Message-Id: <33f46e61-6f3c-4aa4-9821-a0dca6babb89@app.fastmail.com>
Subject: [GIT PULL] soc: fixes for 7.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

The following changes since commit 11439c4635edd669ae435eec308f4ab8a0804808:

  Linux 7.0-rc2 (2026-03-01 15:39:31 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-fixes-7.0

for you to fetch changes up to df3ef89d7ef8185fa719812e2d175b83112aa315:

  Merge tag 'scmi-fixes-7.0' of git://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux into arm/fixes (2026-03-18 14:06:34 +0100)

----------------------------------------------------------------
soc: fixes for 7.0

The firmware drivers for ARM SCMI, FF-A and the Tee subsystem, as well
as the reset controller and cache controller subsystem all see small
bugfixes for reference ounting errors, ABI correctness, and NULL pointer
dereferences.

Similarly, there are multiple reference counting fixes in drivers/soc/
for vendor specific drivers (rockchips, microchip), while the freescale
drivers get a fix for a race condition and error handling.

The devicetree fixes for Rockchips and NXP got held up, so for the moment
there is only Renesas fixing problesm with SD card initialization, a
boot hang on one board and incorrect descriptions for interrupts and
clock registers on some SoCs. The Microchip polarfire gets a dts fix
for a boot time warning.

A defconfig fix avoids a warning about a conflicting assignment.

----------------------------------------------------------------
Arnd Bergmann (6):
      Merge tag 'riscv-soc-fixes-for-v7.0-rc1' of https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux into arm/fixes
      Merge tag 'soc_fsl-7.0-2' of https://git.kernel.org/pub/scm/linux/kernel/git/chleroy/linux into arm/fixes
      Merge tag 'reset-fixes-for-v7.0' of https://git.pengutronix.de/git/pza/linux into arm/fixes
      Merge tag 'tee-fix-for-v7.0' of git://git.kernel.org/pub/scm/linux/kernel/git/jenswi/linux-tee into arm/fixes
      Merge tag 'ffa-fix-7.0' of git://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux into arm/fixes
      Merge tag 'scmi-fixes-7.0' of git://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux into arm/fixes

Chen Ni (1):
      soc: fsl: cpm1: qmc: Fix error check for devm_ioremap_resource() in qmc_qe_init_resources()

Claudiu Beznea (2):
      reset: rzg2l-usbphy-ctrl: Check pwrrdy is valid before using it
      arm64: dts: renesas: rzg3s-smarc-som: Set bypass for Versa3 PLL2

Conor Dooley (1):
      riscv: dts: microchip: add can resets to mpfs

Cristian Marussi (1):
      firmware: arm_scmi: Fix NULL dereference on notify error path

Fabrizio Castro (1):
      arm64: dts: renesas: r9a09g057: Remove wdt{0,2,3} nodes

Felix Gu (3):
      cache: starfive: fix device node leak in starlink_cache_init()
      cache: ax45mp: Fix device node reference leak in ax45mp_cache_init()
      firmware: arm_scpi: Fix device_node reference leak in probe path

Geert Uytterhoeven (2):
      arm64: dts: renesas: r8a78000: Fix out-of-range SPI interrupt numbers
      firmware: arm_scmi: Spelling s/mulit/multi/, s/currenly/currently/

Krzysztof Kozlowski (2):
      Merge tag 'renesas-fixes-for-v7.0-tag1' of https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel into arm/fixes
      Merge tag 'v7.0-rockchip-drvfixes1' of ssh://gitolite.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip into arm/fixes

Lad Prabhakar (4):
      arm64: dts: renesas: rzt2h-n2h-evk: Add ramp delay for SD0 card regulator
      arm64: dts: renesas: rzv2-evk-cn15-sd: Add ramp delay for SD0 regulator
      arm64: dts: renesas: r9a09g077: Fix CPG register region sizes
      arm64: dts: renesas: r9a09g087: Fix CPG register region sizes

Matthew Wilcox (1):
      tee: shm: Remove refcounting of kernel pages

Nathan Chancellor (1):
      ARM: multi_v7_defconfig: Drop duplicate CONFIG_TI_PRUSS=m

Richard Genoud (1):
      soc: fsl: qbman: fix race condition in qman_destroy_fq

Shawn Lin (1):
      soc: rockchip: grf: Add missing of_node_put() when returning

Yeoreum Yun (1):
      firmware: arm_ffa: Remove vm_id argument in ffa_rxtx_unmap()

Zilin Guan (1):
      soc: microchip: mpfs: Fix memory leak in mpfs_sys_controller_probe()

 arch/arm/configs/multi_v7_defconfig                |  1 -
 arch/arm64/boot/dts/renesas/r8a78000.dtsi          | 16 ++++++------
 arch/arm64/boot/dts/renesas/r9a09g057.dtsi         | 30 ----------------------
 arch/arm64/boot/dts/renesas/r9a09g077.dtsi         |  4 +--
 arch/arm64/boot/dts/renesas/r9a09g087.dtsi         |  4 +--
 arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi   |  2 +-
 .../boot/dts/renesas/rzt2h-n2h-evk-common.dtsi     |  1 +
 arch/arm64/boot/dts/renesas/rzv2-evk-cn15-sd.dtso  |  1 +
 arch/riscv/boot/dts/microchip/mpfs.dtsi            |  2 ++
 drivers/cache/ax45mp_cache.c                       |  4 +--
 drivers/cache/starfive_starlink_cache.c            |  4 +--
 drivers/firmware/arm_ffa/driver.c                  |  8 +++---
 drivers/firmware/arm_scmi/notify.c                 |  4 +--
 drivers/firmware/arm_scmi/protocols.h              |  4 +--
 drivers/firmware/arm_scpi.c                        |  5 ++--
 drivers/reset/reset-rzg2l-usbphy-ctrl.c            |  3 +++
 drivers/soc/fsl/qbman/qman.c                       | 24 +++++++++++++++--
 drivers/soc/fsl/qe/qmc.c                           |  4 +--
 drivers/soc/microchip/mpfs-sys-controller.c        | 13 +++++++---
 drivers/soc/rockchip/grf.c                         |  1 +
 drivers/tee/tee_shm.c                              | 27 -------------------
 21 files changed, 69 insertions(+), 93 deletions(-)
