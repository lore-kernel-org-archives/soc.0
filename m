Return-Path: <SRS0=U7wc=HK=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FB60C433E0
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Feb 2021 16:47:34 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 319A864E92
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Feb 2021 16:47:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 319A864E92
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=5kapX3+ajIlOHZeVqy2t/Jz6qzgXPX/GkibHwIlNb6c=; b=fSVlx/73FQBtSulJ/SxrO8aIz
	1kgF+pd2ZaG9w4vztw+nUW8pXilnb6IsH9004v4OQsI8xthcbOQl95A4d4ZUauwYxi5Mbn12NMcEW
	wZCCOSmMHKI1xhSxrkoLnaz3GDclhdTGP5+dN51XViXlf7mtrC18hufht/IBqlmhQXjtHuwRYXQvT
	zsLSoGl8ZsJPEeatEEu/N3hOlaFJ+eKX9mmEFobUbYY6q2t560PdtNcqQZRwhmR+uPm4n83Xg2WAj
	woeUdOj8aophD7LkPtGO9aRlu7C+9U73dDTnkLtnl3QZI0dPGJEw8nBRbHX77btH0zrPc12UJo9NH
	/GOKzQK9g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l99gB-0003TD-BD; Mon, 08 Feb 2021 16:46:27 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l99g8-0003SP-Iy
 for linux-arm-kernel@lists.infradead.org; Mon, 08 Feb 2021 16:46:25 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0233864E8C;
 Mon,  8 Feb 2021 16:46:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1612802783;
 bh=rRjfEFof8z2zXcMybZQcZB0Y/Qk60nFQBUIR9y+gZcg=;
 h=Date:From:To:List-Id:Cc:Subject:References:In-Reply-To:From;
 b=niQVPo5DuPZMzD/Vyz4i+otHijqhyUCs3iVnF+GWM6b9S6F9J5962+nbClDEk1CBn
 fEW5OMAdEX9e09OcBx+WrkB7lktjjCfkL4iPl3vKox/88GoUR3pOP9TuKf1+7Z292Z
 GcTmQ6BTQ1pWRZqntPnDohc0xGICbYR8nQgnFEjc=
Date: Mon, 8 Feb 2021 17:46:20 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Hector Martin <marcan@marcan.st>
Subject: Re: [PATCH 05/18] tty: serial: samsung_tty: add support for Apple
 UARTs
Message-ID: <YCFq3DqOzv4//6Vw@kroah.com>
References: <20210204203951.52105-1-marcan@marcan.st>
 <20210204203951.52105-6-marcan@marcan.st>
 <87lfc1l4lo.wl-maz@kernel.org>
 <e842f37d-d788-2d34-05e4-86ef94aed8f5@marcan.st>
 <73116feaa00de9173d1f2c35ce16e08f@kernel.org>
 <7adf8ede-f7ff-7c62-d0fd-9ab4eaf25741@marcan.st>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <7adf8ede-f7ff-7c62-d0fd-9ab4eaf25741@marcan.st>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210208_114624_911757_2BE886E3 
X-CRM114-Status: GOOD (  25.59  )
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
Cc: Arnd Bergmann <arnd@kernel.org>, devicetree@vger.kernel.org,
 Marc Zyngier <maz@kernel.org>, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzk@kernel.org>, soc@kernel.org, robh+dt@kernel.org,
 Olof Johansson <olof@lixom.net>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210208164620.AWugC-1QljCsirj9jGk3WoRTspE3mo_PPs-bC5QPv_4@z>

On Tue, Feb 09, 2021 at 01:18:21AM +0900, Hector Martin wrote:
> On 08/02/2021 19.34, Marc Zyngier wrote:
> > On 2021-02-07 09:12, Hector Martin 'marcan' wrote:
> > > On 06/02/2021 22.15, Marc Zyngier wrote:
> > > > Do you actually need a new port type here? Looking at the driver
> > > > itself, it is mainly used to work out the IRQ model. Maybe introducing
> > > > a new irq_type field in the port structure would be better than
> > > > exposing this to userspace (which should see something that is exactly
> > > > the same as a S3C UART).
> > > 
> > > Well... every S3C variant already has its own port type here.
> > > 
> > > #define PORT_S3C2410    55
> > > #define PORT_S3C2440    61
> > > #define PORT_S3C2400    67
> > > #define PORT_S3C2412    73
> > > #define PORT_S3C6400    84
> > > 
> > > If we don't introduce a new one, which one should we pretend to be? :)
> > 
> > Pick one! :D
> 
> *queries /dev/urandom* :-)
> 
> > > I agree that it might make sense to merge all of these into one,
> > > though; I don't know what the original reason for splitting them out
> > > is. But now that they're part of the userspace API, this might not be
> > > a good idea. Though, unsurprisingly, some googling suggests there are
> > > zero users of these defines in userspace.
> > 
> > I don't think we can do that, but I don't think we should keep adding
> > to this unless there is a very good reason. Greg would know, I expect.
> 
> Greg, what do you think? Add more PORT_ UART types for Samsung variants, or
> overload one of the existing ones and deal with it in the driver?

I HATE adding new PORT_ types, as I am almost positive no one uses them,
but as they are in the uapi files, we can't delete them.

So, just use an existing one, why do you want a new one?  If you don't
have a userspace tool that requires it, don't bother.

Just use PORT_8250 and be done with it.  I should force all new drivers
to use that as well :)

thanks,

greg k-h

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
