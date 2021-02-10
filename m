Return-Path: <SRS0=mpRk=HM=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B571C433DB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Feb 2021 12:57:23 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F3B0364E63
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Feb 2021 12:57:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F3B0364E63
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=jxvA3ljn8rodVZ4M4PoocvI/1Ak4aQc2+FZl7Yfa+wY=; b=POfjCvvOhHtsh0q1QQuO1fb1a
	VZ5j8VumFA0QvySrBVVKXU2DE6uwi0CT8rAjfZRZYkZC9Gs8FIpqRUCTq3PvzgphdYdIk4DVjHrby
	i0GRnM0NhZ+9+C8THAPLDekOBuYqjNYlEzgeEA69bX4ZwPhrOohM/oLY+1z9aO11XkaAXFtBLdKES
	0PCOemx4TS2vS50DMWDQ7obKShk+yF9mCgFUAZAZQEqyiyfqdbkec1oJLWV98DUdDzmkSRhGWVs9h
	U+Lb67cBUTHEUnCnknJgjKrWW+mD9HsxV6Ih+D244o1jIDDUjFMIfo20s4k//7JSbvw5DxeWBDhRJ
	iozZAU4xw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l9p2D-0001xw-Sj; Wed, 10 Feb 2021 12:55:57 +0000
Received: from mail-wm1-f53.google.com ([209.85.128.53])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l9p29-0001wU-MR
 for linux-arm-kernel@lists.infradead.org; Wed, 10 Feb 2021 12:55:54 +0000
Received: by mail-wm1-f53.google.com with SMTP id j21so1773194wmj.0
 for <linux-arm-kernel@lists.infradead.org>;
 Wed, 10 Feb 2021 04:55:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=klyvuCb2s80xxmYVdUoIwTBI4ZLcJg7EZBGPH+l10fY=;
 b=MHdFS6EAMi4GXALzOD3fHqjNVuVozL23HuvF3z8VID40IliXVlzKkuYcRrVXGZ/29H
 kd8QB7cEJXvP02x6RTS/c3/TxICAM9qNlgOH/2lnbLk4RCesRvoXZ7ANlCHxjMDSBy6y
 DUj4EkZ5xzoGuQDnrfDTPgnrh2KcokAykvxhtjPJkq4/DuaJgep+MdhcHLw/QOmc1sok
 srhkptXMed2DQyw/stQj8lBi94KgS5QS5XkBpf+7YXO36t7y4VhLsXSmJzYHy6rasvFZ
 sM86JvB0Cxig9Sf1OcKHxqrKOM/WmPWhRSxkqzooEqcxemKLTHOUqHDaUVID+XWdJ1hK
 Yi8g==
X-Gm-Message-State: AOAM530Cllqkqwlg2syf19d+xHstf2lAvywFeX3sI0gUTziLl7p3+YGZ
 oI4MkNrTuT3j/fz8g92xXEk=
X-Google-Smtp-Source: ABdhPJxEJMv2xTHkhA5hRM6aKJJZhYfdlEBUHOKcxJzOPO3sXDi3h9DHp9MZv//bMkX9mQOgPEc9bA==
X-Received: by 2002:a1c:3b8a:: with SMTP id i132mr2869183wma.26.1612961750425; 
 Wed, 10 Feb 2021 04:55:50 -0800 (PST)
Received: from kozik-lap (adsl-84-226-167-205.adslplus.ch. [84.226.167.205])
 by smtp.googlemail.com with ESMTPSA id 64sm3601054wrc.50.2021.02.10.04.55.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Feb 2021 04:55:49 -0800 (PST)
Date: Wed, 10 Feb 2021 13:55:48 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Tony Lindgren <tony@atomide.com>
Subject: Re: [PATCH 18/18] arm64: apple: Add initial Mac Mini 2020 (M1)
 devicetree
Message-ID: <20210210125548.sdeadc4ncoxu3ikj@kozik-lap>
References: <20210204203951.52105-1-marcan@marcan.st>
 <20210204203951.52105-19-marcan@marcan.st>
 <20210208110441.25qc6yken4effd6c@kozik-lap>
 <cd67b2ce-9676-31b4-85f7-de1ec9b2bf72@marcan.st>
 <YCOzLSqdsr83xf0b@atomide.com>
 <4481998a-27f6-951e-bb4f-a9d2b95f211f@marcan.st>
 <YCPE2lPpBlhCi7TH@atomide.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YCPE2lPpBlhCi7TH@atomide.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210210_075553_752763_EF1D8E77 
X-CRM114-Status: GOOD (  21.42  )
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
Message-ID: <20210210125548.C5coptDGOmbjR2-91EfPQ0Kw0XnObAAQsdXuQ6inSMo@z>

On Wed, Feb 10, 2021 at 01:34:50PM +0200, Tony Lindgren wrote:
> * Hector Martin <marcan@marcan.st> [210210 11:14]:
> > On 10/02/2021 19.19, Tony Lindgren wrote:
> > > * Hector Martin 'marcan' <marcan@marcan.st> [210208 12:05]:
> > > > On 08/02/2021 20.04, Krzysztof Kozlowski wrote:
> > > ...
> > > 
> > > > > > +	clk24: clk24 {
> > > > > 
> > > > > Just "clock". Node names should be generic.
> > > > 
> > > > Really? Almost every other device device tree uses unique clock node names.
> > > 
> > > Yeah please just use generic node name "clock". FYI, we're still hurting
> > > because of this for the TI clock node names years after because the drivers
> > > got a chance to rely on the clock node name..
> > > 
> > > Using "clock" means your clock driver code won't get a chance to wrongly
> > > use the node name and you avoid similar issues.
> > 
> > That means it'll end up like this (so that we can have more than one
> > fixed-clock):
> > 
> > clocks {
> >     #address-cells = <1>;
> >     #size-cells = <0>;
> > 
> >     clk123: clock@0 {
> >         ...
> >         reg = <0>
> >     }
> > 
> >     clk456: clock@1 {
> >         ...
> >         reg = <1>
> >     }
> > }
> > 
> > Correct?
> 
> Yeah, just don't use an imaginary dummy index for the reg. Use a real
> register offset from a clock controller instance base, and a register
> bit offset too if needed.

No, there is no need for fake "clocks" node with fake addresses. If you
have multiple clocks, the rules are the same as for other similar cases,
e.g. leds:

{
    clock-0 {
       ...
    };

    clock-1 {
        ..
    };

    soc@0 {
    };
}

This should not generate any dtc W=1 warnings and work with dtschema
(you need to check for both).

Best regards,
Krzysztof


_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
