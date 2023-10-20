Return-Path: <SRS0=CKFp=GC=linaro.org=peter.griffin@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94CC0C001DF
	for <soc@archiver.kernel.org>; Fri, 20 Oct 2023 21:48:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 7D718C433C9; Fri, 20 Oct 2023 21:48:02 +0000 (UTC)
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 8C353C433C7
	for <soc@kernel.org>; Fri, 20 Oct 2023 21:48:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 8C353C433C7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-66d24ccc6f2so20602656d6.0
        for <soc@kernel.org>; Fri, 20 Oct 2023 14:48:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697838479; x=1698443279; darn=kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=/mBv1buCpcnwBc220mZjRsjDHmbRRP2xfyJ2lFdmR6s=;
        b=l9rogrhBKOiUbOQDr3LACO3xtBccWboYNAGwN84sjiYezo3unOaZQK8eL3VW5bn5nx
         jLZhHePqcE2xGJp1mdyQQkPbz1t+ruqHv+Xp8Z6RAXqU7rM6nGflh+roP/jlgmQPWaCu
         5TmaXBvuWZelRQdDh44q0IVFhKXwWEya4IsU8p89Zz8LzWuT8IP1pJvTUmMEQjM/YAR3
         qjYGlvcWWU14X4YjUGyabL2luduQ/b4l3aP4Y/dwxo6sscXS3Hfrq/YaufWwQmh3Dx/1
         KCLyjuO3PmLADvdtCs9p8nevNyjjottySv5H+R8TFqHstLl6KhzWnFbHjInVzj+kyACg
         o6rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697838479; x=1698443279;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/mBv1buCpcnwBc220mZjRsjDHmbRRP2xfyJ2lFdmR6s=;
        b=QzWqwSqIITQkL3BQFRzTwT9zs4iPscQnbnzyuEPs/1/LeJ5oUXhZ5EMlLFswKcJXQ1
         hJnJF7WwsQX5iTgN2dt0UrJrsBDBPY6x+78hWqaHqNEIIMaYIplA0InJ2gLkJk/+lztc
         x/n8NBxcYD7SJXyejllRytfbjMkUI2oJP04QG3CQ/m3VtjBtaOnCHDb7QB+Eym3/kV3n
         qmp72U3HL+8VkXM+NYWKpSjYOA/wQCfMgIbMFiqmAR9Q4KJccwz3KW7KNcpBIMfHl/Fn
         N6NhSy5hTwaN2l4wIUICt/xl3N5AiBBupIDId6qchyxgnoxHHgoqWszdDrjcNoZ5SzO/
         BpMA==
X-Gm-Message-State: AOJu0YwvTIhcwWNOP0g/UhsHCDD0FyCeupdAkvPUY2wVjyXXrvYpe3oW
	baDwYSEG+h7RMAw6O9XDSc9t0TbrnKKvskeAtbC2gQ==
X-Google-Smtp-Source: AGHT+IHQJ7x9/SuQ4EBTGwOQciXDqQRU/H0wUJap6zldAAHxxJLfRsl7IevqZUOUANlVf9xne6BrdF0f6OpD88sD5HM=
X-Received: by 2002:ad4:5dc2:0:b0:66d:9b63:72fb with SMTP id
 m2-20020ad45dc2000000b0066d9b6372fbmr2943620qvh.5.1697838479398; Fri, 20 Oct
 2023 14:47:59 -0700 (PDT)
MIME-Version: 1.0
References: <20231011184823.443959-1-peter.griffin@linaro.org>
 <20231011184823.443959-17-peter.griffin@linaro.org> <eca9feea-b4a6-438c-83c7-452e8fe388c6@app.fastmail.com>
In-Reply-To: <eca9feea-b4a6-438c-83c7-452e8fe388c6@app.fastmail.com>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Fri, 20 Oct 2023 22:47:47 +0100
Message-ID: <CADrjBPqPR54FqsdG1irrAYVn+Bkuc5hU3Vip7mUS8Aeq1b=JOw@mail.gmail.com>
Subject: Re: [PATCH v3 16/20] tty: serial: samsung: Add gs101 compatible and
 SoC data
To: Arnd Bergmann <arnd@arndb.de>
List-Id: <soc.lore.kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>, krzysztof.kozlowski+dt@linaro.org, 
	Michael Turquette <mturquette@baylibre.com>, Conor Dooley <conor+dt@kernel.org>, 
	Stephen Boyd <sboyd@kernel.org>, Tomasz Figa <tomasz.figa@gmail.com>, 
	Sylwester Nawrocki <s.nawrocki@samsung.com>, Linus Walleij <linus.walleij@linaro.org>, 
	Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Olof Johansson <olof@lixom.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Chanwoo Choi <cw00.choi@samsung.com>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	andre.draszik@linaro.org, Sam Protsenko <semen.protsenko@linaro.org>, saravanak@google.com, 
	William McVicker <willmcvicker@google.com>, soc@kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, 
	"open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, linux-watchdog@vger.kernel.org, 
	kernel-team@android.com, linux-serial@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Arnd,

On Thu, 12 Oct 2023 at 07:07, Arnd Bergmann <arnd@arndb.de> wrote:
>
> On Wed, Oct 11, 2023, at 20:48, Peter Griffin wrote:
> > Add serial driver data for Google Tensor gs101 SoC.
> >
> > Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
>
> Reviewed-by: Arnd Bergmann <arnd@arndb.de>

Thanks!

>
> While the patch is now correct, I would point out a few
> improvements we could make on top:
>
> > +static const struct s3c24xx_serial_drv_data gs101_serial_drv_data = {
> > +     EXYNOS_COMMON_SERIAL_DRV_DATA(),
> > +     /* rely on samsung,uart-fifosize DT property for fifosize */
> > +     .fifosize = { 0 },
> > +};
> > +
> >  #define EXYNOS4210_SERIAL_DRV_DATA (&exynos4210_serial_drv_data)
> >  #define EXYNOS5433_SERIAL_DRV_DATA (&exynos5433_serial_drv_data)
> >  #define EXYNOS850_SERIAL_DRV_DATA (&exynos850_serial_drv_data)
> > +#define GS101_SERIAL_DRV_DATA (&gs101_serial_drv_data)
>
> Since this is now actually correct for any Exynos variant that
> has the FIFO size listed in the DT, we could use a variable/macro
> name that leads itself to being used by future chips.

I've updated this to exynos_fifoszdt_serial_drv_data and
EXYNOS_FIFOSZDT_SERIAL_DRV_DATA in v4 and added a
comment that it is common struct for platforms that specify
uart,fifosize in DT.

I've also updated the YAML to make this a required property for
google,gs101-uart.

>
> There is also the question of whether we want to address the
> ordering bug for the other SoC types. The way I understand it,
> the .fifosize array logic is wrong because it relies on having
> a particular alias for each of the ports to match the entry in
> the array.
> For the exynosautov9, this would be trivially fixed
> by using the same data as gs101 (since it already lists the
> correct size in DT), but for the other ones we'd need a different
> logic.
>

It seems samsung,exynosautov9-uart is in the yaml bindings and
exynosautov9.dtsi but never actually made it into the driver. But
it could be added to the driver and made to use the common
exynos_fifoszdt_serial_drv_data mentioned above.

I think any new platform should specify this in DT as many of these
UARTs on newer Exynos are actually universal serial IPs which can
be UART, I2C or SPI which is board dependent. So having the fifosize
in the driver, based on a SoC compatible and relying on probe order
and DT aliases seems very prone to error.

regards,

Peter.

> > @@ -2688,6 +2696,9 @@ static const struct platform_device_id
> > s3c24xx_serial_driver_ids[] = {
> >       }, {
> >               .name           = "artpec8-uart",
> >               .driver_data    = (kernel_ulong_t)ARTPEC8_SERIAL_DRV_DATA,
> > +     }, {
> > +             .name           = "gs101-uart",
> > +             .driver_data    = (kernel_ulong_t)GS101_SERIAL_DRV_DATA,
> >       },
> >       { },
> >  };
>
> I just noticed that the platform_device_id array is currently
> only used for mach-crag6410, since everything else uses DT
> based probing. s3c64xx is scheduled for removal in early 2024
> (though no patch has been sent), and we can probably just
> remove all the atags/platform_device based code when that happens.
>
>       Arnd
