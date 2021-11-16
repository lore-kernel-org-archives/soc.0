Return-Path: <SRS0=vwZw=QD=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79E4AC433F5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Nov 2021 06:09:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 43AF363212
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Nov 2021 06:09:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 43AF363212
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=COyFj3pUxWoPYWGWuoee6zsyY0BJipSwRLzQ5YrX1Co=; b=LsLio/8kljRr6j
	HLjsMp4/11EH5T+zGvI1O8FguN5etVuhwqQuwckKuLL5nZqk9F/aeh1D6vBesq6sqm6fHA8CEcpv7
	X+FVgLX2/rfd4vx8Aj6Dr0LPTnxLTdf9DZcTD0lPnuZFl2XU5mcqk5v83Oi0icArMQQjviEUx9O32
	IaqXRs5PeaPxTC2slTM4JfR5/gBmMY7tRTgY65RxLhmf57kqKngPE7jM94Svxsk8NrAZX3kSLGbMQ
	ZdVieAQtasNWd3b+ZN7EnstrVvYA98XQdq8wIApeFL7wEY+BDcEHRQUT7/+EgL8qcEak+tjLZTYN/
	+r8zoz40EKPSjkEC4Wmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mmrdf-000LVu-2w; Tue, 16 Nov 2021 06:08:15 +0000
Received: from mail-qk1-x72b.google.com ([2607:f8b0:4864:20::72b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mmrdZ-000LUk-SV
 for linux-arm-kernel@lists.infradead.org; Tue, 16 Nov 2021 06:08:13 +0000
Received: by mail-qk1-x72b.google.com with SMTP id de30so19574734qkb.0
 for <linux-arm-kernel@lists.infradead.org>;
 Mon, 15 Nov 2021 22:08:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=I3oQyh1i67EI9sCW3pQlUFVmFFrrPdE1dpx1lb+xR2U=;
 b=E9OjszSmwpNQ1taXDWq1P1iNQZBuIsSmoMRgF0L3fgDwV+ydKR63vsHfTocvsPlpHU
 DYTeHToo4XaVlAnMH9jqGnJNBI6qDg9pxEbGd8Z7noiXjXn3jsqqBNKljPRI1Y1YkaXE
 t0+1CZ0sZ42qgvHtea/vCOFqvA+ArkYy9zFPc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=I3oQyh1i67EI9sCW3pQlUFVmFFrrPdE1dpx1lb+xR2U=;
 b=QCY/soledqOvn9RWZtg59AgDAU24c6C7X328DNIXCrAB30x4zSW0UORa+W+P5BWuAf
 kbced6B9ioxIES+jOetB3AyNXgsg1j/BeXPUvNB8r0CA91yZzUObWj+yVRL7W/5sGK+E
 /Z+KtnMMR8wxByb5uFblpHAi3b5y5YSkRVRyEqlTRxz90xlByEaoTAKJ3+AEVfumgzmv
 sGb99+FDqMLMhq3LM07FqaPZbNHtbZDNx6rAOyD8BeyOsVvyvMH52jjx8x5WVVxDtJyu
 M30ceix06sCTPidGegVgu4PGuKBOVkJ7pENlpuZLe9LIBTJGOUaasUXZ9U6jF2AAXQoP
 SjaQ==
X-Gm-Message-State: AOAM530O0zFrAh4NOLY1L+PIngVQV/aFaU4K5SI3vdygtNiab1Yaziqw
 9/+zvTiWkgsAKjqf3fDa9qKRxkK3GPeUlt5HJkI=
X-Google-Smtp-Source: ABdhPJxg2WkPIsuOSay/GYggygOyktUFgy0Tfd4Ccq6kw0J8FhevHPTHEN5D5sp3cEHRxaqlDRsubd6rTcg2+5hU1BQ=
X-Received: by 2002:a37:a8e:: with SMTP id 136mr4211384qkk.395.1637042887509; 
 Mon, 15 Nov 2021 22:08:07 -0800 (PST)
MIME-Version: 1.0
References: <20211026200058.2183-1-aladyshev22@gmail.com>
 <CACPK8Xd5eYpsFNw1jEjv3NaShgzE3zC_Ct29pJM34TfrqRTNtQ@mail.gmail.com>
 <CACSj6VVTFa0t9WK=R2TucG7eFqUzBsWYFzvsaRt6eXOiFuQORA@mail.gmail.com>
In-Reply-To: <CACSj6VVTFa0t9WK=R2TucG7eFqUzBsWYFzvsaRt6eXOiFuQORA@mail.gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 16 Nov 2021 06:07:55 +0000
Message-ID: <CACPK8Xcc6Nem00zZdGmHF=U4T2O90aL+_vKO4YmAqSW9wKeegA@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: aspeed: Add AMD DaytonaX BMC
To: Konstantin Aladyshev <aladyshev22@gmail.com>,
 Patrick Williams <patrick@stwcx.xyz>
List-Id: <soc.lore.kernel.org>
Cc: Supreeth Venkatesh <supreeth.venkatesh@amd.com>,
 Arnd Bergmann <arnd@arndb.de>, 
 Olof Johansson <olof@lixom.net>, SoC Team <soc@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Andrew Jeffery <andrew@aj.id.au>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 devicetree <devicetree@vger.kernel.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>, 
 Andrew Geissler <geissonator@yahoo.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211115_220809_948671_A7A3AD59 
X-CRM114-Status: GOOD (  35.66  )
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
Message-ID: <20211116060755.KUpRXlMR1Omp33B9ZscKi-15_qa6X62ic0h9muNAXfY@z>

On Wed, 27 Oct 2021 at 10:59, Konstantin Aladyshev
<aladyshev22@gmail.com> wrote:
>
> Thanks for the comments. Can I ask you some questions about this
> `device-tree-gpio-naming.md`?
>
> 1) First of all in my naming I've tried to use naming scheme the same
> as the EthanolX CRB DTS currently has
> (https://github.com/torvalds/linux/blob/d25f27432f80a800a3592db128254c8140bd71bf/arch/arm/boot/dts/aspeed-bmc-amd-ethanolx.dts#L102).
> Do you want me to change GPIO naming in the EthanolX CRB as well?

Yeah, that would make sense.

> 2) Also this naming comes from the signal names in the board
> schematics. This way it is clear to check schematics vs DTS. If we use
> this OpenBMC naming style, we will lose that correspondence. Is it
> really good?

This is a good point. The preference is to use human readable names
over the schematic net. I can see cases where this would be worse, but
hopefully on balance it results in consistent naming between machines.

> 3) In the initial version of the DTS file I've supplied only a minimal
> set of GPIO, that are used by OpenBMC. GPIOs for x86-power-control app
> and led id/fault gpios. With renaming these GPIOs I'm only sure about
> these GPIOs:
>
> FAULT_LED                  - led-fault
> CHASSIS_ID_BTN        - led-identify
>
> What about the rest? For example the document doesn't really state
> what the *-button postfix states? Is it for asserting or monitoring
> buttons? How should I name these signals?
>
> ASSERT_BMC_READY
> ASSERT_RST_BTN
> ASSERT_PWR_BTN
>
> MON_P0_RST_BTN
> MON_P0_PWR_BTN
> MON_P0_PWR_GOOD
> MON_PWROK
>
> Can you help me with those?

Patrick, do you have thoughts here?

>
> 4) And what should I do to the board GPIO signals that OpenBMC doesn't
> use? If you look at the EthanolX CRB DTS
> (https://github.com/torvalds/linux/blob/d25f27432f80a800a3592db128254c8140bd71bf/arch/arm/boot/dts/aspeed-bmc-amd-ethanolx.dts#L102)
> it has a ton of GPIOs. Should they be renamed to this OpenBMC style as
> well? Or can they be named exactly like in the schematics?

That's up to you.

>
> I've also CCed original author of the `device-tree-gpio-naming.md`
> document Andrew Geissler. Andrew, can you please provide your opinion
> on the subject?

I've also added Patrick, who is helping review this document.

Cheers,

Joel

>
> Best regards,
> Konstantin Aladyshev
>
> On Wed, Oct 27, 2021 at 12:03 AM Joel Stanley <joel@jms.id.au> wrote:
> >
> > Hello Konstantin,
> >
> > On Tue, 26 Oct 2021 at 20:01, Konstantin Aladyshev
> > <aladyshev22@gmail.com> wrote:
> > >
> > > Add initial version of device tree for the BMC in the AMD DaytonaX
> > > platform.
> > >
> > > AMD DaytonaX platform is a customer reference board (CRB) with an
> > > Aspeed ast2500 BMC manufactured by AMD.
> > >
> > > Signed-off-by: Konstantin Aladyshev <aladyshev22@gmail.com>
> >
> > This looks good. I have one comment about the GPIOs below.
> >
> > > +&gpio {
> > > +       status = "okay";
> > > +       gpio-line-names =
> > > +       /*A0-A7*/       "","","FAULT_LED","","","","","",
> > > +       /*B0-B7*/       "","","","","","","","",
> > > +       /*C0-C7*/       "CHASSIS_ID_BTN","","","","","","","",
> > > +       /*D0-D7*/       "","","ASSERT_BMC_READY","","","","","",
> > > +       /*E0-E7*/       "MON_P0_RST_BTN","ASSERT_RST_BTN","MON_P0_PWR_BTN","ASSERT_PWR_BTN","",
> > > +                       "MON_P0_PWR_GOOD","MON_PWROK","",
> >
> > For systems that will run openbmc, we try to use naming conventions
> > from this document:
> >
> > https://github.com/openbmc/docs/blob/master/designs/device-tree-gpio-naming.md
> >
> > If a GPIO is missing from that doc I encourage you to add it.

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
