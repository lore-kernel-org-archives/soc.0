Return-Path: <SRS0=HLeY=M5=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58C64C4338F
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Aug 2021 21:01:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E551261184
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Aug 2021 21:01:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E551261184
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=z3L8U3MKQ22c5rLcR1pJHAexTyicdnyINlnlVWYGEMI=; b=vTrjpn/KM/bGki
	Gsrgtu2K1m0FpJF2s9KEq28GjeeLCffh5ziQ1385ctdJzsvQ26JykXyBx7RQO87B5s4SjQ9EiDTw0
	2VJA0UItL3HmkKVg8XkrF5O6ulJ08NG29K5O2vC4aQddPf4evD9WYdyult0hrpQ+ysbyZHw+5rnL7
	rU5y64pErorU9xU2jDsR63Enso8K/PWlpCTp5gTT2wikmP7rAahBxbbrfxQeSMhABidMmdUt1mKg8
	yTShpbI3vTPohoM1IzyjGaXq8Ewi74YdDc3nFiq5xOLnJW/rH1ssPMxi33oeDFq6PBTH2JUnOI+la
	SNBsByAsLgBccrtLRVDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mC6wY-00DZc9-Tk; Fri, 06 Aug 2021 20:59:51 +0000
Received: from mail-io1-f45.google.com ([209.85.166.45])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mC6wV-00DZbl-Cl
 for linux-arm-kernel@lists.infradead.org; Fri, 06 Aug 2021 20:59:48 +0000
Received: by mail-io1-f45.google.com with SMTP id s184so14031408ios.2
 for <linux-arm-kernel@lists.infradead.org>;
 Fri, 06 Aug 2021 13:59:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Abd72sZNRU0BLu7YkKaiYFwOHr3rHD24N77jTkRPs6M=;
 b=kmoF6GVSiAN9hBaB8liPmxXwZAhk7dfb02RWc+G5s1+/HU7X8ity0XRt7NSl7p4FkS
 FBBYXdU4fbF8B8sd+cPGNuiiUTsdOg/A4ZIV+PXTNwKhclWD+yBRaveCzr1YuY6I15gN
 QOynOTkWIFNcwagd9AHd011fgbWnu7U+80x4svVsSaDucSeWNCLMbNlCXoxtwGL6PRVi
 QNfrFWwklDfkFRD6mK0SYwd32yfyjEZBmAZ0b1nt3PwXm2hEq9gAvneaGoOUQBoAlg0x
 zJsIxQqMccXw+Qt1TA/7B9IRYn+tBGC9Jwd2JNjTu9L68p+5Ppo71q5b2TwKJSyIpy04
 XzCw==
X-Gm-Message-State: AOAM531o3L4EERk2tpi0X1pjNGCNZaoqIIujpakWMsdwVPMtKSHwFPfG
 Ewer+O7garwx4w6TBLXrpXsTY4WcsQ==
X-Google-Smtp-Source: ABdhPJzyr3XOBq5uPxRDKXpTJOdZ6Sg4iLb6fl58mEob9P0bnfHDB8LAbg+1E/tRB8RW8/BxSSQcUg==
X-Received: by 2002:a05:6602:14f:: with SMTP id
 v15mr136277iot.206.1628283586727; 
 Fri, 06 Aug 2021 13:59:46 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
 by smtp.gmail.com with ESMTPSA id b23sm4530328iof.8.2021.08.06.13.59.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Aug 2021 13:59:45 -0700 (PDT)
Received: (nullmailer pid 1787406 invoked by uid 1000);
 Fri, 06 Aug 2021 20:59:44 -0000
Date: Fri, 6 Aug 2021 14:59:44 -0600
From: Rob Herring <robh@kernel.org>
To: Bert Vermeulen <bert@biot.com>
List-Id: <soc.lore.kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, soc@kernel.org,
 John Crispin <john@phrozen.org>, Felix Fietkau <nbd@nbd.name>
Subject: Re: [PATCH 3/5] ARM: dts: Add basic support for EcoNet EN7523
Message-ID: <YQ2iwIcSuDwcw/s5@robh.at.kernel.org>
References: <20210730134552.853350-1-bert@biot.com>
 <20210730134552.853350-4-bert@biot.com>
 <20210730144627.GB19569@C02TD0UTHF1T.local>
 <d0ff051b-280c-4021-f4ee-7bfda5e356d3@biot.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <d0ff051b-280c-4021-f4ee-7bfda5e356d3@biot.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210806_135947_482856_C19923B1 
X-CRM114-Status: GOOD (  22.28  )
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
Message-ID: <20210806205944.5ldZZBmFjjedlNZR5X2Z1Iin8dnqbEsBThC6alWlZM0@z>

On Wed, Aug 04, 2021 at 06:41:55PM +0200, Bert Vermeulen wrote:
> On 7/30/21 4:46 PM, Mark Rutland wrote:
> > On Fri, Jul 30, 2021 at 03:45:50PM +0200, Bert Vermeulen wrote:
> > > +	timer {
> > > +		compatible = "arm,armv8-timer";
> > 
> > This should be "arm,armv7-timer".
> > 
> > > +		interrupt-parent = <&gic>;
> > > +		interrupts = <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
> > > +			     <GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
> > > +			     <GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
> > > +			     <GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>;
> > 
> > GICv3 doesn't have a cpumask in its PPI description, so the
> > GIC_CPU_MASK_SIMPLE() bits should be removed.
> 
> Ok, will fix.
> 
> > > +		clock-frequency = <25000000>;
> > 
> > Please have your FW configure CNTFRQ on each CPU; the clock-frequency
> > property in the DT is a workaround for broken FW, and it's *vastly*
> > preferable for FW to configure this correctly (e.g. as it means VMs
> > should "just work").
> 
> I've since got hold of the modified U-Boot that runs on my eval board, and
> indeed it doesn't set CNTFRQ. So the kernel does need this, for the moment.

Can't you write CNTFRQ in the u-boot shell/script?

> I may get a chance to upstream support for this SoC in U-Boot, but I can't
> control what people are going to ship with their board. Is it ok to leave
> this in?

If they want a working upstream Linux, then you can control it.

I seem to recall this being rejected in other cases. That may have been 
on v8 which has taken stricter stances (but arguably any new v7 stuff 
should too).

Rob

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
