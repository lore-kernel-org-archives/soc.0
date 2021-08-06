Return-Path: <SRS0=HLeY=M5=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78C07C4338F
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Aug 2021 20:54:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2E49561078
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Aug 2021 20:54:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2E49561078
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=i9vyirohmlBLiq/yF6OgLa2Z2TRL3U4dpQMgrbOX1Xg=; b=wvvvuJ+Ir86NiM
	DHKB0BDtIssuRnrWtOI98rPRrsYtEdgPabyAUDUorJKJ9N5brqWxHfKB9JfI0/csuuSmytFVgJMOV
	gbOOxerS2PWk64+fab+1OUj1UsirYnQxeGf9IYj1MN8gd79IMaThmMCMWZLDiqFvi/SBlnem7/nOL
	pqETCLU9+f6NfjKqQ0fVsVFB6WcVQq4tULzOxgn485MMvdCEvAN7GZcHDlmKrvO5Gesf3t8rh+oja
	Dd4bWFCXIf706AjzP3M5LEciWj2G1nQsrfLw8wkSpObC7JgWPDIIM8eGPZT+llqKYQMl+odxqAO7J
	s1+rfdGk6A0UAyuETqAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mC6pl-00DZ7I-BG; Fri, 06 Aug 2021 20:52:49 +0000
Received: from mail-io1-f54.google.com ([209.85.166.54])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mC6ph-00DZ6W-1H
 for linux-arm-kernel@lists.infradead.org; Fri, 06 Aug 2021 20:52:46 +0000
Received: by mail-io1-f54.google.com with SMTP id a13so13906497iol.5
 for <linux-arm-kernel@lists.infradead.org>;
 Fri, 06 Aug 2021 13:52:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=NVLyAZM767lCQjYHXP5y7pQwa3Dn1l6PYLmN/KqVz0o=;
 b=o/FICxaPPICQBIb/UjDYzPId1ewdz4Di1L0Ir5EYaLiojKx6+WwGonrAKyFjtcCJZo
 sGYwq12ct4yOwkgmAM6R3h2Xi6nbR+4bzMces33SgJrTQYDm4aqXTfLSu09WUlX1oVCa
 +qboFBxnvUUVMjxb94zZeaTDr9+j76DphzS/xskanj18cA5FtJIv6bFA3HFvCPZwUv8y
 RrKcWZmcf475SEFpWjVWJ6eRv2VNZv8IpfpSdNs+BNdPt1W0cvYHMNJgjV9N+STKjPrZ
 gy8JuHIN7L/RN4AvyVuTeqoxGZ1mDokZ+MTaxK2QcsHLmIIPuG4erCDvKrsmhE6dUHqy
 3S3Q==
X-Gm-Message-State: AOAM533C1odPRKJ+SSEYPdTruTXgyOX09DD6b9fI7DAq9vuENyJ0890I
 RFik1H/f80jgK5JI9rBr+Q==
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Arnd Bergmann <arnd@arndb.de>,
 Olof Johansson <olof@lixom.net>, soc@kernel.org,
 John Crispin <john@phrozen.org>, Felix Fietkau <nbd@nbd.name>
Subject: Re: [PATCH 3/5] ARM: dts: Add basic support for EcoNet EN7523
Message-ID: <YQ2hGd1cERLbfjJ6@robh.at.kernel.org>
References: <20210730134552.853350-1-bert@biot.com>
 <20210730134552.853350-4-bert@biot.com>
 <20210730145901.GC19569@C02TD0UTHF1T.local>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210730145901.GC19569@C02TD0UTHF1T.local>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210806_135245_130740_03525BB8 
X-CRM114-Status: GOOD (  18.05  )
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
Message-ID: <20210806205241.6VJaTX9QybN2rN5fjBMiPdINSYhhfucVwLdg0fymzOo@z>

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

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
