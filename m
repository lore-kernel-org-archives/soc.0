Return-Path: <SRS0=l2eH=S5=linaro.org=lee.jones@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49E33C433EF
	for <soc@archiver.kernel.org>; Mon, 14 Feb 2022 14:16:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 0D560C340EE; Mon, 14 Feb 2022 14:16:37 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 52883C340E9
	for <soc@kernel.org>; Mon, 14 Feb 2022 14:16:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 52883C340E9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f45.google.com with SMTP id w11so27113625wra.4
        for <soc@kernel.org>; Mon, 14 Feb 2022 06:16:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=kgQHfexaQuoUShSlLQPKVWrC/gt5SJSd7Yg7kgOgPDA=;
        b=Qar0O4VfTdm4BhCSDsumsP2Z0/NBPGBQXdxkXe6L8qV9ranTdvuer5MbywUm3O7Dzb
         9CbG2dZ46gKZiwzl1lTTQewq6TUEKA0sQzf9FZ34F1rCKzIDaA+aPYvWHiXaj9xlX4e/
         0Td6Dz4v9tLVZUc0SDAFeMmBQeYXoE0VzGwV6ePXCPoBJ4eKhATYyNml6yjcU/QJiMlR
         t7V3IpMTuW2bWnDsE6eLE/ERLls3LmxfJ5u5XElFkvdcEbwqqUYF47uwjcNjjuls7RIy
         pV2P7/7czjqcSJtzeaeC/xmW4t5V7NCUS3H1b2sPO88Oj4D+0dKCRm3xNPhwZJtT4tNk
         zTXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=kgQHfexaQuoUShSlLQPKVWrC/gt5SJSd7Yg7kgOgPDA=;
        b=wBqIBetOSEf2gXpZay39bfOmYB2N7JSSwCzQ5udYeuDO+pvItyjmJJyduj0xqeT/kT
         JR8jLAEuszDLxoXrsqrBa6l5955Vy1p/4jD3sQ6jjx3mpS0eoBNZvhpgGjK6X5QD68jm
         xYVnDLqdHIOQrODNa8P6CyryejKqS0/Lt/sIKoFjXFiMiAfrhjCcs1ttl3FEd5NAcm6F
         cw/O3MMOUHgyk5d9whGtHpVZzhVYP6GmCNL4960KFe5kdxM58bKpg12ajr9D9vTYjecn
         4dY1AdpCzlc2+ldTfKdI8xl3sQfttGiL5h0mru+4KVsdcy+05ma8+LpugeMJEDgEmVuY
         Ckpg==
X-Gm-Message-State: AOAM532lDINnFM+iwJBbp9MB6Jdp92/kJk9zz9p8bGweU955EDhtZ9Kw
	9/JEzGuiOHktfz7knsaZJzfDkw==
X-Google-Smtp-Source: ABdhPJy7afZw39K6dXfik9BXiNDpeFayVD89osPiAt5JUbelWGzKm2KIokkvj0G/ptPA15p6XaVQWw==
X-Received: by 2002:a5d:6b90:: with SMTP id n16mr11641080wrx.558.1644848194706;
        Mon, 14 Feb 2022 06:16:34 -0800 (PST)
Received: from google.com (cpc155339-bagu17-2-0-cust87.1-3.cable.virginm.net. [86.27.177.88])
        by smtp.gmail.com with ESMTPSA id q13sm29865253wrd.78.2022.02.14.06.16.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Feb 2022 06:16:34 -0800 (PST)
Date: Mon, 14 Feb 2022 14:16:32 +0000
From: Lee Jones <lee.jones@linaro.org>
To: Michael Walle <michael@walle.cc>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org, linux-kernel@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>
Subject: Re: [PATCH] MAINTAINERS: add myself as a maintainer for the sl28cpld
Message-ID: <YgpkQMbhWAJG6oCh@google.com>
References: <20220207184652.1218447-1-michael@walle.cc>
 <YgpkCyoSMg5RYfkO@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YgpkCyoSMg5RYfkO@google.com>

On Mon, 14 Feb 2022, Lee Jones wrote:

> On Mon, 07 Feb 2022, Michael Walle wrote:
> 
> > The sl28cpld is a management controller found on the Kontron SMARC-sAL28
> > board for now. Support for it was added by me quite a while ago, but I
> > didn't add a MAINTAINERS entry. Add it now.
> > 
> > Signed-off-by: Michael Walle <michael@walle.cc>
> > ---
> > Hi,
> > 
> > since this affects so many subsystems, I'm not sure through which tree this
> > should go. I'm sending this to the arm soc maintainers because it's an
> > aarch64 board where this driver is used as well as Lee as the MFD
> > maintainer.
> 
> I'm happy to take this, if it pleases everyone.

Hold on, you're not going to get many Acks if you don't send it to the
other subsystem maintainers. :)

> >  MAINTAINERS | 15 +++++++++++++++
> >  1 file changed, 15 insertions(+)
> > 
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index ddcee331dc09..c14209168ce6 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -17762,6 +17762,21 @@ S:	Maintained
> >  W:	http://www.winischhofer.at/linuxsisusbvga.shtml
> >  F:	drivers/usb/misc/sisusbvga/
> >  
> > +SL28 CPLD MFD DRIVER
> > +M:	Michael Walle <michael@walle.cc>
> > +S:	Maintained
> > +F:	Documentation/devicetree/bindings/gpio/kontron,sl28cpld-gpio.yaml
> > +F:	Documentation/devicetree/bindings/hwmon/kontron,sl28cpld-hwmon.yaml
> > +F:	Documentation/devicetree/bindings/interrupt-controller/kontron,sl28cpld-intc.yaml
> > +F:	Documentation/devicetree/bindings/mfd/kontron,sl28cpld.yaml
> > +F:	Documentation/devicetree/bindings/pwm/kontron,sl28cpld-pwm.yaml
> > +F:	Documentation/devicetree/bindings/watchdog/kontron,sl28cpld-wdt.yaml
> > +F:	drivers/gpio/gpio-sl28cpld.c
> > +F:	drivers/hwmon/sl28cpld-hwmon.c
> > +F:	drivers/irqchip/irq-sl28cpld.c
> > +F:	drivers/pwm/pwm-sl28cpld.c
> > +F:	drivers/watchdog/sl28cpld_wdt.c
> > +
> >  SLAB ALLOCATOR
> >  M:	Christoph Lameter <cl@linux.com>
> >  M:	Pekka Enberg <penberg@kernel.org>
> 
> Acked-by: Lee Jones <lee.jones@linaro.org>
> 

-- 
Lee Jones [李琼斯]
Principal Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
