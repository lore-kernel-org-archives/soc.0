Return-Path: <SRS0=Da4+=Z2=linaro.org=linus.walleij@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 700EEC6FA82
	for <soc@archiver.kernel.org>; Fri, 23 Sep 2022 12:56:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 42322C433B5; Fri, 23 Sep 2022 12:56:41 +0000 (UTC)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id D6670C433D6
	for <soc@kernel.org>; Fri, 23 Sep 2022 12:56:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org D6670C433D6
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f44.google.com with SMTP id sb3so455131ejb.9
        for <soc@kernel.org>; Fri, 23 Sep 2022 05:56:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=FXzhOPZ9LU1I4GC/TVMv5Vw+ndU5psRLeLe0Y2U7+7Q=;
        b=VZVnN3lG0blgwGlwiN/YhshtOScmsDa5ZuiYbkKo7YQi6XS9kpu2sDhbBF8548l+qx
         insTUtqU58GaSizGdNexhcrv3byz7JwtsMMdr+v/AnFkCGo2rZHdU2NklzCWEVgbRh4a
         VXCMjXBUUEJLxA0z9AJ9S/MEwokFosLZenQz984xWQLpc1g6NJ6R973WyqZcrTExlNnd
         GSyqc5dQkyqUtgJTFzwSSEhvaHhNtBonuaFb3FJx1pRirLMTuG6KaVhsN4h/N3J9JWkc
         p1K9fK/7qBgLQY8Y7Hl0pjnTyfZfjpwPyBxG1hpyM0AXFbV1KiLVYEH9Yy98Luc6xNpd
         hSYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=FXzhOPZ9LU1I4GC/TVMv5Vw+ndU5psRLeLe0Y2U7+7Q=;
        b=QikxXj9HD2+3Pxgnwu2ieOztRc0DFforUEm5DtdKL/eUfUOdMdxelj37e/T6DfA8GS
         Jpecan5AZwajLrR56Akr3m8bs1MaEqs7DX13tdol1hIjFXGbhNSmYFoyQv4M9LL+u+L9
         9YyrbZw/WMrJ+foJ3w0vY+mF3csX/0JkZ8Pw81MFWhYy7CfkQyS+yI8L0EVBG9mQB31D
         53MGrQhTz9i/5yD1ZRWXQyslE6IQVnooVRvYrKOgrEbPAkVKtMtcAJbCcT+KQnzqrtIz
         PgOEksWAr9VsBw0k+X+iOW3igdlnrWbSFXsmYHXnFwagkAgAqtYBVelVZ6yRSa0OaZRl
         P7Kw==
X-Gm-Message-State: ACrzQf1zy4KiyFu68oKLWnBjw2gys1YBnblWgksIsq6DPiiD1PrAx7kh
	8eZy+9TG1C+OPQMAsz0nhWxj8lzBFvqs3nO0vwIMaQ==
X-Google-Smtp-Source: AMsMyM65ZSK4IrDiLEMXZlD+S5ckPOWjz+5ft4bz4SMcJFhFOFQkB7b9l4c/hmuLuhnvug7GulAwyKBqw3wdm2N1qtk=
X-Received: by 2002:a17:907:2d0b:b0:782:76dc:e557 with SMTP id
 gs11-20020a1709072d0b00b0078276dce557mr4475132ejc.690.1663937797937; Fri, 23
 Sep 2022 05:56:37 -0700 (PDT)
MIME-Version: 1.0
References: <20220923113822.1445491-1-linus.walleij@linaro.org> <b80444c8-70fc-4aa2-9c71-e7e7e90a3696@www.fastmail.com>
In-Reply-To: <b80444c8-70fc-4aa2-9c71-e7e7e90a3696@www.fastmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 23 Sep 2022 14:56:26 +0200
Message-ID: <CACRpkdYvsktiM5Fzk4g673=r6gJ4WZArJh-HTERsbFBZ5LcJbg@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: integrator: Fix DMA ranges
To: Arnd Bergmann <arnd@arndb.de>
List-Id: <soc.lore.kernel.org>
Cc: arm@kernel.org, soc@kernel.org, linux-arm-kernel@lists.infradead.org, 
	Christoph Hellwig <hch@lst.de>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, Sep 23, 2022 at 1:58 PM Arnd Bergmann <arnd@arndb.de> wrote:
> On Fri, Sep 23, 2022, at 1:38 PM, Linus Walleij wrote:

> > A recent change affecting the behaviour of phys_to_dma() to
> > actually require the device tree ranges to work unmasked a
> > bug in the Integrator DMA ranges.
> >
> > The PL110 uses the CMA allocator to obtain coherent allocations
> > from a dedicated 1MB video memory, leading to the following
> > call chain:
> >
> > drm_gem_cma_create()
> >   dma_alloc_attrs()
> >     dma_alloc_from_dev_coherent()
> >       __dma_alloc_from_coherent()
> >         dma_get_device_base()
> >           phys_to_dma()
> >             translate_phys_to_dma()
> >
> > phys_to_dma() by way of translate_phys_to_dma() will nowadays not
> > provide 1:1 mappings unless the ranges are properly defined in
> > the device tree and reflected into the dev->dma_range_map.
>
> I don't understand this yet, what did the kernel previously
> do to that allowed the correct DMA mapping when a wrong
> address was set in the DT?

Ah this goes way back. I think I need a different fixes tag.
I hadn't tested this platform in a while.

What happens currently in translate_phys_to_dma() is that it returns
DMA_MAPPING_ERROR (0xffffffff) because of the buggy device tree
and that causes the problem.

Before the dma direct rework we selected ARCH_HAS_PHYS_TO_DMA
and arch/arm/include/asm/dma-direct.h did this:

static inline dma_addr_t pfn_to_dma(struct device *dev, unsigned long pfn)
{
        if (dev)
                pfn -= dev->dma_pfn_offset;
        return (dma_addr_t)__pfn_to_bus(pfn);
}
(...)
static inline dma_addr_t __phys_to_dma(struct device *dev, phys_addr_t paddr)
{
        unsigned int offset = paddr & ~PAGE_MASK;
        return pfn_to_dma(dev, __phys_to_pfn(paddr)) + offset;
}

As dma_pfn_offset was 0 this resulted in a 1:1 map.

The actual switchover from this code happens in
commit af6f23b88e9508f1cb8d0af008bb175019428f73
"ARM/dma-mapping: use the generic versions of dma_to_phys/phys_to_dma
by default"

I'm not sure which commit is the appropriate for Fixes: really.

> > There is a bug in the device trees because the DMA ranges are
> > incorrectly specified, and the patch uncovers this bug.
> >
> > Solution:
> >
> > - Fix the LB (logic bus) ranges to be 1-to-1 like they should
> >   have always been.
> > - Provide a 1:1 dma-ranges attribute to the PL110.
> > - Mark the PL110 display controller as DMA coherent.
>
> Are you sure the actually coherent? I'm not aware of any other
> ARM9 based SoC with cache-coherent DMA. What is the DMA master
> that accesses

No scratch that, this oneliner isn't even needed.

I got my head wrong around what coherent means in this
context. Captain hindsight says we should have named
the dt flag dma-cache-coherent instead of just
dma-coherent.

Odd thing: this flag has no device tree bindings I could
find. Maybe it's in the really old DT docs?

> Which device is the actual DMA master here? The "dma-coherent"
> property sets the pl110 as coherent, but the dma-ranges property
> would refer to the port, right?

Yeah just the latter should be set. Mea culpa.

> > diff --git a/arch/arm/boot/dts/integratorap.dts
> > b/arch/arm/boot/dts/integratorap.dts
> > index c983435ed492..9148287fa0a9 100644
> > --- a/arch/arm/boot/dts/integratorap.dts
> > +++ b/arch/arm/boot/dts/integratorap.dts
> > @@ -262,7 +262,7 @@ bus@c0000000 {
> >               lm0: bus@c0000000 {
> >                       compatible = "simple-bus";
> >                       ranges = <0x00000000 0xc0000000 0x10000000>;
> > -                     dma-ranges = <0x00000000 0x80000000 0x10000000>;
> > +                     dma-ranges = <0x00000000 0xc0000000 0x10000000>;
>
> In your description, you say that you set a 1:1 map, but this is
> not what you seem to be setting here. Instead you map DMA address
> zero to point to the beginning of RAM.

This is in this context (after my changes):

        reserved-memory {
                #address-cells = <1>;
                #size-cells = <1>;
                ranges;

                impd1_ram: vram@c2000000 {
                        /* 1 MB of designated video RAM on the IM-PD1 */
                        compatible = "shared-dma-pool";
                        reg = <0xc2000000 0x00100000>;
                        no-map;
                };
        };

So reserved-memory has to be in the root of the device tree
because we don't support putting reserved memory anywhere
else (would be nice to fix this!)

Here the special memory appears in the CPU address map.

        bus@c0000000 {
                compatible = "arm,integrator-ap-lm";
                #address-cells = <1>;
                #size-cells = <1>;
                ranges = <0xc0000000 0xc0000000 0x40000000>;
                dma-ranges;
(...)
                lm0: bus@c0000000 {
                        compatible = "simple-bus";
                        ranges = <0x00000000 0xc0000000 0x10000000>;
                        dma-ranges = <0x00000000 0xc0000000 0x10000000>;
                        reg = <0xc0000000 0x10000000>;
                        #address-cells = <1>;
                        #size-cells = <1>;

                        display@1000000 {
                                compatible = "arm,pl110", "arm,primecell";
                                reg = <0x01000000 0x1000>;
(...)
                                memory-region = <&impd1_ram>;
                                dma-ranges;
(...)

Here we find the reg properly at physical address 0xc1000000 thanks to
the ranges: 0xc0000000 + 0x00000000 + 0x01000000 = 0xc1000000.

But the special memory region is in the root of the device tree, outside of the
translation.

Now dma-ranges will assume that when we translate the memory region
it is in the address space of the display controller, but it isn't, because the
phandle goes to something in the root of the device tree.

0xc2000000 + 0x00000000 + 0x00000000 = 0xc2000000

Whenever I do ranges my head start spinning :/

If you have a better way to accomodate the DMA ranges I am happy to
comply!

We can fix the problem that reserved memory can only be in the
root as well I suppose but that is no easy regression fix.

Yours,
Linus Walleij
