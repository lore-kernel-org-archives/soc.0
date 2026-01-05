Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CD05324705
	for <soc@lists.linux.dev>; Mon,  5 Jan 2026 04:49:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.29.241.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767588551; cv=none; b=oWLURoxnd1fqof/41cnnqej62sbi/OCkvYTXo6YIMvonoygQ2BqRjhiMiyJsiKjiEFkKKgmFzBcbLVMZw1EZ2xJz+YOl7ztT0pvOysImpPEekOKRqrVNdWs7rEsw+jN3dlw8TLjHIAGDksxvqnyEg7hNoZKFabC2NdM19ve641o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767588551; c=relaxed/simple;
	bh=OM3ypW6uGj9VdTvmzEx5hWEBnqV+Na13N1Qjivzzm38=;
	h=Message-ID:Subject:From:To:Cc:Date:Content-Type:MIME-Version; b=P69pgXgVaRDjt5SJVBgGEb/YER+SvPz4orMd2/9tGRW341YJANL9LOvQVoXZaH/PcF9NAh3Udtr7jy+0uxk5CSKlHe4qjKZUaiLDtfddn9D11KbsjxmzztfLqt4PK889APLe+8PnVrj6PbhT7/zblgw82DoUjVL6x6N66VdtgGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; spf=pass smtp.mailfrom=codeconstruct.com.au; dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b=m03LK9lh; arc=none smtp.client-ip=203.29.241.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b="m03LK9lh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1767588067;
	bh=tSnwqQ4DEG5Xd/QNiEqxoVCY2/oYuSe+axqra58I6ko=;
	h=Subject:From:To:Cc:Date;
	b=m03LK9lhp4zWDB6gJBtFLHzjJ5LzZfmvgtajryyBo+CFzyqXiXNm0e1ajCeqjHO71
	 iwH7I5qkN0I2LgxDy7gu7rzhKb9AVCCTzj2ijJdmAjI/l6TdfyCT4mBIwIUgpUij1t
	 Iy/4yN1B3Q+AOL8awvYxQNWHo6653S9Q70rohj/obfHP6FoJVlucR2bv5bcU2V43wp
	 xCjhBnBzOMJyKNMgJ2A4C9BrFF9HbZ4ZDP0JyrGXEucAjJ6Yqv4nUzz1HYreZKpjhn
	 VqFpoeG+PSbfKcGxK09n4pwHQcepK3xnMPcuVzxGpa03exudol54CAv8WvVP1BnLKu
	 WnTmw6V0TacjQ==
Received: from [192.168.68.115] (unknown [180.150.112.60])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 8B88B7C1B2;
	Mon,  5 Jan 2026 12:41:04 +0800 (AWST)
Message-ID: <4ab756729c4e26f7e544156c8613e839a9a9bebe.camel@codeconstruct.com.au>
Subject: [GIT PULL] aspeed: first batch of devicetree changes for 6.20
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: soc <soc@lists.linux.dev>
Cc: linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org, Joel Stanley <joel@jms.id.au>
Date: Mon, 05 Jan 2026 15:11:03 +1030
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

The following changes since commit 8f0b4cce4481fb22653697cced8d0d04027cb1e8=
:

  Linux 6.19-rc1 (2025-12-14 16:05:07 +1200)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/bmc/linux.git tags/aspeed=
-6.20-devicetree-0

for you to fetch changes up to 459a5aa171c0f13fcd78faa9594dc4aa5a95770b:

  ARM: dts: aspeed: bletchley: Fix ADC vref property names (2025-12-17 15:5=
3:31 +1030)

----------------------------------------------------------------
First batch of ASPEED Arm devicetree changes for 6.20

New platforms:

- NVIDIA MSX4 BMC

  The NVIDIA MSX4 HPM (host platform module) is a reference board for
  managing up to 8 PCIe connected NVIDIA GPUs via ConnectX-8 (CX8)
  SuperNICs. The BMC manages all GPUs and CX8s for both telemetry and
  firmware update via MCTP over USB. The host CPUs are dual socket Intel
  Granite Rapids processors.

  For more detail on this architecture:

  https://developer.nvidia.com/blog/nvidia-connectx-8-supernics-advance-ai-=
platform-architecture-with-pcie-gen6-connectivity/

Updated platforms:

- ast2600-evb (ASPEED): Various tidy-ups to address binding warnings
- bletchley (Meta): Watchdog fix, tidy-ups to address binding warnings
- clemente (Meta): HDD LED fix, GPIO line names, EEPROMs
- harma (Meta): fanboard presence GPIO
- santabarbara (Meta): IPMB, GPIO line names, additional IO expander

----------------------------------------------------------------
Alex Wang (1):
      ARM: dts: aspeed: clemente: move hdd_led to its own gpio-leds group

Andrew Jeffery (6):
      ARM: dts: aspeed: Remove sdhci-drive-type property from AST2600 EVB
      ARM: dts: aspeed: Use specified wp-inverted property for AST2600 EVB
      ARM: dts: aspeed: Drop syscon compatible from EDAC in g6 dtsi
      ARM: dts: aspeed: g6: Drop unspecified aspeed,ast2600-udma node
      ARM: dts: aspeed: ast2600-evb: Tidy up A0 work-around for UART5
      ARM: dts: aspeed: g6: Drop clocks property from arm,armv7-timer

Cosmo Chou (6):
      ARM: dts: aspeed: bletchley: remove WDTRST1 assertion from wdt1
      ARM: dts: aspeed: bletchley: Use generic node names
      ARM: dts: aspeed: bletchley: Fix SPI GPIO property names
      ARM: dts: aspeed: bletchley: Remove unused pca9539 properties
      ARM: dts: aspeed: bletchley: Remove unused i2c13 property
      ARM: dts: aspeed: bletchley: Fix ADC vref property names

Daniel Hsu (1):
      ARM: dts: aspeed: harma: add fanboard presence sgpio

Fred Chen (2):
      ARM: dts: aspeed: santabarbara: Add swb IO expander and gpio line nam=
es
      ARM: dts: aspeed: santabarbara: Enable ipmb device for OCP debug card

Kimi Chen (1):
      ARM: dts: aspeed: clemente: add gpio line name to io expander

Leo Wang (1):
      ARM: dts: aspeed: clemente: Add EEPROMs for boot and data drive FRUs

Marc Olberding (2):
      dt-bindings: arm: aspeed: Add NVIDIA MSX4 board
      ARM: dts: aspeed: Add NVIDIA MSX4 HPM

 Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml      |   1 +
 arch/arm/boot/dts/aspeed/Makefile                             |   1 +
 arch/arm/boot/dts/aspeed/aspeed-ast2600-evb.dts               |   7 +++---=
-
 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-bletchley.dts    | 106 ++++++=
++++++++++++++++++++++++++++++++++++++++++++++++---------------------------=
-------------------------
 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-clemente.dts     |  43 ++++++=
+++++++++++++++++++++++++++++++------
 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts        |   8 ++++++=
--
 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-santabarbara.dts |  29 ++++++=
+++++++++++++++++++----
 arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-msx4-bmc.dts       | 246 ++++++=
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++=
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++=
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++=
+++++++++++++++
 arch/arm/boot/dts/aspeed/aspeed-g6.dtsi                       |  12 +-----=
------
 9 files changed, 374 insertions(+), 79 deletions(-)
 create mode 100644 arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-msx4-bmc.dts

