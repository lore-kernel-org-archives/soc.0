Return-Path: <SRS0=45Hb=E5=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 584E3C2D0E4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2020 18:22:52 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DE7C220BED
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2020 18:22:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="RiiX5mYe";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="OenrjoUI"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DE7C220BED
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=aK4ZIXwFuBK4raQILnOwxuZFY8Uy3vsxsBrikRYUrBc=; b=RiiX5mYezIUbuVXz2yPr4+qOX
	fPOIFKS5CoYN6DoqjQdhsf3UP5pDzDQy8qgk7fKtX8G/oY2tm3uklK8uDJMegif5K8YOzFQnjkQJE
	0zNAqiwRn1IiTOAkgueOq65XmAl0j7shMy20yjccBmbxk3qMwFzcG3lIT++/VUpsJ8+gXImuRDSFD
	QShO6axsoLdEHMtwC/7EN+m7ashvgdPrgjGqHVHrqpupQfWBOihlr5BjSzkRTS+4k7nnrlHlqjam1
	W7SSXqwHyorVhcqMtLFN9LVQf8UCgSl2tQPknuLqnCKRU0aT3n8mKCFjj1JJ00lMm+dbFxrdlpdNK
	S/TP06APQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1khGTt-0002xZ-7C; Mon, 23 Nov 2020 18:22:29 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1khGTq-0002wF-BT
 for linux-arm-kernel@lists.infradead.org; Mon, 23 Nov 2020 18:22:27 +0000
Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com
 [209.85.210.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 5FE3220BED
 for <linux-arm-kernel@lists.infradead.org>;
 Mon, 23 Nov 2020 18:22:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1606155745;
 bh=lhlLbSBjS+IMZ3O7opbrbZzzm2KL2JGsBL/0Nk96kBM=;
 h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
 b=OenrjoUITdC7UZxURxdMGRl6UadP6wuqRJhqaOosymf85pkix1G4PoOE1CJEQxrQT
 zZJH+a3jqRqAmK0fKA/HUHTuHXdDuqIXcy9T6IWvFP88AIQvxZ9Ed15cl0Vhb/a0fi
 JVFdjZHY4k/e0kg8a4GAm5709jJNF+9gz9GiofCU=
Received: by mail-ot1-f51.google.com with SMTP id 92so13766514otd.5
 for <linux-arm-kernel@lists.infradead.org>;
 Mon, 23 Nov 2020 10:22:25 -0800 (PST)
X-Gm-Message-State: AOAM531dhOz93/yconoG95pSLGs02WfVC1D8CL2Yf6M9BMa5egnzbjsk
 8uSpG7SQ6VfxpWrkO+fM6hrLOUdWtkGT8zRmZ/w=
X-Google-Smtp-Source: ABdhPJy8cKeXOnOFd1SMpfIJI9tom1a6owxHdNLigtG6eK43g/GWsYi8u8QmSJbtL+abbydCn2AmtQTXKDx4Ay8L3v8=
X-Received: by 2002:a05:6830:22d2:: with SMTP id
 q18mr414874otc.305.1606155744665; 
 Mon, 23 Nov 2020 10:22:24 -0800 (PST)
MIME-Version: 1.0
References: <20201030124650.20349-1-grygorii.strashko@ti.com>
 <20201116090429.GB26857@atomide.com>
 <CAK8P3a0-LWzSvvKkH5xVAoCfNGG_fhDJ37AZVW+qknSZU1wxDw@mail.gmail.com>
 <20201123172726.GQ26857@atomide.com>
In-Reply-To: <20201123172726.GQ26857@atomide.com>
From: Arnd Bergmann <arnd@kernel.org>
Date: Mon, 23 Nov 2020 19:22:08 +0100
X-Gmail-Original-Message-ID: <CAK8P3a34=9SiP1Uqa808teKCB8w+W9cc-sYyLYways9xrQg-sA@mail.gmail.com>
Message-ID: <CAK8P3a34=9SiP1Uqa808teKCB8w+W9cc-sYyLYways9xrQg-sA@mail.gmail.com>
Subject: Re: [PATCH v2] ARM: multi_v7_defconfig: ti: Enable networking options
 for nfs boot
To: Tony Lindgren <tony@atomide.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201123_132226_578682_329D2C69 
X-CRM114-Status: GOOD (  18.66  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
List-Id: <soc.lore.kernel.org>
Cc: Nishanth Menon <nm@ti.com>, Grygorii Strashko <grygorii.strashko@ti.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, Arnd Bergmann <arnd@arndb.de>,
 Sekhar Nori <nsekhar@ti.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 SoC Team <soc@kernel.org>, linux-omap <linux-omap@vger.kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20201123182208.kMdN1OrXz7sTH69XVGejkhZsEVgRb_MpZZjLTPUUbWM@z>

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

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
