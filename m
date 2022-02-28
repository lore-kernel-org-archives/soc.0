Return-Path: <SRS0=eFBj=TL=linaro.org=sumit.garg@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E9E3C433EF
	for <soc@archiver.kernel.org>; Mon, 28 Feb 2022 08:05:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 06F94C340F1; Mon, 28 Feb 2022 08:05:59 +0000 (UTC)
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 3A393C340F2
	for <soc@kernel.org>; Mon, 28 Feb 2022 08:05:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 3A393C340F2
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f180.google.com with SMTP id s25so16230142lji.5
        for <soc@kernel.org>; Mon, 28 Feb 2022 00:05:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=qH7UqPayT5oaUTBU7kQaCR40s9AZiilL0cyOk7nWEfk=;
        b=vmi9w5dJvill6iQB4QyeowMBPUBdCmijp9xq2eP82o3c2N7rH/TWHtjn3h+3w4EJD1
         mnUFdvQF9ZTt5noYKh9EkQVeEEdDMUBb8aDT/imYI+FVdkXMX708R9IWhK1wNwAlb8EV
         GLrAwqJ89AGTApk/vnbtmDey2c6/5pAwfonJYsULrAv67Aj0ttCUa0GqJLrGtIf3rO/M
         Bz0SeXJC3HMMo+zD3zxkKUSdtZTlUhGPq5nlIMICD/VxiIQOKi+zeZSJ5FbreXaUqiSH
         RxPTSDhWudn/WSMhqjSJcizTROPZt6hLHuapAK6fB4nRdCBLiERSgnHLhWO1FQkdR2f+
         uOZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qH7UqPayT5oaUTBU7kQaCR40s9AZiilL0cyOk7nWEfk=;
        b=inTodY6QmpOOEFimpn7YvL7GOFS/nuU1Pai6l/qxC6wSELVPP3NjRjhAkKT8N36BmE
         jpCb2Mt+ic1tWRSJNCeMEURyc9xRqT9YRUTNuxYzjDFnHKiCMhh9o2w+PcqZuyNNp7SZ
         a20mCRngdtfVtO4RXw8O+DEZPTFyge0oiiySlOAGzt5DfJOu6AOjzSmsaDazwOJEA2It
         o6LxR+0rwZG+VH/Nel8fan1jPJJIklpP/bQQtoSGilCfyOkq10b8FTztEjVAcXGykwCm
         c9tfYYi0soxTgGfZjYRhIjL/ST80pu7V7hs4v+JLQw+IDrqKknv6It1shaSWbI2GOp+6
         iXUg==
X-Gm-Message-State: AOAM532V4ch7EcGekBAs9PifNDWKZMUE5u0v0jSUnxXRtDsFCHmzRB8J
	Pmuy9clwOXg0KAPt3FuIv0zYw68oW/y5/bIpk9arlw==
X-Google-Smtp-Source: ABdhPJw+MMDt8ov0Fc43zExaO4e6jJLK8k4t02Jj0OyzwtYgfx9NmHVdlYCpchMD8hJN0vSvdzAYRHIc2bZgiIEj48k=
X-Received: by 2002:a2e:8895:0:b0:246:3e9a:df64 with SMTP id
 k21-20020a2e8895000000b002463e9adf64mr13683094lji.323.1646035555781; Mon, 28
 Feb 2022 00:05:55 -0800 (PST)
MIME-Version: 1.0
References: <20220218092010.1327309-1-hasegawa-hitomi@fujitsu.com>
 <CAK8P3a027OWYrRDm3r930pYo+He7bqVSEpQKjM9od1W8ciamyw@mail.gmail.com>
 <OSZPR01MB70508B35657B539FF4FA28F6EB3B9@OSZPR01MB7050.jpnprd01.prod.outlook.com>
 <OSZPR01MB7050EF799D97D05A8C4597E7EB3E9@OSZPR01MB7050.jpnprd01.prod.outlook.com>
 <CAK8P3a0T1eP9a_1UhYRg0wHBsjyLLORoKB+44PAPM4zj3ryVcA@mail.gmail.com>
In-Reply-To: <CAK8P3a0T1eP9a_1UhYRg0wHBsjyLLORoKB+44PAPM4zj3ryVcA@mail.gmail.com>
From: Sumit Garg <sumit.garg@linaro.org>
Date: Mon, 28 Feb 2022 13:35:44 +0530
Message-ID: <CAFA6WYMqO9rnHaYgyrY=+zV9saS1jrayiVoB_FwSm_yCBRhu5g@mail.gmail.com>
Subject: Re: [PATCH] soc: fujitsu: Add A64FX diagnostic interrupt driver
To: Arnd Bergmann <arnd@arndb.de>, 
	"hasegawa-hitomi@fujitsu.com" <hasegawa-hitomi@fujitsu.com>
List-Id: <soc.lore.kernel.org>
Cc: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, 
	"jirislaby@kernel.org" <jirislaby@kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	SoC Team <soc@kernel.org>, Olof Johansson <olof@lixom.net>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Arnd, Hitomi,

On Fri, 25 Feb 2022 at 16:50, Arnd Bergmann <arnd@arndb.de> wrote:
>
> On Fri, Feb 25, 2022 at 11:35 AM hasegawa-hitomi@fujitsu.com
> <hasegawa-hitomi@fujitsu.com> wrote:
> >
> > Hi Greg and Jiri,
> >
> > I'm trying to implement a feature for A64FX that will panic when
> > a diagnostic interrupt is received.
> > Arnd suggested that handle_sysrq() should be used
> > but I'm wonderingif it's ok to call it in NMI.
> > Would you please let me know if we can call handle_sysrq() in NMI?
>
> I see some work from Sumit Garg to make it possible, but this was never
> merged, so presumably it is not safe:
>
> https://lore.kernel.org/linux-arm-kernel/CAFA6WYOWHgmYYt=KGXDh2hKiuy_rQbJfi279ev0+s-Qh7L21kA@mail.gmail.com/t/#m2b5006f08581448020eb24566927a104d0b95c44
>

Yeah it had some tricky bits but it wasn't the reason for the work
being stalled. Actually it turned out to be cumbersome to allow all
8250 UARTs to be driven from NMI interrupts as well. But given this
special diagnostic interrupt on A64FX turned as pseudo NMI, it
shouldn't be that hard to test it with this [1] minimal patch.

[1] https://lkml.org/lkml/2022/2/28/83

-Sumit

> Sumit has worked on some related areas as well, and may have additional
> ideas for you.
>
>         Arnd
