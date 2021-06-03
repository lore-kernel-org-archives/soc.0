Return-Path: <SRS0=0PE6=K5=google.com=ndesaulniers@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD84DC47082
	for <soc@archiver.kernel.org>; Thu,  3 Jun 2021 23:28:09 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id C505161411; Thu,  3 Jun 2021 23:28:09 +0000 (UTC)
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A78C96140A
	for <soc@kernel.org>; Thu,  3 Jun 2021 23:28:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A78C96140A
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=ndesaulniers@google.com
Received: by mail-lj1-f175.google.com with SMTP id a4so9239656ljd.5
        for <soc@kernel.org>; Thu, 03 Jun 2021 16:28:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=yp2xRS7FBwt+MIq6S/QXxDvwXDIU2o3m3x2Gm2/0e9o=;
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
        b=rnFqPigr90IwktqDjzidQYOlFoq21+jcBgQmZL+c464SU864QN44Ywaaic9E6xEFcJ
         /gLQN1Cotbv/z4r3KIzSd2ZP/wsPUPiN2Nvd2aOBjIJwlY3rpkr/5wVCOR6kfENRL+HL
         A9hYddZceR1QWC+HpOCvL/uuFMjJBM/FCRpLd0HRIlDTTrLmilWG2Cu9utR+3NOAX1uw
         QKh8uL1JV/kCqHYLCqELdO7UklGHxZsOtzemmNOWgPO5aPNFTIOy2KTEfp3Np+WHKoFX
         hwd1Tghjs6kR77osWVx4nmqeJzkbD/ayZouS02gzDBdYYZdBwKslU3nHkBNzkUfGbLlq
         NCfw==
X-Gm-Message-State: AOAM5315PLj09LVYXYLnLzwkpyg2jNravaXPZKlpT2BNcP9lAbqVx0Dt
	zLujA/RqWmsVqJT+sPdFJaLv0iWI9weZcpPNTAAETA==
X-Google-Smtp-Source: ABdhPJzXbiQOm/LTa/9I1aTG6l1jQZ5G6mYyNqgFW8DJe4zWHMlzneqPaWc1OYbyRPsdbcfjM4egzmVvxwPKp5INQg0=
X-Received: by 2002:a05:651c:b1f:: with SMTP id b31mr1302202ljr.0.1622762887714;
 Thu, 03 Jun 2021 16:28:07 -0700 (PDT)
MIME-Version: 1.0
References: <20210226164345.3889993-1-arnd@kernel.org> <CAK8P3a2E0pv6PKzcCoRZH0G_gGrhWeiDwN7h090iQpd6c=XG1Q@mail.gmail.com>
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
	Nathan Chancellor <nathan@kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	clang-built-linux <clang-built-linux@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"

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
