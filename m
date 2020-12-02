Return-Path: <SRS0=JWeQ=FG=0x0f.com=daniel@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2661C64E7C
	for <soc@archiver.kernel.org>; Wed,  2 Dec 2020 09:10:56 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 9E90222245; Wed,  2 Dec 2020 09:10:56 +0000 (UTC)
Received: from mail-qv1-f68.google.com (mail-qv1-f68.google.com [209.85.219.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AC4D420709
	for <soc@kernel.org>; Wed,  2 Dec 2020 09:10:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AC4D420709
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=0x0f.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=daniel@0x0f.com
Received: by mail-qv1-f68.google.com with SMTP id q7so354120qvt.12
        for <soc@kernel.org>; Wed, 02 Dec 2020 01:10:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0x0f.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=jHXxAEFihpGexQosJgOwtA1rTxwRBPimbOCJs6PdyiQ=;
        b=Y5QtHYdkrX6aP/Zfes2Iz6RXNnojW27vyX/5CgTqb+ITygoCCJ2dfDbg2zQfOXAiic
         PF4gIiC7/Pfg7hZ/9b5KyW8cmfjNRwejA5zB5Pca6v0+vP80S/2MNkkd29UrKFoqUPwY
         EGUNWFX4S8E1fm9eVVgvgwraAIP7bfzNE460M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jHXxAEFihpGexQosJgOwtA1rTxwRBPimbOCJs6PdyiQ=;
        b=b56lct2HbCOFQGBjS3F0tX3iX9whUzqsEa4kFk/m2MpAeUcHIUFyp3weg1HnHHJRfP
         q+/rXRZtOW6PIkKfkAdI4nvx5otEhrX9/iGwxklVX1b5ix0IQ+yapb24WHMArJPzbsRu
         MtS3SVIOzxfzb1NSz3dIKS4XazmJU5uQHT3GoCeR+yMmJd9/CVc5x/CL74AfNmScrJrD
         AjyuO9WNhwrpLDpgVltEEv7HdJlY2VuDOjEmRofj4LKcdSIry9G4OlT5qtzeiTeO8k6g
         yKMoiaAt7QzJfPu47K9jo6pSFlGNoYXIZh4Dv8jJqSV5zgOnLOmQRXIg1C48FQsEjosF
         2BrA==
X-Gm-Message-State: AOAM531/ev2VHBofDdbbeyThXMx0aqNHtZWkvLMXSezWZjDFD8yxMmk0
	2J9LE/piWW48f0jQtRM4hlQOdtLkV7k0Adhve8bgRw==
X-Google-Smtp-Source: ABdhPJytwEIZuRyGn05kO7fcdgPdlwgix3LuGPG61AnTa6cEDH4lUg49k1PEGAjiN9bs36DCjIusI58CiLW25Da9z0Y=
X-Received: by 2002:a0c:8e47:: with SMTP id w7mr1540726qvb.55.1606900254283;
 Wed, 02 Dec 2020 01:10:54 -0800 (PST)
MIME-Version: 1.0
References: <20201201134330.3037007-1-daniel@0x0f.com> <20201201134330.3037007-11-daniel@0x0f.com>
 <20201201150425.GC1551@shell.armlinux.org.uk>
In-Reply-To: <20201201150425.GC1551@shell.armlinux.org.uk>
From: Daniel Palmer <daniel@0x0f.com>
Date: Wed, 2 Dec 2020 18:10:43 +0900
Message-ID: <CAFr9PXnME5UCyOdkRGFO2+=gv27grcq35Adrtio3ex4hq0CWEQ@mail.gmail.com>
Subject: Re: [PATCH v2 10/10] ARM: mstar: SMP support
To: Russell King - ARM Linux admin <linux@armlinux.org.uk>
List-Id: <soc.lore.kernel.org>
Cc: DTML <devicetree@vger.kernel.org>, SoC Team <soc@kernel.org>, 
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, olof@lixom.net, 
	Arnd Bergmann <arnd@arndb.de>, Rob Herring <robh@kernel.org>, Willy Tarreau <w@1wt.eu>
Content-Type: text/plain; charset="UTF-8"

Hi Russell,

On Wed, 2 Dec 2020 at 00:04, Russell King - ARM Linux admin
<linux@armlinux.org.uk> wrote:
>
> On Tue, Dec 01, 2020 at 10:43:30PM +0900, Daniel Palmer wrote:
> > +     np = of_find_compatible_node(NULL, NULL, "mstar,smpctrl");
> > +     smpctrl = of_iomap(np, 0);
> > +
> > +     if (!smpctrl)
> > +             return -ENODEV;
>
> Wouldn't -ENOMEM be more appropriate here?

There seems to be examples of both -ENOMEM and -ENODEV in other ARM platforms.
arch/arm/mach-aspeed/platsmp.c uses -ENODEV for example.

I went with -ENODEV there as the source of the error is most likely
the node not being in the device tree.
I didn't check the result of of_find_compatible_node() because for the
memory barrier code in the same file I was told it wasn't necessary.

Thanks,

Daniel
