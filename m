Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EDB81DE2AA
	for <soc@lists.linux.dev>; Sat,  8 Mar 2025 17:39:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741455590; cv=none; b=MTLvG1c2zf12S2KxCDB7ZAb9kOnhMPAQPuj5SgjVq+4zfNfwdGOiqjpgjKJ5oDLoM6Yrx3INiW2swOzCIHfCyc5yhuowpleHQ8dImdsfL4fNkmuAB81jhe+LIipNJ+3cfX7xbMdT1/fBJdsbEzeiClqeBeu08zhc+ZmYEbL76sQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741455590; c=relaxed/simple;
	bh=byf8HBH0dWCW98Z4fIp5BZ8co/8YAfkX955US1kCgys=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=YBtOUr53iWKEO8zEJ1iCLSIOntwTWgTdT70oUrEbUXJbIeFDjMO/cl9MABXxfd8ZsvlEoT391X8Sja6u5MejMUaXcXA7QxpVoaTszsTywVVaOGlwBpO+V5v3qWp2RssVyHPmgo7+Y9v2gebLkxx6yIRKYV3VxnnBjc6/EM1fm+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=glu/xNwZ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="glu/xNwZ"
Received: by smtp.kernel.org (Postfix)
	id 820EBC4CEE8; Sat,  8 Mar 2025 17:39:49 +0000 (UTC)
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 25B8FC4CEE0;
	Sat,  8 Mar 2025 17:39:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 25B8FC4CEE0
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=sntech.de
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=nvOCa8TUyygxpNletdqlPdP/z6YHwnTBk1630GsnLOE=; b=glu/xNwZRkdSMG24w3s68Hzdcp
	/v/OW1lmXWMMD3XiDE2yGV15hWunopjVarggcOlr7Mylb1gHfCoDBB9ys4p3RELwzIHA4dg/ajj1H
	Gza2Y/YxnZyHPmig0ILUsRg9irZJQxfCtzSs6Gzpj8m2X+LMWUPLzu+a+2LPD1Lb7Us5MvlFP+15m
	G4Ly8wXqwuBDzHCHHp9Uga9vKWK6hl/cAM9qy5qSn9TVGnrM7xeha5eVCO8ZRp0DJ7Ha+dp48zcV3
	cv9jUDziFmqqLAXvhayxporqMqr/j/vlXI5J+hwEpf9Y/I4jfHdmRy59MClhkPa5T7paq9KBRh4hu
	0LKwnKJA==;
Received: from [194.95.143.137] (helo=phil.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1tqy9K-0004cY-FI; Sat, 08 Mar 2025 18:39:46 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: arm@kernel.org
Cc: soc@kernel.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] Rockchip dts fixes for 6.14 #2
Date: Sat, 08 Mar 2025 18:39:45 +0100
Message-ID: <1990830.tdWV9SEqCh@phil>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"

Hi Arnd, Kevin, Olof,

please find a below some additional fixes for the current
release 6.14 cycle.


Please pull

Thanks
Heiko


The following changes since commit 8546cfd08aa4b982acd2357403a1f15495d622ec:

  arm64: dts: rockchip: adjust SMMU interrupt type on rk3588 (2025-02-11 21:28:13 +0100)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git tags/v6.14-rockchip-dtsfixes2

for you to fetch changes up to b36402e4a0772d1b3da06a4f5fbd1cfe4d6f1cc0:

  arm64: dts: rockchip: slow down emmc freq for rock 5 itx (2025-03-08 18:21:11 +0100)

----------------------------------------------------------------
A number of emmc fixes (removing CQE from Theobroma boards and slower
freq on Rock-5-ITX) as well as some pinmux fixes and missing supplies.

----------------------------------------------------------------
Dragan Simic (2):
      arm64: dts: rockchip: Add avdd HDMI supplies to RockPro64 board dtsi
      arm64: dts: rockchip: Add missing PCIe supplies to RockPro64 board dtsi

Heiko Stuebner (2):
      arm64: dts: rockchip: remove supports-cqe from rk3588 jaguar
      arm64: dts: rockchip: remove supports-cqe from rk3588 tiger

Jianfeng Liu (1):
      arm64: dts: rockchip: slow down emmc freq for rock 5 itx

Justin Klaassen (1):
      arm64: dts: rockchip: fix u2phy1_host status for NanoPi R4S

Quentin Schulz (2):
      arm64: dts: rockchip: fix pinmux of UART0 for PX30 Ringneck on Haikou
      arm64: dts: rockchip: fix pinmux of UART5 for PX30 Ringneck on Haikou

Yao Zi (1):
      arm64: dts: rockchip: Remove undocumented sdmmc property from lubancat-1

 arch/arm64/boot/dts/rockchip/px30-ringneck-haikou.dts | 12 ++++++++++++
 arch/arm64/boot/dts/rockchip/rk3399-nanopi-r4s.dtsi   |  2 +-
 arch/arm64/boot/dts/rockchip/rk3399-rockpro64.dtsi    | 14 ++++++++++++++
 arch/arm64/boot/dts/rockchip/rk3566-lubancat-1.dts    |  1 -
 arch/arm64/boot/dts/rockchip/rk3588-jaguar.dts        |  1 -
 arch/arm64/boot/dts/rockchip/rk3588-rock-5-itx.dts    |  3 +--
 arch/arm64/boot/dts/rockchip/rk3588-tiger.dtsi        |  1 -
 7 files changed, 28 insertions(+), 6 deletions(-)



