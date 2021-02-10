Return-Path: <SRS0=mpRk=HM=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDD5AC433DB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Feb 2021 12:56:24 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5BCEB64DD9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Feb 2021 12:56:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5BCEB64DD9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=atomide.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=QMm3sj02+k9bGqi4OphrBbMkFJZB3jseXONgFlHv2U4=; b=Q3o1R0Qn8CQ9wHpRfa7mqvASY
	jlbn9vgaQZhH9E/4NTafNXRZ0LA3vhZjg2levK5xlUi/AwVkjx2m47dgKm+cTVvk1NhOEWd1wF5pV
	rULTOBYVhhz2lcAxt8FF7cIGbcuOab8HyKRzOMrQPujfCquxgmnBWWAj/r0pl2dyKiwtNqmZwqoc/
	D9FxT/KZrsA79825UnqTa+V7EL4EU3EHHNJrNDpEl5D60PrB8Bh3KbS/VSvhA6UW5NJxiFdYqJQsa
	PBIHKS1AeaEUSxbymFV9xOG9Xm06QgfK6KgRoJHugwhDgzThICqqMnRBe7j7cbpSE6J1JUBSa8Kc/
	qTzQP6xZg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l9p1O-0001sb-8b; Wed, 10 Feb 2021 12:55:06 +0000
Received: from muru.com ([72.249.23.125])
 by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l9p1M-0001rc-12
 for linux-arm-kernel@lists.infradead.org; Wed, 10 Feb 2021 12:55:04 +0000
Received: from atomide.com (localhost [127.0.0.1])
 by muru.com (Postfix) with ESMTPS id 589B880EB;
 Wed, 10 Feb 2021 12:55:17 +0000 (UTC)
Date: Wed, 10 Feb 2021 14:54:56 +0200
From: Tony Lindgren <tony@atomide.com>
To: Daniel Palmer <daniel@0x0f.com>
Subject: Re: [PATCH 18/18] arm64: apple: Add initial Mac Mini 2020 (M1)
 devicetree
Message-ID: <YCPXoEKJQyVFdOHv@atomide.com>
References: <20210204203951.52105-1-marcan@marcan.st>
 <20210204203951.52105-19-marcan@marcan.st>
 <20210208110441.25qc6yken4effd6c@kozik-lap>
 <cd67b2ce-9676-31b4-85f7-de1ec9b2bf72@marcan.st>
 <YCOzLSqdsr83xf0b@atomide.com>
 <4481998a-27f6-951e-bb4f-a9d2b95f211f@marcan.st>
 <YCPE2lPpBlhCi7TH@atomide.com>
 <4dd911d8-ce84-bf4d-3aae-95ef321b4a97@marcan.st>
 <CAFr9PXkLRKHguszidJX2Qit0QUJ0QxFi3H=Wp2HDqpfJQYZEVw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAFr9PXkLRKHguszidJX2Qit0QUJ0QxFi3H=Wp2HDqpfJQYZEVw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210210_075504_164353_9BB4DAC0 
X-CRM114-Status: GOOD (  23.98  )
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
Cc: Arnd Bergmann <arnd@kernel.org>, DTML <devicetree@vger.kernel.org>,
 Stephen Boyd <sboyd@kernel.org>, Marc Zyngier <maz@kernel.org>,
 Hector Martin <marcan@marcan.st>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, SoC Team <soc@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Olof Johansson <olof@lixom.net>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210210125456.d0gi-ugmYF41e-u6RppuSlSXDJJlIdxqg4A23pMnAOE@z>

* Daniel Palmer <daniel@0x0f.com> [210210 12:24]:
> Hi Hector,
> 
> On Wed, 10 Feb 2021 at 20:49, Hector Martin <marcan@marcan.st> wrote:
> 
> > > Yeah, just don't use an imaginary dummy index for the reg. Use a real
> > > register offset from a clock controller instance base, and a register
> > > bit offset too if needed.
> >
> > I mean for fixed input clocks without any particular numbering, or for
> > temporary fake clocks while we figure out the clock controller. Once a
> > real clock controller is involved, if there are hardware indexes
> > involved that are consistent then of course I'll use those in some way
> > that makes sense.
> 
> This exact problem exists for MStar/SigmaStar too.
> As it stands there is no documentation to show what the actual clock
> tree looks like so everything is guess and I need to come up with numbers.
> I'm interested to see what the solution to this is as it will come up again
> when mainlining chips without documentation.
> 
> 
> > The purpose of the clock in this particular case is just to make the
> > uart driver work, since it wants to know its reference clock; there is
> > work to be done here to figure out the real clock tree
> 
> FWIW arm/boot/dts/mstar-v7.dtsi has the same issue: Needs uart,
> has no uart clock. In that instance the uart clock setup by u-boot
> is passed to the uart driver as a property instead of creating a fake
> clock.

Using more local dts nodes for the fixed clocks might help a bit with
the dummy numbering problem but is still not a nice solution.

How about using node names like "clock-foo" for the fixed clocks?
This would be along what we do for with regulator names.

Rob and Stephen might have some better suggestions here.

Regards,

Tony

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
