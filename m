Return-Path: <SRS0=/1gN=ZE=gmail.com=andy.shevchenko@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC724ECAAD3
	for <soc@archiver.kernel.org>; Thu,  1 Sep 2022 17:48:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 73DFEC433C1; Thu,  1 Sep 2022 17:48:14 +0000 (UTC)
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 814ABC433D6
	for <soc@kernel.org>; Thu,  1 Sep 2022 17:48:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 814ABC433D6
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f42.google.com with SMTP id f9so10353582qvw.11
        for <soc@kernel.org>; Thu, 01 Sep 2022 10:48:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=XxzGcZxEvn6lqn3S+ejnJxVLBGgsRsaccRc4Cve+wRs=;
        b=eX+c4tvw+WP34P9+Oh9i7JI4DrcHsssLX1AvxveMSyuN7PeNb6jogtV+DB1Y1RUnx/
         ESMV3E/e1BKYQmnOIFBrB5oKGfevKZyyY/gw0nsWkh/TbVvDnXY6WT8cjvMw6DAY1NAy
         aLiUawpXGB5/QTab5VA/SAVvBjrjiOb064t/RmDy3xtm7HE85VaP95IWlkkPJTDvoheg
         fDoKUXFFZJ/PTE2vHHaw24TRhIl70y0DSnVs7C0U72n6SeEgQSMu2y9ScwCzH9UC6fQG
         nrNk/P3AYp6F8OM7kGikbrk9hi9Rn6H5PhF2S3CNC/JGMlkC/ch/K/iCB7QcoFR2t/EY
         8B8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=XxzGcZxEvn6lqn3S+ejnJxVLBGgsRsaccRc4Cve+wRs=;
        b=KE008MNERmC7ez+27O4O7ht+Mg50xm2jK91PlKZ+TrOkzVfq3yrzzx5I4Pap1iovES
         fJM2DyBxqkvUyAa46irvFjxGYzUjWlOcYkK2zW4tkbJNowIKUAX2RoHxio7tQQbbmao5
         hLTaUKp1B+2S5/TDL4U39pRfzUue068JbaHJBW0Z3x/3ejNhiVIdZ3IkeVNKYBrDu/Ux
         9n6ZDW+7A6uLmktf+IXwxx5haWksj6eJLGQMAY2wCh5MC0Kr68GGUmF2HP+0iApKKc7T
         49lRmJoIQat7SGD/3zkJS9lz+sT1fjoAGaoDmBIAVbTopEi06LSGsvO4YZ4N4czvKFIr
         wkxg==
X-Gm-Message-State: ACgBeo0xYX46OkfCiDvT+GfZw4V2Ql2sg2W+qzKKT5/KqR+jju4+GfOG
	GdKhSmvrp14RwPJDo2BNRXC+tyEoKezVjrqmGfA=
X-Google-Smtp-Source: AA6agR5W6544mL7LWhnEioeV9p9alWGGjlSQTDFcYNtuZrEzZjzNO9Xin13cgi9cinfMtgiZlyMHCL4An3SJpU2YsoI=
X-Received: by 2002:a05:6214:27ca:b0:499:95f:6379 with SMTP id
 ge10-20020a05621427ca00b00499095f6379mr16365873qvb.82.1662054492332; Thu, 01
 Sep 2022 10:48:12 -0700 (PDT)
MIME-Version: 1.0
References: <1662030871-182688-1-git-send-email-john.garry@huawei.com> <1662030871-182688-6-git-send-email-john.garry@huawei.com>
In-Reply-To: <1662030871-182688-6-git-send-email-john.garry@huawei.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 1 Sep 2022 20:47:36 +0300
Message-ID: <CAHp75Vcg79sZjv24DD3ZhYf9aC-zoEZ59gfagS1Jw1-GYhpQug@mail.gmail.com>
Subject: Re: [PATCH 5/5] bus: hisi_lpc: Use platform_device_register_full()
To: John Garry <john.garry@huawei.com>
List-Id: <soc.lore.kernel.org>
Cc: "xuwei (O)" <xuwei5@hisilicon.com>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Linuxarm <linuxarm@huawei.com>, 
	"Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, SoC Team <soc@kernel.org>, 
	Yang Yingliang <yangyingliang@huawei.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, Sep 1, 2022 at 2:37 PM John Garry <john.garry@huawei.com> wrote:
>
> The code to create the child platform device is essentially the same as
> what platform_device_register_full() does, so change over to use
> that same function to reduce duplication.

Thanks!

>  drivers/bus/hisi_lpc.c | 70 ++++++++++++++++++++++--------------------
>  1 file changed, 36 insertions(+), 34 deletions(-)

Looking at the statistics I thought it was a scary "improvement", but...

...

>                 /* ipmi */
>                 {
>                         .hid = "IPI0001",
> -                       .name = "hisi-lpc-ipmi",
> +                       .pdevinfo = (struct platform_device_info []) {
> +                               {
> +                                       .parent = hostdev,
> +                                       .fwnode = acpi_fwnode_handle(child),
> +
> +                                       .name = "hisi-lpc-ipmi",
> +                                       .id = PLATFORM_DEVID_AUTO,
> +
> +                                       .res = res,
> +                                       .num_res = num_res,
> +                               },

...here and in the other cases you have a lot of blank lines, can we
just get rid of them?

> +                       },
>                 },
>                 /* 8250-compatible uart */
>                 {
>                         .hid = "HISI1031",
> -                       .name = "serial8250",
> -                       .pdata = (struct plat_serial8250_port []) {
> +                       .pdevinfo = (struct platform_device_info []) {
>                                 {
> -                                       .iobase = res->start,
> -                                       .uartclk = 1843200,
> -                                       .iotype = UPIO_PORT,
> -                                       .flags = UPF_BOOT_AUTOCONF,
> +                                       .parent = hostdev,
> +                                       .fwnode = acpi_fwnode_handle(child),
> +
> +                                       .name = "serial8250",
> +                                       .id = PLATFORM_DEVID_AUTO,
> +
> +                                       .res = res,
> +                                       .num_res = num_res,
> +
> +                                       .data = (struct plat_serial8250_port []) {
> +                                               {
> +                                                       .iobase = res->start,
> +                                                       .uartclk = 1843200,
> +                                                       .iotype = UPIO_PORT,
> +                                                       .flags = UPF_BOOT_AUTOCONF,
> +                                               },
> +                                               {}
> +                                       },

> +                                       .size_data =  2 *
> +                                               sizeof(struct plat_serial8250_port),

I believe this can be one line.

>                                 },
>                         },

-- 
With Best Regards,
Andy Shevchenko
