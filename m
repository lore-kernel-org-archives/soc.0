Return-Path: <SRS0=lmAU=PP=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C18C1C433F5
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 Oct 2021 11:01:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 876DA60C40
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 Oct 2021 11:01:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 876DA60C40
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=76ie3A4rLAsBbEy6lDsQJJ84Hnf7rm6Y28zuBSUmQac=; b=hEvsEWaWj7nFgO
	QBfXg+BU8W80wAYy7wcV8ceGGac3KnDSe2cOOsZQrUSqQxoYjanFLB8DokDtt6dGdz2J5pLcMRqmT
	pk8ZLsCE5OyCBHrwe2MfoaZGxZTsl/8ljn1hPnJFtqf3Eal/8na5JowrVLas9q4PCc8cpRji+gwt8
	m53/C8FnfgBjKH0RIVsF/hgBWoC2+KpBc4XcZTynvvYZE5mNt/4lU7gC3/Tns73Wfp3bUiWYo6wVP
	sifXrQra/orhaeBpV0PJfTyCp3isqS2NZqRa1SxDVq7vma+6/Q8LddOQM4UAYEEqEbJmpKHzS4Y1u
	oHawbbr2LbtsfD3J2vJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mfgez-004eam-82; Wed, 27 Oct 2021 10:59:57 +0000
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mfgeu-004eYT-0L
 for linux-arm-kernel@lists.infradead.org; Wed, 27 Oct 2021 10:59:53 +0000
Received: by mail-lf1-x12c.google.com with SMTP id l13so5293816lfg.6
 for <linux-arm-kernel@lists.infradead.org>;
 Wed, 27 Oct 2021 03:59:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Zsf5W6YqowSseyvuTUMml4+bgTU62PWsyrp4oNO1xMk=;
 b=HVlZRtxATzTeW9s77vFDU1/2HETT9Vc8F/2vUCf47K4QJbtvN1amTS5v97H6uQ9m5L
 hVgobVhWgmmJNor2lCPhE1GX6grKq6E1GRGsCSxIBo1iXLAyZ6ARA3n5JLWgohMWhcvn
 qz+kuyYksI8LPtBnpJXcZ37BHI7XjlHMUaJJepBjIHmNhUkeOdY23NYCq9VtJ5CzCpFQ
 2swWDx+TQ9eEQpc4yTEEh4+FODH9EPqQofcacFdqEIIwKmbcCgi8EovuLA/DqGoxtHIm
 m/bhGdtcz50fA2UdUVqIjZwUXV8cOt1K4IXtmGwlnVrPJH1UVhUFneEdi4qKsnTodh81
 OIhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Zsf5W6YqowSseyvuTUMml4+bgTU62PWsyrp4oNO1xMk=;
 b=VYp4+/bQf5azq8ZmRJrwueoYk4c59L/I+YQQYVNLxJn1525GsiPN4FXs0ZGYlyss2W
 u9RxfMo3MlkpF9APowvFGSVnWhGDHWW8e0LXpP2c9KGba8hpEgbFBzpL/CMqLLpPuiiC
 yoPiOrT1D1Z1xwbJwrCEW0WmiQ3gfJ1X+Qc83shsOAytFPQy/cB6ViTG2C1ZzK8hTaU5
 3DHhUEzwY/OmvenHNyaQj3ct6f1PNYIrExg0tzQKTEz/7J1YwMn646nQxw7FLOoLfDup
 fsDRmAwscwCQgj5/8i8ipbxQXj5DWyXlq2yrfcMDcaktZUsvvc44c51Ned+TsBpmHj5n
 eoLA==
X-Gm-Message-State: AOAM5329ep3iXIRJggyEG6zEdL+y/WOJMSDFrQ+pQNXtKyoq5bHz284p
 V5RliTEPOY3DHb8dFwIppxq6DpF0C1oInVZmb2E=
X-Google-Smtp-Source: ABdhPJw2RtAnvTTu8eKJ1Gu5xdiQKMCSymgMHX2aBMj3kskaGPm2Lg7bnH1qL2p+8Qq1exiko2TgCjBz58gOBrLcDXs=
X-Received: by 2002:ac2:5d4b:: with SMTP id w11mr29074118lfd.676.1635332388998; 
 Wed, 27 Oct 2021 03:59:48 -0700 (PDT)
MIME-Version: 1.0
References: <20211026200058.2183-1-aladyshev22@gmail.com>
 <CACPK8Xd5eYpsFNw1jEjv3NaShgzE3zC_Ct29pJM34TfrqRTNtQ@mail.gmail.com>
In-Reply-To: <CACPK8Xd5eYpsFNw1jEjv3NaShgzE3zC_Ct29pJM34TfrqRTNtQ@mail.gmail.com>
From: Konstantin Aladyshev <aladyshev22@gmail.com>
Date: Wed, 27 Oct 2021 14:05:45 +0300
Message-ID: <CACSj6VVTFa0t9WK=R2TucG7eFqUzBsWYFzvsaRt6eXOiFuQORA@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: aspeed: Add AMD DaytonaX BMC
To: Joel Stanley <joel@jms.id.au>
List-Id: <soc.lore.kernel.org>
Cc: Supreeth Venkatesh <supreeth.venkatesh@amd.com>,
 Arnd Bergmann <arnd@arndb.de>, 
 Olof Johansson <olof@lixom.net>, SoC Team <soc@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Andrew Jeffery <andrew@aj.id.au>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 devicetree <devicetree@vger.kernel.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>, geissonator@yahoo.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211027_035952_077481_39474923 
X-CRM114-Status: GOOD (  24.75  )
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
Message-ID: <20211027110545.Xm3r9LSwtngudxTr0R1shTNf7BpwrGf9mUmVdT6l95Y@z>

Thanks for the comments. Can I ask you some questions about this
`device-tree-gpio-naming.md`?

1) First of all in my naming I've tried to use naming scheme the same
as the EthanolX CRB DTS currently has
(https://github.com/torvalds/linux/blob/d25f27432f80a800a3592db128254c8140bd71bf/arch/arm/boot/dts/aspeed-bmc-amd-ethanolx.dts#L102).
Do you want me to change GPIO naming in the EthanolX CRB as well?
2) Also this naming comes from the signal names in the board
schematics. This way it is clear to check schematics vs DTS. If we use
this OpenBMC naming style, we will lose that correspondence. Is it
really good?
3) In the initial version of the DTS file I've supplied only a minimal
set of GPIO, that are used by OpenBMC. GPIOs for x86-power-control app
and led id/fault gpios. With renaming these GPIOs I'm only sure about
these GPIOs:

FAULT_LED                  - led-fault
CHASSIS_ID_BTN        - led-identify

What about the rest? For example the document doesn't really state
what the *-button postfix states? Is it for asserting or monitoring
buttons? How should I name these signals?

ASSERT_BMC_READY
ASSERT_RST_BTN
ASSERT_PWR_BTN

MON_P0_RST_BTN
MON_P0_PWR_BTN
MON_P0_PWR_GOOD
MON_PWROK

Can you help me with those?

4) And what should I do to the board GPIO signals that OpenBMC doesn't
use? If you look at the EthanolX CRB DTS
(https://github.com/torvalds/linux/blob/d25f27432f80a800a3592db128254c8140bd71bf/arch/arm/boot/dts/aspeed-bmc-amd-ethanolx.dts#L102)
it has a ton of GPIOs. Should they be renamed to this OpenBMC style as
well? Or can they be named exactly like in the schematics?

I've also CCed original author of the `device-tree-gpio-naming.md`
document Andrew Geissler. Andrew, can you please provide your opinion
on the subject?

Best regards,
Konstantin Aladyshev

On Wed, Oct 27, 2021 at 12:03 AM Joel Stanley <joel@jms.id.au> wrote:
>
> Hello Konstantin,
>
> On Tue, 26 Oct 2021 at 20:01, Konstantin Aladyshev
> <aladyshev22@gmail.com> wrote:
> >
> > Add initial version of device tree for the BMC in the AMD DaytonaX
> > platform.
> >
> > AMD DaytonaX platform is a customer reference board (CRB) with an
> > Aspeed ast2500 BMC manufactured by AMD.
> >
> > Signed-off-by: Konstantin Aladyshev <aladyshev22@gmail.com>
>
> This looks good. I have one comment about the GPIOs below.
>
> > +&gpio {
> > +       status = "okay";
> > +       gpio-line-names =
> > +       /*A0-A7*/       "","","FAULT_LED","","","","","",
> > +       /*B0-B7*/       "","","","","","","","",
> > +       /*C0-C7*/       "CHASSIS_ID_BTN","","","","","","","",
> > +       /*D0-D7*/       "","","ASSERT_BMC_READY","","","","","",
> > +       /*E0-E7*/       "MON_P0_RST_BTN","ASSERT_RST_BTN","MON_P0_PWR_BTN","ASSERT_PWR_BTN","",
> > +                       "MON_P0_PWR_GOOD","MON_PWROK","",
>
> For systems that will run openbmc, we try to use naming conventions
> from this document:
>
> https://github.com/openbmc/docs/blob/master/designs/device-tree-gpio-naming.md
>
> If a GPIO is missing from that doc I encourage you to add it.

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
