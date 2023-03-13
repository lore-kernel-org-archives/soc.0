Return-Path: <SRS0=VHqc=7F=t-8ch.de=thomas@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D25A4C6FD19
	for <soc@archiver.kernel.org>; Mon, 13 Mar 2023 00:01:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 907F1C4339B; Mon, 13 Mar 2023 00:01:32 +0000 (UTC)
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 1336DC433EF;
	Mon, 13 Mar 2023 00:01:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 1336DC433EF
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=t-8ch.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=t-8ch.de
Date: Mon, 13 Mar 2023 00:01:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=t-8ch.de; s=mail;
	t=1678665687; bh=wxLpf8Jdf0lk2RvWY5sDFzQ0yrucDslEDAxZjcXQwvQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oh1GpygvP9tfgUVJOQp59jFcyft77uuDARurkyb8HATS/m1mO/ET8TXTPn4yzGDfj
	 33yKZLVDyglpXe0UQxjecpYMQtPJ54+w2/iiXLeHATSUvm4F0Zhgp8OS1XkbHQCoq5
	 1NRqtrhscTWAzLSHQzwDmjVWAVgs1Zy1e8HteeLA=
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas@t-8ch.de>
To: Andreas Kemnade <andreas@kemnade.info>
List-Id: <soc.lore.kernel.org>
Cc: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, arnd@arndb.de,
	olof@lixom.net, soc@kernel.org, shawnguo@kernel.org,
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
	linux-imx@nxp.com, marex@denx.de, max.krummenacher@toradex.com,
	leoyang.li@nxp.com, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/2] ARM: dts: imx: Add devicetree for Tolino Vison
Message-ID: <0d08c091-2923-43d8-bec1-86e9edf2ac57@t-8ch.de>
References: <20230312205236.2281466-1-andreas@kemnade.info>
 <20230312205236.2281466-3-andreas@kemnade.info>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230312205236.2281466-3-andreas@kemnade.info>

On Sun, Mar 12, 2023 at 09:52:36PM +0100, Andreas Kemnade wrote:
> This adds a devicetree for the Kobo Aura 2 Ebook reader. It is based
> on boards marked with "37NB-E60Q30+4A3". It is equipped with an i.MX6SL
> SoC.

Kobo Aura 2?

> Expected to work:
>  - Buttons
>  - Wifi
>  - LEDs
>  - uSD
>  - eMMC
>  - USB
>  - RTC
>  - Touchscreen
>  - Backlight
> 
> Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
> ---
>  arch/arm/boot/dts/Makefile                 |   1 +
>  arch/arm/boot/dts/imx6sl-tolino-vision.dts | 490 +++++++++++++++++++++
>  2 files changed, 491 insertions(+)
>  create mode 100644 arch/arm/boot/dts/imx6sl-tolino-vision.dts
