Return-Path: <SRS0=XH8j=PJ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF0E1C433EF
	for <linux-riscv@archiver.kernel.org>; Thu, 21 Oct 2021 18:47:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6FBAC60EFE
	for <linux-riscv@archiver.kernel.org>; Thu, 21 Oct 2021 18:47:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6FBAC60EFE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+HYLdorXl9pw9Djkwf/mTzT5FnqKAvaZEYXC2uH9EY4=; b=4sUsCr+vLzMfMx
	Ou2nRbU4Cdo8xA+C/BguavmVeRQv9fe3PZn16KiI8eMBQfL/bmHG+TrceGZJt+S1RNAXMNI5TNn1q
	xevPoLtsXGBjasDPD/jft8m19T4xYA+G3I3QvmWFKNooOsTZclQrYqYgwdYQw5kUThp7YTfgqehgr
	+R++g+gTkMmbkqQSiVtUAemMwgN0hRWxMekbID/9S+c4m/mzM8hFVgFJUqxAKLeUsOqZh6WUd/I2x
	Mzwl++PCDIQ9qFfbQ/FpxNQMGnAM5riGu2j4bLZIvj9yeJgqfvY1wmxOpKEArRXprSNjI7VrqTXB5
	32P26r1ns/BWYbIVioCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mdd65-008t0z-Ax; Thu, 21 Oct 2021 18:47:25 +0000
Received: from mout.kundenserver.de ([212.227.126.134])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mdcuJ-008noX-8v
 for linux-riscv@lists.infradead.org; Thu, 21 Oct 2021 18:35:17 +0000
Received: from mail-wm1-f48.google.com ([209.85.128.48]) by
 mrelayeu.kundenserver.de (mreue009 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1MYvTs-1m8qTv08ga-00Uo23 for <linux-riscv@lists.infradead.org>; Thu, 21 Oct
 2021 20:35:11 +0200
Received: by mail-wm1-f48.google.com with SMTP id
 y22-20020a1c7d16000000b003231ea3d705so648007wmc.4
 for <linux-riscv@lists.infradead.org>; Thu, 21 Oct 2021 11:35:10 -0700 (PDT)
X-Gm-Message-State: AOAM531TP37jWH8hSNzHor2MX3gD6XGqGrZKER9gEfRQJH+eBnEJko2+
 GbCp81o+FYmo9YX3bILfRAXgKo0YmnJLeLwVLN0=
X-Google-Smtp-Source: ABdhPJxJnttZVYDDq1wT7sqVg/34xA2ViJzSZlZ8uydGsF2cMPPIn30u8q+0i/QxoA4crgnhZkdmcwVqK+m7oJgBKVg=
X-Received: by 2002:a05:600c:1548:: with SMTP id
 f8mr8597496wmg.35.1634841310501; 
 Thu, 21 Oct 2021 11:35:10 -0700 (PDT)
MIME-Version: 1.0
References: <79ae46c3-c028-2c99-2428-b601e4fb03d4@microchip.com>
 <mhng-a25d4570-1744-44ef-988b-43914d5bc17d@palmerdabbelt-glaptop>
In-Reply-To: <mhng-a25d4570-1744-44ef-988b-43914d5bc17d@palmerdabbelt-glaptop>
From: Arnd Bergmann <arnd@arndb.de>
Date: Thu, 21 Oct 2021 20:34:54 +0200
X-Gmail-Original-Message-ID: <CAK8P3a31Gj-0DgN+ooMZds8_iOJWwGRp4FZLD0kgo9Go=Pzyhw@mail.gmail.com>
Message-ID: <CAK8P3a31Gj-0DgN+ooMZds8_iOJWwGRp4FZLD0kgo9Go=Pzyhw@mail.gmail.com>
Subject: Re: [PATCH] soc: add polarfire soc system controller
To: Palmer Dabbelt <palmer@dabbelt.com>
List-Id: <soc.lore.kernel.org>
Cc: Conor.Dooley@microchip.com, Arnd Bergmann <arnd@arndb.de>, 
 Olof Johansson <olof@lixom.net>, SoC Team <soc@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, 
 Damien Le Moal <Damien.LeMoal@wdc.com>, Jassi Brar <jassisinghbrar@gmail.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Paul Walmsley <paul.walmsley@sifive.com>, 
 linux-riscv <linux-riscv@lists.infradead.org>, 
 "nathan=20Neusch=C3=A4fer?=" <j.neuschaefer@gmx.net>,
 Stephen Rothwell <sfr@canb.auug.org.au>, Cyril.Jean@microchip.com, 
 Daire McNamara <Daire.McNamara@microchip.com>,
 Atish Patra <Atish.Patra@wdc.com>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Ludovic Desroches <ludovic.desroches@microchip.com>
X-Provags-ID: V03:K1:47h3Z3W35bmVNBUFMr8n8sb2DhxJGqFMY4IYevEqtjFASvMAjUH
 Q3+LKLd3RQRj2wrlO6CM4grz5f4sU5a2BF/dP6B86jrz+aL2+pRGyghwArw5ATiy9CXhzC3
 fupEM/oXuIlAnEJuLcXHtlHp9T7ENlI6E5xWssHakrFUdEIq/EKDCVse1Kkcm2+l/xQWO6r
 E47Wz62IDElfYdOOmtgDw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:N2HDL2WKee8=:WPYNlWYhJ8kX73oHlmFsMp
 ikWD1CCShz1aAxz/yHBq3hwPUJBDdoLNjDr2RTxiKf3lLpjBvxvsWe3ZsPMVfYRvJO3FT/Rg5
 ZRt546J5czJSE4CIwjCg5Y4qGeLTHKQLFu3Y7sG537mdHOktkPQEdOLjtVXOQpoP9anAPJuD4
 3fGdFU6rYQqrrR9yeMrqJ+z+3FtR5Tes3D+lKGz+mH7XTJS44gt0f06Uk3OdZVYaKICxEpNl7
 ixXOw77W6pEtgMQaud9MRAF3qqerUcbC4zGko5awE2WzCkVTCGnT6y1+nG5e/AIF5imJbPjm3
 dZ3f1Gtorg1GBjJBRIw3AfkEnTxW2UPgcyTvINRSSUzJpeAkRcmoY9BFzMDxHkjgM1JO9Y7dM
 Jvpwnhwe80Y2zdp2VJVzh6gP0eyqwuBOKDyZ3n8CwMiKR5IIun4C7+iFPGNqlFcUqFt6SLZ2N
 i2t479XYZfMTGIqJivYV1LUy9LzU9u6f8fCi0Q9qqfQj9husXjrC6kLvJ9/PNhV/jFMELunfF
 bdPZ3Qa2+Eu/tEWSP6yWWnBdCa3/CRHvfFKD0r3d860e8cnHUC4pYsrojmLwecA/vaL9ztoVn
 fru89cPTyzu0d6CQR7+I3S167zvLmkm+pbPrFSy42DcTEo/mqZVyPnMSpLTV9IxskhN1BoZRJ
 VVVzJUWiEzzu2Bi3mOWhwsnpKFQHrFqWvzl3847/8H89yOO9A59lcY5HMdsUMMkouDe5yCPqv
 /pQzcf9/FZ50TXlU7XRGAC3xgfwKwrMxTqX+1E5mamhSeRf51j018xp7g3Hl25KGTwo/Lp+qh
 ERrky6uy/u09j8ZOmmx/0QasQQwzkUALN0/ZkgPV2he9gmBcTE=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211021_113515_662382_4CB21DC6 
X-CRM114-Status: GOOD (  35.09  )
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
Message-ID: <20211021183454.mFWGGEdaSlIHJC_0_mNUOBu0Ge2AWdqHrAXeQzI0fw0@z>

On Thu, Oct 21, 2021 at 6:00 PM Palmer Dabbelt <palmer@dabbelt.com> wrote:
> On Thu, 21 Oct 2021 06:13:35 PDT (-0700), Conor.Dooley@microchip.com wrote:
> > On 05/10/2021 13:47, conor.dooley@microchip.com wrote:
> >> From: Conor Dooley <conor.dooley@microchip.com>
> >>
> >> This driver provides an interface for other drivers to access the
> >> functions of the system controller on the Microchip PolarFire SoC.
> >>
> >> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> > Is there some extra CCs that I am missing on this patch that weren't
> > picked up by getmaintainers, and/or am I mistaken in thinking that
> > the soc tree is arm only?

We can handle non-Arm SoCs as well, though most architecture
maintainers prefer to keep them merged through their trees.

> +Arnd, Olof, and the SOC list.  They probably understand this better
> than I do, we're kind of new to having SOCs in RISC-V land.
>
> I guess I was assuming that someone maintained drivers/soc, but from
> poking around it seems like there's no entry for it and instead it's
> just a bunch of entries for the sub-directories.  As a result the
> scripts aren't picking up anyone to send these too, and I'd assuming
> that because they're not in arch/riscv that they're not for the RISC-V
> tree.
>
> That said, it looks like I put the Kendryte stuff in there (so sorry if
> I screwed anything up).  I'm happy to take these via the RISC-V tree as
> well, I'm assuming that means there should be a MAINTAINERS entry for
> this new sub-directory so changes to it are less likely to get lost.
> Sorry if I was confusing before, I guess I forgot about how this fits
> together.
>
> Arnd: aside from the lack of a maintainer, these generally look fine to
> me.  LMK if you were expecting this kind of stuff to go through the
> RISC-V tree.

It probably helps avoid merge conflicts to go through the soc tree,
as there are generally more changes for arm specific socs in there.

However, we usually take pull requests from platform maintainers,
not individual patches. For Microchip's ARM based platforms, those
patches would go through the AT91/SAMA5 maintainers (added to
Cc). You can ask them if they are willing to take future patches for
the polarfire soc as well and forward them to soc@kernel.org along
with the other stuff.

> >> +int mpfs_blocking_transaction(struct mpfs_sys_controller *mpfs_client, void *msg)
> >> +{
> >> +    int ret;
> >> +
> >> +    mutex_lock_interruptible(&transaction_lock);

When you do a mutex_lock_interruptible(), you have to check its return code and
handle the interruption, usually by passing down -EINTR to the caller.

> >> +struct mpfs_sys_controller *
> >> +mpfs_sys_controller_get(struct device_node *mss_node)
> >> +{
> >> +    struct platform_device *pdev = of_find_device_by_node(mss_node);
> >> +
> >> +    if (!pdev)
> >> +            return NULL;
> >> +
> >> +    return platform_get_drvdata(pdev);
> >> +}
> >> +EXPORT_SYMBOL(mpfs_sys_controller_get);

There should probably be a check in here to ensure that this is actually
a system controller and it's bound do this driver, rather than returning a
random device's driver data.

It might also help to make this take a phandle instead of a device node
for lookup, to spare the client the extra phandle to node conversion.

       Arnd

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
