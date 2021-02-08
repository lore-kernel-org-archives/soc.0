Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CCC2C433DB
	for <soc@archiver.kernel.org>; Mon,  8 Feb 2021 12:40:46 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id BAC3364E8F; Mon,  8 Feb 2021 12:40:45 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8D9FF64E8A;
	Mon,  8 Feb 2021 12:40:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1612788045;
	bh=zN+QyJPIw5PXaS/k8xzu0rgXDkKs2/8NF26TwCH56cA=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=R6w+TIZe+BtpYKApRBLFqnc1P3qvLmJVQoddtY3WJ+RFsSpFpmB6PG9185UHAKxxc
	 O+kzc7EpS0HavseHW/t+0OBkMASKWmq/5GLBPKd7IQt0zbHouA3pswdWJvDW1u8YtT
	 /TPeNpx9TTTZk/m11k2bRcCryHPy6afoKFau0sAUcaoQbIWQH3GV/QgBqKUZbfm99j
	 JJEge0oa7OUADX4BmkRCijCXjT474bipC6+QgZ/PREIIayOzYhc/8q+WMn5P2fsF5A
	 MWvdvkVQZJ06qUTdNO8M84+I+l9lJRGSrAEsutA+fiXqGPAfqEr0+vEtom63502M6D
	 guClWAmCQasUQ==
Received: by mail-ot1-f52.google.com with SMTP id i20so14017224otl.7;
        Mon, 08 Feb 2021 04:40:45 -0800 (PST)
X-Gm-Message-State: AOAM5314LIaORf3/DDSu8cwAwQZKsHbQ/BYOtqxRgGH9omiL66L4XqUz
	JQCMuJAT3/JBzFh8UJ6Uu7bRaRBUW8ByyJjVDbU=
X-Google-Smtp-Source: ABdhPJzB0Sl4Qcea0QfN6LSnqxsQvoJ2nrH52C2zoBz+nuXqNwWR2b4eQ4wf5tsNzu05dziVBnwRcMuiLLzEX3jL8Qo=
X-Received: by 2002:a9d:3403:: with SMTP id v3mr3729921otb.305.1612788044796;
 Mon, 08 Feb 2021 04:40:44 -0800 (PST)
MIME-Version: 1.0
References: <20210204203951.52105-1-marcan@marcan.st> <20210204203951.52105-19-marcan@marcan.st>
 <20210208110441.25qc6yken4effd6c@kozik-lap> <cd67b2ce-9676-31b4-85f7-de1ec9b2bf72@marcan.st>
 <20210208121325.owjjd7nfbdanszny@kozik-lap>
In-Reply-To: <20210208121325.owjjd7nfbdanszny@kozik-lap>
From: Arnd Bergmann <arnd@kernel.org>
Date: Mon, 8 Feb 2021 13:40:28 +0100
X-Gmail-Original-Message-ID: <CAK8P3a0yBC3dui6vcz+NByWD-3LqRj-2MF89jpjb_k8r5xmNRA@mail.gmail.com>
Message-ID: <CAK8P3a0yBC3dui6vcz+NByWD-3LqRj-2MF89jpjb_k8r5xmNRA@mail.gmail.com>
Subject: Re: [PATCH 18/18] arm64: apple: Add initial Mac Mini 2020 (M1) devicetree
To: Krzysztof Kozlowski <krzk@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: "Hector Martin 'marcan'" <marcan@marcan.st>, SoC Team <soc@kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, Marc Zyngier <maz@kernel.org>, 
	Rob Herring <robh+dt@kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, DTML <devicetree@vger.kernel.org>, 
	Olof Johansson <olof@lixom.net>
Content-Type: text/plain; charset="UTF-8"

On Mon, Feb 8, 2021 at 1:13 PM Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> On Mon, Feb 08, 2021 at 08:56:53PM +0900, Hector Martin 'marcan' wrote:
> > On 08/02/2021 20.04, Krzysztof Kozlowski wrote:
> > > apple
> > >
> > > Don't make things different for this one platform (comparing to all
> > > other platforms). Apple is not that special. :)
> >
> > AAPL is the old vendor prefix used in the PowerPC era. I'm happy to use
> > `apple`, as long as we're OK with having two different prefixes for the same
> > vendor, one for PPC and one for ARM64. I've seen opinions go both ways on
> > this one :)
>
> Thanks for explanation. I propose to choose just "apple". Sticking to
> old vendor name is not a requirement - we have few vendor prefixes which
> were marked as deprecated because we switched to a better one.

We've gone back and forth on this a few times already. My current
preference would also be to go with "apple", not because it's somehow
nicer or clearer but because it avoids the namespace conflict with
what the Apple firmware uses:

The point of the vendor prefix is to prevent two people from introducing
the same identifier with slightly different meanings. This used to be
the stock ticker symbol ("ibm", "SUNW", "AAPL", ...) back when the
only people making devices with firmware were large corporations.

In FDT, it's usually random contributors introducing the names to make
something work on Linux, with unique strings coming from code review.

The identifiers that Apple use are highly unlikely to cause clashes
with the ones we use in Linux, since you probably won't find much
software that has to deal with both formats, but the fact that Apple
still prefixes those strings with their stock ticker symbol tells me that
someone there still considers the namespace relevant, so it's more
polite to stay out of their lawn.

> Makes sense. In such case it's indeed your work. Since you introduce it,
> the DTSes are usually licensed with (GPL-2.0+ OR MIT).

Indeed, we do want other OSs to use our dts files, so the general
preference is to have a permissive license, unless you have a strong
reason yourself to require GPL-only.

       Arnd
