Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 019B1C2D0E4
	for <soc@archiver.kernel.org>; Mon, 23 Nov 2020 18:22:26 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id C751A22203; Mon, 23 Nov 2020 18:22:25 +0000 (UTC)
Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 9E2A4221FE
	for <soc@kernel.org>; Mon, 23 Nov 2020 18:22:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1606155745;
	bh=lhlLbSBjS+IMZ3O7opbrbZzzm2KL2JGsBL/0Nk96kBM=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=OenrjoUITdC7UZxURxdMGRl6UadP6wuqRJhqaOosymf85pkix1G4PoOE1CJEQxrQT
	 zZJH+a3jqRqAmK0fKA/HUHTuHXdDuqIXcy9T6IWvFP88AIQvxZ9Ed15cl0Vhb/a0fi
	 JVFdjZHY4k/e0kg8a4GAm5709jJNF+9gz9GiofCU=
Received: by mail-ot1-f45.google.com with SMTP id z24so2809799oto.6
        for <soc@kernel.org>; Mon, 23 Nov 2020 10:22:25 -0800 (PST)
X-Gm-Message-State: AOAM533VnP/Dnl/+yBbQrB5nGvXv77admznIbe/b8vIymPDg2OtwujfT
	hhr3XyNGnIQzgCiGAEmNKimmnXA7FfBLbxfnHpk=
X-Google-Smtp-Source: ABdhPJy8cKeXOnOFd1SMpfIJI9tom1a6owxHdNLigtG6eK43g/GWsYi8u8QmSJbtL+abbydCn2AmtQTXKDx4Ay8L3v8=
X-Received: by 2002:a05:6830:22d2:: with SMTP id q18mr414874otc.305.1606155744665;
 Mon, 23 Nov 2020 10:22:24 -0800 (PST)
MIME-Version: 1.0
References: <20201030124650.20349-1-grygorii.strashko@ti.com>
 <20201116090429.GB26857@atomide.com> <CAK8P3a0-LWzSvvKkH5xVAoCfNGG_fhDJ37AZVW+qknSZU1wxDw@mail.gmail.com>
 <20201123172726.GQ26857@atomide.com>
In-Reply-To: <20201123172726.GQ26857@atomide.com>
From: Arnd Bergmann <arnd@kernel.org>
Date: Mon, 23 Nov 2020 19:22:08 +0100
X-Gmail-Original-Message-ID: <CAK8P3a34=9SiP1Uqa808teKCB8w+W9cc-sYyLYways9xrQg-sA@mail.gmail.com>
Message-ID: <CAK8P3a34=9SiP1Uqa808teKCB8w+W9cc-sYyLYways9xrQg-sA@mail.gmail.com>
Subject: Re: [PATCH v2] ARM: multi_v7_defconfig: ti: Enable networking options
 for nfs boot
To: Tony Lindgren <tony@atomide.com>
List-Id: <soc.lore.kernel.org>
Cc: Grygorii Strashko <grygorii.strashko@ti.com>, Nishanth Menon <nm@ti.com>, SoC Team <soc@kernel.org>, 
	Arnd Bergmann <arnd@arndb.de>, Sekhar Nori <nsekhar@ti.com>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	Vignesh Raghavendra <vigneshr@ti.com>, linux-omap <linux-omap@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, Nov 23, 2020 at 6:27 PM Tony Lindgren <tony@atomide.com> wrote:
>
> * Arnd Bergmann <arnd@kernel.org> [201123 16:55]:
> > On Mon, Nov 16, 2020 at 10:04 AM Tony Lindgren <tony@atomide.com> wrote:
> > >
> > > * Grygorii Strashko <grygorii.strashko@ti.com> [201030 14:47]:
> > > > Enable networking options required for NFS boot on TI platforms, which is
> > > > widely for automated test systems.
> > > > - enable new TI CPSW switch driver and related NET_SWITCHDEV config
> > > > - enable TI DP83867 phy
> > > > - explicitly enable PTP clock support to ensure dependent networking
> > > > drivers will stay built-in.
> > > >
> > > > vmlinux size changes:
> > > > - before:
> > > >    text       data        bss        dec        hex    filename
> > > > 14703736    8024602     444976    23173314    16198c2    ./omap-arm/vmlinux
> > > >
> > > > - after:
> > > >    text       data        bss        dec        hex    filename
> > > > 14727271    8029150     444528    23200949    16204b5    ./omap-arm/vmlinux
> > > >
> > > > diff: 27635 (dec)
> > >
> > > Thanks applying into omap-for-v5.11/defconfig.
> >
> > Oops, I just applied it as well (as it was sent to soc@kernel.org it appeared
> > in patchwork) and I  noticed too late that you already had it.
> > Should I remove it at my end, can you just drop your copy?
>
> Sure no problem, I'll drop my copy.

Thanks!

     Arnd
