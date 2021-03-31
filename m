Return-Path: <SRS0=X/nU=I5=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-23.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIMWL_WL_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20756C433B4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 31 Mar 2021 17:58:59 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AE6E060FEA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 31 Mar 2021 17:58:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AE6E060FEA
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=cisco.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=NME49wQfDTHZHjxt999mVH6EClJUC0c0ejcADeOMERc=; b=e1DZZ4B1iVrJI7go16BHu2Fuu
	or1Ngn3CwvM8r2aI8ZM7z+cvQyexl9WAsZMZxb/uqZrDZDo9QfKLbGGIsv/+zFQqObDFHmGrMNhqd
	bdYLKTbyqRjCfxFsPMtB0VDTVUSEmrgTvIfsH4d18ouWOYp241MhxStW36cEbN9vlpVW9mVTY3Qmt
	xuS5wu/UHlqc3u2k+6O68xNY/D+E1ssa5E4i2o/SxcqVOEPPao3UWs0uK6eC30zhSkxIgYHB/HEaQ
	YfbR847mHUDep0srDLwx8mwtvECvudtMmxSCFEMVmUFNwvJZbGuW7RXn4KaiAs4To9p/0X2iR0oQX
	Naw9cz1ig==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lRf5p-007DyJ-8Z; Wed, 31 Mar 2021 17:57:25 +0000
Received: from alln-iport-7.cisco.com ([173.37.142.94])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lRf5l-007DxY-0X
 for linux-arm-kernel@lists.infradead.org; Wed, 31 Mar 2021 17:57:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=cisco.com; i=@cisco.com; l=3142; q=dns/txt; s=iport;
 t=1617213441; x=1618423041;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=9+KK6SA8vleCLJAhsbCIqaUCPho3SAWet4gWR6pTR+U=;
 b=NV8KnVlJIZr5Ik3w7uMv/vjX3PjqUj4WoyEftd0WIM54evWgdJLLd9s6
 zXwxu0I6hNyEmypTtAtmy8OPE98Of0k1Sv7vicw/jkODf7kmy7ZxF97cG
 w5hWwZOeVbQ9cEWVjxDMvqJxnt0+9+kFRw62kEZqKELkDUIbQpgktC+no E=;
X-IronPort-AV: E=Sophos;i="5.81,293,1610409600"; d="scan'208";a="670998258"
Received: from rcdn-core-3.cisco.com ([173.37.93.154])
 by alln-iport-7.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA;
 31 Mar 2021 17:57:12 +0000
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
Content-Disposition: inline
In-Reply-To: <CAK8P3a1rbGPxjRiUTy3AKh4S9jqxk=SHoa9s0Z-3nhgQb3xJUw@mail.gmail.com>
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-SMTP-Client: 10.24.8.227, [10.24.8.227]
X-Outbound-Node: rcdn-core-3.cisco.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210331_185721_414841_2738CB45 
X-CRM114-Status: GOOD (  30.83  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210331175709.ItyPhPwAcOTJpiVIgj9VP86q8BfaPhkZgMrJgJQfzqY@z>

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

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
