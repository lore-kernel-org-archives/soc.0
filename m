Return-Path: <SRS0=U7wc=HK=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50ABBC433E0
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Feb 2021 10:30:52 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DACC064EE3
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Feb 2021 10:30:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DACC064EE3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=v22St+UUGhymZLPiz5NsecjHtyyVJUSVIvedTPZFVbU=; b=qIs0EZ1E1a8bggf55QJPdaX+w
	78nGAdTFN5r5ocLE5Lr2JKeqkMa7EWzTbxq3GvE5FObPS7kEobZ5C7nEIMFAAGWDRPpjtgWYnBNIm
	Gf9THqFm7qBTRhQR072unTmqQyPctwYapsjkoAD4wZdJyTkwlEeQ/xrZgvPyXKSL07M/f4LsbfAB/
	bdAq8HyVWboG5bCxJBuSwVBPpVjCb6WdavBp9YRRDa7pI5ZJmTi4d8BJ0LxXiHwlGG+gBuDOTL/tW
	CJJ9aGlMeZrEgkpCNnjr4/nTbvJ5L0UuIGb8nZvc7D8N132EBJe8+r6+lhdsQBAlBuUvt/3afqE1v
	+S6HG5fNw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l93nd-0007AA-42; Mon, 08 Feb 2021 10:29:45 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l93nb-00079g-6F
 for linux-arm-kernel@lists.infradead.org; Mon, 08 Feb 2021 10:29:43 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5E86764EEA
 for <linux-arm-kernel@lists.infradead.org>;
 Mon,  8 Feb 2021 10:29:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1612780180;
 bh=p2hx13acRNeRuP4/3KLPZN6rkRc1Qu9PVutMfTL9s+0=;
 h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
 b=CxGdeT7tkU3I3bRTBd2DLR0XNj0sfLX/0zK4WO9Lbsj0L7h9pubYB6BFevAmG6ENl
 95bY3/ATjPn2YGTI//PB6joJlk6yJVuhZmlJ8HK2A++V5ZC/f5DOT6sgwNYOg4+0mR
 ibMJfqDfOL5xJ8C0NBo41IYJap3DzzmrPkACBllMeQZ79v8PmKa+Q1uELxj67KQ2Pz
 SueBMS+AqNzPh9+vLcnB4Lso8KGQZHYt4njJBaYs9YKPD0OIrWU+yceAy7IMXEXo5s
 /g8b+IRr6c/r8Z+MXUdUN+4yoY5ZNc+By7dx3wqhU+jAHMDM2gisNlYZurwWCYkbI3
 IjQrcsCtLG2vw==
Received: by mail-ot1-f54.google.com with SMTP id q4so4038843otm.9
 for <linux-arm-kernel@lists.infradead.org>;
 Mon, 08 Feb 2021 02:29:40 -0800 (PST)
X-Gm-Message-State: AOAM533i1NDXSxAM+Ba3PWeCwI46bpimU0CAB1dePIXuUtV9zt5DDGaj
 ers28wUZQ9zBe2Df3Cqtq4hIsklyIec4OyylaEY=
X-Google-Smtp-Source: ABdhPJyRKuKxcCWk5w7thD9Nr/Fjq8zYWawG9+OC4Z/IF51G+RuRSi0qovib3pD6A0+8UTKCFZwnVeglv9K1F/1wuwY=
X-Received: by 2002:a05:6830:18e6:: with SMTP id
 d6mr7375696otf.251.1612780179583; 
 Mon, 08 Feb 2021 02:29:39 -0800 (PST)
MIME-Version: 1.0
References: <20210204203951.52105-1-marcan@marcan.st>
 <20210204203951.52105-16-marcan@marcan.st>
 <87eehqlxlr.wl-maz@kernel.org>
In-Reply-To: <87eehqlxlr.wl-maz@kernel.org>
From: Arnd Bergmann <arnd@kernel.org>
Date: Mon, 8 Feb 2021 11:29:23 +0100
X-Gmail-Original-Message-ID: <CAK8P3a25eFFrMG-9QknFZ6Ckc3-gkiLK=jQdnyTMgn-z4X0RHQ@mail.gmail.com>
Message-ID: <CAK8P3a25eFFrMG-9QknFZ6Ckc3-gkiLK=jQdnyTMgn-z4X0RHQ@mail.gmail.com>
Subject: Re: [PATCH 15/18] irqchip/apple-aic: Add support for the Apple
 Interrupt Controller
To: Marc Zyngier <maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210208_052943_329115_0A56AC98 
X-CRM114-Status: GOOD (  13.86  )
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
Cc: DTML <devicetree@vger.kernel.org>, Hector Martin <marcan@marcan.st>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 SoC Team <soc@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Olof Johansson <olof@lixom.net>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210208102923.pxRVb9BbJMXb1BwgzSdUTDyVEfVg9kDqg58A3ZJhWA4@z>

On Mon, Feb 8, 2021 at 10:25 AM Marc Zyngier <maz@kernel.org> wrote:
> On Thu, 04 Feb 2021 20:39:48 +0000, Hector Martin <marcan@marcan.st> wrote:

> > +{
> > +     return readl(ic->base + reg);
>
> Please consider using the _relaxed accessors, as I don't think any of
> these interacts with memory (apart from IPIs, of course).

MSI interrupts require serializing with DMA, so at the minimum I think there
needs to be something that ensures that DMA from device into memory
has completed before delivering the completion interrupt to a driver. This
may already be implied when the AIC is entered, but this is hard to know
without actual hardware specs.

       Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
