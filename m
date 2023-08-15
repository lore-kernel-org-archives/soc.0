Return-Path: <SRS0=wG93=EA=atomide.com=tony@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22286C001B0
	for <soc@archiver.kernel.org>; Tue, 15 Aug 2023 06:07:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id D6589C433C9; Tue, 15 Aug 2023 06:07:38 +0000 (UTC)
Received: from muru.com (muru.com [72.249.23.125])
	by smtp.kernel.org (Postfix) with ESMTP id AC55DC433C7;
	Tue, 15 Aug 2023 06:07:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org AC55DC433C7
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=atomide.com
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=atomide.com
Received: from localhost (localhost [127.0.0.1])
	by muru.com (Postfix) with ESMTPS id 7A8A180E0;
	Tue, 15 Aug 2023 06:07:30 +0000 (UTC)
Date: Tue, 15 Aug 2023 09:07:29 +0300
From: Tony Lindgren <tony@atomide.com>
To: Mark Brown <broonie@kernel.org>, Arnd Bergmann <arnd@arndb.de>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org, =?utf-8?Q?Beno=C3=AEt?= Cousson <bcousson@baylibre.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>, linux-omap@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RESEND] ARM: multi_v7_defconfig: Enable TLV320AIC3x
Message-ID: <20230815060729.GR11676@atomide.com>
References: <20230731-arm-tlv320aic31xx-config-v1-1-013c8c321dad@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230731-arm-tlv320aic31xx-config-v1-1-013c8c321dad@kernel.org>

Hi,

* Mark Brown <broonie@kernel.org> [230731 11:53]:
> A number of TI based platforms use TLV320AIC3x since it was their
> standard audio CODEC for quite some time, including the Beagle X15.
> Enable it multi_v7_defconfig to improve test coverage.
> 
> Signed-off-by: Mark Brown <broonie@kernel.org>

Looks like this is still pending, I don't have any defconfig changes to queue,
so I've added Arnd to Cc:

Reviewed-by: Tony Lindgren <tony@atomide.com>

> ---
>  arch/arm/configs/multi_v7_defconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi_v7_defconfig
> index f0800f806b5f..00e95220e08d 100644
> --- a/arch/arm/configs/multi_v7_defconfig
> +++ b/arch/arm/configs/multi_v7_defconfig
> @@ -825,6 +825,7 @@ CONFIG_SND_SOC_SGTL5000=m
>  CONFIG_SND_SOC_STI_SAS=m
>  CONFIG_SND_SOC_TLV320AIC32X4=m
>  CONFIG_SND_SOC_TLV320AIC32X4_I2C=m
> +CONFIG_SND_SOC_TLV320AIC3X_I2C=m
>  CONFIG_SND_SOC_WM8960=m
>  CONFIG_SND_SOC_WM8962=m
>  CONFIG_SND_SOC_WM8978=m
> 
> ---
> base-commit: 06c2afb862f9da8dc5efa4b6076a0e48c3fbaaa5
> change-id: 20230707-arm-tlv320aic31xx-config-f52a886647db
> 
> Best regards,
> -- 
> Mark Brown <broonie@kernel.org>
> 
