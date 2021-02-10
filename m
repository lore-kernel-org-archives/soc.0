Return-Path: <SRS0=mpRk=HM=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1AF5DC433E0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Feb 2021 13:21:08 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9D54464E7C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Feb 2021 13:21:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9D54464E7C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=atomide.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ixIl2drAHc0h547X00VpzN8Ev1CzaPCSYVHhQQ19Erk=; b=2k9j0IEW8IJ1T0o8XZL99S0ET
	aZuT+sGCTF/v9UT8dAASgNyD7x86Pdwz0k0VRwfjfpozvp+nPSgS14jVl5tuzA+pz/Oml01tFXtrC
	MXDC+KOThZ+9osMqnWoKe9hPejLlhH0bEavjW9PUsNr5z2Ofz7r/mUiS/Gg+bmH9WSglRA+q62Rtv
	7cuQgTJX10og+AycMeyH5IFym6lKp9ddlcP8qd9y9ozK2c5lk9//XugOuSaeY+OYa9qCFay0guFXw
	qf6iUb28KAb82zijlVUJnQLnOEgF8PyJ4ylU19cjgCpsDANlmNoWxfn+7ZIMWtE+Nccs5jbSQ1xNR
	CdlTu4Xpg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l9pPN-000166-9Q; Wed, 10 Feb 2021 13:19:53 +0000
Received: from muru.com ([72.249.23.125])
 by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l9pPL-00015O-7A
 for linux-arm-kernel@lists.infradead.org; Wed, 10 Feb 2021 13:19:52 +0000
Received: from atomide.com (localhost [127.0.0.1])
 by muru.com (Postfix) with ESMTPS id 9040A80EB;
 Wed, 10 Feb 2021 13:20:07 +0000 (UTC)
Date: Wed, 10 Feb 2021 15:19:46 +0200
From: Tony Lindgren <tony@atomide.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH 18/18] arm64: apple: Add initial Mac Mini 2020 (M1)
 devicetree
Message-ID: <YCPdclQykSPx96hk@atomide.com>
References: <20210204203951.52105-1-marcan@marcan.st>
 <20210204203951.52105-19-marcan@marcan.st>
 <20210208110441.25qc6yken4effd6c@kozik-lap>
 <cd67b2ce-9676-31b4-85f7-de1ec9b2bf72@marcan.st>
 <YCOzLSqdsr83xf0b@atomide.com>
 <4481998a-27f6-951e-bb4f-a9d2b95f211f@marcan.st>
 <YCPE2lPpBlhCi7TH@atomide.com>
 <20210210125548.sdeadc4ncoxu3ikj@kozik-lap>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210210125548.sdeadc4ncoxu3ikj@kozik-lap>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210210_081951_316859_C081327B 
X-CRM114-Status: GOOD (  21.33  )
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
Message-ID: <20210210131946.pO7cPG7bElaT7dHFDuUSGd8R31cX-wmxI6mLFVprWfA@z>

* Krzysztof Kozlowski <krzk@kernel.org> [210210 12:56]:
> On Wed, Feb 10, 2021 at 01:34:50PM +0200, Tony Lindgren wrote:
> > * Hector Martin <marcan@marcan.st> [210210 11:14]:
> > > On 10/02/2021 19.19, Tony Lindgren wrote:
> > > > * Hector Martin 'marcan' <marcan@marcan.st> [210208 12:05]:
> > > > > On 08/02/2021 20.04, Krzysztof Kozlowski wrote:
> > > > ...
> > > > 
> > > > > > > +	clk24: clk24 {
> > > > > > 
> > > > > > Just "clock". Node names should be generic.
> > > > > 
> > > > > Really? Almost every other device device tree uses unique clock node names.
> > > > 
> > > > Yeah please just use generic node name "clock". FYI, we're still hurting
> > > > because of this for the TI clock node names years after because the drivers
> > > > got a chance to rely on the clock node name..
> > > > 
> > > > Using "clock" means your clock driver code won't get a chance to wrongly
> > > > use the node name and you avoid similar issues.
> > > 
> > > That means it'll end up like this (so that we can have more than one
> > > fixed-clock):
> > > 
> > > clocks {
> > >     #address-cells = <1>;
> > >     #size-cells = <0>;
> > > 
> > >     clk123: clock@0 {
> > >         ...
> > >         reg = <0>
> > >     }
> > > 
> > >     clk456: clock@1 {
> > >         ...
> > >         reg = <1>
> > >     }
> > > }
> > > 
> > > Correct?
> > 
> > Yeah, just don't use an imaginary dummy index for the reg. Use a real
> > register offset from a clock controller instance base, and a register
> > bit offset too if needed.
> 
> No, there is no need for fake "clocks" node with fake addresses. If you
> have multiple clocks, the rules are the same as for other similar cases,
> e.g. leds:
> 
> {
>     clock-0 {
>        ...
>     };
> 
>     clock-1 {
>         ..
>     };
> 
>     soc@0 {
>     };
> }
> 
> This should not generate any dtc W=1 warnings and work with dtschema
> (you need to check for both).

OK yeah so no need for the node name there after the "clock-" :)
Sounds good to me.

Regards,

Tony

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
