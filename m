Return-Path: <SRS0=NLmV=AI=sntech.de=heiko@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14202C77B75
	for <soc@archiver.kernel.org>; Mon, 17 Apr 2023 23:45:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id D2318C4339B; Mon, 17 Apr 2023 23:45:10 +0000 (UTC)
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 303F2C433EF;
	Mon, 17 Apr 2023 23:45:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 303F2C433EF
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=sntech.de
Received: from [77.22.52.211] (helo=phil.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1poYWv-0007Z8-PY; Tue, 18 Apr 2023 01:45:05 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: arm@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] Rockchip dts64 changes for 6.4 #2
Date: Tue, 18 Apr 2023 01:45:05 +0200
Message-ID: <5144826.MHq7AAxBmi@phil>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Arnd, Kevin, Olof,

some smallish things for 64bit Rockchip SoCs came up after the first
pull request. Nothing earth shattering, but if there is still time for
it, it would be cool if this could make it in for 6.4 .

Otherwise I'll rebase these changes for 6.5.

So if it's still possible, please pull.

Thanks
Heiko


The following changes since commit 07099a551803e05d3ee42fae152bf404f8dc21f9:

  arm64: dts: rockchip: correct panel supplies on Odroid Go Super (2023-04-05 19:39:39 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git tags/v6.4-rockchip-dts64-2

for you to fetch changes up to d3150ed535805403291b95fd84b00b0b5ef41096:

  arm64: dts: rockchip: Add support for volume keys to rk3399-pinephone-pro (2023-04-18 00:40:49 +0200)

----------------------------------------------------------------
On the Rock5b a fix the newly added rtc node and cpu-regulators for the big
cluster. Volume-keys (via adc) for the Pinephone Pro, display support for
the Anbernic RG353. As well as gpio-ranges for rk356x and fixes for the
audio-codec node-names on two boards.

----------------------------------------------------------------
Chris Morgan (1):
      arm64: dts: rockchip: add panel to Anbernic RG353 series

Cristian Ciocaltea (3):
      arm64: dts: rockchip: Drop RTC clock-frequency on rk3588-rock-5b
      arm64: dts: rockchip: Use generic name for es8316 on Pinebook Pro and Rock 5B
      arm64: dts: rockchip: Add vdd_cpu_big regulators to rk3588-rock-5b

John Clark (1):
      arm64: dts: rockchip: Add pinctrl gpio-ranges for rk356x

Ondrej Jirman (1):
      arm64: dts: rockchip: Add support for volume keys to rk3399-pinephone-pro

 .../boot/dts/rockchip/rk3399-pinebook-pro.dts      |  2 +-
 .../boot/dts/rockchip/rk3399-pinephone-pro.dts     | 26 ++++++++++
 .../boot/dts/rockchip/rk3566-anbernic-rg353x.dtsi  | 58 +++++++++++++++++++++
 arch/arm64/boot/dts/rockchip/rk356x.dtsi           |  5 ++
 arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dts    | 59 +++++++++++++++++++++-
 5 files changed, 147 insertions(+), 3 deletions(-)



