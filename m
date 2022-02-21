Return-Path: <SRS0=uEgb=TE=gmail.com=joel.stan@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB0D8C433F5
	for <soc@archiver.kernel.org>; Mon, 21 Feb 2022 08:32:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 9BBA0C340E9; Mon, 21 Feb 2022 08:32:03 +0000 (UTC)
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id CF866C340F1;
	Mon, 21 Feb 2022 08:32:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org CF866C340F1
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f176.google.com with SMTP id 185so8079685qkh.1;
        Mon, 21 Feb 2022 00:32:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Fe2hsCdbxN1ij2HP4oggs60CZPKRq8in1lb+QkY/nqo=;
        b=nikTB4nTPSIHaAbZaqKeqIYB7Ip1n/OvgN5AE9hLz08d3EyLVRH+LyoKfDvR26SUeP
         Ggwo7azjtYWZPev4HZPO/g0Ui/r1WmrpyJjFJajqDyxGO69+PUxjfPigsPECfz/c/mKU
         0hH5vzvYZBaxGDXFAyf2FiKGkvc+g3GP53Bz4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Fe2hsCdbxN1ij2HP4oggs60CZPKRq8in1lb+QkY/nqo=;
        b=JW2yxKT8slhTbg4ATcGQclImipYpMKBsnv62Ccxyjk2ClPTH86si27yM+balvInYGQ
         K9HZuxwNPrsxIJw+cYPZ3tZgSkBVIniIUh1PiQtUzkfvYyFoTdPDtd46nzoNTBg4wb/D
         3KyTBUtNV4wTtNbipAYY0N1ag2cP0cQAjg6kBYT7jy40eP8P0QsicY+HDHfMXOCHBFJT
         JdqOYbv0LTYmrgS5zFlRXo2SQXZxVW8lAYxI2U6YTdMDRP63SSNSQp9e/I/PcY+nRot1
         rF8ihrUcU3iLfDrHDF7Oog/gnoe5hF7PL90JvC1rOoKwQO+jDsHkm9n5BBmymexumaS5
         +gjg==
X-Gm-Message-State: AOAM532H9vaTnqGnBkJrLU1w0fbubwCVDax20NWOZNazx4WT0G9+/eEE
	UOHPkA8GxYYhWI8p9eY7ZH/Vkfs3++g2Yhceh6E=
X-Google-Smtp-Source: ABdhPJybHDR+rwS5BataoX0weUhRuleDucNLDhHs+gIIGUgBpftAAxgiThB8021yyAhm964JoV33b5jxB2TzSNca8W4=
X-Received: by 2002:a05:620a:29ce:b0:648:ad12:789 with SMTP id
 s14-20020a05620a29ce00b00648ad120789mr5644170qkp.347.1645432321827; Mon, 21
 Feb 2022 00:32:01 -0800 (PST)
MIME-Version: 1.0
References: <nick.hawkins@hpe.com> <20220216153632.40981-1-nick.hawkins@hpe.com>
 <CAK8P3a0NmyxrzxgfwfDXuFvhmc3OL_-yBj8PDdEHh-2qm4NVkw@mail.gmail.com>
 <PH0PR84MB17185157544CFEB1D8AE267088359@PH0PR84MB1718.NAMPRD84.PROD.OUTLOOK.COM>
 <CAK8P3a1HuTMt5WmOw3aQcLwGZd_WQ5nsKZ2HFDPQ0CHFvKsygA@mail.gmail.com>
In-Reply-To: <CAK8P3a1HuTMt5WmOw3aQcLwGZd_WQ5nsKZ2HFDPQ0CHFvKsygA@mail.gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 21 Feb 2022 08:31:49 +0000
Message-ID: <CACPK8XdXV4j=0kYbEJRki9ug6VeeK02ZrXRgqFd9gUu6kSpA=Q@mail.gmail.com>
Subject: Re: [PATCH] [v3] arch: arm: boot: dts: Create HPE GXP Device Tree
To: Arnd Bergmann <arnd@arndb.de>
List-Id: <soc.lore.kernel.org>
Cc: "Hawkins, Nick" <nick.hawkins@hpe.com>, "Verdun, Jean-Marie" <verdun@hpe.com>, 
	Olof Johansson <olof@lixom.net>, SoC Team <soc@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, DTML <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, 16 Feb 2022 at 16:51, Arnd Bergmann <arnd@arndb.de> wrote:
>
> On Wed, Feb 16, 2022 at 5:29 PM Hawkins, Nick <nick.hawkins@hpe.com> wrote:

> > > +
> > > +               vrom@58000000 {
> > > +                       compatible = "mtd-ram";
> >
> > Same thing here, "vrom" is clearly not a standard name.
> >
> > NH: VROM is a Virtual ROM device that we use to create a memory mapping of a SPI flash content copy that is served to a host system. How should I rename it?
>
> Not sure, I don't remember seeing this case so far. Adding Joel to Cc,
> maybe he knows of
> another BMC that does the same thing.

We have something similar. The aspeed systems map this over LPC, using
FW cycles (aka memory accesses) over the LPC bus to read from the
BMC's SPI NOR devices, or DRAM.

The device tree bindings we have are in the LPC document:

 Documentation/devicetree/bindings/mfd/aspeed-lpc.yaml

It's the aspeed,ast2400-lpc-ctrl specifically. It takes a phandle to a
reserved-memory node.

The kernel driver is at drivers/soc/aspeed/aspeed-lpc-ctrl.c. It
exposes a character device that allows userspace to read and write to
the memory window.

We have this very aspeed specific design because it was the first
implementation in the kernel. Where possible, we should create a new
unified API for doing this type of access, where each BMC can
implement a backend. Now that we have GXP, Nuvoton and ASPEED it
should be easier to pick out common functionality.

Cheers,

Joel
