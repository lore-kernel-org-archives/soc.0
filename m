Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B08F4C2D0E4
	for <soc@archiver.kernel.org>; Mon, 23 Nov 2020 16:55:12 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 757AC208DB; Mon, 23 Nov 2020 16:55:12 +0000 (UTC)
Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 4D49820717
	for <soc@kernel.org>; Mon, 23 Nov 2020 16:55:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1606150512;
	bh=5TGQ3RvpR/ANMcUFjqtgG01/NFwVjegKi7FjVQq6IuI=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=WhShZmP0B0/hIgpirSjZyeqj/NGmDSU46uFfawlr23hDGl4sKySLYYtBwzEb/3e4V
	 zx1d3uD6VGXnpPm2E+O0wIBwjeEaOn+mp02QkHfXz3fPRImv77aW+IX7daTJsP8cD2
	 hWxzP5aF4jr6aUe+KLjmi7qFwzrM4V06+IUM/3Fg=
Received: by mail-ot1-f45.google.com with SMTP id f16so16500178otl.11
        for <soc@kernel.org>; Mon, 23 Nov 2020 08:55:12 -0800 (PST)
X-Gm-Message-State: AOAM533xDoVgLoZ+DJQ33kcyuzi7G1+7D1fUzVssPadJ7zTXPwfrr1s+
	qDuq/vCwEdUDmqLhr6OfPNySGFJICik5EEvcVwo=
X-Google-Smtp-Source: ABdhPJwLHjRURvfwueQxlU/IdS64L590RX9HP+hnspqyEDouBWRDck9NdIpuMQUUNFjRXxlkolBeQkOgv4ZNNW3lLn8=
X-Received: by 2002:a9d:6317:: with SMTP id q23mr121018otk.251.1606150511661;
 Mon, 23 Nov 2020 08:55:11 -0800 (PST)
MIME-Version: 1.0
References: <20201030124650.20349-1-grygorii.strashko@ti.com> <20201116090429.GB26857@atomide.com>
In-Reply-To: <20201116090429.GB26857@atomide.com>
From: Arnd Bergmann <arnd@kernel.org>
Date: Mon, 23 Nov 2020 17:54:54 +0100
X-Gmail-Original-Message-ID: <CAK8P3a0-LWzSvvKkH5xVAoCfNGG_fhDJ37AZVW+qknSZU1wxDw@mail.gmail.com>
Message-ID: <CAK8P3a0-LWzSvvKkH5xVAoCfNGG_fhDJ37AZVW+qknSZU1wxDw@mail.gmail.com>
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

On Mon, Nov 16, 2020 at 10:04 AM Tony Lindgren <tony@atomide.com> wrote:
>
> * Grygorii Strashko <grygorii.strashko@ti.com> [201030 14:47]:
> > Enable networking options required for NFS boot on TI platforms, which is
> > widely for automated test systems.
> > - enable new TI CPSW switch driver and related NET_SWITCHDEV config
> > - enable TI DP83867 phy
> > - explicitly enable PTP clock support to ensure dependent networking
> > drivers will stay built-in.
> >
> > vmlinux size changes:
> > - before:
> >    text       data        bss        dec        hex    filename
> > 14703736    8024602     444976    23173314    16198c2    ./omap-arm/vmlinux
> >
> > - after:
> >    text       data        bss        dec        hex    filename
> > 14727271    8029150     444528    23200949    16204b5    ./omap-arm/vmlinux
> >
> > diff: 27635 (dec)
>
> Thanks applying into omap-for-v5.11/defconfig.

Oops, I just applied it as well (as it was sent to soc@kernel.org it appeared
in patchwork) and I  noticed too late that you already had it.
Should I remove it at my end, can you just drop your copy?

       Arnd
