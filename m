Return-Path: <SRS0=aJNj=TT=arndb.de=arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF261C433EF
	for <soc@archiver.kernel.org>; Tue,  8 Mar 2022 15:18:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id B08DAC340EC; Tue,  8 Mar 2022 15:18:17 +0000 (UTC)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.135])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 11E8FC340EB;
	Tue,  8 Mar 2022 15:18:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 11E8FC340EB
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=arndb.de
Received: from mail-wm1-f48.google.com ([209.85.128.48]) by
 mrelayeu.kundenserver.de (mreue012 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1N62mG-1oGEAf3xo8-016Kvg; Tue, 08 Mar 2022 16:18:13 +0100
Received: by mail-wm1-f48.google.com with SMTP id l1-20020a05600c4f0100b00389645443d2so1734895wmq.2;
        Tue, 08 Mar 2022 07:18:13 -0800 (PST)
X-Gm-Message-State: AOAM531CliuGemKwgBtEZeMDS7zTkz6GJqxPRMD/hOMEspKngDLVuAyr
	gqvq9ULIf2/SuOUkv06sL3cA8Inl7XboiWI8/PM=
X-Google-Smtp-Source: ABdhPJwWnege0B89hH2GkrjFsd8ZOdfeG5z/xIwKnV2rzC8zB4ilKLYWFNkX7PGEBAA7XOORN9saQgPD0j03zWqy5ZY=
X-Received: by 2002:a05:600c:154b:b0:381:8148:64d with SMTP id
 f11-20020a05600c154b00b003818148064dmr4020960wmg.98.1646752693479; Tue, 08
 Mar 2022 07:18:13 -0800 (PST)
MIME-Version: 1.0
References: <20220307143421.1106209-1-andre.przywara@arm.com>
 <20220307143421.1106209-14-andre.przywara@arm.com> <CAK8P3a1FxfZj0=T=cvLNfagP+c_d+SEYYuV30+-UTU+B+HVXmQ@mail.gmail.com>
 <20220308120750.0bbe0122@donnerap.cambridge.arm.com> <99029bae-cf1b-c3c1-004e-8a6795d19f7f@microchip.com>
In-Reply-To: <99029bae-cf1b-c3c1-004e-8a6795d19f7f@microchip.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Tue, 8 Mar 2022 16:17:57 +0100
X-Gmail-Original-Message-ID: <CAK8P3a0ogA_b57N_yOjARfh9Gmox+KUrOcP5eE_frSD5YXJJsw@mail.gmail.com>
Message-ID: <CAK8P3a0ogA_b57N_yOjARfh9Gmox+KUrOcP5eE_frSD5YXJJsw@mail.gmail.com>
Subject: Re: [PATCH 13/14] ARM: configs: sync multi_v5_defconfig from savedefconfig
To: Nicolas Ferre <nicolas.ferre@microchip.com>
List-Id: <soc.lore.kernel.org>
Cc: Andre Przywara <andre.przywara@arm.com>, Arnd Bergmann <arnd@arndb.de>, 
	Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Rob Herring <robh+dt@kernel.org>, Mesih Kilinc <mesihkilinc@gmail.com>, 
	Icenowy Zheng <icenowy@aosc.io>, Jesse Taube <mr.bossman075@gmail.com>, 
	Giulio Benetti <giulio.benetti@benettiengineering.com>, 
	George Hilliard <thirtythreeforty@gmail.com>, DTML <devicetree@vger.kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, linux-sunxi@lists.linux.dev, 
	Russell King <linux@armlinux.org.uk>, Olof Johansson <olof@lixom.net>, SoC Team <soc@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:9OyOef70URgq30feF0AliwbRj7qNyazbjrgbTLUA0UC1UXVirNq
 1dzmdURnlef+yinLsJyi9fbhD/wVFKfO4CubPuIDsvxFWomv7q4Eq6jVEloo4Q8NcpDSxXQ
 uXeScmFI/AfPBCDiUR3ossfc/+0A1KHVXEIsKov6QTa1aQZpNbqhBaEgWnnLNabuWZum4Bm
 PNSbE9X3eXkm68xXerJow==
X-UI-Out-Filterresults: notjunk:1;V03:K0:ndCKae2I1TY=:kk+cdmg+FKcKqSEZkZM4ab
 gvVPCXP3sPXeolWF0BYBee97tc0KJl4gg+z+NzAAscsCsTfp7OWpxI7pxReIrcVY1x8qtF5F8
 D65MUACYlkDoSCXEepIbUb/Gec/Ks75EYj74ns+PgevDVE8HZVIXe8+DLaLvOrYUzceALbCV+
 Hr+xjjVtvhyKcFNCYjcFBXRNycLBTERE+iQpj7hGuifBZVI5iHiKzuTfLzmz+2mXnRBTaCWJj
 lI5JEzffO44K2/6/Kk/GqfYzjvI8XsFPTilU1bljmhAXUQHxbQwG7J0t6BL4OLMzbMnoSucEM
 7oxGGcbkOYw8jw1o7ge21F/GGgUqHP/aIodlvup08S/QfzdzxL9i2Ap3TLLQJ9MDJnGtMBUD+
 V4IMue1vajcA/uFuzI1XBWG+LONzpQ8UPoMJ4uWM9bcsPmHqisw6wUfDL9yVX6rmytPUVDXLf
 X45nFkW1x6qXx8SlD3QpeHehPYgiaOJO6ALUbF8ilbVx+eHvJvToFgrcRWCMHEExx3zrsXait
 zVyRoUHyLiNzQolf9HkvigIoNdsBcR9S5yIGQfw7Uu+uPMto4InsWgVLlGY6JxLfRKtQu0/J7
 o6+K0ZyCqi+SrR0pQxWNmsDDLlp7vsKkyxRXOZcO3Kp/fNG7IeGPJXBV7OthfIg51LoIldVgu
 9VAkmouWf0I/4mcC+x5/kBzaJPub+PWqgkeSdKcAfxpaCqqcnxBivZjxwd5WrhJYe8Qz8+4qM
 ug2BUIoyDp5SBSE48lhOMas4dhVVTHpRXLonr1bsFzwrojcdt8arhbTgVFq4uYmW6DNoiX1Mk
 H1ya+1dygfXWpGByuPMcMMFpkGyjKUC3kZ6zllWmblvA/i+ixA=

On Tue, Mar 8, 2022 at 3:30 PM Nicolas Ferre
<nicolas.ferre@microchip.com> wrote:
> On 08/03/2022 at 13:07, Andre Przywara wrote:
>
> As far as I'm concerned and only talking about the drivers, I would
> prefer that we keep the following config options activated in the .config:
>
> CONFIG_VIDEO_ATMEL_ISI=m
> CONFIG_DRM_PANEL_SIMPLE=y
> CONFIG_FB_ATMEL=y
> CONFIG_BACKLIGHT_ATMEL_LCDC=y
>
> The question to know if they are activated by default or not and if the
> associated stack is selected or not, well... I lost track of this, sorry.

These are actually missing, I think the two options we need to
enable are:

CONFIG_MEDIA_PLATFORM_SUPPORT=y
CONFIG_FB=y

All the other options that get removed are either now the default,
or are no longer part of the kernel.

         Arnd
