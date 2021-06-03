Return-Path: <SRS0=SrHh=K5=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE8BDC47082
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Jun 2021 23:33:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AAAF6613EC
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Jun 2021 23:33:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AAAF6613EC
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ap1NqLPKg1Po32HlLhVclAIN1B4gZBMYljUgXTd2QPo=; b=hplNlyXWzqdEKz
	9O/LSAvC/i06l4/2TAO8D0uQMkBOUfGtsLNox+OHrzI5yja2O7fGuCmNSLy2vtwhtuy15GPjuPSqT
	9GvscQITaP48lpbAp642d02E7VQWd1bhif55rD8Aai9rndyxeWBkPhun+kjfVJMdeOiinZgFRTHml
	AWidSWf35hT7yyyGq5aaHrNL0fN2ITFlHFnqzC4A3+N5hBjik2jSmlkP1ZGzt1mbi6t00IrLmxbJc
	h9dqs2miqfyNTf9DhuOhFYBxleKWIQ5ijMGK2dwe64LtRTXHvUKRcOK81ubZP5NVBCBFHhaayqCOq
	qD+TmTYergSrgfsNa0Tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lown1-00Avks-Dp; Thu, 03 Jun 2021 23:30:15 +0000
Received: from mail-lj1-x22b.google.com ([2a00:1450:4864:20::22b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lowmx-00AvTt-Pk
 for linux-arm-kernel@lists.infradead.org; Thu, 03 Jun 2021 23:30:13 +0000
Received: by mail-lj1-x22b.google.com with SMTP id e2so9250259ljk.4
 for <linux-arm-kernel@lists.infradead.org>;
 Thu, 03 Jun 2021 16:28:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=yp2xRS7FBwt+MIq6S/QXxDvwXDIU2o3m3x2Gm2/0e9o=;
 b=MPHHM8hgXKQMT2F3JT70zdDS0t7cPi9LrYCnvh+CZ4kgONtffvYF4ixcKpCqqoO1Fs
 lJ2z7gOX0dMnOUZDsvDEoig7HUnPRq1rZ/Ye6SoLbryAHRbJhWlS4o9Bjo68dOwqmmec
 F1c6lUNcrK7UQ3b2+QDUfywN8IxfiMOKNfIpCZBVSE2I5EjCxtcpwNB3ySLJ7m+C/DcJ
 n2hjy3cxhoujdU5akqnPzk4ppjraB4hTA22266tJLfRLaNTqSaGHibK1uKWHHgbwS8ZO
 B4zbM+2OAZKY2NJaEpT3bmSNiZtXlnzqNNnDvxjzgqyJBaT1jzTOFQ3uGZn7oXSPjY9e
 9c0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yp2xRS7FBwt+MIq6S/QXxDvwXDIU2o3m3x2Gm2/0e9o=;
 b=ZLORgSs07bpdwQ3e54F0Iz2iRV3f68mPdNbgiLsxtSzBr/0u7FHBw3ZDqmu24Il9m5
 +gCO71cN7J9BKh9diUKD4lr2fkrCV3aH9lt1Xz6zJj38gEseahDZid/K9fimm8HR94Ah
 s75eITHuA+Hhno7Dgh3e0yJHQs2mvwoeJRoMpmZBeOBO7X4VKdqDHW1k2ELSk0RJ0jWA
 wqTLrFJIIvt8XQqV6OdRHmfJlQ55BhcsoNsKPHfyrYu8a6x22Q1NUYP2r9trudf6jzca
 Tj5q5zKpZl6JG2a26WFUmvtjQsZOh1A8eaplLRPLTnioP8Ifet4aS0rP75K0fQUpkuP/
 nwwQ==
X-Gm-Message-State: AOAM531EPkfRfZuQu/A/gwI2s+bZKlNaJQSgWVZbUDEyze5WLQlRGlfa
 NEcz9JBpL4zeg5ZeWeDukYF73g0tnJDUBqmcxctCCw==
X-Google-Smtp-Source: ABdhPJzXbiQOm/LTa/9I1aTG6l1jQZ5G6mYyNqgFW8DJe4zWHMlzneqPaWc1OYbyRPsdbcfjM4egzmVvxwPKp5INQg0=
X-Received: by 2002:a05:651c:b1f:: with SMTP id
 b31mr1302202ljr.0.1622762887714; 
 Thu, 03 Jun 2021 16:28:07 -0700 (PDT)
MIME-Version: 1.0
References: <20210226164345.3889993-1-arnd@kernel.org>
 <CAK8P3a2E0pv6PKzcCoRZH0G_gGrhWeiDwN7h090iQpd6c=XG1Q@mail.gmail.com>
In-Reply-To: <CAK8P3a2E0pv6PKzcCoRZH0G_gGrhWeiDwN7h090iQpd6c=XG1Q@mail.gmail.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Thu, 3 Jun 2021 16:27:56 -0700
Message-ID: <CAKwvOdna9KPAsN6+qTDkWMdXYDg5AGUnp=ek5McxtDXLSQdVWg@mail.gmail.com>
Subject: Re: [PATCH] ARM: ep93xx: don't use clang IAS for crunch
To: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: Hartley Sweeten <hsweeten@visionengravers.com>, 
 Alexander Sverdlin <alexander.sverdlin@gmail.com>, SoC Team <soc@kernel.org>, 
 Arnd Bergmann <arnd@arndb.de>, Russell King <linux@armlinux.org.uk>, 
 Nathan Chancellor <nathan@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
 clang-built-linux <clang-built-linux@googlegroups.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210603_163011_878536_59125D32 
X-CRM114-Status: GOOD (  12.52  )
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
Message-ID: <20210603232756.aheC_OoUPeFMvLHuS0TOBorR_Rh1QVH1vQjtO_jpjCI@z>

On Fri, Feb 26, 2021 at 10:01 AM Arnd Bergmann <arnd@kernel.org> wrote:
>
> On Fri, Feb 26, 2021 at 5:44 PM Arnd Bergmann <arnd@kernel.org> wrote:
> >
> >  obj-$(CONFIG_CRUNCH)           += crunch.o crunch-bits.o
> > -AFLAGS_crunch-bits.o           := -Wa,-mcpu=ep9312
> > +AFLAGS_crunch-bits.o           := -Wa,-mcpu=ep9312 $(cc-option, -fno-integrated-as)
>
> I reworked that patch just before sending it out, and ended up with two typos
> in there, it should be
>
> +AFLAGS_crunch-bits.o           := -Wa,-mcpu=ep9312 $(call cc-option,
> -no-integrated-as)
>
> I'll wait for others to comment before I send the fixed version.

Probably good for that v2?
-- 
Thanks,
~Nick Desaulniers

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
