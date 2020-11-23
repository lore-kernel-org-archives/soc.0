Return-Path: <SRS0=45Hb=E5=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39FE7C2D0E4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2020 16:56:33 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AD633206CA
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2020 16:56:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="jrb39agP";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="WhShZmP0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AD633206CA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=vt4jM4gK6TT+rf7/xvtivcTaKhCXTvckV9uW9pJLsfU=; b=jrb39agPCpUEe+L58Qy5abmGH
	BDr8x7M/19pTtl8cVtPEzHcXXu5aprkaz8EZ0uZu1rKYMnpF0zcNcQ1p6oAzjScy/a8qhoVLBnYMz
	B7uR7DSLzbp/Z8hFlkwqPDCQtQatuihlcTva026yQgJlthA6FX4aFluTtPslMiKZCHgUfx7kNthBS
	tnP9fPbY76lI1v/FwiFsXNsJs1l2Or0RTPeXoeDYq+IDhSOk8ZzJLiPwO9Ul46LrTMyebpcevZYkg
	CE/hQie17vY1Ykf/NipxMyswDRDyQpArVS6ecdid1wEmTnDGiW/l4Ywu7oOYexfgeryzFcwU0NzhR
	t0NRlFl1A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1khF7U-0004E6-C4; Mon, 23 Nov 2020 16:55:16 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1khF7R-0004D5-GM
 for linux-arm-kernel@lists.infradead.org; Mon, 23 Nov 2020 16:55:14 +0000
Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com
 [209.85.210.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 576E52083E
 for <linux-arm-kernel@lists.infradead.org>;
 Mon, 23 Nov 2020 16:55:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1606150512;
 bh=5TGQ3RvpR/ANMcUFjqtgG01/NFwVjegKi7FjVQq6IuI=;
 h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
 b=WhShZmP0B0/hIgpirSjZyeqj/NGmDSU46uFfawlr23hDGl4sKySLYYtBwzEb/3e4V
 zx1d3uD6VGXnpPm2E+O0wIBwjeEaOn+mp02QkHfXz3fPRImv77aW+IX7daTJsP8cD2
 hWxzP5aF4jr6aUe+KLjmi7qFwzrM4V06+IUM/3Fg=
Received: by mail-ot1-f50.google.com with SMTP id f12so5085089oto.10
 for <linux-arm-kernel@lists.infradead.org>;
 Mon, 23 Nov 2020 08:55:12 -0800 (PST)
X-Gm-Message-State: AOAM532N5n1S3DNyY76/9GxhRvCNPxiRqY4I9xxzQg7GkQwzncLFyEAp
 JcDHu0cedlKFXmarm8TXuxstCAH1ktOYokFr6GY=
X-Google-Smtp-Source: ABdhPJwLHjRURvfwueQxlU/IdS64L590RX9HP+hnspqyEDouBWRDck9NdIpuMQUUNFjRXxlkolBeQkOgv4ZNNW3lLn8=
X-Received: by 2002:a9d:6317:: with SMTP id q23mr121018otk.251.1606150511661; 
 Mon, 23 Nov 2020 08:55:11 -0800 (PST)
MIME-Version: 1.0
References: <20201030124650.20349-1-grygorii.strashko@ti.com>
 <20201116090429.GB26857@atomide.com>
In-Reply-To: <20201116090429.GB26857@atomide.com>
From: Arnd Bergmann <arnd@kernel.org>
Date: Mon, 23 Nov 2020 17:54:54 +0100
X-Gmail-Original-Message-ID: <CAK8P3a0-LWzSvvKkH5xVAoCfNGG_fhDJ37AZVW+qknSZU1wxDw@mail.gmail.com>
Message-ID: <CAK8P3a0-LWzSvvKkH5xVAoCfNGG_fhDJ37AZVW+qknSZU1wxDw@mail.gmail.com>
Subject: Re: [PATCH v2] ARM: multi_v7_defconfig: ti: Enable networking options
 for nfs boot
To: Tony Lindgren <tony@atomide.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201123_115513_651760_77DEB385 
X-CRM114-Status: GOOD (  15.45  )
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
Message-ID: <20201123165454.Sn0Mp7rGYn3OAWUs1SZFM7mvMJo2wkgLCwBzBCfXt8Q@z>

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

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
