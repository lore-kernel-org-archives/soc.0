Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B66EDC433FE
	for <soc@archiver.kernel.org>; Wed, 13 Oct 2021 15:12:57 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 9C6276113D; Wed, 13 Oct 2021 15:12:57 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 82BBD61152;
	Wed, 13 Oct 2021 15:12:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1634137977;
	bh=hu+wHuAijt6nLgQe0LYgPk9kgIafUqC8hB4S6oJeOUE=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=igGQFBKD+aeklpT+IPdsjPlKZEg6f04goBiWxRoy2OWBnrKJGPdtzPQWgmaUthtl6
	 oPymhGXKlrbeFMyOyOGGrJoQNRzOSgprHd5Xh4SVrjv4+dsuhgzb/lFmLkU5XMKuEP
	 9l3w00whyF2CJvbzMEENWcrS61/0AWiwLI6oJZ4TLUxgcG7nZz2uQhLrZ5C5lRKmfj
	 86JNdEPgP4XT7jPrxMcsEpMxHbBnJck3Std/skGDFYGsl82r8aXQ5l48mWJiSZqH2Y
	 8wne4X2O+ynNanHoT6jHWfDAXWQzij6v0AcEWf24wtSW/TOymzQ0i6voLW9akb0zPb
	 A1aIdFn045LYw==
Received: by mail-wr1-f45.google.com with SMTP id g25so9566721wrb.2;
        Wed, 13 Oct 2021 08:12:57 -0700 (PDT)
X-Gm-Message-State: AOAM533mTsp6GxOvIMCG0mwoi/2anyKERNQhfWOGiiivwAdAlga7nefO
	21o7/d/eBk4NQxaiu7QGkOUD9YqxYyCqmvVzb7U=
X-Google-Smtp-Source: ABdhPJz7uRpoRHTq/reu8G1mGsTqoPz9rsP+XTRoDPCVBiZ7gteKr0XijfxMraY+BsUhsvUuuE+zgbJGYeSE+IKaDY0=
X-Received: by 2002:a05:600c:208:: with SMTP id 8mr13127132wmi.173.1634137975774;
 Wed, 13 Oct 2021 08:12:55 -0700 (PDT)
MIME-Version: 1.0
References: <20211013143810.2101838-1-arnd@kernel.org> <20211013143810.2101838-2-arnd@kernel.org>
 <CA+Eumj5Fx6tQv9B9R9iBCP4C=f2dk3szCGcisvPHYfMWpsCCfw@mail.gmail.com>
In-Reply-To: <CA+Eumj5Fx6tQv9B9R9iBCP4C=f2dk3szCGcisvPHYfMWpsCCfw@mail.gmail.com>
From: Arnd Bergmann <arnd@kernel.org>
Date: Wed, 13 Oct 2021 17:12:39 +0200
X-Gmail-Original-Message-ID: <CAK8P3a0BodYmn+n9xLxHxCkdQ+nmNAOV7U3ky6ME+j4tatz8qg@mail.gmail.com>
Message-ID: <CAK8P3a0BodYmn+n9xLxHxCkdQ+nmNAOV7U3ky6ME+j4tatz8qg@mail.gmail.com>
Subject: Re: [PATCH 2/2] arm64: exynos: fix cpu unit name warnings
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
List-Id: <soc.lore.kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>, Chanho Park <chanho61.park@samsung.com>, 
	SoC Team <soc@kernel.org>, Arnd Bergmann <arnd@arndb.de>, DTML <devicetree@vger.kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	"linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, Oct 13, 2021 at 5:01 PM Krzysztof Kozlowski
<krzysztof.kozlowski@canonical.com> wrote:
> On Wed, 13 Oct 2021 at 16:38, Arnd Bergmann <arnd@kernel.org> wrote:
>
> Thanks Arnd, but this was fixed with the next version of patchset.
> It's my bad because I did not drop the patch from my next branch after
> spotting it, knowing that Chanho will resubmit the next day and then I
> would replace it. This replacement happened next day but linux next
> got the older/buggy patch.

Ok, I see it now. Looks like I forgot to rebase onto the latest next/master
before testing my patches today.

        Arnd
