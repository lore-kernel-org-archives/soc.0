Return-Path: <SRS0=z6QC=UI=collabora.com=detlev.casanova@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49CCDC433EF
	for <soc@archiver.kernel.org>; Tue, 29 Mar 2022 14:15:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 04D27C34100; Tue, 29 Mar 2022 14:15:47 +0000 (UTC)
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id BF00FC340ED
	for <soc@kernel.org>; Tue, 29 Mar 2022 14:15:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org BF00FC340ED
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=collabora.com
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(Authenticated sender: detlev)
	with ESMTPSA id 991DA1F42771
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1648563344;
	bh=5aRdTY9mn+6seuvtEvgDqM56RNvxAnbftkZBjriJEqI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=F8mdCuycUxrdSjSd41Aze3+Lh/Jsq+jbbhbOrZo7Vbt/JYFgzzPnwgMJMzCOIp99+
	 /4LprH1FxYLGp/mqD4QruTap56GEykEuALeR+yaBDXuW3ngSyx5k2ftyFLooScqs1I
	 /l0uD87ybHTPcLkvqMVT0l+TcFx4GB9B05hAKgCogp0A9sKEKZXCqT6UFMTyRmfxJS
	 fSGSJw2uxnxiBzikGksduEL7/RsUbpmpQNJguol66uKW9eyYDn9DGEL2Apb9kGLieO
	 CIdXH3z4+KAfyEDExZZarQZhQCI8du+wqmzhpjMnNgfO3Zcxd13F6b6Wrz+QPms9Xs
	 ZXm0ysHvmvZXA==
From: Detlev Casanova <detlev.casanova@collabora.com>
To: linux-kernel@vger.kernel.org
List-Id: <soc.lore.kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, soc@kernel.org
Subject: Re: [RFC PATCH v2 0/3] ARM: dts: Support official Raspberry Pi 7inch touchscreen
Date: Tue, 29 Mar 2022 10:15:40 -0400
Message-ID: <11947259.O9o76ZdvQC@falcon9>
In-Reply-To: <20220221140117.90284-1-detlev.casanova@collabora.com>
References: <20220221140117.90284-1-detlev.casanova@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Monday, February 21, 2022 9:01:14 A.M. EDT Detlev Casanova wrote:
> Add a devicetree overlay to support the official Raspberry Pi 7inch
> touchscreen.
> 
> This also demuxes the i2c0 controller to support both pinctrls.
> 
> Changes in v2:
>  * The device tree in now an overlay
>  * The i2c demux patch is kept for now to have a working patch set. It has
>    not been merged yet in [1].
>  * The device tree overlay doesn't use fragments. It is working as is
>    but not enough literature was found to go one way or the other.
> 
> [1] https://www.spinics.net/lists/arm-kernel/msg944330.html
> 
> Detlev Casanova (3):
>   ARM: dts: bcm2*: Demux i2c0 with a pinctrl
>   of: Add support for -@ when compiling overlays
>   ARM: dto: Add bcm2711-rpi-7-inches-ts.dts overlay
> 
>  arch/arm/boot/dts/Makefile                    |   4 +
>  arch/arm/boot/dts/bcm2711-rpi-4-b.dts         |   1 +
>  arch/arm/boot/dts/bcm2711.dtsi                |   2 +-
>  arch/arm/boot/dts/bcm2835-rpi.dtsi            |   9 +-
>  .../boot/dts/bcm283x-rpi-i2c0mux_0_44.dtsi    |   4 +
>  arch/arm/boot/dts/bcm283x.dtsi                |  26 +++-
>  arch/arm/boot/dts/overlays/Makefile           |   3 +
>  .../dts/overlays/bcm2711-rpi-7-inches-ts.dts  | 125 ++++++++++++++++++
>  arch/arm64/boot/dts/broadcom/Makefile         |   4 +
>  .../arm64/boot/dts/broadcom/overlays/Makefile |   3 +
>  .../overlays/bcm2711-rpi-7-inches-ts.dts      |   2 +
>  drivers/of/Kconfig                            |   8 ++
>  scripts/Makefile.lib                          |   9 +-
>  13 files changed, 193 insertions(+), 7 deletions(-)
>  create mode 100644 arch/arm/boot/dts/bcm283x-rpi-i2c0mux_0_44.dtsi
>  create mode 100644 arch/arm/boot/dts/overlays/Makefile
>  create mode 100644 arch/arm/boot/dts/overlays/bcm2711-rpi-7-inches-ts.dts
>  create mode 100644 arch/arm64/boot/dts/broadcom/overlays/Makefile
>  create mode 100644
> arch/arm64/boot/dts/broadcom/overlays/bcm2711-rpi-7-inches-ts.dts

Hello,

Any comments on this ?

Regards,

Detlev.


