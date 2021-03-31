Return-Path: <SRS0=Oh4c=I5=cisco.com=danielwa@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-22.3 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 690C7C433ED
	for <soc@archiver.kernel.org>; Wed, 31 Mar 2021 17:58:17 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 2C11260FEA; Wed, 31 Mar 2021 17:58:17 +0000 (UTC)
X-Greylist: delayed 62 seconds by postgrey-1.34 at mail.kernel.org; Wed, 31 Mar 2021 17:58:16 UTC
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B0FF9601FF
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=cisco.com
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=danielwa@cisco.com
Received: from alln-iport-7.cisco.com (alln-iport-7.cisco.com [173.37.142.94])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B0FF9601FF
	for <soc@kernel.org>; Wed, 31 Mar 2021 17:58:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=cisco.com; i=@cisco.com; l=3142; q=dns/txt; s=iport;
  t=1617213496; x=1618423096;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=9+KK6SA8vleCLJAhsbCIqaUCPho3SAWet4gWR6pTR+U=;
  b=OZS4uzv+cPYAXHTUstBUX0Gifegb55fkox0uZrmRJf0SyJ1Psv4JfTGF
   t+Kh9CarDZECV25akmbgqfap/0Irx1FMu1otbFAE4M56Ts7oKWrmU7gqc
   hWRT50KfupdUgSemkhgOD5gSoWxRlOK+i+vbEx7txKpo/cTHoRk54C+5n
   g=;
X-IronPort-AV: E=Sophos;i="5.81,293,1610409600"; 
   d="scan'208";a="670998258"
Received: from rcdn-core-3.cisco.com ([173.37.93.154])
  by alln-iport-7.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA; 31 Mar 2021 17:57:12 +0000
Received: from zorba ([10.24.8.227])
	by rcdn-core-3.cisco.com (8.15.2/8.15.2) with ESMTPS id 12VHv9UF022319
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Wed, 31 Mar 2021 17:57:10 GMT
Date: Wed, 31 Mar 2021 10:57:09 -0700
From: Daniel Walker <danielwa@cisco.com>
To: Arnd Bergmann <arnd@arndb.de>
List-Id: <soc.lore.kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
        Olof Johansson <olof@lixom.net>, SoC Team <soc@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, Ofer Licht <olicht@cisco.com>,
        xe-linux-external@cisco.com, DTML <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH] arm64: Add support for cisco craw64 ARMv8 SoCs
Message-ID: <20210331175709.GE2469518@zorba>
References: <20210331014603.2496983-1-danielwa@cisco.com>
 <CAK8P3a1rbGPxjRiUTy3AKh4S9jqxk=SHoa9s0Z-3nhgQb3xJUw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK8P3a1rbGPxjRiUTy3AKh4S9jqxk=SHoa9s0Z-3nhgQb3xJUw@mail.gmail.com>
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-SMTP-Client: 10.24.8.227, [10.24.8.227]
X-Outbound-Node: rcdn-core-3.cisco.com

On Wed, Mar 31, 2021 at 09:04:15AM +0200, Arnd Bergmann wrote:
> On Wed, Mar 31, 2021 at 3:46 AM Daniel Walker <danielwa@cisco.com> wrote:
> > From: Ofer Licht <olicht@cisco.com>
> 
> Thanks for the submission, it's always nice to see a new platform
 

> > Define craw64 config, dts and Makefile for Cisco
> > SoCs known as Craw.
> 
> I'd like some more information about the platform, e.g. the target
> market and maybe a link to the product information.

Our SoC is produced as an internal product. So SoC specifications aren't
widely available.

Here is an example of a Cisco product which uses this SoC,

https://www.cisco.com/c/en/us/products/collateral/switches/catalyst-9200-series-switches/nb-06-cat9200-ser-data-sheet-cte-en.html

I suspect that's not really what your looking for tho.

> > Cc: xe-linux-external@cisco.com
> > Signed-off-by: Ofer Licht <olicht@cisco.com>
> > Signed-off-by: Daniel Walker <danielwa@cisco.com>
> > ---
> >  .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
> >  arch/arm64/Kconfig.platforms                  |   5 +
> >  arch/arm64/boot/dts/Makefile                  |   1 +
> >  arch/arm64/boot/dts/cisco/Makefile            |   5 +
> >  .../arm64/boot/dts/cisco/craw64-dopplerg2.dts | 239 +++++++++++
> >  arch/arm64/boot/dts/cisco/craw64.dtsi         | 392 ++++++++++++++++++
> >  arch/arm64/configs/defconfig                  |   1 +
> 
> We have separate branches for dt, defconfig, and the rest, so it would be
> good to split this patch up a little more.
> 
> There should also be an entry in the top-level MAINTAINERS file.
> 
> > diff --git a/arch/arm64/boot/dts/cisco/craw64-dopplerg2.dts b/arch/arm64/boot/dts/cisco/craw64-dopplerg2.dts
> > new file mode 100644
> > index 000000000000..20ecc57b4e5c
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/cisco/craw64-dopplerg2.dts
> > @@ -0,0 +1,239 @@
> > +/dts-v1/;
> > +
> > +#include "craw64.dtsi"
> > +
> > +/ {
> > +       model = "Cisco Craw64 on DopplerG 2.0";
> > +       compatible = "cisco,craw64-dopplerg2", "cisco,craw64";
> > +
> > +       memory {
> > +               device_type = "memory";
> > +               reg = <0x0 0x80000000 0x0 0x80000000>;
> > +       };
> 
> The memory size is usually filled by the boot loader, just put an
> empty node into the .dtsi file

Arnd, I must regretfully inform you that Cisco has a deep dark addiction to
bootloaders which, are, um, how do I say this diplomatically, um , brain dead.

You have some other comments below related to moving things into the bootloader,
and I can look into it, but bootloader inflexibility is wide spread inside
Cisco.

> 
> > +       doppler {
> > +               #address-cells = <2>;
> > +               #size-cells = <2>;
> > +               compatible = "simple-bus";
> > +               ranges;
> > +       };
> 
> What is this?
> 

It's a device, but the driver is not submitted. I can remove it along with the
other device driver binding we have where the drivers and bindings aren't submitted.

I'll do my best to fix the comments your given an resubmit.

Daniel
