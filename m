Return-Path: <SRS0=se3b=XS=arndb.de=arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37431C433EF
	for <soc@archiver.kernel.org>; Wed, 13 Jul 2022 12:36:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 06987C341C0; Wed, 13 Jul 2022 12:36:58 +0000 (UTC)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 64F7BC34114;
	Wed, 13 Jul 2022 12:36:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 64F7BC34114
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=arndb.de
Received: from mail-yw1-f170.google.com ([209.85.128.170]) by
 mrelayeu.kundenserver.de (mreue009 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1Mg6mM-1ncnEG0qqs-00hgN9; Wed, 13 Jul 2022 14:36:54 +0200
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-31c9b70c382so111083097b3.6;
        Wed, 13 Jul 2022 05:36:53 -0700 (PDT)
X-Gm-Message-State: AJIora8nblJfyf4yOY7IrbviEVczjaUmNI7vrrL7qwvdeXVN9WJDlcTS
	71Yre5mvIE6uKVBhAGnY2byNtjQ148QKqIFJE0k=
X-Google-Smtp-Source: AGRyM1sh6y2Q78V+7SEHOa4+tSkaz/9F3euOrnSe3woF61Ndiv4noQe+HMpJi5sccU+Otl07Nje5B04oP8knpINAaJ0=
X-Received: by 2002:a0d:df0f:0:b0:31b:e000:7942 with SMTP id
 i15-20020a0ddf0f000000b0031be0007942mr3819236ywe.320.1657715812648; Wed, 13
 Jul 2022 05:36:52 -0700 (PDT)
MIME-Version: 1.0
References: <20220708185608.676474-1-thierry.reding@gmail.com>
 <20220708185608.676474-2-thierry.reding@gmail.com> <CAK8P3a1bKUr77t9xkNAX=-RqzRme6Hymr3V=36MSHT_sOFEW5A@mail.gmail.com>
 <Ys6lXD6BSxjH02mW@orome> <CAK8P3a0cSq47B=acZ854TVu=RckJNfyfKdqQUMzCX7SsV7Wt0g@mail.gmail.com>
 <d12fa14a-bf0d-4e98-acd8-69229315d660@nvidia.com>
In-Reply-To: <d12fa14a-bf0d-4e98-acd8-69229315d660@nvidia.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Wed, 13 Jul 2022 14:36:36 +0200
X-Gmail-Original-Message-ID: <CAK8P3a1sDbtEUaT7Z5k_SfUcA7OBUxkny7kmKOMFaE96qaGeXg@mail.gmail.com>
Message-ID: <CAK8P3a1sDbtEUaT7Z5k_SfUcA7OBUxkny7kmKOMFaE96qaGeXg@mail.gmail.com>
Subject: Re: [GIT PULL 1/7] soc/tegra: Changes for v5.20-rc1
To: Jon Hunter <jonathanh@nvidia.com>
List-Id: <soc.lore.kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Thierry Reding <thierry.reding@gmail.com>, arm-soc <arm@kernel.org>, 
	SoC Team <soc@kernel.org>, 
	"open list:TEGRA ARCHITECTURE SUPPORT" <linux-tegra@vger.kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, linux-edac@vger.kernel.org, 
	Borislav Petkov <bp@alien8.de>, Mauro Carvalho Chehab <mchehab@kernel.org>, Tony Luck <tony.luck@intel.com>, 
	James Morse <james.morse@arm.com>, Robert Richter <rric@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:E1IMx+UL/tENdXVZSXXaVg1CgG9Ahzn7Vofel49i3XnYiEDXUNh
 +zYLnrQqxdDQPoT+ErTc/9Dx4G7tJfPS2aHszwW2wAaLjIzJPWmkSvYmpZIKCurWE9gmMYn
 emmSxt7HX5Im10aM697v+GmN+8I56QTorpbf07oOMZQ/K0/DYqEmgET64Gup87Px6tCG557
 Pp7Y4ycjMCtCjmRdZMlMw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:O1Qg/sz8tDM=:VaqRc5gwTwWECQ/CG1IfQj
 BW3IxisCuC8zlTUtS8U6/tjJaTgyVFuFKe6RkWmItyapzfZeUXqVjo72dmzSjG9WWS2+G5xE+
 hSaXKoM0Q1aSnUYIu7xtqq0AJeh7QwfxdojXkgl3YLcd25iXjQAUYUr6P/lfHGhPG8mAtU4Nc
 SuJpGjm9SUQdpAWvMxO8TTmFpI9HWskuzxPWxicEV/Y7w17R/Lmrt/bUs2yUJHt4VvcxgczkD
 lgiHcffDI/Pimxy2OUpGqgiKc48Afpjta0eH63fI2S4d4N4ZsCJ5pEkJMSOB2YE4PRMhL3ej4
 gsF5y4yDcI9jnuzjM0g286tVSiTLZMK11MYBaPIgetXfJRaTQSqxhJW3ftmMTDCjhouFIDOyh
 WoktWChD7apLa6bMEm+eyxzO5Amr/NEJ13HSJzlXVVXeaI351tzCMGIyI0suqvLtMSmonY0AP
 QDcfG0lHAG0pQQjfbfEBaQTZgbC6M1ns4Qa8/b4YL8VvYTn8F6gvthqIVQ9e/Ufk1LrFgQbW+
 16r0QvdcWCoha/xXl6Rb4DoUArtUWjatitigNhz8mXIP+C7+q0stvbRiAcfRPctjC4OpivE7+
 vVKsRaXRDliIfETGI9X5DoMgPf9+HaDW2Pql6ED75cNF7h00jAQ6iatKir07DsAvv/iTevjrF
 P8J2Jf0sIhtusEmYaclTqdTRzmC9mR7ttaVkYyIqSbfCOCyiNtY3n2ODCl5XWy/dGLI/6iGU9
 oXyQIhWqcFzgMd2uYCR6GIot8lb/WzLR5SaGg/HE4SyKPt/LXFKqz5hKxqlBJe27Lhn+R0veB
 69LUyPSliqBcMKuroncjIZU+3qrKCBdPumjNC93vxd8tLE2Bs7JlJTNWnJtSdV0Dy8R1YwYfp
 lDF6LsV2wHt6dDuGKbZQ==

On Wed, Jul 13, 2022 at 2:19 PM Jon Hunter <jonathanh@nvidia.com> wrote:
> On 13/07/2022 13:14, Arnd Bergmann wrote:
> >>> For the other patches, I found two more problems:
> >>>
> >>>> Bitan Biswas (1):
> >>>>        soc/tegra: fuse: Expose Tegra production status
> >>>
> >>> Please don't just add random attributes in the soc device infrastructure.
> >>> This one has a completely generic name but a SoC specific
> >>> meaning, and it lacks a description in Documentation/ABI.
> >>> Not sure what the right ABI is here, but this is something that needs
> >>> to be discussed more broadly when you send a new version.
> >>
> >> I wasn't aware that the SoC device infrastructure was restricted to only
> >> standardized attributes. Looks like there are a few other outliers that
> >> add custom attributes: UX500, ARM Integrator and RealView, and OMAP2.
> >>
> >> Do we have some other place where this kind of thing can be exposed? Or
> >> do we just need to come up with some better way of namespacing these?
> >> Perhaps it would also be sufficient if all of these were better
> >> documented so that people know what to look for on their platform of
> >> interest.
> >
> > It's not a 100% strict rule, I've just tried to limit it as much as possible,
> > and sometimes missed drivers doing it anyway. My main goal here is
> > to make things consistent between SoC families, so if one piece of
> > information is provided by a number of them, I'd rather have a standard
> > attribute, or a common way of encoding this in the existing attributes
> > than to have too many custom attributes with similar names.
>
>
> Makes sense. Any recommendations for this specific attribute? I could
> imagine other vendors may have engineering devices and production
> versions. This is slightly different from the silicon version.

Not sure, I haven't seen this one referenced elsewhere so far.

What is the actual information this encodes in your case? Is this fused
down in a way that production devices lose access to certain features
that could be security critical but are useful for development?

         Arnd
