Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5064AC433DB
	for <soc@archiver.kernel.org>; Sat,  2 Jan 2021 10:54:32 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 0006722475; Sat,  2 Jan 2021 10:54:32 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id CB7EF22283;
	Sat,  2 Jan 2021 10:54:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1609584871;
	bh=Dd0RhzVe753ptbAnU/DKnNBiKaGd4G8T9libPh9kYb0=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=k18cya+wyuhpTq4koP4LZwrQPZ6sNuR0pzXi6IQNDmNKHOhW5vHJExbETYAhuF/yX
	 L+HuJYeQ3GodkpQpGAQeUYGPdNw5LRBr6i7ZDAOwWjaM9Z++F1ZO9jnm6/DRwaQtjv
	 Y/aLQdKKgIniPVyhqMOFqXlGF43VAaSvEjMcu6YSrW8ZNW9aRGZdNe/Hu4NTbGMSqL
	 YfdqEDPeb4GemZdJJ+yA5wh/pnVnUakh2nEyRFiQH7my75nJMQwWIhQxQETMa68X84
	 H0SPRMvkh0j32Li1iwXGueHPhg75vPMIHJuxZgX4F5jzNc7k0ML5En6M4Bt8WY+Qse
	 mguoX9WfXaQAA==
Received: by mail-ot1-f46.google.com with SMTP id w3so21686876otp.13;
        Sat, 02 Jan 2021 02:54:31 -0800 (PST)
X-Gm-Message-State: AOAM5314WSHC9a9VszXSH7pgc5YdTq0eB25Y4S+Dy4DqIlCgACd0LK9w
	H5ZIUGzFpyxMXcZxbxxM0ewCURFDcGYBNlXvekM=
X-Google-Smtp-Source: ABdhPJwc6VzfJ78btekZr0kxGEgNwOABdjiYJBKAYs+Zm1qRAAH1QcbrSl1Yueg0v7qhcI93I/l6Z2b2a8VoxKQ0nD0=
X-Received: by 2002:a9d:7a4b:: with SMTP id z11mr47221743otm.305.1609584871197;
 Sat, 02 Jan 2021 02:54:31 -0800 (PST)
MIME-Version: 1.0
References: <20201230152010.3914962-1-arnd@kernel.org> <20201231124946.GA2918779@willow>
In-Reply-To: <20201231124946.GA2918779@willow>
From: Arnd Bergmann <arnd@kernel.org>
Date: Sat, 2 Jan 2021 11:54:15 +0100
X-Gmail-Original-Message-ID: <CAK8P3a3TR3qzJ2JP8-mFHtEA0sqDYeuG5vR6W1_XGzWF-S0-YA@mail.gmail.com>
Message-ID: <CAK8P3a3TR3qzJ2JP8-mFHtEA0sqDYeuG5vR6W1_XGzWF-S0-YA@mail.gmail.com>
Subject: Re: [PATCH] ARM: picoxcell: fix missing interrupt-parent properties
To: Jamie Iles <jamie@jamieiles.com>
List-Id: <soc.lore.kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>, SoC Team <soc@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Olof Johansson <olof@lixom.net>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, DTML <devicetree@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, Dec 31, 2020 at 1:49 PM Jamie Iles <jamie@jamieiles.com> wrote:
>
> Hi Arnd,
>
> On Wed, Dec 30, 2020 at 04:20:05PM +0100, Arnd Bergmann wrote:
> > From: Arnd Bergmann <arnd@arndb.de>
> >
> > dtc points out that the interrupts for some devices are not parsable:
> >
> > picoxcell-pc3x2.dtsi:45.19-49.5: Warning (interrupts_property): /paxi/gem@30000: Missing interrupt-parent
> > picoxcell-pc3x2.dtsi:51.21-55.5: Warning (interrupts_property): /paxi/dmac@40000: Missing interrupt-parent
> > picoxcell-pc3x2.dtsi:57.21-61.5: Warning (interrupts_property): /paxi/dmac@50000: Missing interrupt-parent
> > picoxcell-pc3x2.dtsi:233.21-237.5: Warning (interrupts_property): /rwid-axi/axi2pico@c0000000: Missing interrupt-parent
> >
> > There are two VIC instances, so it's not clear which one needs to be
> > used. I found the BSP sources that reference VIC0, so use that:
> >
> > https://github.com/r1mikey/meta-picoxcell/blob/master/recipes-kernel/linux/linux-picochip-3.0/0001-picoxcell-support-for-Picochip-picoXcell-SoC.patch
> >
> > Signed-off-by: Arnd Bergmann <arnd@arndb.de>
>
> Rob has a series to remove Picoxcell as there's no active development on
> this anymore and Intel have stopped producing the chips.

Right, I am aware of Rob's series. My patch was a little older but I only got
around to submitting it now. I'd still like to merge it as a bugfix for v5.11
though and have it backported to avoid the warnings with new dtc on
stable kernels, while doing the platform removal for v5.12.

      Arnd
