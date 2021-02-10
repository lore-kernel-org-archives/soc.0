Return-Path: <SRS0=mpRk=HM=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,MAILING_LIST_MULTI,SPF_HELO_NONE,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DAC9BC433E0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Feb 2021 13:26:46 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8F57764D73
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Feb 2021 13:26:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8F57764D73
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=fbEE8sAk1x/iZJ7q/t2ZzLXD01PrKsZxsUkbeTbi8w0=; b=yfUXCz7pr9XZx4O8XhLIQMuuG
	yQJPKM7rZ/tFBxiz55YZ7eJ6BhEayRqHBR0Zxk9GwI8FrK7nUR+iBJHKY1PTchq1K8a/pkd3uyrXr
	Xxf/ZDW27MgxfUekm8HNkmEW9NzZw7GMQr4VZOp3/PSIKFvv2NVBbv0c9y7IyESiAR/+gSDKDBneO
	3S+QhdGBc98PUyM2+qGYcL2wtwAt0jqe120Mg3WCu8BrDVF/KktfzSn36Y1eRnbhEOD6v5fKimIXu
	bbpmHMGAfk9Kfpmdl/GerzjoLQbABIxaYE4cP7dTTELCNOX4xzwmz0yDlBNc4Cq/UOVSAMsl7YaBu
	Jtve1hXzQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l9pUj-0002Cs-8m; Wed, 10 Feb 2021 13:25:25 +0000
Received: from mail-wr1-f46.google.com ([209.85.221.46])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l9pUg-0002CI-KM
 for linux-arm-kernel@lists.infradead.org; Wed, 10 Feb 2021 13:25:23 +0000
Received: by mail-wr1-f46.google.com with SMTP id v15so2536987wrx.4
 for <linux-arm-kernel@lists.infradead.org>;
 Wed, 10 Feb 2021 05:25:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Qbkae6XY7nF+JRYKySs6fWFYR01dWCp9hvuftwHNY5Q=;
 b=H/aDJAGsJq3D++GXB/Mspz4rDazRnjV+23a0M5oPVOSwQfoTJJAt5EzlJ29Wyij6xq
 ElmrkYwLNk98ZKSwDBHc85LbTVyCDS2OYLVTmzBjLDqFRwq6ea0chq0YKFJyQmwqGKcQ
 sXUN8rE24LcbqDdCuh6ZYTwHt3TKc5Lt16H1MrUP37m2wNXH1d5i6x7H5KCfE2/9LALc
 ZKiDh4ohwnq2Vx8b6jdHF96C0PqudAl1C/jq+D3QseLgyoqXWLgppuMRe36qmVsS+5zi
 O4ruK7IJpsYUitFb4XE63d7EEtzW9e3ncSHgkRyGn6guFnAZiEUyftz/F0T00a0hBrB4
 iknw==
X-Gm-Message-State: AOAM531ov7vKRajpry1RPyeF5IVrGVsXnJvyHbowFL07YVtv11TKwObK
 eDN1/7V6bj24ctpkpHHEJl/y/obLvxc=
X-Google-Smtp-Source: ABdhPJw2XE1pIwLVQEAfJrFRyhQJBLSdyhHkZA/kqetUF5a5F5YWWHUVOfaPXlPHyoH3cIrs6pZRVA==
X-Received: by 2002:adf:80c8:: with SMTP id 66mr3729053wrl.344.1612963521202; 
 Wed, 10 Feb 2021 05:25:21 -0800 (PST)
Received: from kozik-lap (adsl-84-226-167-205.adslplus.ch. [84.226.167.205])
 by smtp.googlemail.com with ESMTPSA id f14sm2363823wmj.30.2021.02.10.05.25.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Feb 2021 05:25:19 -0800 (PST)
Date: Wed, 10 Feb 2021 14:25:18 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Tony Lindgren <tony@atomide.com>
Subject: Re: [PATCH 18/18] arm64: apple: Add initial Mac Mini 2020 (M1)
 devicetree
Message-ID: <20210210132518.de7eyzrb5p5xycox@kozik-lap>
References: <20210204203951.52105-1-marcan@marcan.st>
 <20210204203951.52105-19-marcan@marcan.st>
 <20210208110441.25qc6yken4effd6c@kozik-lap>
 <cd67b2ce-9676-31b4-85f7-de1ec9b2bf72@marcan.st>
 <YCOzLSqdsr83xf0b@atomide.com>
 <4481998a-27f6-951e-bb4f-a9d2b95f211f@marcan.st>
 <YCPE2lPpBlhCi7TH@atomide.com>
 <20210210125548.sdeadc4ncoxu3ikj@kozik-lap>
 <YCPdclQykSPx96hk@atomide.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YCPdclQykSPx96hk@atomide.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210210_082522_690891_0BA98261 
X-CRM114-Status: GOOD (  26.66  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
List-Id: <soc.lore.kernel.org>
Cc: Arnd Bergmann <arnd@kernel.org>, devicetree@vger.kernel.org,
 Marc Zyngier <maz@kernel.org>, Hector Martin <marcan@marcan.st>,
 linux-kernel@vger.kernel.org, soc@kernel.org, robh+dt@kernel.org,
 Olof Johansson <olof@lixom.net>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210210132518.JpkbpXOceVriIjVCoo8T1eU6FQb-CAB6LQQbPsvP64k@z>

On Wed, Feb 10, 2021 at 03:19:46PM +0200, Tony Lindgren wrote:
> * Krzysztof Kozlowski <krzk@kernel.org> [210210 12:56]:
> > On Wed, Feb 10, 2021 at 01:34:50PM +0200, Tony Lindgren wrote:
> > > * Hector Martin <marcan@marcan.st> [210210 11:14]:
> > > > On 10/02/2021 19.19, Tony Lindgren wrote:
> > > > > * Hector Martin 'marcan' <marcan@marcan.st> [210208 12:05]:
> > > > > > On 08/02/2021 20.04, Krzysztof Kozlowski wrote:
> > > > > ...
> > > > > 
> > > > > > > > +	clk24: clk24 {
> > > > > > > 
> > > > > > > Just "clock". Node names should be generic.
> > > > > > 
> > > > > > Really? Almost every other device device tree uses unique clock node names.
> > > > > 
> > > > > Yeah please just use generic node name "clock". FYI, we're still hurting
> > > > > because of this for the TI clock node names years after because the drivers
> > > > > got a chance to rely on the clock node name..
> > > > > 
> > > > > Using "clock" means your clock driver code won't get a chance to wrongly
> > > > > use the node name and you avoid similar issues.
> > > > 
> > > > That means it'll end up like this (so that we can have more than one
> > > > fixed-clock):
> > > > 
> > > > clocks {
> > > >     #address-cells = <1>;
> > > >     #size-cells = <0>;
> > > > 
> > > >     clk123: clock@0 {
> > > >         ...
> > > >         reg = <0>
> > > >     }
> > > > 
> > > >     clk456: clock@1 {
> > > >         ...
> > > >         reg = <1>
> > > >     }
> > > > }
> > > > 
> > > > Correct?
> > > 
> > > Yeah, just don't use an imaginary dummy index for the reg. Use a real
> > > register offset from a clock controller instance base, and a register
> > > bit offset too if needed.
> > 
> > No, there is no need for fake "clocks" node with fake addresses. If you
> > have multiple clocks, the rules are the same as for other similar cases,
> > e.g. leds:
> > 
> > {
> >     clock-0 {
> >        ...
> >     };
> > 
> >     clock-1 {
> >         ..
> >     };
> > 
> >     soc@0 {
> >     };
> > }
> > 
> > This should not generate any dtc W=1 warnings and work with dtschema
> > (you need to check for both).
> 
> OK yeah so no need for the node name there after the "clock-" :)
> Sounds good to me.

You also could add a suffix or prefix ("fixed-clock-0", "clock-ext").
There is no strict requirement and Rob admitted that as-is was good
enough.

From my point of view, the dt spec mentions "clock" as one of preferred
names, so I would stick to it.

Anyway, it's not that important. :)

Best regards,
Krzysztof


_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
