Return-Path: <SRS0=Da4+=Z2=linaro.org=linus.walleij@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0CA0C6FA82
	for <soc@archiver.kernel.org>; Fri, 23 Sep 2022 13:54:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 5870DC433B5; Fri, 23 Sep 2022 13:54:39 +0000 (UTC)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 021EBC433D6
	for <soc@kernel.org>; Fri, 23 Sep 2022 13:54:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 021EBC433D6
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f48.google.com with SMTP id e18so343001edj.3
        for <soc@kernel.org>; Fri, 23 Sep 2022 06:54:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=oR3rC38nMBNz6t5BMRLg1GUgG20Ko0iTZdn9TC7Nvs0=;
        b=sCw+pCkTi/QDfkqG2vkBOcvw6wGktSb/Wuhy3yLI4Muhw/QoUGYgKVGHkdsInQoILK
         4iftTg9FXhUfYdKYTg5k8Nb92imjsrUgGgrWmt7+FUCvqP2owvh9jyCtePFqf/36Dx3k
         qirEpYFB8DCCxr/scNeUsSUAbcSUNldE9T79Ksu47Soy33ZRJoP7Y1xuiarFq+6L4VSO
         R+I/vpI6BxW0oRI23kOz5MDxDuBkHPca9TuW5t4meTfQ2J61vwjrKDMih7f6ypm8zORt
         KiA0Mlab7rm/Vc2v5D5qOJqC5Eg6FBNUbk9RoLAWfTzX2bXNJ6oV6qbiF2E5jGENj/Wa
         pdlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=oR3rC38nMBNz6t5BMRLg1GUgG20Ko0iTZdn9TC7Nvs0=;
        b=VScweqxWmSBpeUZXjjuet5PT3/V3wccd1piwwKAGM3kkLLRqQPpYAhjkSKqaNyyS2i
         UnLpLiiMGrxACyOTrxrgiP0RE5dqqSrJ4ec8k8T5mNFKxbALvU3P96dM5E0gWy7DIDz3
         tT6KZJSJfZPpsMygMHNym4F7h7mmE+zxPdgtX6FVgcXSmoB/0d0nFnv4cECMHEREAOee
         pF2U6q9z4iUB9dtbjD0Hkk+W1RK/ZvZIqUXT/xqdWFN7SVTVXaT2ZTv64oddKkkV8ZXR
         Ui43+sLnjGTgCB3hQcQmX8xlGQ3EwXu44YDSKpMw525Bq0rIrn6efnriBzoPJlmA7wWY
         /8GA==
X-Gm-Message-State: ACrzQf1am8OWMOilzXWXHNFMIv1hMqJQvoKR+niT5sxj4IVwYuLAZcnN
	0TA7AN/NEpWBPZhVb769T2w2U+uCBVpT/fLVLkUTxg==
X-Google-Smtp-Source: AMsMyM5mLCrn25I5gbqOABu7bFTUVZLOLX3wK90Nut9IB6Vv+7nF20WRMafL4OlgF0GwVnpzZWtnS+G/4jqsV7fv1xw=
X-Received: by 2002:aa7:d6d9:0:b0:44d:e1b7:d905 with SMTP id
 x25-20020aa7d6d9000000b0044de1b7d905mr8606222edr.32.1663941276293; Fri, 23
 Sep 2022 06:54:36 -0700 (PDT)
MIME-Version: 1.0
References: <20220923113822.1445491-1-linus.walleij@linaro.org>
 <b80444c8-70fc-4aa2-9c71-e7e7e90a3696@www.fastmail.com> <CACRpkdYvsktiM5Fzk4g673=r6gJ4WZArJh-HTERsbFBZ5LcJbg@mail.gmail.com>
 <47db7fea-eed7-4fb6-9f74-0abe93be3f0d@www.fastmail.com>
In-Reply-To: <47db7fea-eed7-4fb6-9f74-0abe93be3f0d@www.fastmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 23 Sep 2022 15:54:24 +0200
Message-ID: <CACRpkdbnNbYcOGPyJMKe5yxKfzaBJ4dA4WvSZrNYYHieALQf6A@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: integrator: Fix DMA ranges
To: Arnd Bergmann <arnd@arndb.de>
List-Id: <soc.lore.kernel.org>
Cc: arm@kernel.org, soc@kernel.org, linux-arm-kernel@lists.infradead.org, 
	Christoph Hellwig <hch@lst.de>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, Sep 23, 2022 at 3:21 PM Arnd Bergmann <arnd@arndb.de> wrote:
> On Fri, Sep 23, 2022, at 2:56 PM, Linus Walleij wrote:

> > Here the special memory appears in the CPU address map.
> >
> >         bus@c0000000 {
> >                 compatible = "arm,integrator-ap-lm";
> >                 #address-cells = <1>;
> >                 #size-cells = <1>;
> >                 ranges = <0xc0000000 0xc0000000 0x40000000>;
> >                 dma-ranges;
> > (...)
> >                 lm0: bus@c0000000 {
> >                         compatible = "simple-bus";
> >                         ranges = <0x00000000 0xc0000000 0x10000000>;
> >                         dma-ranges = <0x00000000 0xc0000000 0x10000000>;
> >                         reg = <0xc0000000 0x10000000>;
> >                         #address-cells = <1>;
> >                         #size-cells = <1>;
> >
> >                         display@1000000 {
> >                                 compatible = "arm,pl110", "arm,primecell";
> >                                 reg = <0x01000000 0x1000>;
> > (...)
> >                                 memory-region = <&impd1_ram>;
> >                                 dma-ranges;
> > (...)
> >
> > Here we find the reg properly at physical address 0xc1000000 thanks to
> > the ranges: 0xc0000000 + 0x00000000 + 0x01000000 = 0xc1000000.
> >
> > But the special memory region is in the root of the device tree,
> > outside of the translation.
> >
> > Now dma-ranges will assume that when we translate the memory region
> > it is in the address space of the display controller, but it isn't,
> > because the phandle goes to something in the root of the device tree.
> >
> > 0xc2000000 + 0x00000000 + 0x00000000 = 0xc2000000
> >
> > Whenever I do ranges my head start spinning :/
> >
> > If you have a better way to accomodate the DMA ranges I am happy to
> > comply!
>
> I'm still not sure I understand it. Is that reserved memory
> area in RAM or on the logic bus?

It's on the logic bus slot "lm0", so the display controller is
at 0xc1000000 and right below it at 0xc2000000 is 1MB
of dedicated graphics memory.

> The 'ranges' property makes
> it appear that all of 0xc0000000-0xcfffffff is the logic bus,

Yep it is.

> but then the vram itself is also in that address range, which
> would indicate that it is behind that bus.

Yep it is.

>  However, using the
> 'reserved-memory' property indicates that this is actually
> just normal RAM that is carved out from what the OS manages.

The binding document
Documentation/devicetree/bindings/reserved-memory/reserved-memory.yaml
unfortunately does not mention anywhere that the reserved memory
must be a subset of the system main RAM "carveout" or anything like that,
it says that  the memory should be "designed for special usage by various
device drivers", and "excluded from normal usage" which it is, hence the
misunderstanding.

We have used this for Vexpress like forever, but I did
the change from some custom vexpress memory property
to shared-dma-pool so I guess that's my fault.
Incidentally this also works very well.

Is there some other mechanism we should be using for dedicated
framebuffer memory on some odd address?

Yours,
Linus Walleij
