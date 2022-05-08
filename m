Return-Path: <SRS0=N901=VQ=bgdev.pl=brgl@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB583C433F5
	for <soc@archiver.kernel.org>; Sun,  8 May 2022 11:06:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 78FBBC385B0; Sun,  8 May 2022 11:06:35 +0000 (UTC)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 89F8FC385AC
	for <soc@kernel.org>; Sun,  8 May 2022 11:06:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 89F8FC385AC
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-ej1-f45.google.com with SMTP id i27so21883398ejd.9
        for <soc@kernel.org>; Sun, 08 May 2022 04:06:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=dH1QqkvJ5bsPVWYXR29sustQxigKfwCpsF7xSRdx28Q=;
        b=oEO4rm6U6hwQKGu7Sm1VYFbTgV9TGMlmlHFmdgOIjtkTJCHmdAPOHz9H9ejGohKivb
         zv6DQsUP+ZGT+3qA3CRNHErYwJdxbrCTsEHuEPd8ean8e5f61gh7GSfB2cAhpK3l2mcE
         iVx65lRY0D/9i2GwIxp935T4Rk7yRw+OSzLtjO8QPNrJrRAglye6O9FvHyx6pVKjxgSv
         tpn1dyL/DA83jin6QqKhxgLtsaBNwyRLNWCr3Efxw8sP75hYW25TdY7QZH6xufyynY5K
         QeOfehrBQx94Minbk0CTIv8TNsnrSfD6kNu8LVctz7U966PDGwzkUlGmlqqdPIpUdvqB
         9ntg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=dH1QqkvJ5bsPVWYXR29sustQxigKfwCpsF7xSRdx28Q=;
        b=AorTVG8BrYL1gheWuLCSLDSw/mkmv8zrHmvZdMgt3fVFutlXMEU5H1X7qP6VoGuDGR
         c5oqdfZbc664YxIVKgPwbfvDcg/2thB5uDQs2/UPLwILt0cxUYoVEOJys4A+oreiNZE4
         EVb0KYtyLWWD6WVJrrE7Rn/f/ubGV84U2iTIKcp9O4WSmwvvqIp3B630tFxuSNdEh5J6
         Jz+Z8MZ50M43IRaFqFKyRrXyKZEOetns0H3dn47S9hgJ0CwLXT/RHuvYZJrEP4w/W7gZ
         twkgMT4Wbiz69yyrz337+5sPjdKwtUblEyHW6U9bV61g43J/cgDwph7nNo0S9ozshE+G
         3Zdg==
X-Gm-Message-State: AOAM531wuMkwji7D4CJftPKEJ7zjh3bK31OlthBLRpj10qwwxH6F1/dn
	S1zNn27aaAjlScXQwgk2mnRWj7K53fVI6FCfGk43oLARqVhZmg==
X-Google-Smtp-Source: ABdhPJyb0S519+Rb58WLifh8TER5P2fxyF5rFCGb5fH6GI/MGrCij0wxQS84INLCYnw7WrQ96pOp7XSQMz1xOuwf5DQ=
X-Received: by 2002:a17:906:58d4:b0:6f4:cebd:c4b with SMTP id
 e20-20020a17090658d400b006f4cebd0c4bmr10142735ejs.492.1652007992770; Sun, 08
 May 2022 04:06:32 -0700 (PDT)
MIME-Version: 1.0
References: <20220506222646.1671474-1-broonie@kernel.org>
In-Reply-To: <20220506222646.1671474-1-broonie@kernel.org>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Sun, 8 May 2022 13:06:22 +0200
Message-ID: <CAMRc=MennzKvu5pom5X0pSFq+5YNpWb+mgLg6eZ=WmZLLQDB_w@mail.gmail.com>
Subject: Re: [PATCH] ARM: configs: Enable audio on BeagleBone Black in multi_v7_defconfig
To: Mark Brown <broonie@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: Sekhar Nori <nsekhar@ti.com>, Linux ARM <linux-arm-kernel@lists.infradead.org>, soc@kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sat, May 7, 2022 at 12:27 AM Mark Brown <broonie@kernel.org> wrote:
>
> The BeagleBone Black supports audio over HDMI, using a combination of the
> DaVinci McASP (used for audio by a very large proportion of DaVinci systems
> with audio support) and a TDA998x device driving the HDMI link (this is a
> very widely used driver). Build both drivers as modules in multi_v7_defconfig
> so they can be more easily included in testing.
>
> Signed-off-by: Mark Brown <broonie@kernel.org>
> ---
>  arch/arm/configs/multi_v7_defconfig | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi_v7_defconfig
> index d6a6811f0539..2e0384a31e4e 100644
> --- a/arch/arm/configs/multi_v7_defconfig
> +++ b/arch/arm/configs/multi_v7_defconfig
> @@ -684,6 +684,7 @@ CONFIG_IMX_IPUV3_CORE=m
>  CONFIG_DRM=y
>  # CONFIG_DRM_I2C_CH7006 is not set
>  # CONFIG_DRM_I2C_SIL164 is not set
> +CONFIG_DRM_I2C_NXP_TDA998X=m
>  CONFIG_DRM_NOUVEAU=m
>  CONFIG_DRM_EXYNOS=m
>  CONFIG_DRM_EXYNOS_FIMD=y
> @@ -798,6 +799,7 @@ CONFIG_SND_SOC_TEGRA_WM9712=m
>  CONFIG_SND_SOC_TEGRA_TRIMSLICE=m
>  CONFIG_SND_SOC_TEGRA_ALC5632=m
>  CONFIG_SND_SOC_TEGRA_MAX98090=m
> +CONFIG_SND_SOC_DAVINCI_MCASP=m
>  CONFIG_SND_SOC_AK4642=m
>  CONFIG_SND_SOC_CPCAP=m
>  CONFIG_SND_SOC_CS42L51_I2C=m
> --
> 2.30.2
>

Reviewed-by: Bartosz Golaszewski <brgl@bgdev.pl>
