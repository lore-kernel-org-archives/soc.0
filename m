Return-Path: <SRS0=aJNj=TT=arndb.de=arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6624FC433EF
	for <soc@archiver.kernel.org>; Tue,  8 Mar 2022 09:38:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 374E1C340EE; Tue,  8 Mar 2022 09:38:58 +0000 (UTC)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.135])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 94267C340F5;
	Tue,  8 Mar 2022 09:38:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 94267C340F5
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=arndb.de
Received: from mail-wr1-f54.google.com ([209.85.221.54]) by
 mrelayeu.kundenserver.de (mreue011 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1Mt7Ll-1oKSTH27qb-00tUbN; Tue, 08 Mar 2022 10:38:54 +0100
Received: by mail-wr1-f54.google.com with SMTP id j17so27575936wrc.0;
        Tue, 08 Mar 2022 01:38:54 -0800 (PST)
X-Gm-Message-State: AOAM530xWUJKMnAYV40Vjr31o9C10VAbjqcWICyyArxRSIky/1knijRT
	4fxLNJNFDus/mwMmYDkmsjuOmViYDufbKqFxtbE=
X-Google-Smtp-Source: ABdhPJxo54mRJkzudcax91VzsIifg7BnKSlOiViFsWSbWLDpZO+Tik8hGd0ehAFU2LrwrU2FCNCuGn556SDuP8dgAl4=
X-Received: by 2002:adf:90c1:0:b0:1e4:ad27:22b9 with SMTP id
 i59-20020adf90c1000000b001e4ad2722b9mr11499158wri.219.1646732333821; Tue, 08
 Mar 2022 01:38:53 -0800 (PST)
MIME-Version: 1.0
References: <20220307143421.1106209-1-andre.przywara@arm.com> <20220307143421.1106209-14-andre.przywara@arm.com>
In-Reply-To: <20220307143421.1106209-14-andre.przywara@arm.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Tue, 8 Mar 2022 10:38:37 +0100
X-Gmail-Original-Message-ID: <CAK8P3a1FxfZj0=T=cvLNfagP+c_d+SEYYuV30+-UTU+B+HVXmQ@mail.gmail.com>
Message-ID: <CAK8P3a1FxfZj0=T=cvLNfagP+c_d+SEYYuV30+-UTU+B+HVXmQ@mail.gmail.com>
Subject: Re: [PATCH 13/14] ARM: configs: sync multi_v5_defconfig from savedefconfig
To: Andre Przywara <andre.przywara@arm.com>
List-Id: <soc.lore.kernel.org>
Cc: Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Rob Herring <robh+dt@kernel.org>, Mesih Kilinc <mesihkilinc@gmail.com>, 
	Icenowy Zheng <icenowy@aosc.io>, Jesse Taube <mr.bossman075@gmail.com>, 
	Giulio Benetti <giulio.benetti@benettiengineering.com>, 
	George Hilliard <thirtythreeforty@gmail.com>, DTML <devicetree@vger.kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, linux-sunxi@lists.linux.dev, 
	Russell King <linux@armlinux.org.uk>, Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, 
	SoC Team <soc@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:shzwjfw1hwsMPqKPAEr65vYLVYOs9/t8vgVesvOz5CPBFYrNM3N
 1nhLyHu/jPb5P1JLvITIy/XKZR6+pfK70V0W+AyqkVyINvUnNG964fVZ7DB0v+bQEk8fNnw
 xTzrbCQOoiMdQN5dzMOnJg8GeYwLYPU3UInOO25Pe1UvzLY6OQi8JLYdAbikYrgKP4SitM9
 i6QVe5a4v1l2qLysBDowg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:J6nFCqEplhE=:zD/cSZWl+A176QW2nPTJCZ
 5KumSesg+K3fRLIWvfCkcvb/0usTcvz/ArXcJv6tfViHFbriq+iPz1YzJ+aFZEfHlvxGIbsvD
 +PleDdNgo0zjXlMc57cPmR6HlZYlYNxgc1gHQCo4xiok4pbUbApJMBQxvapCMiZn05pGj/F1E
 qodHylwQskQGPz2ISE1whbj3mlug5x9JznqqJdcwrt3XOFqxUEgzmqJKyZY4+YRrgtauCLLti
 X0Vn43WdcKXG45VdVdohi/fseBBIikIVmsqjNbbYJwWgrfyGQEDZiVzH0nCjH86mgDCqWGzZM
 1m6Lg5fyG7oIJJi3HcpG1W/uwkMlpHZRDhmMxy5beBZYHz9a3DWuVinGzOYY9dQmYMtiHrsuK
 3yO9G/AIkCa1cJD7+hAf/irCZv5bJmf7F9kZJR5esm51JwnuUYst5CNvDfrWzAT5HJPsRjcWO
 XRgwx/rz1n6B0MXl9hPGYOsvAW/WnS55hDjRwRrbCp2rl8+HVjctWHMfQsBzX4BEUZWAvMHI3
 LNDSGevYKly/vYKvlZfZPG8jRL9lw2VNlzjNh9irHkUAuQCc/y/6EA+jqYTraLh1KNsyg4yKr
 OTvodq7FGEaaqdX3EHQK1eXUMMniRyOiLw81ubbe6Z5E80VQWPLrv/ciBbSSIhex17kdhMalu
 cEse9iWVdTraT18DK9DHR9t06I4w9DC8WXumN2RuolAlPniJPPp9nm1yswiZq85u/Yws=

On Mon, Mar 7, 2022 at 3:34 PM Andre Przywara <andre.przywara@arm.com> wrote:
>
> Some Kconfig options have changed, some other platforms have been
> removed.

Please split this up into logical chunks: list the platforms that were removed
and remove only the lines corresponding to those platforms in one patch,
do functional changes in separate patches each with a reason for doing them,
and cleanups (moving lines to match the savedefconfig output, removing lines
that are now the default) in one final patch.

>  CONFIG_AEABI=y
>  CONFIG_HIGHMEM=y
> -CONFIG_ZBOOT_ROM_TEXT=0x0
> -CONFIG_ZBOOT_ROM_BSS=0x0
>  CONFIG_ARM_APPENDED_DTB=y
>  CONFIG_ARM_ATAG_DTB_COMPAT=y
>  CONFIG_CPU_FREQ=y

These were not removed, what happened here is that 'savedefconfig'
no longer produces the lines because they now match the defaults.

> @@ -159,7 +151,6 @@ CONFIG_I2C_ASPEED=m
>  CONFIG_I2C_AT91=y
>  CONFIG_I2C_IMX=y
>  CONFIG_I2C_MV64XXX=y
> -CONFIG_I2C_NOMADIK=y
>  CONFIG_SPI=y
>  CONFIG_SPI_ATMEL=y
>  CONFIG_SPI_IMX=y

This one is still there. Not sure why it's no longer enabled.

>  CONFIG_REGULATOR_FIXED_VOLTAGE=y
>  CONFIG_MEDIA_SUPPORT=y
>  CONFIG_MEDIA_CAMERA_SUPPORT=y
> -CONFIG_V4L_PLATFORM_DRIVERS=y
> -CONFIG_VIDEO_ASPEED=m
> -CONFIG_VIDEO_ATMEL_ISI=m
>  CONFIG_DRM=y
>  CONFIG_DRM_ATMEL_HLCDC=m
> -CONFIG_DRM_PANEL_SIMPLE=y
> -CONFIG_DRM_PANEL_EDP=y
>  CONFIG_DRM_ASPEED_GFX=m
> -CONFIG_FB_IMX=y
> -CONFIG_FB_ATMEL=y
> -CONFIG_BACKLIGHT_ATMEL_LCDC=y

This doesn't look right at all. If you want to disable graphics support,
please do that in a separate patch and explain why we can't have those
any more. Are you running into problems with the vmlinux size?

>  CONFIG_LIBCRC32C=y
>  CONFIG_DEBUG_INFO=y
> -CONFIG_DEBUG_FS=y
>  CONFIG_MAGIC_SYSRQ=y
> +CONFIG_DEBUG_FS=y
>  CONFIG_DEBUG_KERNEL=y
>  # CONFIG_SCHED_DEBUG is not set
>  # CONFIG_DEBUG_PREEMPT is not set

This should probably go along with the ZBOOT_ROM change, it's
only cosmetic.

        Arnd
