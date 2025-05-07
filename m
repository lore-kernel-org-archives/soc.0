Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5930224469B
	for <soc@lists.linux.dev>; Wed,  7 May 2025 22:05:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746655539; cv=none; b=WBp825mewc63iBvEcpwclo0y5JVFJmEe6UZGKfy7teKqTomPH/GS+Ynt9QFO+Q5ZC5zya2+2I1BIl4KJJaOYNTJlN3fEWtTgl8K6hPbn5+3fMvHLSgZHPjN2MNJO83f6lR2glYy4nAqDK4c6Wby/vIG2z2w+p9aZQPdy3/1k26s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746655539; c=relaxed/simple;
	bh=JXtbevkj63owt0sm3QTQpCIdzg1osS7zOKcTuyXdT9g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=ZUisRTmBJnfK6beIzTRRxT9LztzGeNQYW1RDTwpuzQIftlS9fwMXamA0ijBgi7o3rpbwFzqP/wpUAPyCW62lFDQkoKTsW5XvKjRwwJhSL/+FOlCmuQMwR8XWa2OFvYonVwRTtN20HGtbwRtm88nox3j5IHS/5LYML4PH9i/GcHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=srsu48tE; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="srsu48tE"
Received: by smtp.kernel.org (Postfix)
	id DB908C4CEE7; Wed,  7 May 2025 22:05:38 +0000 (UTC)
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 1CDEFC4CEE8;
	Wed,  7 May 2025 22:05:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 1CDEFC4CEE8
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=sntech.de
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References;
	bh=XOOW2EUAAkzOiMNrI7nZRykfkfumE4ulNre1oUwjw0k=; b=srsu48tEVyFTb/Ww1u/Fsaqklb
	FiffOd40xuLFHK5taN+NUczbm4B/RorVqeYpyXa6uFBK2Dvn+jg9kkOcoK+F3IBoAv1+dBQCqcgAl
	YUfrtEtrZuzff27EfxNBN1sWBQR6J3hZPzGUmrMxOmZHbSLDcyUlU0KIThbvKwdfU0hyW2pHPpUcI
	ffI5TmqUg6YjyZYks97r1+myjNybzl0rTd2oPZLv/uttWL2WpJQ2qreLXJMqF0thrE9XGZTn1QVeA
	JTMWlzCC2Tm358GfqL1X/ZArmyPYvskK9evEFe7uR1Z+g9WSIucQ55MD7ph+9FkjWY6VskTt1yh7u
	LA1qkblA==;
Received: from i53875a1d.versanet.de ([83.135.90.29] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uCmtQ-0001z2-33; Thu, 08 May 2025 00:05:32 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: arm@kernel.org
Cc: soc@kernel.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] Rockchip dts32 changes for 6.16 #1
Date: Thu, 08 May 2025 00:05:31 +0200
Message-ID: <22686731.EfDdHjke4D@diego>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"

The following changes since commit 0af2f6be1b4281385b618cb86ad946eded089ac8:

  Linux 6.15-rc1 (2025-04-06 13:11:33 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git tags/v6.16-rockchip-dts32-1

for you to fetch changes up to c895c32bf1ce90839fc525c5d23cbf867ebe519a:

  ARM: dts: rockchip: enable Mali gpu on rk3066 marsboard (2025-05-05 10:20:11 +0200)

----------------------------------------------------------------
Graphics support for the old rk3066-marsboard (hdmi + Mali400 gpu),
rk3036 improvements (mmc asliases, hdmi refclk), dropping of
redundant clock-latency props.

----------------------------------------------------------------
Andy Yan (3):
      ARM: dts: rockchip: Add aliases for rk3036-kylin MMC devices
      ARM: dts: rockchip: Add ref clk for hdmi
      Revert "ARM: dts: rockchip: drop grf reference from rk3036 hdmi"

Heiko Stuebner (2):
      ARM: dts: rockchip: enable hdmi on rk3066 marsboard
      ARM: dts: rockchip: enable Mali gpu on rk3066 marsboard

Rob Herring (Arm) (1):
      ARM: dts: rockchip: Drop redundant CPU "clock-latency"

 arch/arm/boot/dts/rockchip/rk3036-kylin.dts      |  6 ++++
 arch/arm/boot/dts/rockchip/rk3036.dtsi           |  5 ++--
 arch/arm/boot/dts/rockchip/rk3066a-marsboard.dts | 37 ++++++++++++++++++++++++
 arch/arm/boot/dts/rockchip/rk3128.dtsi           |  8 ++++-
 arch/arm/boot/dts/rockchip/rk3188.dtsi           |  1 -
 arch/arm/boot/dts/rockchip/rk322x.dtsi           |  1 -
 arch/arm/boot/dts/rockchip/rk3288.dtsi           |  5 +---
 arch/arm/boot/dts/rockchip/rv1108.dtsi           |  1 -
 8 files changed, 54 insertions(+), 10 deletions(-)



