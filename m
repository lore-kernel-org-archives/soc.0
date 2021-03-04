Return-Path: <SRS0=peI6=IC=arndb.de=arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38594C433DB
	for <soc@archiver.kernel.org>; Thu,  4 Mar 2021 11:03:55 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 039F464F2C; Thu,  4 Mar 2021 11:03:55 +0000 (UTC)
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4747C64F2B;
	Thu,  4 Mar 2021 11:03:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4747C64F2B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=arnd@arndb.de
Received: from mail-ot1-f48.google.com ([209.85.210.48]) by
 mrelayeu.kundenserver.de (mreue109 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1N7iKq-1lmzx60tGs-014kGJ; Thu, 04 Mar 2021 11:58:46 +0100
Received: by mail-ot1-f48.google.com with SMTP id v12so25712901ott.10;
        Thu, 04 Mar 2021 02:58:45 -0800 (PST)
X-Gm-Message-State: AOAM531zoq82CK3DvdUggcuesUskhkBY3AUM3WgGsvLuGEODnqRsDUqv
	jUEaYlBVqZkckk0PW5gk8PWZo8kXWZyrF+y49gg=
X-Google-Smtp-Source: ABdhPJz1isN7a4ehcF9HHNeG9q7qKHd8/FFXnPMY8/CvMfpnQJJ0Yqd+ln/usQiWPlqPIG7JB8bFXpj71N5eEjpvbrc=
X-Received: by 2002:a05:6830:1b65:: with SMTP id d5mr2952747ote.305.1614855524811;
 Thu, 04 Mar 2021 02:58:44 -0800 (PST)
MIME-Version: 1.0
References: <1614764303-34903-1-git-send-email-tan.shaopeng@jp.fujitsu.com>
 <1614764303-34903-2-git-send-email-tan.shaopeng@jp.fujitsu.com>
 <CAK8P3a0VUoixMKg5UmF8agAZUXoMT8_SbCiWBdStbZ+_yAYNjA@mail.gmail.com>
 <OSAPR01MB2146DC8A26F6EBD1CF11D9748B979@OSAPR01MB2146.jpnprd01.prod.outlook.com>
 <20210304104650.GA20843@willie-the-truck>
In-Reply-To: <20210304104650.GA20843@willie-the-truck>
From: Arnd Bergmann <arnd@arndb.de>
Date: Thu, 4 Mar 2021 11:58:28 +0100
X-Gmail-Original-Message-ID: <CAK8P3a2pFcNTw9NpRtQfYr7A5OcZ=As2kM0D_sbfFcGQ_J2Q+Q@mail.gmail.com>
Message-ID: <CAK8P3a2pFcNTw9NpRtQfYr7A5OcZ=As2kM0D_sbfFcGQ_J2Q+Q@mail.gmail.com>
Subject: Re: [PATCH RFC] soc: fujitsu: Add cache driver code
To: Will Deacon <will@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: "tan.shaopeng@fujitsu.com" <tan.shaopeng@fujitsu.com>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, SoC Team <soc@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Olof Johansson <olof@lixom.net>, 
	"misono.tomohiro@fujitsu.com" <misono.tomohiro@fujitsu.com>, James Morse <james.morse@arm.com>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:vMjJJBByJFEYcTrB4A+Ex9J2uAXtawDCIdadoi5PBxegIAhUgsy
 Cdh6wO5iQ9br9zUmu8ZiUoNNIvz4UW2SMamN6E+HMPb60ykAfD3QZcAr6FT5KMbKu8fKH55
 hblyPvse6j1baYJE/pGgzIXo+08BcL73pyjt4hXpUuxTgKe1Ufo67OiLGOMYAzSobdQJc9D
 quv3dn3txwEr09bgbjLHA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:0X8MLLaDIL0=:aXwUI2STJXMGLvPn9lmApF
 DCHtsq0HhNhEUHW69OUksIRAOVU8383zsv/+GHVys+zz4I7nQuXPX2sI3dilMEpDPviwv0Tx6
 Qh8QTe2dy9TdfHuyBuS55F7lqz1mBmwHJ2glBeFqwFL23EYMUuA73hW1qEmbMfHLDHVpR0hv4
 ON8Ch9WIL7QK/di8jZToKJnR4H6EjjTlSI7TO2kS935AW/gJd/CF+wDGlwzJfvIf1m8fFj0hZ
 CDSaxun7z5tvdZ5q9MEhgPtHnNwadc4gT9rMwcJ+yXlJtBEqq3msIoMg01kOtHneOQkuxVOQ9
 /X7u9K6A7kI5CFGcSYIBA5NSqGQNNA39yu3JLhWkkQsm+aFlnhN/L/ofd1f5kRx70D1Zw+RLu
 gx1ScFQE0jw+BNBeXeXqsMlMpl0xATuPYg6ZAH8I3pCHQxdsyl8QV/Wh50NPcVr5hePQBs16y
 3Y+saCUPHthJ9ttGpDJqChtCrIoc9S6GJP/byOTeuzjxAdWgtq4uEW5iviJPp5IcwgkZ+0ZqV
 XhuCx68cyhnW0YgCyjNL/XnTqgiPdwo50UzdfO1/teaHvMZV/55DT+OJk/8ctQG4Q==
Message-ID: <20210304105828.FwNwO6lTWcYozCebZdOmL78eul6tKD-5bucD8UlK2Sk@z>

On Thu, Mar 4, 2021 at 11:46 AM Will Deacon <will@kernel.org> wrote:
> On Thu, Mar 04, 2021 at 10:34:43AM +0000, tan.shaopeng@fujitsu.com wrote:
> > > On Wed, Mar 3, 2021 at 10:38 AM tan.shaopeng
> > > <tan.shaopeng@jp.fujitsu.com> wrote:
> > > > +
> > > > +config FUJITSU_CACHE
> > > > +        tristate "FUJITSU Cache Driver"
> > > > +        depends on ARM64_VHE || COMPILE_TEST
> > > > +        help
> > > > +          FUJITSU Cache Driver
> > > > +
> > > > +          This driver offers cache functions for A64FX system.
> > > > +         Loading this cache driver, control registers will be set to enable
> > > > +         these functions, and advanced settings registers will be set by
> > > default
> > > > +         values. After loading this driver, you can use the default values of
> > > the
> > > > +         advanced settings registers or set the advanced settings registers
> > > > +         from EL0. Unloading this driver, control registers will be clear to
> > > > +         disable these functions.
> > > > +          When built as a module, this will be called as "fujitsu_cache".
> > >
> > > My feeling is that this code should be in arch/arm64/, as the cache
> > > is generally considered part of the CPU, rather than part of the wider
> > > SoC design, or something that can be controlled separately from the
> > > core kernel and memory management code.
> >
> > Thanks for your advice. I also would like to hear the opinions from
> > other soc&arm maintainers, and then consider whether to add this to
> > arch/arm64/.
>
> Given that all of this is outside of the scope of the architecture, I don't
> think that arch/arm64/ is the right place for it. Perhaps this would fit
> into the resctrl rework that James has been doing for MPAM?

Indeed, that sounds like a good starting point. I don't understand enough
about either of the two to be sure, but it sounds like there is some overlap
in functionality, and ideally we would have one user interface that can
deal with all the hardware implementations (intel, arm, fujitsu and any
future ones).

      Arnd
