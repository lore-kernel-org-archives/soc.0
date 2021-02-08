Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4D18C433E6
	for <soc@archiver.kernel.org>; Mon,  8 Feb 2021 10:29:40 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 9850A64EE6; Mon,  8 Feb 2021 10:29:40 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 69A0664EF4;
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
Received: by mail-ot1-f45.google.com with SMTP id k10so11331183otl.2;
        Mon, 08 Feb 2021 02:29:40 -0800 (PST)
X-Gm-Message-State: AOAM5323lRc9sxW0JmA53PVrK6dht/ZITpx4L/yDgYFM5uRgVUlpYtFD
	YTnHK+DFTnBwp6vGQt+RSG4+KQmOzu8hTjV5YmM=
X-Google-Smtp-Source: ABdhPJyRKuKxcCWk5w7thD9Nr/Fjq8zYWawG9+OC4Z/IF51G+RuRSi0qovib3pD6A0+8UTKCFZwnVeglv9K1F/1wuwY=
X-Received: by 2002:a05:6830:18e6:: with SMTP id d6mr7375696otf.251.1612780179583;
 Mon, 08 Feb 2021 02:29:39 -0800 (PST)
MIME-Version: 1.0
References: <20210204203951.52105-1-marcan@marcan.st> <20210204203951.52105-16-marcan@marcan.st>
 <87eehqlxlr.wl-maz@kernel.org>
In-Reply-To: <87eehqlxlr.wl-maz@kernel.org>
From: Arnd Bergmann <arnd@kernel.org>
Date: Mon, 8 Feb 2021 11:29:23 +0100
X-Gmail-Original-Message-ID: <CAK8P3a25eFFrMG-9QknFZ6Ckc3-gkiLK=jQdnyTMgn-z4X0RHQ@mail.gmail.com>
Message-ID: <CAK8P3a25eFFrMG-9QknFZ6Ckc3-gkiLK=jQdnyTMgn-z4X0RHQ@mail.gmail.com>
Subject: Re: [PATCH 15/18] irqchip/apple-aic: Add support for the Apple
 Interrupt Controller
To: Marc Zyngier <maz@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: Hector Martin <marcan@marcan.st>, SoC Team <soc@kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, Rob Herring <robh+dt@kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, DTML <devicetree@vger.kernel.org>, 
	Olof Johansson <olof@lixom.net>
Content-Type: text/plain; charset="UTF-8"

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
