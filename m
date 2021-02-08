Return-Path: <SRS0=U7wc=HK=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD2ADC433E0
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Feb 2021 12:42:11 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4854264E37
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Feb 2021 12:42:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4854264E37
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=BiExx1hX+3VmsdXsWglApJKuuOI/XQsFI1OKXLt9XTc=; b=x/gPcrkzKL0KsqUmSWpBfZKz5
	H4uZyO2t/GJmct0V+cfswoCvUMRuC0efYgVwgP4q1p1fMGW37rI2Qnjtd3RKdXf9ivzF6/vKxHZ4G
	AEL5mP7bauIXwsdqhTFGezKqciWIou6pRCnac9BckQSNjqyGe2Y4r75+11u1maHoRz60mrbGMQuT+
	i4HCI4ztU+rjcQrmzN4SUNHYUejkmlqHP+okVClc3H331ZfYJeKcIHAd6zkhfqVzbAPz8lKbNBvrX
	Tg2OGp+oB3rB7fDYTImq55WLujufmRAX7snRSTKvprUY7lwGoIMJrc9c7UAZfs0JhDDyLoRFd0/Py
	HFJJb/G2A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l95qT-0001h5-7o; Mon, 08 Feb 2021 12:40:49 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l95qQ-0001gX-RM
 for linux-arm-kernel@lists.infradead.org; Mon, 08 Feb 2021 12:40:47 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 86BAA64E87
 for <linux-arm-kernel@lists.infradead.org>;
 Mon,  8 Feb 2021 12:40:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1612788045;
 bh=zN+QyJPIw5PXaS/k8xzu0rgXDkKs2/8NF26TwCH56cA=;
 h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
 b=R6w+TIZe+BtpYKApRBLFqnc1P3qvLmJVQoddtY3WJ+RFsSpFpmB6PG9185UHAKxxc
 O+kzc7EpS0HavseHW/t+0OBkMASKWmq/5GLBPKd7IQt0zbHouA3pswdWJvDW1u8YtT
 /TPeNpx9TTTZk/m11k2bRcCryHPy6afoKFau0sAUcaoQbIWQH3GV/QgBqKUZbfm99j
 JJEge0oa7OUADX4BmkRCijCXjT474bipC6+QgZ/PREIIayOzYhc/8q+WMn5P2fsF5A
 MWvdvkVQZJ06qUTdNO8M84+I+l9lJRGSrAEsutA+fiXqGPAfqEr0+vEtom63502M6D
 guClWAmCQasUQ==
Received: by mail-ot1-f44.google.com with SMTP id k10so11654744otl.2
 for <linux-arm-kernel@lists.infradead.org>;
 Mon, 08 Feb 2021 04:40:45 -0800 (PST)
X-Gm-Message-State: AOAM533vboneL9/dYvI6XiKOiTnXyMyDNIfxk8CaToRCLkwku6nl/agv
 D0gE74Bc5DJyXqNU8NyyrqLXrtdKH6SGGWOqxds=
X-Google-Smtp-Source: ABdhPJzB0Sl4Qcea0QfN6LSnqxsQvoJ2nrH52C2zoBz+nuXqNwWR2b4eQ4wf5tsNzu05dziVBnwRcMuiLLzEX3jL8Qo=
X-Received: by 2002:a9d:3403:: with SMTP id v3mr3729921otb.305.1612788044796; 
 Mon, 08 Feb 2021 04:40:44 -0800 (PST)
MIME-Version: 1.0
References: <20210204203951.52105-1-marcan@marcan.st>
 <20210204203951.52105-19-marcan@marcan.st>
 <20210208110441.25qc6yken4effd6c@kozik-lap>
 <cd67b2ce-9676-31b4-85f7-de1ec9b2bf72@marcan.st>
 <20210208121325.owjjd7nfbdanszny@kozik-lap>
In-Reply-To: <20210208121325.owjjd7nfbdanszny@kozik-lap>
From: Arnd Bergmann <arnd@kernel.org>
Date: Mon, 8 Feb 2021 13:40:28 +0100
X-Gmail-Original-Message-ID: <CAK8P3a0yBC3dui6vcz+NByWD-3LqRj-2MF89jpjb_k8r5xmNRA@mail.gmail.com>
Message-ID: <CAK8P3a0yBC3dui6vcz+NByWD-3LqRj-2MF89jpjb_k8r5xmNRA@mail.gmail.com>
Subject: Re: [PATCH 18/18] arm64: apple: Add initial Mac Mini 2020 (M1)
 devicetree
To: Krzysztof Kozlowski <krzk@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210208_074047_050121_5C53251F 
X-CRM114-Status: GOOD (  17.73  )
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
Cc: DTML <devicetree@vger.kernel.org>, Marc Zyngier <maz@kernel.org>,
 Hector Martin 'marcan' <marcan@marcan.st>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 SoC Team <soc@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Olof Johansson <olof@lixom.net>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210208124028.wpwdDTW-nAYhCYcYiL2cIMRruT55eU4EO8nVJiIU-Zc@z>

On Mon, Feb 8, 2021 at 1:13 PM Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> On Mon, Feb 08, 2021 at 08:56:53PM +0900, Hector Martin 'marcan' wrote:
> > On 08/02/2021 20.04, Krzysztof Kozlowski wrote:
> > > apple
> > >
> > > Don't make things different for this one platform (comparing to all
> > > other platforms). Apple is not that special. :)
> >
> > AAPL is the old vendor prefix used in the PowerPC era. I'm happy to use
> > `apple`, as long as we're OK with having two different prefixes for the same
> > vendor, one for PPC and one for ARM64. I've seen opinions go both ways on
> > this one :)
>
> Thanks for explanation. I propose to choose just "apple". Sticking to
> old vendor name is not a requirement - we have few vendor prefixes which
> were marked as deprecated because we switched to a better one.

We've gone back and forth on this a few times already. My current
preference would also be to go with "apple", not because it's somehow
nicer or clearer but because it avoids the namespace conflict with
what the Apple firmware uses:

The point of the vendor prefix is to prevent two people from introducing
the same identifier with slightly different meanings. This used to be
the stock ticker symbol ("ibm", "SUNW", "AAPL", ...) back when the
only people making devices with firmware were large corporations.

In FDT, it's usually random contributors introducing the names to make
something work on Linux, with unique strings coming from code review.

The identifiers that Apple use are highly unlikely to cause clashes
with the ones we use in Linux, since you probably won't find much
software that has to deal with both formats, but the fact that Apple
still prefixes those strings with their stock ticker symbol tells me that
someone there still considers the namespace relevant, so it's more
polite to stay out of their lawn.

> Makes sense. In such case it's indeed your work. Since you introduce it,
> the DTSes are usually licensed with (GPL-2.0+ OR MIT).

Indeed, we do want other OSs to use our dts files, so the general
preference is to have a permissive license, unless you have a strong
reason yourself to require GPL-only.

       Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
