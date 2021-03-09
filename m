Return-Path: <SRS0=lLU6=IH=arndb.de=arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33EBEC433E9
	for <soc@archiver.kernel.org>; Tue,  9 Mar 2021 15:20:02 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 0B14665274; Tue,  9 Mar 2021 15:20:02 +0000 (UTC)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4BB3C65272;
	Tue,  9 Mar 2021 15:20:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4BB3C65272
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=arnd@arndb.de
Received: from mail-oi1-f178.google.com ([209.85.167.178]) by
 mrelayeu.kundenserver.de (mreue109 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1MfYHW-1lzIYR1sS0-00g1Q3; Tue, 09 Mar 2021 16:19:59 +0100
Received: by mail-oi1-f178.google.com with SMTP id f3so15261987oiw.13;
        Tue, 09 Mar 2021 07:19:58 -0800 (PST)
X-Gm-Message-State: AOAM5326zMvzPYBjo8111DipYpgw8ZOr6MrInMTLAc7XtEApkEG4HTdm
	jClSlRF/0Sh0EflmgOhVHdM0rwnB1NqT2mbbWMU=
X-Google-Smtp-Source: ABdhPJzLaYkFBQxeenML1CtvrMiCXYHwEhB7UewHLGYWzvuz3PZ33xGUA54iow9OSLWqVDbvpKTVkJjaZNVQIbBYtnE=
X-Received: by 2002:a05:6808:3d9:: with SMTP id o25mr3319660oie.4.1615303197754;
 Tue, 09 Mar 2021 07:19:57 -0800 (PST)
MIME-Version: 1.0
References: <20210308174824.278372-1-krzysztof.kozlowski@canonical.com>
 <776e0c26-4f05-2a3c-1536-f730b9109b1b@kernel.org> <7462eeec-5c4e-b4d5-cf94-9945042fc1d1@canonical.com>
 <73dafebf-5c47-5d90-e29e-e1811f370a54@kernel.org>
In-Reply-To: <73dafebf-5c47-5d90-e29e-e1811f370a54@kernel.org>
From: Arnd Bergmann <arnd@arndb.de>
Date: Tue, 9 Mar 2021 16:19:38 +0100
X-Gmail-Original-Message-ID: <CAK8P3a36-6yjVLSdJiUWPEz0_i_DWbPasQ8RZWHyxth-4D62+w@mail.gmail.com>
Message-ID: <CAK8P3a36-6yjVLSdJiUWPEz0_i_DWbPasQ8RZWHyxth-4D62+w@mail.gmail.com>
Subject: Re: [PATCH v2] arm64: defconfig: enable Intel's eASIC N5X SoCFPGA and
 Keem Bay SoC
To: Dinh Nguyen <dinguyen@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>, 
	"Paul J. Murphy" <paul.j.murphy@intel.com>, 
	Daniele Alessandrelli <daniele.alessandrelli@intel.com>, Rob Herring <robh+dt@kernel.org>, 
	DTML <devicetree@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, arm-soc <arm@kernel.org>, SoC Team <soc@kernel.org>, 
	Olof Johansson <olof@lixom.net>, Krzysztof Kozlowski <krzk@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:PlRyxu35TJnq3tkkRWg0v/aJqEdg8+vaMXZiiz2GvivfnZx0vgF
 9FYsCHHc/Hg/DExiVI/8xIcD1WeiLzrePqm+TG9HlO+8U17+t7l/Uc2RP8QgTLen7XpbMdp
 Bx8WDC2gohkZHiukuC0WlLSI1Z50SdCYp1jShLWNiLzce7076IutQoGSKv9kOs5eQjL8SKU
 2cEdTsXYiSpHrmSKT0rHw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:yU+4/9nYG7E=:SFiZnQkNzQGtU4u7YxmCY8
 /wMUZ8Obgg3EGK0MmHk48kzHw5HSC9ddyiIQ9rY/uW6pOrrIpwrk9PoMYCVQmV5VUlE4kNskC
 aoMnWfYOLNrRkDjR45QzP20E4rIv1K5TsJd6qt2/NpDskEuHBTITnp3f8vaC7lW72PFWI6tHY
 uPKvi9Yt6mDUwYL+so4Kw1XQFvu8FgglO9hDjhNuP4GUe4p9tHTsnsIgJSTQ+C1NPBYi8hGsw
 XW6ACDiQDa5OGcuJ5tSPxhoUrCgzGTXqmqD96Sx/GeHydv6m1TdrtbirQ+Tjzxw1QJY2Ebbr7
 fTfgfKmFf3n1YtlMwkxPJEW7b0hbqfXDhkn1kiaERsOK3pU9iqhcyN/XJB0uOTookb9mFMJ4F
 Qx9ye9FJ92YlJNju5oyNZX5kcKtz+IwoQ0qwt4gmKstOfEMC2GBQBfkWJSXSJa1OrfoOAn5SC
 Gzq8D58LO6S9SZP2+xteIJ8mTwmAMBZX8HkKt1ajFNlBzVtu7ZyBb8qSNszsLLMMio2KJ6Kok
 HKgjJQ3mdViVV/QZJ+43Uxeusya0A6qu1tvNGAjbvnFp9Ij1Bqh3BAXwHJNsfrvgA==

On Tue, Mar 9, 2021 at 2:26 PM Dinh Nguyen <dinguyen@kernel.org> wrote:
> On 3/9/21 3:29 AM, Krzysztof Kozlowski wrote:
> > On 08/03/2021 20:07, Dinh Nguyen wrote:
> >>> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> >>> index d612f633b771..9f9adcb8b0e9 100644
> >>> --- a/arch/arm64/configs/defconfig
> >>> +++ b/arch/arm64/configs/defconfig
> >>> @@ -29,6 +29,7 @@ CONFIG_KALLSYMS_ALL=y
> >>>    CONFIG_PROFILING=y
> >>>    CONFIG_ARCH_ACTIONS=y
> >>>    CONFIG_ARCH_AGILEX=y
> >>> +CONFIG_ARCH_N5X=y
> >>
> >> I just submitted a patch for this as well. From the looks of the
> >> defconfig file, it looks like the platforms are in alphabetical order,
> >> but then I see that ARCH_SUNXI is not in it's correct spot if there is a
> >> rule for keeping things in alphabetical order.
> >>
> >
> > The rule is that order comes from savedefconfig, not alphabetical. This
> > way you avoid reshuffling of symbols on any future savedefconfig.
> >
>
> Got it. But I've done savedefconfig in the past and Arnd adviced against
> that because what if multiple patches come in with savedefconfig,
> wouldn't that cause a messy merge?

To clarify: you should not send the result of 'make savedefconfig'
if it changes the contents of the file in another way, but Krzysztof's
recommendation of adding new lines where savedefconfig would
put them is best.

        Arnd
