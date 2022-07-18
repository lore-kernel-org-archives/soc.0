Return-Path: <SRS0=6tPc=XX=arndb.de=arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FF38C433EF
	for <soc@archiver.kernel.org>; Mon, 18 Jul 2022 11:25:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 0AEDDC341CF; Mon, 18 Jul 2022 11:25:04 +0000 (UTC)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 6181AC341C0;
	Mon, 18 Jul 2022 11:25:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 6181AC341C0
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=arndb.de
Received: from mail-yw1-f180.google.com ([209.85.128.180]) by
 mrelayeu.kundenserver.de (mreue109 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1MN5W7-1nuMRt0YNh-00J3qo; Mon, 18 Jul 2022 13:25:00 +0200
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-31e0d4ad6caso42689877b3.10;
        Mon, 18 Jul 2022 04:24:59 -0700 (PDT)
X-Gm-Message-State: AJIora8fBA27dBJrgAu8F77QfMc8YC03URrh6JGAl2uomf7lhksDI8Iy
	gnalFynJRCjuE9j0d+NvD8CS/hGS9S9x73qNZPI=
X-Google-Smtp-Source: AGRyM1tzL7hthvP1sOdr1X/BfOKLedAJn4Urbe8k3BQ7Z19q4rX8bfPxpzkeM1Uk0JKELZ+zlaoPYOQFI7A/abx5b1Y=
X-Received: by 2002:a81:9b02:0:b0:31c:9ae4:99ec with SMTP id
 s2-20020a819b02000000b0031c9ae499ecmr29471022ywg.495.1658143498552; Mon, 18
 Jul 2022 04:24:58 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1656396767.git.qinjian@cqplus1.com> <CAK8P3a1HoB74TA9EKJFuPLuw_zJfy_p7fwkm0M45+jaGkK6ivA@mail.gmail.com>
In-Reply-To: <CAK8P3a1HoB74TA9EKJFuPLuw_zJfy_p7fwkm0M45+jaGkK6ivA@mail.gmail.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Mon, 18 Jul 2022 13:24:42 +0200
X-Gmail-Original-Message-ID: <CAK8P3a3eSNR4xdGkjiBadNd+YsvEP6WtdAcJjinX+5AAiZWQog@mail.gmail.com>
Message-ID: <CAK8P3a3eSNR4xdGkjiBadNd+YsvEP6WtdAcJjinX+5AAiZWQog@mail.gmail.com>
Subject: Re: [PATCH v20 00/11] Add Sunplus SP7021 SoC Support
To: Arnd Bergmann <arnd@arndb.de>
List-Id: <soc.lore.kernel.org>
Cc: Qin Jian <qinjian@cqplus1.com>, Stephen Boyd <sboyd@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Rob Herring <robh+dt@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Russell King - ARM Linux <linux@armlinux.org.uk>, 
	Olof Johansson <olof@lixom.net>, SoC Team <soc@kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, DTML <devicetree@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-clk <linux-clk@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:C+3PLnNH2PJf1A3eS8Uckxm3OjR6RV9VpgHx4EjqWXQwRRjP8UW
 7zRUce8OWCeoVM1UftgdLcDHcX+fUZfaHFUaDpHYil09nx2his+mdiy6oKxfKllmODc/U2p
 o9wn3UeZknaGqI6dzX/AAOp1hWsuyO+7XdhgxsTvTqU+W5H1fJmyefZqzs9f/KYn47WAb/a
 hpqqBeeyI4YEw4Iu9bCuA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:fsmKcO1YdDo=:7nnZIdLq8j3Ky6hCOV4PFB
 y9zUhFGs1YfCD1vwRzgEc2AsnKfMmwCTbyjepPZmm8AYtPbncEez7TeWjC5pMCyFXUbvS7y2o
 RGTd0g2GitCynFpnlJ/y9iiZjw8/hkSYCJgZcAoZQCYPSbUAVsxtWbc7ouJUQjAhifGLAjx25
 2yn/yfWUjpxw0C/wwmJi8losLenbHWLqWmAZUCYOimW1oRjhNw3G79y+vCCIWEiiWtJmhuY6h
 bkjGHceIs9VnGA9AJhprNhz1ZKpyc2PZhyJcUw1qfEnmEixYHGJfdmKT/3CvgjQZg86ujxqbT
 AlUMhcewvNIQFkrZxtSWSzREfLzckpIHmHVp8JbKU5qYDZt4+IQil9hhBWtxAoLxJJ7jDOufL
 5jT5SucNKxh13tmsvHOH74aQK9gQ2zrNwIN/fPOuXrjIXkS4vlZQMDUxa9MC60H6h9pWw/I4T
 cdlNSy78tiLCUdnjcH2GrM9EUBWjpu+8OB1x6X9n5e3hx2kBWgT6R/yyWhjq05XPiVf6ZBhFm
 u0423gRpH0SQ0lgUPvHhb4Jg32sv23pq947N198KYnWYBqY9aEz5DbDv02wrAHGq6M4s/SDTA
 IrzbUtg5j2WDkxrRjZONdeh4jJEfMPL0s35PtZTxPPJEWv1TgK0uqDspz27+B1EV64jwAdmpV
 +C0fdFYVcJe4xX7GL4H7PR+/DBVGuFq3shqPr4ubXACUjQoPZUlMJYH+mXI/nJfEQUNcKHltS
 xbjUskFcpsgd8oitkAI3qx5A6JfYsTDrgIEIvg==

On Wed, Jul 6, 2022 at 5:01 PM Arnd Bergmann <arnd@arndb.de> wrote:
>
> On Tue, Jun 28, 2022 at 8:26 AM Qin Jian <qinjian@cqplus1.com> wrote:
> >
> > This patch series add Sunplus SP7021 SoC support.
> >
> > Sunplus SP7021 is an ARM Cortex A7 (4 cores) based SoC. It integrates many
> > peripherals (ex: UART, I2C, SPI, SDIO, eMMC, USB, SD card and etc.) into a
> > single chip. It is designed for industrial control.
> >
> > SP7021 consists of two chips (dies) in a package. One is called C-chip
> > (computing chip). It is a 4-core ARM Cortex A7 CPU. It adopts high-level
> > process (22 nm) for high performance computing. The other is called P-
> > chip (peripheral chip). It has many peripherals and an ARM A926 added
> > especially for real-time control. P-chip is made for customers. It adopts
> > low-level process (ex: 0.11 um) to reduce cost.
> >
>
> As far as I can tell, all review comments have been fully addressed,
> but I'm missing an Ack from Stephen Boyd so I can apply it through
> the SoC tree.

I ended up applying the series without the clk driver now, please see

https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git/commit/?h=arm/newsoc&id=7cb7b8fe63393d77

No need to resend the series any more, please just work with
the clk maintainers to get that driver included through their tree.

If there are any issues with the patches that I merged, it's best
to send bugfix patches that can be applied on top of the branch
listed above, or a pull request based on that commit.

For new features to be merged in a later release, e.g. patches to
add device tree nodes for other on-chip components, or additional
dts files, please base them on the coming -rc1 release when that
is out.

       Arnd
