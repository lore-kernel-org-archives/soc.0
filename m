Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C929C4338F
	for <soc@archiver.kernel.org>; Tue,  3 Aug 2021 11:59:05 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id E218660F8F; Tue,  3 Aug 2021 11:59:04 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id C814760EFD;
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
Received: by mail-wr1-f44.google.com with SMTP id d8so25009672wrm.4;
        Tue, 03 Aug 2021 04:59:04 -0700 (PDT)
X-Gm-Message-State: AOAM533hmBPDdiJ3jsRC8UUIcUH/Li4UNHVx8i/TVzX6eVNRQNHLgtRf
	lyu46kNO1RgbO8Q8Qemmi/1PWZ3YeEPiRh+WNn4=
X-Google-Smtp-Source: ABdhPJzMtgQIAKJXGT7UCeFsWOcxw3QQc62HjckxRJGn75ZeLtfkhRUtMkyTB6JL2YOsSJDijOWh+qaCNxmhdb5bdpM=
X-Received: by 2002:adf:fd90:: with SMTP id d16mr23933088wrr.105.1627991943405;
 Tue, 03 Aug 2021 04:59:03 -0700 (PDT)
MIME-Version: 1.0
References: <20210802141245.1146772-1-arnd@kernel.org> <CAL4-wQqCL1S-GYu7VKJeTT37wh=rR=SMUuwgKiXnnn_Y=uydOA@mail.gmail.com>
 <CAL4-wQpKLtSj0xfNUXXLhbtN1wC051jpRneAuLYOi1riZfiinw@mail.gmail.com>
In-Reply-To: <CAL4-wQpKLtSj0xfNUXXLhbtN1wC051jpRneAuLYOi1riZfiinw@mail.gmail.com>
From: Arnd Bergmann <arnd@kernel.org>
Date: Tue, 3 Aug 2021 13:58:47 +0200
X-Gmail-Original-Message-ID: <CAK8P3a2z_xxpz9hAYoBx5=bS81V=TkjEU6WHNhPi1UhQ3UScfw@mail.gmail.com>
Message-ID: <CAK8P3a2z_xxpz9hAYoBx5=bS81V=TkjEU6WHNhPi1UhQ3UScfw@mail.gmail.com>
Subject: Re: [PATCH] ARM: ep93xx: remove MaverickCrunch support
To: Martin Guy <martinwguy@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: Russell King <linux@armlinux.org.uk>, Hartley Sweeten <hsweeten@visionengravers.com>, 
	Alexander Sverdlin <alexander.sverdlin@gmail.com>, SoC Team <soc@kernel.org>, 
	Nikita Shubin <nikita.shubin@maquefel.me>, Arnd Bergmann <arnd@arndb.de>, 
	Oleg Nesterov <oleg@redhat.com>, Hubert Feurstein <hubert.feurstein@contec.at>, 
	Lukasz Majewski <lukma@denx.de>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Linus Walleij <linus.walleij@linaro.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	clang-built-linux <clang-built-linux@googlegroups.com>, jerome.oufella@savoirfairelinux.com
Content-Type: text/plain; charset="UTF-8"

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
