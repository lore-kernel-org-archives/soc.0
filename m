Return-Path: <SRS0=WGdq=M2=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA91AC4338F
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Aug 2021 12:02:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9D1F06052B
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Aug 2021 12:02:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9D1F06052B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ef+FYlMFpVyyY6nk1v05x+ovAsd9uu1V1TXkjexMjU0=; b=5DmEATYFBuKUnd
	1lPiE52ll9FmS5YV2jx8/KvOJD9VAGJdsq7iq/3k7uq5ioO8HMgn9E6Up58ZM+LlOtU6YeqJ8BIIX
	TOM8fzrClFFG8zmVutzJF3GZoy9d3jNghLz5Ba1xWwAowG1Ns4oSAB1FUDhWWq0FDNsSDnxqOTzC4
	erGftR+nbswcPT8+dYz0EQMaWQaEFFEfuK0qbSCZJADkgko4U8uaPZLozw6UV0QiVgNdb4p8S2zz8
	/Gl+uziMmloY2LB67mBlAxI59OUYhEfBSq3fqJjbZvTSZdN4+Awyvi5cKqQK4EVDSktwsRIuSmCVb
	WcBNAfIdyDbHkNbvzatA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mAt5N-002S8r-63; Tue, 03 Aug 2021 11:59:54 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mAt4b-002Rvw-IB
 for linux-arm-kernel@lists.infradead.org; Tue, 03 Aug 2021 11:59:07 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id D65EA60F41
 for <linux-arm-kernel@lists.infradead.org>;
 Tue,  3 Aug 2021 11:59:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1627991944;
 bh=srQIycfhfH5WX8YKn+/lFJA77txuOFavSxSVJIhI5oE=;
 h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
 b=mSfxNTO6ANBGWTICJC+sezS9hSZVRjsXhgGC5l83du+yKrtmThplMDb7rLWTv8wyd
 lasSNuJzZs66F9wiQERcZ/8Fn8zvSr7yyajktzKVv66i01Thu6xElteiPbUj2GZROx
 ym0A6bk6QgdPSus+KLTt8B1G3bI5W6MBOw/c/aXLOrVWP9rZ8wf+Jemedjl+//aeq4
 wm5/XRpzyrXhTAiJ17kP/WRx9x6ubQKb9N1ROq1aOWz1zzlKqLTT7PDuC9SGdGKyy4
 se2BnK4y509RXPgIolEIv1oBRX5kiguGfDfqONIJHkTs3QRMhON72M/4dRoEFXMVeh
 kUD/WPJCfSJcA==
Received: by mail-wr1-f48.google.com with SMTP id p5so25049359wro.7
 for <linux-arm-kernel@lists.infradead.org>;
 Tue, 03 Aug 2021 04:59:04 -0700 (PDT)
X-Gm-Message-State: AOAM530I/eA97h+mK/PNq+8rTVu7sMUjvvJ/VH0qrO+UyAavPCM51v6a
 8vKQ2ELlgwTdfx8+R2CBb6Pc2+3NWUtZVcfUjfw=
X-Google-Smtp-Source: ABdhPJzMtgQIAKJXGT7UCeFsWOcxw3QQc62HjckxRJGn75ZeLtfkhRUtMkyTB6JL2YOsSJDijOWh+qaCNxmhdb5bdpM=
X-Received: by 2002:adf:fd90:: with SMTP id d16mr23933088wrr.105.1627991943405; 
 Tue, 03 Aug 2021 04:59:03 -0700 (PDT)
MIME-Version: 1.0
References: <20210802141245.1146772-1-arnd@kernel.org>
 <CAL4-wQqCL1S-GYu7VKJeTT37wh=rR=SMUuwgKiXnnn_Y=uydOA@mail.gmail.com>
 <CAL4-wQpKLtSj0xfNUXXLhbtN1wC051jpRneAuLYOi1riZfiinw@mail.gmail.com>
In-Reply-To: <CAL4-wQpKLtSj0xfNUXXLhbtN1wC051jpRneAuLYOi1riZfiinw@mail.gmail.com>
From: Arnd Bergmann <arnd@kernel.org>
Date: Tue, 3 Aug 2021 13:58:47 +0200
X-Gmail-Original-Message-ID: <CAK8P3a2z_xxpz9hAYoBx5=bS81V=TkjEU6WHNhPi1UhQ3UScfw@mail.gmail.com>
Message-ID: <CAK8P3a2z_xxpz9hAYoBx5=bS81V=TkjEU6WHNhPi1UhQ3UScfw@mail.gmail.com>
Subject: Re: [PATCH] ARM: ep93xx: remove MaverickCrunch support
To: Martin Guy <martinwguy@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: Russell King <linux@armlinux.org.uk>,
 Hartley Sweeten <hsweeten@visionengravers.com>, 
 Alexander Sverdlin <alexander.sverdlin@gmail.com>, SoC Team <soc@kernel.org>, 
 Nikita Shubin <nikita.shubin@maquefel.me>, Arnd Bergmann <arnd@arndb.de>, 
 Oleg Nesterov <oleg@redhat.com>, Hubert Feurstein <hubert.feurstein@contec.at>,
 Lukasz Majewski <lukma@denx.de>, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>, 
 Linus Walleij <linus.walleij@linaro.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 clang-built-linux <clang-built-linux@googlegroups.com>,
 jerome.oufella@savoirfairelinux.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210803_045905_697299_0F5CCB1A 
X-CRM114-Status: GOOD (  29.17  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210803115847.iO67ZJFf7JRPHD6nE94zdV42Kxx4nx0MWb66Rzh5WMk@z>

On Tue, Aug 3, 2021 at 1:41 PM Martin Guy <martinwguy@gmail.com> wrote:
>
> I forward opinion from people currently producing and supporting EP93XX boards:

Thanks a lot for bringing them in. I definitely don't want to remove support for
something that is actively being used, and we don't have to merge the patch
if they currently rely on MaverickCrunch on older platforms.

It does sound however like Jerome's customers are using a normal (softfloat)
Linus distro on EP93xx, rather than one using the original MaverickCrunch
FPU instructions. There are no plans to discontinue EP93xx support, there
is actually a good amount of recent work going into updating the platform.

Jerome, please let me know if I understood you correctly here. If your
customers do rely on MaverickCrunch support in user space, I would
leave that in the kernel for as long as ep93xx itself is supported, and instead
require building support with the GNU assembler to avoid having to
add support to the clang integrated assembler. If you don't know of anyone
using MaverickCrunch, I would go ahead with my patch to remove kernel
support.

      Arnd

> From: Technologic Systems Support Team <support@embeddedarm.com>
> To: martinwguy@gmail.com
> Cc: jerome.oufella@savoirfairelinux.com
>
> > I expect our customers would care if support was dropped.
> > Unfortunately I don't know to what extent.  I'd like to bring
> > Jerome Oufella of Savoir Faire Linux into the conversation here,
> > as he runs the software company who most of our customers
> > contract through when they need a modern Linux kernel running
> > on one of our Cirrus Logic EP93XX series single board computers.
> > I expect his opinion will be more valuable than mine.
> >
> > Good morning Jerome,
> >
> > A member of the Linux Kernel Development community reached out
> > to us this morning letting us know the community has suggested
> > dropping support for the MavericCrunch FPU on the EP9302 processor.
> > Would this impact any of the development your team has been doing
> > for some of our mutual customers?
>
> From: Jerome Oufella<jerome.oufella@savoirfairelinux.com>
> > I am aware of a few companies who rely on variants of the TS-7250
> > running not-too-old LTS releases (4.19, 5.4) to cope with their patch policies.
> >
> > With Linux 5.10 being the next "Super LTS", this presumably brings its
> > support lifespan until about 2030, which (I believe) they would be
> > comfortable with considering the age of the platform.
> >
> > Jerome Oufella
> > Vice-President, Technologies
> > www.savoirfairelinux.com

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
