Return-Path: <SRS0=6A6O=HK=gmail.com=robherring2@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.0 required=3.0 tests=BAYES_00,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0EA88C433E6
	for <soc@archiver.kernel.org>; Mon,  8 Feb 2021 17:58:51 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id CDD7A64EDA; Mon,  8 Feb 2021 17:58:50 +0000 (UTC)
Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6479464ECB;
	Mon,  8 Feb 2021 17:58:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6479464ECB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=robherring2@gmail.com
Received: by mail-ot1-f41.google.com with SMTP id k10so12644751otl.2;
        Mon, 08 Feb 2021 09:58:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=lScv50d1ZyqagwO0c9BMwWMnexfOHV/tP4Lgw63kKHw=;
        b=HNuJb0SlB5o4YTyGgKsOGwIqfJL+NKi05q1Xn8H/hqua8ROy1E1dCryYCO4OMCFuLa
         MsRrPJQy4hpT4KFlCw4o3mIh0R0lGciCqHgsvcn//nds7tvILsuaSYQUGcJ/LbBA8cAu
         HM/QPyNJ0RnFlknQXvd99Cronu0kXIGPWyzS2LELreG4OOSiUrh5ZZ0QzeC/lx5xH9Ww
         IyHWSgCCq3L2oK7BmsTKa7pjRNn1s5I/rGuJuukCopJJgtEr5ZLXbGzkinZdf7mdGUHs
         /vzUz/5AXT/M7L0Y1OOlOFli63k6CoSPF1Kot5OiIxgJN7gW3TRORYQ5VFDG7lsfLoH3
         yVSg==
X-Gm-Message-State: AOAM530qWKJ+e8dXvJDF1+X/Xe7Jg9NchbdCQ2SxPI3tWQUBHqrThn2L
	E7H2aqZaz/T4UncOG6XDxw==
X-Google-Smtp-Source: ABdhPJzqRSrYc4T8fAFx8cdWWHXtMy9OBexjy9vulNRDba6D0v0R4U+Q3TIwsWMEc78NEdWT8dc9FA==
X-Received: by 2002:a05:6830:22d7:: with SMTP id q23mr5443543otc.71.1612807129548;
        Mon, 08 Feb 2021 09:58:49 -0800 (PST)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id u73sm3668919oie.30.2021.02.08.09.58.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Feb 2021 09:58:48 -0800 (PST)
Received: (nullmailer pid 1618899 invoked by uid 1000);
	Mon, 08 Feb 2021 17:58:47 -0000
Date: Mon, 8 Feb 2021 11:58:47 -0600
From: Rob Herring <robh@kernel.org>
To: Hector Martin <marcan@marcan.st>
List-Id: <soc.lore.kernel.org>
Cc: Arnd Bergmann <arnd@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, DTML <devicetree@vger.kernel.org>, Marc Zyngier <maz@kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, SoC Team <soc@kernel.org>, Olof Johansson <olof@lixom.net>, Linux ARM <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH 18/18] arm64: apple: Add initial Mac Mini 2020 (M1)
 devicetree
Message-ID: <20210208175847.GB1567700@robh.at.kernel.org>
References: <20210204203951.52105-1-marcan@marcan.st>
 <20210204203951.52105-19-marcan@marcan.st>
 <20210208110441.25qc6yken4effd6c@kozik-lap>
 <cd67b2ce-9676-31b4-85f7-de1ec9b2bf72@marcan.st>
 <20210208121325.owjjd7nfbdanszny@kozik-lap>
 <CAK8P3a0yBC3dui6vcz+NByWD-3LqRj-2MF89jpjb_k8r5xmNRA@mail.gmail.com>
 <f98dc238-6742-455e-3f76-e86ae4c0c838@marcan.st>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f98dc238-6742-455e-3f76-e86ae4c0c838@marcan.st>

On Mon, Feb 08, 2021 at 11:12:52PM +0900, Hector Martin wrote:
> On 08/02/2021 21.40, Arnd Bergmann wrote:
> > On Mon, Feb 8, 2021 at 1:13 PM Krzysztof Kozlowski <krzk@kernel.org> wrote:
> > > 
> > > On Mon, Feb 08, 2021 at 08:56:53PM +0900, Hector Martin 'marcan' wrote:
> > > > On 08/02/2021 20.04, Krzysztof Kozlowski wrote:
> > > > > apple
> > > > > 
> > > > > Don't make things different for this one platform (comparing to all
> > > > > other platforms). Apple is not that special. :)
> > > > 
> > > > AAPL is the old vendor prefix used in the PowerPC era. I'm happy to use
> > > > `apple`, as long as we're OK with having two different prefixes for the same
> > > > vendor, one for PPC and one for ARM64. I've seen opinions go both ways on
> > > > this one :)
> > > 
> > > Thanks for explanation. I propose to choose just "apple". Sticking to
> > > old vendor name is not a requirement - we have few vendor prefixes which
> > > were marked as deprecated because we switched to a better one.
> > 
> > We've gone back and forth on this a few times already. My current
> > preference would also be to go with "apple", not because it's somehow
> > nicer or clearer but because it avoids the namespace conflict with
> > what the Apple firmware uses:

It's only AAPL,phandle and AAPL,unit-string (equivalent to unit-address) 
AFAICT which are really internal format details. So it's really 'apple' 
that could conflct, but I can't see that mattering.

> Ack, I'll use 'apple' for v2.

3 votes for 'apple'. You all get to pick the color of this shed.

> Amusingly, Apple actually use 'apple,firestorm' and 'apple,icestorm' for the
> CPUs in their devicetrees for these machines, so those will end up identical
> :) (they don't use apple-related prefixes for any other compatible strings
> at all, it's a mess). But we don't care about what their ADTs (Apple DTs) do
> in Linux anyway, the bootloader abstracts all that out and we'll be dealing
> with mantaining proper DTs ourselves.
> 
> > > Makes sense. In such case it's indeed your work. Since you introduce it,
> > > the DTSes are usually licensed with (GPL-2.0+ OR MIT).
> > 
> > Indeed, we do want other OSs to use our dts files, so the general
> > preference is to have a permissive license, unless you have a strong
> > reason yourself to require GPL-only.
> 
> Thanks for pointing this out; this was actually unintentional. I based it
> off of an old dts I'd written ages ago and forgot to revisit the license. I
> even have it marked GPL-2.0+ in the copy in our bootloader repo, which is
> otherwise supposed to be MIT for original code...

I'll also highlight there's a DT only tree[1] available to import DT 
related parts to other projects. It's generated from the kernel tree. 
Probably an overkill to copying at this point though.

Rob

[1] https://git.kernel.org/pub/scm/linux/kernel/git/devicetree/devicetree-rebasing.git/
