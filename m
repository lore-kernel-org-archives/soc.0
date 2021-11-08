Return-Path: <SRS0=u9qy=P3=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 539E8C433EF
	for <linux-riscv@archiver.kernel.org>; Mon,  8 Nov 2021 15:39:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 067536120D
	for <linux-riscv@archiver.kernel.org>; Mon,  8 Nov 2021 15:39:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 067536120D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Nt+PiRJx1u8SDeEkLE3O15RJs45NO78GArrFJ/nvT48=; b=fFVfGURFFQCsVI
	r/dB83sUMfBDuzkoSqrHmYOVfg7p0ZOwcjbntRFEeQWaGOHyVmOxw9o329q+HWcMrgYtRZ4ZgB4el
	627rJUzdK4In6GdBsBQc6p/oLtyEPmCUbffzK3sUNINIK2/3MOKBB5rI+3PKeT8f1W09xZnqP6rlq
	7WGr8lJRjvCQAf+Tgqf10itm3KEG5exYCjFZ+BYfJCcCiudMYa/VLar95Pgye+lMd5qcD05sR1pgQ
	sajBxhSZNiY/FWrZSBxRuSUC4909a3uikTtBD8uviiIi5FFDhKvanLpQUgxNJSd711O0fbRYN75Sw
	tNO/MMkK/UzhsB9CUqjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mk6jm-00GrP3-P1; Mon, 08 Nov 2021 15:39:10 +0000
Received: from mout.kundenserver.de ([212.227.126.134])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mk6jj-00GrOE-D4
 for linux-riscv@lists.infradead.org; Mon, 08 Nov 2021 15:39:09 +0000
Received: from mail-wm1-f49.google.com ([209.85.128.49]) by
 mrelayeu.kundenserver.de (mreue011 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1Mzhzd-1mWiiC2nPF-00vbn2 for <linux-riscv@lists.infradead.org>; Mon, 08 Nov
 2021 16:39:01 +0100
Received: by mail-wm1-f49.google.com with SMTP id z200so13377528wmc.1
 for <linux-riscv@lists.infradead.org>; Mon, 08 Nov 2021 07:39:01 -0800 (PST)
X-Gm-Message-State: AOAM5321+75IgBZJ/baPNBIhj4fMY368ujMpH60+QRv4ymAW/YcXcsXv
 UBWEKCFjpItH2wlzgDjUgCmWBGqsJgrCuP31sfg=
X-Google-Smtp-Source: ABdhPJyXq+VZc2jONwlmXrBFyz9a+T8myfi+JgkFw7D4CYWMuoZyMYG0cC+vmoNAAFrxSa3fRL4VzPL0bnwjGPck568=
X-Received: by 2002:a1c:2382:: with SMTP id j124mr181071wmj.35.1636385941168; 
 Mon, 08 Nov 2021 07:39:01 -0800 (PST)
MIME-Version: 1.0
References: <79ae46c3-c028-2c99-2428-b601e4fb03d4@microchip.com>
 <mhng-a25d4570-1744-44ef-988b-43914d5bc17d@palmerdabbelt-glaptop>
 <CAK8P3a31Gj-0DgN+ooMZds8_iOJWwGRp4FZLD0kgo9Go=Pzyhw@mail.gmail.com>
 <46f04c45-cd50-9484-de41-be8c390bf8e3@microchip.com>
In-Reply-To: <46f04c45-cd50-9484-de41-be8c390bf8e3@microchip.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Mon, 8 Nov 2021 16:38:44 +0100
X-Gmail-Original-Message-ID: <CAK8P3a1m_LhOg5JGMqPz6sohJa2hPZ3GN-jQDPxigZ5DaqAGxQ@mail.gmail.com>
Message-ID: <CAK8P3a1m_LhOg5JGMqPz6sohJa2hPZ3GN-jQDPxigZ5DaqAGxQ@mail.gmail.com>
Subject: Re: [PATCH] soc: add polarfire soc system controller
To: Conor.Dooley@microchip.com
List-Id: <soc.lore.kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
 SoC Team <soc@kernel.org>, 
 Rob Herring <robh+dt@kernel.org>, Damien Le Moal <Damien.LeMoal@wdc.com>, 
 Jassi Brar <jassisinghbrar@gmail.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Paul Walmsley <paul.walmsley@sifive.com>,
 linux-riscv <linux-riscv@lists.infradead.org>, 
 "nathan=20Neusch=C3=A4fer?=" <j.neuschaefer@gmx.net>,
 Stephen Rothwell <sfr@canb.auug.org.au>, Cyril.Jean@microchip.com, 
 Daire McNamara <Daire.McNamara@microchip.com>,
 Atish Patra <Atish.Patra@wdc.com>, 
 Nicolas Ferre <Nicolas.Ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Ludovic Desroches <Ludovic.Desroches@microchip.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
X-Provags-ID: V03:K1:UL4Q2PymHfb90GexP0KWLI2yloy30E7eixf+GIXsw5sm2PwEHYF
 /oenDJATXhfYIsbZWKmDajdi3TTyUp4C0whDJmzo6/1/SyZOZZL90rxPGC64NglHU374RN3
 H0draWlkQhcXfkF16XHQvtavTfmvePZPl56tQ7kGhNW7OgKhf9LV8RAB0Z45YwS9s0+QNk5
 8GIZSebjsM8vTiy4qis5w==
X-UI-Out-Filterresults: notjunk:1;V03:K0:eA3Yu2e66QY=:kZWsgk6AD3lcjptkS4IIu+
 NvitDz1yMjsz7ZINYkAobxxL5cLNoijrLOrvK192HW1R2KQZPSLXDqncuFFPjQ8YWEWSH4N0Z
 Nxw+n1vJo87JJJZeZbutAUdsAFZUG10eZXt2ajJPhmaXfjy3EHXYNeckr9fvMBC+Py6BsTF9N
 UPZMaBwVM4KSOEOLySPMODlnaJB5Mvyhf1wliluuSXKRJXaNjAHxphBUYOtTK/oo6EdKdoWa2
 yNdOzcx/0SG8Aj+DAwYtUw7oPiZL5yBI/ZKb2FevGhS5tuDf5tl/GBvLv0wET3rXKHLoRWY/P
 g0HSpjQV5lMz7+L9DgeL5dTc+SPTsjcD8kRSRMVekeeY9QEqLmyeYD5swl2WYJkWjTzX5hRH5
 LsyXK1cBSomQB5j2xglNXRoFY8bZd0QHzRsH+yFIoLs8CxDupv6YThZOvemMMcTEeJlLlp07g
 KSM9OeG7JdDnWXQowc9T4mmnfpanyLVO9lRdcWRncB5TFdYSuKrSGADcf1ZKdHDeQ+yl8edYl
 wVEjHDOCE1mY8Cd09Maad2iAJyQGG3m5WD1DtPO3dCxQAHqZWBUYCB62+fOhcHgod18r6ciQt
 pvWxZdu39n65m3X/tkkFG/IJk2HtVr8xx0XyMXxJeQZOMrfrNhNMmSMu/QdO1G8DOS16Dw0VY
 PdEA5/2hBgnWMSiDY3RYMxGUf2MlRKItn+N18prZLM35mVysH0mlCrNmZ81I/hAEUwnqJcJZc
 wem5N7tQunP+nszLUOXad0dS1wXQuFi1BSUNKPCTSsLvBaHQ6nwWF1aCtmn4rqO0cr+YUro/O
 kT2mO0BzufMnLPaFb0iG5ReQyFgquruPpqHOtdW75riGbzupbg=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211108_073907_784584_D2F3AFD3 
X-CRM114-Status: GOOD (  23.95  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20211108153844.-yjY-I3FXrk6eKjqIQHjGKbdEpNu76Na-T9jzfgvr70@z>

On Mon, Nov 8, 2021 at 4:19 PM <Conor.Dooley@microchip.com> wrote:
>
> On 21/10/2021 19:34, Arnd Bergmann wrote:
> >>>> +int mpfs_blocking_transaction(struct mpfs_sys_controller *mpfs_client, void *msg)
> >>>> +{
> >>>> +    int ret;
> >>>> +
> >>>> +    mutex_lock_interruptible(&transaction_lock);
> >
> > When you do a mutex_lock_interruptible(), you have to check its return code and
> > handle the interruption, usually by passing down -EINTR to the caller.
> >
> >>>> +struct mpfs_sys_controller *
> >>>> +mpfs_sys_controller_get(struct device_node *mss_node)
> >>>> +{
> >>>> +    struct platform_device *pdev = of_find_device_by_node(mss_node);
> >>>> +
> >>>> +    if (!pdev)
> >>>> +            return NULL;
> >>>> +
> >>>> +    return platform_get_drvdata(pdev);
> >>>> +}
> >>>> +EXPORT_SYMBOL(mpfs_sys_controller_get);
> >
> > There should probably be a check in here to ensure that this is actually
> > a system controller and it's bound do this driver, rather than returning a
> > random device's driver data >
> > It might also help to make this take a phandle instead of a device node
> > for lookup, to spare the client the extra phandle to node conversion.
>
> Finally got around to this again, is it sufficient to just check that
> platform_get_drvdata returns non null, or should I also check if the
> pdev matches the drivers compatible strings? Only found one example of
> the latter and a mix of the former & what I had done when I went looking
> around at other drivers.

Neither of those helps at all, it could still be a random other device.

I would check that the device is bound to mpfs_sys_controller_driver here,
that should be the easiest way. Looking at it some more, I suspect the
reference counting needs to be improved as well, to ensure that the
device is not going away here. You only hold a reference on the
of_node (which you apparently never release either), but not on the device.

    Arnd

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
