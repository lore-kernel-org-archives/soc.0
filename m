Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A87E538F954
	for <soc@lists.linux.dev>; Tue, 13 Jan 2026 13:45:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768311927; cv=none; b=PBQ5ZYeU72NxGgcx+ckSIKAkruPj5ZMT7NDFPBWH7KZehSBw/wItxnK2E1X92bLJqp+RfW01qo2xURm5kgh7YVJPKbHVEDjFtnuDfr0id3pI3ZDohLD+m34lLMkX6NaYjo9RHrYMJeQmcc6kQpBZMhssc82rubA0LDPbrIc6xvY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768311927; c=relaxed/simple;
	bh=oCyzcc3/2OXo4YNHLo/WWy7jF7iIH8fIoG2FeZg8Cu4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=rpB9zkRH8FqHnbb5nuWYuw2q5Uk/oSjW2nRMu028KCYMklp6Dcu/M1VUgPWXQSLMHYiJRNaBt0llfq8JE1rMo9BbHlS6F5kMXTKcu39OMleupC2I9+XGcAC7VK3nPuEG/1Y1x1EM0XeopTPIou5IpU814JemRio5AUESPZdYFGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=STMTjWpc; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="STMTjWpc"
Received: by smtp.kernel.org (Postfix)
	id 5D753C19422; Tue, 13 Jan 2026 13:45:27 +0000 (UTC)
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 04E59C16AAE;
	Tue, 13 Jan 2026 13:45:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 04E59C16AAE
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=sntech.de
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:In-Reply-To:References;
	bh=z9jDZ0U0+KANI9tzxxMG4W2Nc4jLJjawz7bwnY2eJ5s=; b=STMTjWpcsiXuITptpYSE5yDqcO
	CkMuO18H8U83fVn6n07DAR44pONJDLGyfu9vUEmMV8q5+O4ZSNf8xyim8lOd1+XUiHB/W/4q6Q21B
	kGuZLdV5YS5znOqxwVKcbobtJkPNHmAYp+wwb4SnVsDiTLZR8xXD5qRtERYWJ8HQLJuID5oWLDRSc
	vgmHHds4xJauYOoDtj17f7GXq1PC+sVLJdLeg+WDCIJ01yGafTFgPGxSnJlQ6ChZUW6W966QVjard
	rwVF1m8Ypeh42dqDjvfjQkE4hGVKAHxFQlLHWTDh024SJZTRtPt4QllezzE8H2X9fT/zlEPdHSHpy
	9J7iqiww==;
Received: from i53875b63.versanet.de ([83.135.91.99] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1vfei2-00275y-6i; Tue, 13 Jan 2026 14:45:22 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: arm@kernel.org
Cc: soc@kernel.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] Rockchip dts fixes for 6.19 #1
Date: Tue, 13 Jan 2026 14:45:22 +0100
Message-ID: <17171017.hlxOUv9cDv@diego>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"

Hi SoC maintainers,

please find a below some Rockchip fixes for the current 6.19 release-cycle.

Please pull

Thanks
Heiko


The following changes since commit 8f0b4cce4481fb22653697cced8d0d04027cb1e8:

  Linux 6.19-rc1 (2025-12-14 16:05:07 +1200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git tags/v6.19-rockchip-dtsfixes1

for you to fetch changes up to 56e7cc8dadf91cd2164e5d6dac9258f448d50182:

  arm64: dts: rockchip: Drop unsupported properties (2026-01-09 20:50:14 +0100)

----------------------------------------------------------------
In terms of bigger fixes, RK3576 GPU register range was overflowing into
the next peripheral, Nano Pi M5 sound was not working correctly, the
adc-keys voltage levels for 2 buttons on the Pinephone Pro were wrong
and a really wrong PCIe linkspeed was removed from helios64.

Apart from that there are a number of dt-cleanlieness fixes.

----------------------------------------------------------------
Alexey Charkov (2):
      arm64: dts: rockchip: Fix headphones widget name on NanoPi M5
      arm64: dts: rockchip: Configure MCLK for analog sound on NanoPi M5

Chaoyi Chen (1):
      arm64: dts: rockchip: Fix wrong register range of rk3576 gpu

Geraldo Nascimento (2):
      arm64: dts: rockchip: remove dangerous max-link-speed from helios64
      arm64: dts: rockchip: remove redundant max-link-speed from nanopi-r4s

Krzysztof Kozlowski (1):
      arm64: dts: rockchip: Fix wifi interrupts flag on Sakura Pi RK3308B

Ondrej Jirman (1):
      arm64: dts: rockchip: Fix voltage threshold for volume keys for Pinephone Pro

Quentin Schulz (1):
      arm64: dts: rockchip: fix unit-address for RK3588 NPU's core1 and core2's IOMMU

Rob Herring (Arm) (4):
      arm64: dts: rockchip: Drop "sitronix,st7789v" fallback compatible from rk3568-wolfvision
      arm64: dts: rockchip: Fix pinctrl property typo on rk3326-odroid-go3
      arm64: dts: rockchip: Fix gpio pinctrl node names
      arm64: dts: rockchip: Drop unsupported properties

 arch/arm64/boot/dts/rockchip/rk3308-sakurapi-rk3308b.dts     |  2 +-
 arch/arm64/boot/dts/rockchip/rk3326-odroid-go3.dts           |  3 ++-
 arch/arm64/boot/dts/rockchip/rk3399-kobol-helios64.dts       |  2 --
 arch/arm64/boot/dts/rockchip/rk3399-nanopi-r4s.dtsi          |  1 -
 arch/arm64/boot/dts/rockchip/rk3399-pinebook-pro.dts         |  1 -
 arch/arm64/boot/dts/rockchip/rk3399-pinephone-pro.dts        |  4 ++--
 arch/arm64/boot/dts/rockchip/rk3399-puma.dtsi                |  2 +-
 arch/arm64/boot/dts/rockchip/rk3399-rock-4c-plus.dts         |  4 ++--
 .../boot/dts/rockchip/rk3568-wolfvision-pf5-display-vz.dtso  |  3 +--
 arch/arm64/boot/dts/rockchip/rk3576-nanopi-m5.dts            | 12 ++++++++----
 arch/arm64/boot/dts/rockchip/rk3576.dtsi                     |  2 +-
 arch/arm64/boot/dts/rockchip/rk3588-base.dtsi                |  4 ++--
 12 files changed, 20 insertions(+), 20 deletions(-)



