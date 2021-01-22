Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9533C433DB
	for <soc@archiver.kernel.org>; Fri, 22 Jan 2021 22:36:48 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 92A2623B1A; Fri, 22 Jan 2021 22:36:48 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 67BB523AA1;
	Fri, 22 Jan 2021 22:36:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1611355008;
	bh=wrK/0ETSQ+v0wfDnWxn52L0z5V+fXZrnD/rouv/QDMU=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=QH/Qc3M8rYgB/3BAJbCLqe+9lgrGm6YxlkcWaYyuZKrDvs8FZb1U4prDVx94LrxGA
	 ym5a9OCVm1iUHO8etbqsz8Gpqh3izzDP8HsvMxPSuEXk84MdWhUuYUsodj1i6IWsHI
	 fnNrIJGU5TzqkNWo9b2+TqSr+/BlQjXtVdEAbMVOD/4NqC13lkTXe71lWPgeg6Rrm9
	 cWXXhCY1i/zQP7qfoOJwZNRFG3r8F/m/UdLf6RFRExXhcXlfefDxD9EYJCcWzEn+0z
	 SUhO6u4f3v5Zz4MVSv/H+huZNGefnI7L5FsUhOci+j4n82jqS1ek2HVuZHKklrC4Y3
	 0UtUxb8X1eM2g==
Received: by mail-ot1-f43.google.com with SMTP id f6so6678294ots.9;
        Fri, 22 Jan 2021 14:36:48 -0800 (PST)
X-Gm-Message-State: AOAM530+mf1iat0KA/7AvGv7+t6kBhKocC0scJhP4w1im5cdkSIeeMCK
	uZUX+52BmUbw8PTqNKlzKlX2jWHu6B2tQnjIYoI=
X-Google-Smtp-Source: ABdhPJw+4Fx9Lkrjt5v2yQSmOgCQTIjMyQ8+jsbolOlM2Lg66jQPT6z2Gks+njmIa+g2sHAuOx5+6FFPrzUOXv7ccO4=
X-Received: by 2002:a9d:3bb7:: with SMTP id k52mr5076613otc.251.1611355007653;
 Fri, 22 Jan 2021 14:36:47 -0800 (PST)
MIME-Version: 1.0
References: <20210122143536.168833-1-nicolas.ferre@microchip.com>
 <CAK8P3a0s5UPvCzQrcYmPPDYgT+YyZ3vc=fF0GEwpqROR+Zio-g@mail.gmail.com>
 <20210122163520.GG1196852@piout.net> <7131cfc0-2519-8bbe-a380-609eced61753@microchip.com>
In-Reply-To: <7131cfc0-2519-8bbe-a380-609eced61753@microchip.com>
From: Arnd Bergmann <arnd@kernel.org>
Date: Fri, 22 Jan 2021 23:36:31 +0100
X-Gmail-Original-Message-ID: <CAK8P3a1v=_4E40cZjZ-ff7vs84XE9XaxwdoGW7Rf+LYiA+TCTw@mail.gmail.com>
Message-ID: <CAK8P3a1v=_4E40cZjZ-ff7vs84XE9XaxwdoGW7Rf+LYiA+TCTw@mail.gmail.com>
Subject: Re: [GIT PULL] ARM: at91: soc for 5.12
To: Nicolas Ferre <nicolas.ferre@microchip.com>
List-Id: <soc.lore.kernel.org>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, Arnd Bergmann <arnd@arndb.de>, 
	Olof Johansson <olof@lixom.net>, arm-soc <arm@kernel.org>, SoC Team <soc@kernel.org>, 
	Linux Kernel list <linux-kernel@vger.kernel.org>, 
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, 
	Ludovic Desroches <ludovic.desroches@microchip.com>
Content-Type: text/plain; charset="UTF-8"

On Fri, Jan 22, 2021 at 6:05 PM Nicolas Ferre
<nicolas.ferre@microchip.com> wrote:
> On 22/01/2021 at 17:35, Alexandre Belloni wrote:
> > EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> >
> > I wouldn't backport it as a fix, this is just a warning, in a
> > configuration that is very unlikely to be used (and honestly, I
> > wouldn't enable this driver on any platform).
> >
> > If you take it as a fix, you'll have to also get
> > https://lore.kernel.org/linux-arm-kernel/1611318097-8970-5-git-send-email-claudiu.beznea@microchip.com/
>
> Arnd, Alexandre,
>
> Whatever you prefer is fine with me. As I'm not the first impacted I
> wouldn't push in one direction or another.

I've applied both patches to the fixes branch now. While it's only
a harmless warning, it is one that would show up for anyone that
runs a kernel with this driver built-in on a different machine, and
this could be fairly annoying.

        Arnd
