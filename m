Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83F652FCC1B
	for <soc@lists.linux.dev>; Wed,  3 Sep 2025 12:29:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756902593; cv=none; b=HKTGedBSKxyoYBaK+jvyJSvs1J4OQowQsh/xYG1BDlKzFv66cGPg9r8grHHwvyWH6NiMwBakCNCDZB2Y8oMJbWPjb29t7SC9vhccGtwC87QjD2c0JQSuR/0vp77K/XI+xQxXE4+JRNfdAhc6IwASyVir9f5xLhK1hEeZGctIqOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756902593; c=relaxed/simple;
	bh=pgeF349PTxS6HjXgpHdUwbd2TKO7EWlg5u43MLQz+88=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=AkfGWVN8YiPfSWysnoM6vy1qSDXmPFVT7rv+xQydaXHEpQXQY4Gqplvovrm7IJ3iR9rUXK4BJHJzh5VNzmk1lMx4A0uygs2c5ErIlI8yM34iIvqZbbbV+LUTfbcGV21EU6DmOlWQEINRtaeuo0E2ypKQ21gyLQu1jg+67luhnJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=z3xbhbH6; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="z3xbhbH6"
Received: by smtp.kernel.org (Postfix)
	id 17732C4CEF8; Wed,  3 Sep 2025 12:29:53 +0000 (UTC)
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 13D0FC4CEF0;
	Wed,  3 Sep 2025 12:29:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 13D0FC4CEF0
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=sntech.de
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:In-Reply-To:References;
	bh=z/iJHAwqup1jimrIJd7Pc539FvMqXKAbdRBHlv8G210=; b=z3xbhbH6YfVaTYzqFKQ68s21fm
	YNxMReW+HBzD5ha0264GFI5M2fsc9gxjjiCDU/L7tcsNpO/3Ir/OA7Ttvg8mBpF/E6G9iGNlVK5Gf
	Oi4jUhx/6VcW/eORD5uRoDjwQa4Ok87g5qqGR64UwbYKFNFEMsM8PcWDm1NRFfsBX2DHmNo6ur02l
	m7WOFUDGzJvgAThCndaCdgSwGL4J1OuTyvDpaGU1D1QvePaVF9yiAxel+Tr36O73W6n+TS/UyFYI0
	A53CVj6nx8HIiH7VjABlnoKsJjFV8uUZEXxA5iQhzpScM6Tn2sxenovuSN3/W9TruUktIJpDgZZ2O
	V6lKYUYQ==;
Received: from [213.70.40.217] (helo=phil.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1utmcY-0001kC-4c; Wed, 03 Sep 2025 14:29:50 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: arm@kernel.org
Cc: soc@kernel.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] Rockchip dts fixes for 6.17 #1
Date: Wed, 03 Sep 2025 14:29:49 +0200
Message-ID: <5909239.Y6S9NjorxK@phil>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"

Hi Arnd, Kevin, Olof,

please find a below some Rockchip fixes for the current 6.17 release-cycle.

Please pull

Thanks
Heiko


The following changes since commit 8f5ae30d69d7543eee0d70083daf4de8fe15d585:

  Linux 6.17-rc1 (2025-08-10 19:41:16 +0300)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git tags/v6.17-rockchip-dtsfixes1

for you to fetch changes up to dcc6785caffad27f2ea601fdd2f9782036e1faed:

  arm64: dts: rockchip: fix second M.2 slot on ROCK 5T (2025-09-02 08:31:50 +0200)

----------------------------------------------------------------
The newly added Rock 5T board needed slightly bigger fixes to make the
PCIe and USB actually work, because the PCIe does share its lanes between
two ports and the usb needs to toggle a gpio to supply power.

The other interesting fix is the headphone detection on the Orange Pi 5+.

The rest are some added supplies to make the boot log less scary and a
number of styling fixes.

----------------------------------------------------------------
Chen-Yu Tsai (1):
      arm64: dts: rockchip: Add supplies for eMMC on rk3588-orangepi-5

Chukun Pan (1):
      arm64: dts: rockchip: mark eeprom as read-only for Radxa E52C

Kaison Deng (1):
      arm64: dts: rockchip: fix es8388 address on rk3588s-roc-pc

Krzysztof Kozlowski (3):
      ARM: dts: rockchip: Minor whitespace cleanup
      arm64: dts: rockchip: Minor whitespace cleanup
      arm64: dts: rockchip: Fix Bluetooth interrupts flag on Neardi LBA3368

Maud Spierings (1):
      arm64: dts: rockchip: Fix the headphone detection on the orangepi 5 plus

Nicolas Frattaroli (2):
      arm64: dts: rockchip: fix USB on RADXA ROCK 5T
      arm64: dts: rockchip: fix second M.2 slot on ROCK 5T

Peter Robinson (2):
      arm64: dts: rockchip: Add vcc-supply to SPI flash on rk3399-pinebook-pro
      arm64: dts: rockchip: Add vcc-supply to SPI flash on Pinephone Pro

Sebastian Reichel (1):
      arm64: dts: rockchip: correct network description on Sige5

 arch/arm/boot/dts/rockchip/rk3128-xpi-3128.dts     |  2 +-
 arch/arm/boot/dts/rockchip/rv1109-relfor-saib.dts  |  6 ++--
 arch/arm64/boot/dts/rockchip/px30-pp1516.dtsi      |  8 ++---
 .../rockchip/px30-ringneck-haikou-video-demo.dtso  |  6 ++--
 .../boot/dts/rockchip/rk3308-sakurapi-rk3308b.dts  |  2 +-
 arch/arm64/boot/dts/rockchip/rk3368-lba3368.dts    |  2 +-
 .../boot/dts/rockchip/rk3399-pinebook-pro.dts      |  1 +
 .../boot/dts/rockchip/rk3399-pinephone-pro.dts     |  1 +
 .../rockchip/rk3399-puma-haikou-video-demo.dtso    |  6 ++--
 .../boot/dts/rockchip/rk3566-bigtreetech-cb2.dtsi  |  4 +--
 .../boot/dts/rockchip/rk3576-armsom-sige5.dts      |  5 +---
 arch/arm64/boot/dts/rockchip/rk3582-radxa-e52c.dts |  1 +
 .../boot/dts/rockchip/rk3588-orangepi-5-plus.dts   |  2 +-
 .../arm64/boot/dts/rockchip/rk3588-orangepi-5.dtsi |  2 ++
 arch/arm64/boot/dts/rockchip/rk3588-rock-5t.dts    | 35 ++++++++++++++++++++++
 arch/arm64/boot/dts/rockchip/rk3588j.dtsi          |  4 +--
 arch/arm64/boot/dts/rockchip/rk3588s-roc-pc.dts    |  4 +--
 17 files changed, 64 insertions(+), 27 deletions(-)



