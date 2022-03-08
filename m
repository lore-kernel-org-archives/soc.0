Return-Path: <SRS0=aJNj=TT=arndb.de=arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B4E0C433EF
	for <soc@archiver.kernel.org>; Tue,  8 Mar 2022 13:33:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 61726C340EC; Tue,  8 Mar 2022 13:33:34 +0000 (UTC)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 73D85C340EB;
	Tue,  8 Mar 2022 13:33:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 73D85C340EB
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=arndb.de
Received: from mail-wr1-f51.google.com ([209.85.221.51]) by
 mrelayeu.kundenserver.de (mreue010 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1MBUZr-1nJ56b1aqF-00D21M; Tue, 08 Mar 2022 14:33:30 +0100
Received: by mail-wr1-f51.google.com with SMTP id j17so28657060wrc.0;
        Tue, 08 Mar 2022 05:33:30 -0800 (PST)
X-Gm-Message-State: AOAM530lHepYnIYetOgflXVrZsALT1vXNbb8vwqMPQNvZ7ZPL5X5pBXo
	oPf4FUv5ZTD7sk4A9H+aw8IGPAG2danZlauXl4A=
X-Google-Smtp-Source: ABdhPJzBo8+XD8cBHZ+iV3CMpw1rAQ4Kt/pckl18z9wljYid5M+Byqeh0gtSd8eJwZBlQHJruvj8qEJHrBS/gynLDAY=
X-Received: by 2002:adf:90c1:0:b0:1e4:ad27:22b9 with SMTP id
 i59-20020adf90c1000000b001e4ad2722b9mr12265687wri.219.1646746409902; Tue, 08
 Mar 2022 05:33:29 -0800 (PST)
MIME-Version: 1.0
References: <20220307143421.1106209-1-andre.przywara@arm.com>
 <20220307143421.1106209-14-andre.przywara@arm.com> <CAK8P3a1FxfZj0=T=cvLNfagP+c_d+SEYYuV30+-UTU+B+HVXmQ@mail.gmail.com>
 <20220308120750.0bbe0122@donnerap.cambridge.arm.com>
In-Reply-To: <20220308120750.0bbe0122@donnerap.cambridge.arm.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Tue, 8 Mar 2022 14:33:13 +0100
X-Gmail-Original-Message-ID: <CAK8P3a0fuVSYm097X-V9MZSm9AHNp8N8JMp2xiH5CYTApx5BaA@mail.gmail.com>
Message-ID: <CAK8P3a0fuVSYm097X-V9MZSm9AHNp8N8JMp2xiH5CYTApx5BaA@mail.gmail.com>
Subject: Re: [PATCH 13/14] ARM: configs: sync multi_v5_defconfig from savedefconfig
To: Andre Przywara <andre.przywara@arm.com>
List-Id: <soc.lore.kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Rob Herring <robh+dt@kernel.org>, Mesih Kilinc <mesihkilinc@gmail.com>, 
	Icenowy Zheng <icenowy@aosc.io>, Jesse Taube <mr.bossman075@gmail.com>, 
	Giulio Benetti <giulio.benetti@benettiengineering.com>, 
	George Hilliard <thirtythreeforty@gmail.com>, DTML <devicetree@vger.kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, linux-sunxi@lists.linux.dev, 
	Russell King <linux@armlinux.org.uk>, Olof Johansson <olof@lixom.net>, SoC Team <soc@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:UOShei1G7KfyuGhiGH0rv5EXHaPemE19x0FChxESXegSntICg2T
 nhF3HXQdtldm/mSlCS+/wl4J0bAAUBN9zrKQ9zT42Hlok7poLCjs9KRjQbgxz3f2BngFDq3
 1oh//dJeRJBssxlA+OT8K6cQRSWxratpmCJxkKVZusMXMuOO5n3kACFHtLOIGJXQbUOp35D
 yH/iB17Y7ZzDMuBAOjIWg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:TXZ0FcUrpDo=:b/Mzq7OLT24Qrq8CCP3nrP
 bbCd44ShFW5Nb1qNERAfU4AyjH4S2dDpycWbOJEXbK3uR9+rNl0EJr9yZoeNwiCs0CgL33WPm
 +8S5vmRggH8OFq1C0XN8llHEHRi3CdLgVAdWp8WajrhlsAJeFkWigL2FE2Seq1licOEHcri4O
 S1SZHPOujiLZkwSSyQOup/K7GAXsd0zGqQX8JEGsPE+wkC5WWUHQm8VHvWeoSUHdImtv+D41M
 oSUhlI88lFozaaJOvP47gGaGoGG0fA7RJqnE8SplTbB+70TpRUv2uxbZIspnToEupdBiECXzs
 PJXRc5eHdovpvoP8acLYe784xw5UxkkCw8kcZ5cuQHY0SFZXDpqHqRoxYFMzCQpA+18uuFjE0
 G6ODDfdEEFCO+qb4VKva2uv2CyqYfxTBh/KeaNpF+IYV8oHdR1+L7JsiXg1nE8pX6kr154ea4
 Y9WoyjRWv3JcTwjcSu7X7036ya3GiO69M7Y0hD+dNvhyO7Pr74Cl0xY0Zf5xZl0NoYopKkVo6
 aZqTG0aD4pvJr9qnsDyk3+DzTDGNTPotrV755WDrM0RewXt28ch7xbmSMulnSeR4rdXxYpPLx
 U4zOZzsK1UtjGhTXNblKJ57vxC37Ns7pZ2sLxzMU6PiYonCvL/XYMIaq6z6AGqbukhX2282FC
 kmnU45YppqpyBAcAqEidY75zj9FyX7e+xhWWhjK0euJxCBqalVLMny2S6QfxtCQPx0ek=

On Tue, Mar 8, 2022 at 1:07 PM Andre Przywara <andre.przywara@arm.com> wrote:
> On Tue, 8 Mar 2022 10:38:37 +0100 Arnd Bergmann <arnd@arndb.de> wrote:
> > On Mon, Mar 7, 2022 at 3:34 PM Andre Przywara <andre.przywara@arm.com> wrote:
> > >
> > > Some Kconfig options have changed, some other platforms have been
> > > removed.
> >
> > Please split this up into logical chunks: list the platforms that were removed
> > and remove only the lines corresponding to those platforms in one patch,
> > do functional changes in separate patches each with a reason for doing them,
> > and cleanups (moving lines to match the savedefconfig output, removing lines
> > that are now the default) in one final patch.
>
> Actually this patch is meant to be only about the last past: to sync
> multi_v5_defconfig with the output of "make savedefconfig". .config stays
> the same. I initially tried to chase down the reason for each line change,
> but gave up quickly, because it becomes tedious to learn about this,
> especially about symbols that got *removed*. Also Kconfig is somewhat
> sensitive, a single "select" or "default" change in one random Kconfig can
> affect the result of savedefconfig.
>
> As I noted in the commit message, the .config does *not* change as a result
> of this patch, the whole purpose is just to make the next patch clearer.

Ok, then just change the symbols that move around, not the ones that
may have gone missing unintentionally.

> So I can try find the reason for each removal, if you like, but I am not
> sure that's worthwhile? It is my understanding that Kconfig changes tend
> to accumulate cruft in the various defconfigs over time. In U-Boot we gave
> up on reasoning, and just regularly sync the output of savedefconfig over
> to the *_defconfigs, to keep them minimal and meaningful.
>
> And I found Olof's commit 30b10c77837c ("ARM: defconfig: re-run
> savedefconfig on multi_v* configs") as a precedence for this kind of cleanup.

I know, but I never liked doing this because it hides regressions.

> > >  CONFIG_AEABI=y
> > >  CONFIG_HIGHMEM=y
> > > -CONFIG_ZBOOT_ROM_TEXT=0x0
> > > -CONFIG_ZBOOT_ROM_BSS=0x0
> > >  CONFIG_ARM_APPENDED_DTB=y
> > >  CONFIG_ARM_ATAG_DTB_COMPAT=y
> > >  CONFIG_CPU_FREQ=y
> >
> > These were not removed, what happened here is that 'savedefconfig'
> > no longer produces the lines because they now match the defaults.
>
> Yes, I understand. Is there some policy here, for instance to keep
> those in, for clarity?

In this case, as with the moving lines around, there is no functional
change at all, and doing the same thing on older kernels will still
result in the same behavior. I'm not worried about those at all, so
just put them all into one patch.

> > > @@ -159,7 +151,6 @@ CONFIG_I2C_ASPEED=m
> > >  CONFIG_I2C_AT91=y
> > >  CONFIG_I2C_IMX=y
> > >  CONFIG_I2C_MV64XXX=y
> > > -CONFIG_I2C_NOMADIK=y
> > >  CONFIG_SPI=y
> > >  CONFIG_SPI_ATMEL=y
> > >  CONFIG_SPI_IMX=y
> >
> > This one is still there. Not sure why it's no longer enabled.
>
> It's not in the current .config. From what I can see, it depends on
> ARCH_AMBA, which is selected by ARCH_NOMADIK, but that one is not enabled
> by multi_v5_defconfig. Not sure if that is an oversight, or a change, a
> the dependency is bogus, or something else.
>
> If you find that useful, I can try to find those dependency chains for the
> other options, but I definitely lack the knowledge about the history of
> those old platforms, so I can't reason about them. But I could present you
> the findings and you can then say what to do?

I see this was the result of 66e0c12f9e17 ("ARM: nomadik: switch to use the
Nomadik I2C driver"). It's ok to remove this line and others like it,
just explain
what happened for these, as the driver is still enabled.

> > >  CONFIG_REGULATOR_FIXED_VOLTAGE=y
> > >  CONFIG_MEDIA_SUPPORT=y
> > >  CONFIG_MEDIA_CAMERA_SUPPORT=y
> > > -CONFIG_V4L_PLATFORM_DRIVERS=y
> > > -CONFIG_VIDEO_ASPEED=m
> > > -CONFIG_VIDEO_ATMEL_ISI=m
> > >  CONFIG_DRM=y
> > >  CONFIG_DRM_ATMEL_HLCDC=m
> > > -CONFIG_DRM_PANEL_SIMPLE=y
> > > -CONFIG_DRM_PANEL_EDP=y
> > >  CONFIG_DRM_ASPEED_GFX=m
> > > -CONFIG_FB_IMX=y
> > > -CONFIG_FB_ATMEL=y
> > > -CONFIG_BACKLIGHT_ATMEL_LCDC=y
> >
> > This doesn't look right at all. If you want to disable graphics support,
> > please do that in a separate patch and explain why we can't have those
> > any more. Are you running into problems with the vmlinux size?
>
> As I mentioned, the .config didn't change at all, so those options are
> already not included in mainline anymore.
>
> AFAICS, those last options depend on CONFIG_FB, which isn't enabled. Is
> that a regression due to the recent fbdev changes?

Correct, this part was clearly unintentional, and I don't ever want to see
a patch to remove lines like these with a changelog text that fails to
explain why we want them to be removed. We clearly have platforms
that are enabled in multi_v5_config that use some of those drivers, and
we had users that wanted them to be enabled.

I think there are three separate issues here: FB_IMX and FB_ATMEL
broke because of f611b1e7624c ("drm: Avoid circular dependencies for
CONFIG_FB"), VIDEO_ASPEED and VIDEO_ATMEL_ISI  broke
during b0cd4fb27665 ("media: Kconfig: on !EMBEDDED && !EXPERT,
enable driver filtering"), and PANEL_EDP was introduced in 310720875efa
("ARM: configs: Everyone who had PANEL_SIMPLE now gets
PANEL_EDP") without the option ever making it in [1]. These are all
bugs that need to be addressed individually, and not just in a single
defconfig file but across all the affected platforms.

         Arnd

[1] https://lore.kernel.org/all/CAD=FV=VbYcdSqxLHdSaDPh=X0hbW6VWV0mM-iFy3k0J1q+6MWg@mail.gmail.com/
