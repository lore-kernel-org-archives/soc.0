Return-Path: <robh@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D8D5C433E0
	for <soc@archiver.kernel.org>; Tue,  9 Feb 2021 02:05:41 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 101EA64EBA; Tue,  9 Feb 2021 02:05:41 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id ADA8764EBE;
	Tue,  9 Feb 2021 02:05:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1612836341;
	bh=De6jaXpyyCHqlCZls+PmENTom8r8tBBlK8ArkHjZn0A=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=LoQXB1AuN7OJACEJXrI79OmYTGvxJPgkkZL7nWAu9jPEORevUiY2im2wNdsNFS8O7
	 qTFXEj1v6BXL/IUUkocBh/mi4OO9ya/RPp0v8PQV+N2QVyJRnnEiSbY6DUcofWs/jD
	 iAjm1m/Ppuo7QcMl+lugsXMurGq2cSKsNFplx9kOH9Zc+HZ1K2fk/LieChBcjZPHrH
	 msqZyfqvUyUUO8RyuxBTfazPxSftL2c6d6CkjX4QCQ6wek/wBoG1BGRMkqwBL/e7O/
	 G8Y2AwW3tEtf6fj2pplQqzjXa8JtlP4M9Hmy3FbLTl64Yr5XOk4EZkx5cMTjSzuDsg
	 nVH4+TD35LXmg==
Received: by mail-ej1-f52.google.com with SMTP id w1so28798620ejf.11;
        Mon, 08 Feb 2021 18:05:40 -0800 (PST)
X-Gm-Message-State: AOAM533x0zAk16FQFffQv11TNsg/4VbX6Fny4d0yyCx913ZrEUWPOTNw
	EdsA1InrjWt+ozUd4hO9de2mxmpum+Y1fU2mKQ==
X-Google-Smtp-Source: ABdhPJyzUmEfXIMIL3Rls2y3K9U5Nr0w6OkPRTHSDeDshFBAbZY0V7hZ7AbPGzat3tMj/AhI43ofZOx4VbGcYIu0bVc=
X-Received: by 2002:a17:907:262b:: with SMTP id aq11mr13924998ejc.360.1612836339183;
 Mon, 08 Feb 2021 18:05:39 -0800 (PST)
MIME-Version: 1.0
References: <20210204203951.52105-1-marcan@marcan.st> <20210204203951.52105-19-marcan@marcan.st>
 <20210208110441.25qc6yken4effd6c@kozik-lap> <cd67b2ce-9676-31b4-85f7-de1ec9b2bf72@marcan.st>
 <20210208191447.GA1677483@robh.at.kernel.org> <d8454963-3242-699b-4c20-e85d26b19796@marcan.st>
In-Reply-To: <d8454963-3242-699b-4c20-e85d26b19796@marcan.st>
From: Rob Herring <robh@kernel.org>
Date: Mon, 8 Feb 2021 20:05:26 -0600
X-Gmail-Original-Message-ID: <CAL_JsqK9RJPbD4BqhyYsQS2jsOXDAju9qEtTiEzbzay6v2U_iQ@mail.gmail.com>
Message-ID: <CAL_JsqK9RJPbD4BqhyYsQS2jsOXDAju9qEtTiEzbzay6v2U_iQ@mail.gmail.com>
Subject: Re: [PATCH 18/18] arm64: apple: Add initial Mac Mini 2020 (M1) devicetree
To: Hector Martin <marcan@marcan.st>
List-Id: <soc.lore.kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Arnd Bergmann <arnd@kernel.org>, devicetree@vger.kernel.org, 
	Marc Zyngier <maz@kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, SoC Team <soc@kernel.org>, 
	Olof Johansson <olof@lixom.net>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, Feb 8, 2021 at 6:49 PM Hector Martin <marcan@marcan.st> wrote:
>
> On 09/02/2021 04.14, Rob Herring wrote:
> > Does there need to be a legal entity behind 'The Asahi Linux
> > Contributors' to be valid?
>
> I don't think so, this seems to be common practice in other open source
> projects, and recommended these days.
>
> Some recent discussion on the subject from the Linux Foundation:
>
> https://www.linuxfoundation.org/en/blog/copyright-notices-in-open-source-software-projects/

Okay, that's good to know. I'd primarily seen this for Chromium which
obviously has a company (and lawyers) behind it.

> >  From a more practical standpoint, if we want to relicense something in
> > say 5 years from now, who do we ask for an okay?
>
> I thought that's what Git history was for; certainly we aren't keeping
> file headers up to date every time someone touches a file (which for
> anything other than trivial changes gives them a copyright interest in a
> portion of the file).

Yes, for sure. Especially since copyrights tend to be stale as the
blog talks about.

> Asahi Linux's policy for bespoke projects is to use "The Asahi Linux
> Contributors" for this reason, acknowledging that the copyright headers
> aren't up to date anyway (also the years...), and implicitly directing
> people to the orignal project (which is where Git history is kept and
> contains the true record of copyright owneship).
>
> I'm not trying to shake up how we handle copyright lines in the kernel
> here, of course; if you prefer some nominal copyright line from "whoever
> first wrote the file or most of it" I can do that. But it certainly
> won't be the only person you have to ask if you want to relicense, if
> anyone else touched the file in a nontrivial way :)

No, it's fine as is.

> There are a few examples of this style in the tree, mostly pulled from
> other projects:
>
> arch/arm/oprofile/common.c
> drivers/gpu/drm/vgem/vgem_drv.[ch]
> drivers/md/dm-verity-target.c
> drivers/md/dm-verity.h
>
> >>> I guess Rob will comment on the dt-bindings more... but for me a generic
> >>> "arm-platform" is too generic. What's the point of it? I didn't see any
> >>> of such generic compatibles in other platforms.
> >>
> >> This is a hack for patches #11/#12 to use, and I expect it will go away once
> >> we figure out how to properly handle that problem (which needs further
> >> discussion). Sorry for the noise, this should not be there in the final
> >> version.
> >
> > I was going to ask on this. If you have a user of it, I'm okay with it.
> > Generally though, 3 or 4 levels of compatible don't really have users.
>
> The pattern here was board, soc, "arm-platform"; the first two seem to
> be a common (and useful) pattern, and I hope I can get rid of the third
> once we solve #11/#12 in a saner way.
>
> > It's a WIP to be more consistent around node names. For actual
> > clock controllers we have 'clock-controller(@.*)?'. There's not really
> > something established for 'fixed-clock'. We probably should define
> > something, but that goes in the schema first.
>
> What do you suggest for this series?

Fine as-is unless someone wants to define the pattern and add it to
the fixed-clock schema before this is merged.

Rob
