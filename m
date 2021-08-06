Return-Path: <SRS0=EEmc=M5=gmail.com=robherring2@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 351E4C4338F
	for <soc@archiver.kernel.org>; Fri,  6 Aug 2021 20:52:45 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id EA9F261184; Fri,  6 Aug 2021 20:52:44 +0000 (UTC)
Received: from mail-io1-f43.google.com (mail-io1-f43.google.com [209.85.166.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C37B861078
	for <soc@kernel.org>; Fri,  6 Aug 2021 20:52:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C37B861078
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-io1-f43.google.com with SMTP id x10so3075821iop.13
        for <soc@kernel.org>; Fri, 06 Aug 2021 13:52:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=NVLyAZM767lCQjYHXP5y7pQwa3Dn1l6PYLmN/KqVz0o=;
        b=ipbDgz85wmLuWsi1IUIIfh1dV43tOubjC53nKtUaSEqsFZaJktshb93qmaTwD3S7eH
         +Aha/GiiGv3X62lAs3Q3C8WyWQxdzMdvV8xnyVAdVTEVCBk5LwOZ4l8cVf/KN9Ent3wl
         Xuw/BlcFZCz6buvgPLH9HkrIRw306HiX/Mm8gY6P6IpBUmAKC7x1MY9gNGr7EGztRPg9
         UCGU4XMzZL7SAZjjVJxTDO9CzAhyufd8KfpB54tbF7PJIfxxplPm5223sFx+67L1RKDq
         FmbndDE7TSK9uNWV3LBCKziwQhxUk9jYDNym3C3pPUtFkZxDIkzSAPlttWwjN40PGysL
         fOkw==
X-Gm-Message-State: AOAM533NZu8UJFgYx2B5yzkHB48bVsi43x5afVEGRYskb2fneF+hF2cx
	j0vigNXjwvPGDhozQxNERpZgxKLIZA==
X-Google-Smtp-Source: ABdhPJyqR5Qdm+ZUCNfw8o71loW7W+tR7K9SO6snsI4KLMvaPTUL4AzzZcbIs14hJ813EUljIw8hrA==
X-Received: by 2002:a92:b112:: with SMTP id t18mr1836724ilh.36.1628283164111;
        Fri, 06 Aug 2021 13:52:44 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id d18sm5195594ile.32.2021.08.06.13.52.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Aug 2021 13:52:43 -0700 (PDT)
Received: (nullmailer pid 1776741 invoked by uid 1000);
	Fri, 06 Aug 2021 20:52:41 -0000
Date: Fri, 6 Aug 2021 14:52:41 -0600
From: Rob Herring <robh@kernel.org>
To: Mark Rutland <mark.rutland@arm.com>, Bert Vermeulen <bert@biot.com>
List-Id: <soc.lore.kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, soc@kernel.org, John Crispin <john@phrozen.org>, Felix Fietkau <nbd@nbd.name>
Subject: Re: [PATCH 3/5] ARM: dts: Add basic support for EcoNet EN7523
Message-ID: <YQ2hGd1cERLbfjJ6@robh.at.kernel.org>
References: <20210730134552.853350-1-bert@biot.com>
 <20210730134552.853350-4-bert@biot.com>
 <20210730145901.GC19569@C02TD0UTHF1T.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210730145901.GC19569@C02TD0UTHF1T.local>

On Fri, Jul 30, 2021 at 03:59:01PM +0100, Mark Rutland wrote:
> On Fri, Jul 30, 2021 at 03:45:50PM +0200, Bert Vermeulen wrote:
> > From: John Crispin <john@phrozen.org>
> > 
> > Add basic support for EcoNet EN7523, enough for booting to console.
> > 
> > The UART is basically 8250-compatible, except for the clock selection.
> > A clock-frequency value is synthesized to get this to run at 115200 bps.
> > 
> > Signed-off-by: John Crispin <john@phrozen.org>
> > Signed-off-by: Bert Vermeulen <bert@biot.com>
> > ---
> >  arch/arm/boot/dts/Makefile       |   2 +
> >  arch/arm/boot/dts/en7523-evb.dts |  17 ++++
> >  arch/arm/boot/dts/en7523.dtsi    | 128 +++++++++++++++++++++++++++++++
> >  3 files changed, 147 insertions(+)
> >  create mode 100644 arch/arm/boot/dts/en7523-evb.dts
> >  create mode 100644 arch/arm/boot/dts/en7523.dtsi
> > 
> 
> > +	cpus {
> > +		#address-cells = <1>;
> > +		#size-cells = <0>;
> 
> > +		cpu0: cpu@0 {
> > +			device_type = "cpu";
> > +			compatible = "arm,cortex-a7";
> > +			reg = <0x0>;
> > +			enable-method = "psci";
> > +			clock-frequency = <80000000>;
> > +			next-level-cache = <&L2_0>;
> > +
> > +		};
> 
> > +	gic: interrupt-controller@09000000 {
> > +		compatible = "arm,gic-v3";
> > +		interrupt-controller;
> > +		#interrupt-cells = <3>;
> > +		#address-cells = <1>;
> > +		#size-cells = <1>;
> > +		reg = <0x09000000 0x20000>,
> > +			  <0x09080000 0x80000>;
> > +		interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_LOW>;
> > +
> > +		its: gic-its@09020000 {
> > +			compatible = "arm,gic-v3-its";
> > +			msi-controller;
> > +			#msi-cell = <1>;
> 
> Missing 's' here for '#msi-cells'.

No need for a human to be checking this, the DT schemas will check this. 
Please run 'make dtbs_checks' on this. New platforms should be free of 
warnings ideally.

Rob
