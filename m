Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0CCDC433EF
	for <soc@archiver.kernel.org>; Fri, 15 Jul 2022 20:01:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 9ADC3C341CD; Fri, 15 Jul 2022 20:01:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84027C341CA
	for <soc@kernel.org>; Fri, 15 Jul 2022 20:01:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1657915266;
	bh=Imr38CKlrc8eIdt0DmyRaTsXwvocGmZ8I9uM364ZPTw=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=OuMiLQKlC9IKfoAOB5QZ3BiOjyNn80GLIzk6La2wCArJDyrnKthI7iGY0Hbz2LIei
	 QrWh5bHG9NwD5DVmDNhE07TU+GBE1nRNMFNEhaZ2GFkIEkKrTdFLCoAp40FuR9boh3
	 YVF6MaINwyEShHMuxcA4X5hCMGdHEDVD3mv7hliuaagPtnmr/H3GNWVLhZRq+GTTeL
	 u0GJjKNL6CTuxezuXFOTj5XxGWM+ShHaH4x7PPrt2O8lP8yougU+opRBfBVruwnX0n
	 iZz/Nd+qUAGdcR26asWI5K7t/DrQhAGrojqBAVH9d3+xwp7jVP2i9oNJLDZFuswdXY
	 k7CXuzP8Pa0Gg==
Received: by mail-yb1-f170.google.com with SMTP id l11so10147739ybu.13
        for <soc@kernel.org>; Fri, 15 Jul 2022 13:01:06 -0700 (PDT)
X-Gm-Message-State: AJIora+5MJmDA/WaqJsTY03ErDEkB8k2nq4Lhh1EA3JI5t6/0g6VH/Nr
	fqHlC37EJcb0BSmhPpcdyMaO4zd+oGamnx72OHs=
X-Google-Smtp-Source: AGRyM1tSuvuzu2+4ABB6YAht2GH7a25qiPRyVVAQCAbIwAhoWSJPtFoZlW3bnpb31JUOHbcSXVU+7UCUaUXDd39xMMw=
X-Received: by 2002:a25:8b8b:0:b0:669:b37d:f9cd with SMTP id
 j11-20020a258b8b000000b00669b37df9cdmr15832998ybl.394.1657915265492; Fri, 15
 Jul 2022 13:01:05 -0700 (PDT)
MIME-Version: 1.0
References: <CAK8P3a3jSNJfJxkbqJ4Bfa0bkhNsF0CY+bGJMGKJOaFPm_Me5A@mail.gmail.com>
 <CAHk-=wgjOm8RMb7kvpcVT6=MEc+ACUL-QkvhF=8osQcs=e-Dbg@mail.gmail.com>
In-Reply-To: <CAHk-=wgjOm8RMb7kvpcVT6=MEc+ACUL-QkvhF=8osQcs=e-Dbg@mail.gmail.com>
From: Arnd Bergmann <arnd@kernel.org>
Date: Fri, 15 Jul 2022 22:00:47 +0200
X-Gmail-Original-Message-ID: <CAK8P3a1ciRtqMrORbX3K_KudNCp15uWE2=4+9PGhPaeqsasmFw@mail.gmail.com>
Message-ID: <CAK8P3a1ciRtqMrORbX3K_KudNCp15uWE2=4+9PGhPaeqsasmFw@mail.gmail.com>
Subject: Re: [GIT PULL] ARM: SoC fixes for 5.19, part 3
To: Linus Torvalds <torvalds@linux-foundation.org>
List-Id: <soc.lore.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, SoC Team <soc@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, Jul 15, 2022 at 7:22 PM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> On Fri, Jul 15, 2022 at 5:29 AM Arnd Bergmann <arnd@kernel.org> wrote:
> >
> > ARM: SoC fixes for 5.19, part 3
>
> Hmm. I'm not sure what you used as a base for your pull request, but I
> already had most of this and your shortlog and diffstat didn't match
> at all.
>
> But the "for you to fetch changes up to d332a1f6b4c4.." part did
> match, so I assume I got what you meant for me to get. Maybe you just
> hadn't updated your upstream tree?

I checked again now, and I found that I had started merging fixes on
top of my previous fixes pull request, which you merged into -rc6,
but the latest tag I had was the rc5 one that didn't contain the
merge yet. So it's all good, except for the odd diffstat.

       Arnd
