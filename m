Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67D5A23A9AC
	for <soc@lists.linux.dev>; Thu, 13 Feb 2025 21:21:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739481705; cv=none; b=JSqbz7eH4fK2nPLelv6T/lkvO1WUYmCfKpYX1hBBSqWveO2BusyvRVGjxHn9sUmxOHumXSmWzjBPPPy1kxG33GiQpaYKblFuVHzIiztBTWepRoWlJ56hUR663zVb9DUQuqLGg6hslOaEPQRrmBoFBBYMonTAbK6BgEaZxYsi0mQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739481705; c=relaxed/simple;
	bh=OyaD1dq3+0aeOghqNTpyiGlINDSJlJcEwyWYYfERxdA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=H6rGedBjAoSMKlpdZoiu68p71MzvUD/fM9aBpP59C6XdLScZdUzzUswPJ/ILN3fn0/OVA7bzEAfPlC2RgQ6TPmvCq9JxwFyQcKnVRpc3MBw6r4ud1CR47QrNZsrK2lvRO1ccc6OI4r8MckYhasRG9YpfeKoqhUtSiYb5SKh3XPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=vyZw3DCp; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="vyZw3DCp"
Received: by smtp.kernel.org (Postfix)
	id C7046C4CEE6; Thu, 13 Feb 2025 21:21:44 +0000 (UTC)
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id E6010C4CED1;
	Thu, 13 Feb 2025 21:21:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org E6010C4CED1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=sntech.de
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=AAzGpmQaLH7sVclaZm3nGvic6C3AJbqc+WlMSefsOAw=; b=vyZw3DCpxWNkwL091vItEM+22M
	UXlSTnznfZkHIUA0IPp4tLhY0gTIaiwFIcxizxaDmumUHi9rKvSfJRJAp5C9xbscr5WNCg7Tjkc83
	Ii79BJBYzDa8oZ0Sv9j6c26DQJ4hMoqL63fwBTrTy7g72EPPq9WazoU8+eI/1iCc4VYxCnO6DAR/c
	rLZuFmlc7GNtQ4Rsiqgyf8hto/shVd8fmmpaHVP6sPNf93Z17wIrOt48qKGn41Zxqz6zSTF0wbyHV
	mUWtnYOuQtsNLWE3nWOrsfF8w3z9t9w+7GWTZglJUf7U8suVFNcqr4yZFUlyZ7s6LqTT8+SAquz02
	hHi/C91w==;
Received: from i53875bc0.versanet.de ([83.135.91.192] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1tigeT-0006eG-VR; Thu, 13 Feb 2025 22:21:42 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: arm@kernel.org
Cc: soc@kernel.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] Rockchip dts fixes for 6.14 #1
Date: Thu, 13 Feb 2025 22:21:41 +0100
Message-ID: <3004814.3ZeAukHxDK@diego>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"

Hi Arnd, Kevin, Olof,

please find a below some fixes for the current release 6.14 cycle.

Please pull

Thanks
Heiko


The following changes since commit 2014c95afecee3e76ca4a56956a936e23283f05b:

  Linux 6.14-rc1 (2025-02-02 15:39:26 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git tags/v6.14-rockchip-dtsfixes1

for you to fetch changes up to 8546cfd08aa4b982acd2357403a1f15495d622ec:

  arm64: dts: rockchip: adjust SMMU interrupt type on rk3588 (2025-02-11 21:28:13 +0100)

----------------------------------------------------------------
Fixes for the IOMMU used together with the PCIe controllers on rk3588,
some board-level fixes for wrong pins, pinctrl and regulators, and
disabling DMA on a board where the DMA+uart causes the dma controller to
hang, as well as improved network stability for the OrangePi R1.

----------------------------------------------------------------
Alexander Shiyan (1):
      arm64: dts: rockchip: Fix broken tsadc pinctrl names for rk3588

Andy Yan (1):
      arm64: dts: rockchip: Fix lcdpwr_en pin for Cool Pi GenBook

Heiko Stuebner (1):
      arm64: dts: rockchip: fix fixed-regulator renames on rk3399-gru devices

Lukasz Czechowski (2):
      arm64: dts: rockchip: Move uart5 pin configuration to px30 ringneck SoM
      arm64: dts: rockchip: Disable DMA for uart5 on px30-ringneck

Niklas Cassel (1):
      arm64: dts: rockchip: disable IOMMU when running rk3588 in PCIe endpoint mode

Patrick Wildt (1):
      arm64: dts: rockchip: adjust SMMU interrupt type on rk3588

Rob Herring (Arm) (1):
      dt-bindings: rockchip: pmu: Ensure all properties are defined

Tianling Shen (1):
      arm64: dts: rockchip: change eth phy mode to rgmii-id for orangepi r1 plus lts

 .../devicetree/bindings/arm/rockchip/pmu.yaml      |  8 +++++++-
 .../boot/dts/rockchip/px30-ringneck-haikou.dts     |  1 -
 arch/arm64/boot/dts/rockchip/px30-ringneck.dtsi    |  6 ++++++
 .../dts/rockchip/rk3328-orangepi-r1-plus-lts.dts   |  3 +--
 .../boot/dts/rockchip/rk3328-orangepi-r1-plus.dts  |  1 +
 .../boot/dts/rockchip/rk3328-orangepi-r1-plus.dtsi |  1 -
 .../boot/dts/rockchip/rk3399-gru-chromebook.dtsi   |  8 ++++----
 .../boot/dts/rockchip/rk3399-gru-scarlet.dtsi      |  6 +++---
 arch/arm64/boot/dts/rockchip/rk3399-gru.dtsi       | 22 +++++++++++-----------
 arch/arm64/boot/dts/rockchip/rk3588-base.dtsi      | 22 +++++++++++-----------
 .../dts/rockchip/rk3588-coolpi-cm5-genbook.dts     |  4 ++--
 arch/arm64/boot/dts/rockchip/rk3588-extra.dtsi     |  1 -
 .../boot/dts/rockchip/rk3588-rock-5b-pcie-ep.dtso  |  4 ++++
 13 files changed, 50 insertions(+), 37 deletions(-)



