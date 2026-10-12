Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE86225C804
	for <soc@lists.linux.dev>; Mon, 12 Oct 2026 10:20:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=100.103.45.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791800462; cv=pass; b=r1QleBnd4sRPDg+zviNxp+lxAZ0ibiD1bks9EUOl6zNbYaB456sI7bjPd8Q1OTBUTlb9MTQ76/psSeNpz7KPzqmpyYyVQ0D20cfQR96ePpiahQZmdG5QhMIl8bF2Z0KIwzTeeQF8RuQ6tzt9rGPoR/W4b6DHxNzjWJsxahsVI1E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791800462; c=relaxed/simple;
	bh=1a8OTHcpdPwb8gQhojKDlJ917XB1Oejsk+t5PVvmd7A=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=ckWh/qzi2JePvmHLVTJdzj3CHuiXcN8SpVxa2yfIe8yl52C9Wrh/Iri5upnhmYzlvA91Gl5kRW3uhWlg6Y/iyov9AcN2s6q7xsEfmCoM2zHI8nfOTNNUfTr0sSi4ME3iPKG1BfBat4Z9wsqTwT9gAFJOjgwMGt4/jVGccRqNIxM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=AP3JnuKH; arc=pass smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="AP3JnuKH"
Received: by smtp.kernel.org (Postfix)
	id 2334C1F0089C; Mon, 12 Oct 2026 10:20:42 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=185.11.138.130
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1791800442;
	b=B9jwN90DLi3wSmWz5jsej2GSp3s/zxvoahAdwrQ1OCbIhXj5L1a8kJmjonoLeHCm51wg
	 CRW5cdGuF5OLrzy1V592NFcJG+vnLlh6QSxJqQpGhbhVFhKpg6UxlK7YxMFwDjXnc6QB8
	 wrBZaZRbw8T6vuaW4ZxlvNsgSgbTSjhWca+ftYQ6iOiZtHW5nVBNGn5fNEq5s+dIc0DOG
	 iy7iUADxkf/TsEMW/1Tk+gGs3RoOeZ24BLg9XeR4lZHgnkJ5eXmZNOSdmcpgOf/SgSbZQ
	 XOZ1kQ+xhLe8kIfjHmdEi6xfy5Zv6w26u7HoRvzpqoCJ60nlB7AENOuSvMpBSu9Aa5g==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1791800442;
	h=DMARC-Filter:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:
	 MIME-Version:Content-Transfer-Encoding:Content-Type;
	bh=SLBCl332laY7zsY7WJDeYl95lbnGzbtwn7xkysuYFDY=;
	b=MGAwEv4mDoXaWL6epS9uQ6q3UkiQqzKoubASiNoI0PvvL5uno3Hfmfwx7IGDRYpWidcK
	 SnMR3+w29Q5UHNs9Nna+bjp7cmd2QD+N0u9U2jg22vw1C23IAnBTp406u8preaEC8IXHj
	 jXD3e1K8Myla/vfzMJw7QnO72IY6Ggj+al4vaFIgcTQn7btpMzm8dYFoZWHr5f9umM2Y1
	 XO3MUHQOH1/f5Jlltyqb6ksozm0wU01d1aK08qnm27Iyf9kpXbK95SB5zGCq21a0YZOlw
	 VYpbtut/Kx6rROle+4oMoPNnvTlVoaWgHyhAzlDJIRVo6g6rLTCUvMnJl8WVE+lr8Ew==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256 header.s=gloria202408 header.b=AP3JnuKH;
	dmarc=pass header.from=sntech.de;
	spf=pass smtp.mailfrom=sntech.de;
	arc=none smtp.remote-ip=185.11.138.130
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id C138E1F0089B;
	Mon, 12 Oct 2026 10:20:40 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256 header.s=gloria202408 header.b=AP3JnuKH
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org C138E1F0089B
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=sntech.de
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:In-Reply-To:References;
	bh=SLBCl332laY7zsY7WJDeYl95lbnGzbtwn7xkysuYFDY=; b=AP3JnuKHpnMXLw5lodkNehn9nC
	3KSJ7dp/QPaqGJXpGcCJcbH7yMxZeEHQYZO1VMMG+qOR6xoGuOhGG8CxnY6EolSt2shvXolwR6+CO
	W1QEqY2ami7Z05VV2RZc744QwbNiaZuqMJymisc5GttqCtmavhM/6jhsA1NQV3TN8SH8TnR5pmPgM
	wh1poFKu1igGaX2bWQ3xI4SVT/M5edhmqNn4atYbAziflHCpfp52eYTZdJMFRRx1WdZugW2BJj624
	8r69CQ/yw2nzu0YyIp7l76toeTwvCo22wyfBqC7NBguoPoB7r2jX5T1pRVVwfHrr7/1BHFR2TkXBC
	Ayv9O/Hg==;
From: Heiko Stuebner <heiko@sntech.de>
To: arm@kernel.org
Cc: soc@kernel.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] Rockchip dts64 changes for 7.4 #3
Date: Mon, 12 Oct 2026 12:20:30 +0200
Message-ID: <2330337.ZfL8zNpBrT@phil>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"

Hi soc maintainers,

please find below some more Rockchip dt changes for arm64
for the next merge window.

Please pull.

Thanks
Heiko


The following changes since commit fa932a9b632ff0d80390b940e6aabe38ac305fe1:

  arm64: dts: rockchip: Add MangoPi M28K (2026-10-01 00:22:48 +0200)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git tags/v7.4-rockchip-dts64-3

for you to fetch changes up to ae965b9856f033145e292b0c29082a26bcc45efd:

  arm64: dts: rockchip: Add Radxa E54C (2026-10-10 14:04:34 +0200)

----------------------------------------------------------------
New boards: Radxa E54C using the RK3582 (a production variant of the
RK3588 where probably defective cores and gpus get disabled),
DP-carrier for the RK3588-tiger SoM, NanoPi M6

Interesting new peripherals: DPHY, CSI-2 and VICAP on RK3576 so all 3
bigger current-gen SoCs (RK3568, RK3576, RK3588) can now receive camera
data - yay.

Apart from that a rename of the hdmi-audio-cards to allow actual alsa
profiles to bind to something actually sane; and the regular bunch of
board-specific peripheral enablement/fixes.

----------------------------------------------------------------
Amin Gattout (5):
      dt-bindings: soc: rockchip: add rk3576 csidphy grf syscon
      arm64: dts: rockchip: add csi dphy nodes to rk3576
      arm64: dts: rockchip: add mipi csi-2 receiver nodes to rk3576
      arm64: dts: rockchip: add vicap node to rk3576
      arm64: dts: rockchip: add radxa camera 4k on rock 4d

Chukun Pan (5):
      arm64: dts: rockchip: fix adc button voltage on Radxa E52C
      arm64: dts: rockchip: enable NPU on Radxa E52C
      arm64: dts: rockchip: remove FRL GPIO for 100ASK DshanPi A1
      dt-bindings: arm: rockchip: Add Radxa E54C
      arm64: dts: rockchip: Add Radxa E54C

Dennis Gilmore (1):
      arm64: dts: rockchip: Use GPIO function for PCIe reset on Orange Pi 5 Pro

Detlev Casanova (5):
      arm64: dts: rockchip: Rename rk3328 HDMI audio card
      arm64: dts: rockchip: Rename rk3399 HDMI audio card
      arm64: dts: rockchip: Rename rk3566 and rk3568 HDMI audio cards
      arm64: dts: rockchip: Rename rk3576 HDMI audio card
      arm64: dts: rockchip: Rename rk3588 HDMI audio cards

Heiko Stuebner (2):
      dt-bindings: arm: rockchip: add RK3588 DP carrier from Theobroma Systems
      arm64: dts: rockchip: add RK3588 DP carrier from Theobroma Systems

Igor Velkov (2):
      arm64: dts: rockchip: Add buttons to Kobol Helios64
      arm64: dts: rockchip: Add the fan tachometers to Kobol Helios64

Joachim Eastwood (12):
      arm64: dts: rockchip: fix missing sdmmc cd pinctrl on rk3588s-nanopi-r6
      arm64: dts: rockchip: fix missing pcie rst pinctrl on rk3588s-nanopi-r6
      arm64: dts: rockchip: remove pull up on rtc int pin on rk3588s-nanopi-r6
      arm64: dts: rockchip: add pcie2x1l2 clkreq on rk3588s-nanopi-r6
      arm64: dts: rockchip: remove always-on and boot-on from vdd_npu_s0 reg on rk3588s-nanopi-r6
      arm64: dts: rockchip: remove useless vcc_3v3_pcie20 from rk3588s-nanopi-r6
      arm64: dts: rockchip: add gmac1 phy-supply to rk3588s-nanopi-r6
      arm64: dts: rockchip: remove bogus vcc5v0_usb regulator from rk3588s-nanopi-r6
      arm64: dts: rockchip: add comment about gmac phy-mode to rk3588s-nanopi-r6
      arm64: dts: rockchip: refactor rk3588s-nanopi-r6 to support M6 boards
      dt-bindings: arm: rockchip: add FriendlyElec NanoPi M6
      arm64: dts: rockchip: add support for NanoPi M6 board

Shawn Lin (2):
      arm64: dts: rockchip: add pcie30phy data-lanes on rk3588 coolpi-cm5-evb
      arm64: dts: rockchip: fix M.2 E-key reset pinctrl on rk3588 rock-5-itx

Yaozhong Li (3):
      arm64: dts: rockchip: fix analog headphone output on rk3399-firefly
      arm64: dts: rockchip: disable unused i2s0 on rk3399-firefly
      arm64: dts: rockchip: enable HDMI audio on rk3399-firefly

Youngwon Son (1):
      arm64: dts: rockchip: Enable the NPU on ODROID-M2

 .../devicetree/bindings/arm/rockchip.yaml          |   15 +-
 .../devicetree/bindings/soc/rockchip/grf.yaml      |    1 +
 arch/arm64/boot/dts/rockchip/Makefile              |    8 +
 arch/arm64/boot/dts/rockchip/rk3328.dtsi           |    2 +-
 arch/arm64/boot/dts/rockchip/rk3399-base.dtsi      |    2 +-
 arch/arm64/boot/dts/rockchip/rk3399-firefly.dts    |   36 +-
 .../boot/dts/rockchip/rk3399-kobol-helios64.dts    |   82 ++
 arch/arm64/boot/dts/rockchip/rk3566-base.dtsi      |    4 +
 arch/arm64/boot/dts/rockchip/rk3568.dtsi           |    4 +
 arch/arm64/boot/dts/rockchip/rk356x-base.dtsi      |    1 -
 .../boot/dts/rockchip/rk3576-100ask-dshanpi-a1.dts |    9 -
 .../dts/rockchip/rk3576-rock-4d-radxa-cam4k.dtso   |  105 ++
 arch/arm64/boot/dts/rockchip/rk3576.dtsi           |  172 ++-
 arch/arm64/boot/dts/rockchip/rk3582-radxa-e52c.dts |   38 +-
 arch/arm64/boot/dts/rockchip/rk3582-radxa-e54c.dts | 1172 ++++++++++++++++++++
 arch/arm64/boot/dts/rockchip/rk3588-base.dtsi      |    2 +-
 .../boot/dts/rockchip/rk3588-coolpi-cm5-evb.dts    |    1 +
 arch/arm64/boot/dts/rockchip/rk3588-extra.dtsi     |    2 +-
 arch/arm64/boot/dts/rockchip/rk3588-rock-5-itx.dts |    2 +-
 .../rockchip/rk3588-tiger-displayport-carrier.dts  |  110 ++
 .../arm64/boot/dts/rockchip/rk3588s-nanopi-m6.dtsi |  142 +++
 .../boot/dts/rockchip/rk3588s-nanopi-m6v1.dts      |   57 +
 .../arm64/boot/dts/rockchip/rk3588s-nanopi-r6.dtsi |  792 +------------
 arch/arm64/boot/dts/rockchip/rk3588s-nanopi.dtsi   |  797 +++++++++++++
 arch/arm64/boot/dts/rockchip/rk3588s-odroid-m2.dts |   36 +-
 .../boot/dts/rockchip/rk3588s-orangepi-5-pro.dts   |   14 +-
 26 files changed, 2777 insertions(+), 829 deletions(-)
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3576-rock-4d-radxa-cam4k.dtso
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3582-radxa-e54c.dts
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3588-tiger-displayport-carrier.dts
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3588s-nanopi-m6.dtsi
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3588s-nanopi-m6v1.dts
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3588s-nanopi.dtsi



