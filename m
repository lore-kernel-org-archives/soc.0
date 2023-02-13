Return-Path: <masahiroy@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F95BC64EC7
	for <soc@archiver.kernel.org>; Mon, 13 Feb 2023 16:18:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 101F0C433A7; Mon, 13 Feb 2023 16:18:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED8A9C433A0;
	Mon, 13 Feb 2023 16:18:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1676305130;
	bh=hBg7cVow+oYgy5e3O8/j/dwby9hx+9+isBV5FCMuyPQ=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=Iw0tP+Och37DTd0e19LCJgdnHS6v+wjRHMDkwEg2jD1wR70Werl5TYk07tGvq5f0Z
	 kp0jqoVKqPIU5q/ODNuME49PHuPnSDqgmrjvvIPkpYiTlFbBo/oYKR7QHtiUfPDJps
	 tLd0Idl/MgWlLxnC1XGivFJcHHdvzLXahDr664C/Lv1MejJ+spIoqTG8HfpruMnjEt
	 IUDV+Qf7kzUvjVtCRBecsNHAWAksJIf5T20CJolGOTFEFZhZ7sU1cIC0h2vWX0Aoem
	 s5YUzzdX6+ugn/MjHTvugHOUM6vWZs+8cIrD8t5u1s4ZY+JnGrXFImtf+Dhb5mtIsp
	 l90hlmrBE3EMg==
Received: by mail-oi1-f172.google.com with SMTP id r28so10637249oiw.3;
        Mon, 13 Feb 2023 08:18:49 -0800 (PST)
X-Gm-Message-State: AO0yUKWb6iZwyo0wo93nuix9x85wLTfMRnfajTtaag712pmsfQSn0Bhv
	NC+KorNFOA/QPkcl5GPCL2VjsQ5e4NNyivkfNf4=
X-Google-Smtp-Source: AK7set+TMf3RWPRZ5HLJsLbRJMY2HLepKMNUrya/d8a1UsHsC76H2NqLIOppbe1nq0/4zYAWfw/GtYNtsXm58kud0Yo=
X-Received: by 2002:a05:6808:220b:b0:37b:8b8e:5e71 with SMTP id
 bd11-20020a056808220b00b0037b8b8e5e71mr1155596oib.194.1676305129131; Mon, 13
 Feb 2023 08:18:49 -0800 (PST)
MIME-Version: 1.0
References: <20230203-arm64-defconfigs-v1-0-cd0694a05f13@kernel.org>
 <20230203-arm64-defconfigs-v1-3-cd0694a05f13@kernel.org> <CAK7LNASRz-apG_pNwvNOqxXy+-tp+WGHV--g6yYU-UQnZx5tgA@mail.gmail.com>
 <467e7a7f-1703-4f13-8604-6d582e4f9b3e@app.fastmail.com>
In-Reply-To: <467e7a7f-1703-4f13-8604-6d582e4f9b3e@app.fastmail.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Tue, 14 Feb 2023 01:18:12 +0900
X-Gmail-Original-Message-ID: <CAK7LNARfKgQgZ5Q6Djqs+K4WfhjG2wV=RWNY_mb=5Lz-1+USNQ@mail.gmail.com>
Message-ID: <CAK7LNARfKgQgZ5Q6Djqs+K4WfhjG2wV=RWNY_mb=5Lz-1+USNQ@mail.gmail.com>
Subject: Re: [PATCH 3/3] arm64: configs: Add virtconfig
To: Arnd Bergmann <arnd@arndb.de>
List-Id: <soc.lore.kernel.org>
Cc: Mark Brown <broonie@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Nicolas Schier <nicolas@fjasle.eu>, soc@kernel.org, 
	Mark Rutland <mark.rutland@arm.com>, Peter Zijlstra <peterz@infradead.org>, 
	linux-arm-kernel@lists.infradead.org, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, Feb 14, 2023 at 12:16 AM Arnd Bergmann <arnd@arndb.de> wrote:
>
> On Sat, Feb 11, 2023, at 08:37, Masahiro Yamada wrote:
> > On Sat, Feb 11, 2023 at 4:54 AM Mark Brown <broonie@kernel.org> wrote:
> >>
> >> Provide a slimline configuration intended to be booted on virtual
> >> machines, with the goal of providing a light configuration which will
> >> boot on and enable features available in mach-virt.  This is defined in
> >> terms of the standard defconfig, with an additional virt.config fragment
> >> which disables options unneeded in a virtual configuration.
> >>
> >> As a first step we just disable all the ARCH_ configuration options,
> >> disabling the build of all the SoC specific drivers.  This results in a
> >> kernel that builds about 25% faster in my testing, if this approach
> >> works for people we can add further options.
> >>
> >> Signed-off-by: Mark Brown <broonie@kernel.org>
> >> ---
> >>  arch/arm64/Makefile            |  6 ++++++
> >>  arch/arm64/configs/virt.config | 39 +++++++++++++++++++++++++++++++++++++++
> >>  2 files changed, 45 insertions(+)
>
> I like this a lot, I think that is very helpful and we can always build on
> top of it later with other fragments.
>
> We could still combine this with another Kconfig option that
> just hides all the real SoC options, which would turn this fragment
> into a one-line file and avoid having to update it whenever platforms
> get added.
>
> > Yeah, I have a _local_ script to apply
> > a similar config fragragment.
> >
> > When I run QEMU, I disable unneeded CONFIG_ARCH_*,
> > and also disable unneeded sub-systems.
> >
> > Not only me, many people are doing similar in their local env,
> > I guess.
> >
> >
> > Of course, I will not upstream my set of CONFIG options
> > since it is just my preference.
> > After all, this depends on people in my opinion.
>
> Do you have an opinion on the other two patches? If those
> look good to you, maybe I can just merge all three through the
> soc/defconfig branch for 6.3.
>
>       Arnd


scripts/Makefile.defconf is not what I'd maintain.
Please do whatever you want to do.



-- 
Best Regards
Masahiro Yamada
