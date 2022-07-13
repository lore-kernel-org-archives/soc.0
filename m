Return-Path: <SRS0=se3b=XS=arndb.de=arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE462C43334
	for <soc@archiver.kernel.org>; Wed, 13 Jul 2022 12:14:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 9A93AC341C0; Wed, 13 Jul 2022 12:14:50 +0000 (UTC)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id A495BC34114;
	Wed, 13 Jul 2022 12:14:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org A495BC34114
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=arndb.de
Received: from mail-yb1-f174.google.com ([209.85.219.174]) by
 mrelayeu.kundenserver.de (mreue012 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1N01hu-1nNSgC1EyU-00x32v; Wed, 13 Jul 2022 14:14:46 +0200
Received: by mail-yb1-f174.google.com with SMTP id r3so18913676ybr.6;
        Wed, 13 Jul 2022 05:14:45 -0700 (PDT)
X-Gm-Message-State: AJIora92JYzbNJvJslj/Wxnkuu9wdiP3t2tFGsKWDBd7Hn240uhte1z7
	OU+WkRqDPLBrhmaJDNY81GXyrqLyYnWMHF+DCI8=
X-Google-Smtp-Source: AGRyM1uoJQYulkknNKp9p4xlIYwtcLtDUZEWeRILKUzUp7kQEEEiWDmE/Cnxs1q4j3RSu9fsSg5xhlVIAG6cbAi0V/c=
X-Received: by 2002:a05:6902:120f:b0:668:2228:9627 with SMTP id
 s15-20020a056902120f00b0066822289627mr3559363ybu.134.1657714484730; Wed, 13
 Jul 2022 05:14:44 -0700 (PDT)
MIME-Version: 1.0
References: <20220708185608.676474-1-thierry.reding@gmail.com>
 <20220708185608.676474-2-thierry.reding@gmail.com> <CAK8P3a1bKUr77t9xkNAX=-RqzRme6Hymr3V=36MSHT_sOFEW5A@mail.gmail.com>
 <Ys6lXD6BSxjH02mW@orome>
In-Reply-To: <Ys6lXD6BSxjH02mW@orome>
From: Arnd Bergmann <arnd@arndb.de>
Date: Wed, 13 Jul 2022 14:14:27 +0200
X-Gmail-Original-Message-ID: <CAK8P3a0cSq47B=acZ854TVu=RckJNfyfKdqQUMzCX7SsV7Wt0g@mail.gmail.com>
Message-ID: <CAK8P3a0cSq47B=acZ854TVu=RckJNfyfKdqQUMzCX7SsV7Wt0g@mail.gmail.com>
Subject: Re: [GIT PULL 1/7] soc/tegra: Changes for v5.20-rc1
To: Thierry Reding <thierry.reding@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, arm-soc <arm@kernel.org>, SoC Team <soc@kernel.org>, 
	Jon Hunter <jonathanh@nvidia.com>, 
	"open list:TEGRA ARCHITECTURE SUPPORT" <linux-tegra@vger.kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, linux-edac@vger.kernel.org, 
	Borislav Petkov <bp@alien8.de>, Mauro Carvalho Chehab <mchehab@kernel.org>, Tony Luck <tony.luck@intel.com>, 
	James Morse <james.morse@arm.com>, Robert Richter <rric@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:cINvK/kuklM1uAq8DLg4sb6R8qhRjSL8oOjSeqJLhT9qIZSgN0E
 Twk1QOdV1QkSg+mkrXPRIwX0E8vjxsltdBRztwn24wruE5jLEUOptqclluyUY6alV5mRzSn
 W6JtXnaH/W25cAcvMko2wzR2zTIL/VclCea4EODp590gVd61Ih0t+xuSrbZIDQF0Mhj82v2
 DLLUOJaMPbliS5z4vib8w==
X-UI-Out-Filterresults: notjunk:1;V03:K0:YChMtyq0yXk=:QiJJifGLtav+CvJpMN40fR
 unPByuzjWav5evmFTY6nI9SJZk6/ZENMeUdySMjukMqLQQdWHc022hdlEDpzYQxLS2Yv9959m
 xNnvYn7GpX7wqZm0G/eswwpmM+vEQQLk+41kHbn2cgD1ZHMMHHDwDNhtmFateCe1PRZlN6c4v
 Fwm2W0ejGP52AQPkG7bc7mNlqgR99WvDhoD/XAXVUOyz+cdOV8sbdnDNkNik4LPWrLL08K8Kr
 BgDzBqGuhfijr8Vp1Jfl1b2xi3TD7wyf757yFGockw0O5wT3m0wqoXTkUu1tqu1FUTA5sAYmh
 k3iE0E23NNVFozarD3QvlT87FtsnxF0mvoR85Vp+vd9krnOH1I5QYZ0vN0c2yvZrEmrwy6ikg
 jf7//h4opXCTYRY0DSPilYPMMU5mZOLT4Ek09LGP2AaQsA73y9gtnDFtHewGmD6LYpnj06Ytg
 MNpwFAFhcJ11N8WasG2+N0YVSQ+TJZjRCLATjulM+gxL7xuckmoeTD/kJstFzgKjgR8FyDs/T
 9YdaFeVI6Vn5ijxVLM2Vdhz7ox/LO43RyB/vYM7bV35dFxPuI3kM7J4c8878Dwaab0KPTqNJ0
 jIFdjR9rBCxJUROpjd6EYDGiotjebVGrPODF2IqFYEqi/ww7irVHBbXYcXP/Xn73lCV8irFIy
 7SDBJ8N8+2QJjLL4Y7Q6kSDZ2SHXJSadFxy9ykndMfWwSp+n8bq9tUMqY8UqSUA8qSDiGh2FO
 hbHaB695c48+AF5iFF81Hf6y/Cnw7ZhCQNAsPQ==

On Wed, Jul 13, 2022 at 12:58 PM Thierry Reding
<thierry.reding@gmail.com> wrote:
> On Tue, Jul 12, 2022 at 03:27:16PM +0200, Arnd Bergmann wrote:
> > On Fri, Jul 8, 2022 at 8:56 PM Thierry Reding <thierry.reding@gmail.com> wrote:
> >
> > I fear I'm going to skip this for the current merge window. It looks like
> > the CBB driver you add here would fit into the existing drivers/edac/
> > subsystem, or at the minimum should have been reviewed by the
> > corresponding maintainers (added to Cc)  to decide whether it goes
> > there or not.
> >
> > I had not previously seen this driver, but I'll let them have a look first.
>
> EDAC looks like it's used primarily for memory controllers, which this
> is not. But then I also see explicit references to non-memory-controller
> references in the infrastructure, so perhaps this does fit in there. The
> CBB driver is primarily a means to provide additional information about
> runtime errors, so it's not directly a means of discovering the errors
> (they would be detected anyway and cause a crash) and I don't think we
> have a means of correcting any of these errors.

I think this is just a reflection of what other hardware can do:
most machines only detect memory errors, but the EDAC subsystem
can work with any type in principle. There are also a lot of
conditions elsewhere that can be detected but not corrected.

> I'll ask Sumit to work with the EDAC maintainers on this.

Thanks

> > For the other patches, I found two more problems:
> >
> > > Bitan Biswas (1):
> > >       soc/tegra: fuse: Expose Tegra production status
> >
> > Please don't just add random attributes in the soc device infrastructure.
> > This one has a completely generic name but a SoC specific
> > meaning, and it lacks a description in Documentation/ABI.
> > Not sure what the right ABI is here, but this is something that needs
> > to be discussed more broadly when you send a new version.
>
> I wasn't aware that the SoC device infrastructure was restricted to only
> standardized attributes. Looks like there are a few other outliers that
> add custom attributes: UX500, ARM Integrator and RealView, and OMAP2.
>
> Do we have some other place where this kind of thing can be exposed? Or
> do we just need to come up with some better way of namespacing these?
> Perhaps it would also be sufficient if all of these were better
> documented so that people know what to look for on their platform of
> interest.

It's not a 100% strict rule, I've just tried to limit it as much as possible,
and sometimes missed drivers doing it anyway. My main goal here is
to make things consistent between SoC families, so if one piece of
information is provided by a number of them, I'd rather have a standard
attribute, or a common way of encoding this in the existing attributes
than to have too many custom attributes with similar names.

> > > YueHaibing (1):
> > >      soc/tegra: fuse: Add missing DMADEVICES dependency
> >
> > This one fixes the warning the wrong way: we don't 'select' random
> > drivers from other subsystems, and selecting the entire
> > subsystem makes it worse. Just drop the 'select' here and
> > enable the drivers in the defconfig.
>
> This doesn't actually select the DMADEVICES property. It adds a
> dependency on DMADEVICES and if that is met it will select
> TEGRA20_APB_DMA.

My mistake. However, I still think it's wrong to select
TEGRA20_APB_DMA here, unless there is a build-time
dependency that prevents it from being compiled otherwise.

The dmaengine subsystem is meant to abstract the relation
between the drivers using DMA and those providing the feature,
the same way we abstract all the other subsystems. The
fuse driver may only be used on machines that use
TEGRA20_APB_DMA, but neither the driver code nor
Kconfig should care about that.

        Arnd
