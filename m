Return-Path: <SRS0=llEl=ZF=gmail.com=andy.shevchenko@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA5BBECAAD5
	for <soc@archiver.kernel.org>; Fri,  2 Sep 2022 09:19:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 88D9EC433B5; Fri,  2 Sep 2022 09:19:16 +0000 (UTC)
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 7D2DFC433D6
	for <soc@kernel.org>; Fri,  2 Sep 2022 09:19:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 7D2DFC433D6
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f181.google.com with SMTP id m5so1269430qkk.1
        for <soc@kernel.org>; Fri, 02 Sep 2022 02:19:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=wN1g1xDoFb13lisdj6+cGYCXIaptZ92KuDnigLzcS88=;
        b=a7Nge74CosWKyQX1L03O/zbvmcA1xfA3j0HobwDvTY31WHlj98Ami8ApDE3Ae+E6Cc
         ROPMyJZcA0GBUu5jtF9amoi5RYqXj0R8N1E/Dn+rqAD+2y0WzOP6taxRKJJU5RTrUKR0
         v+wDPXvgvT/tk1DZpGS55Tfd1pNLTLZIGJ8Rc92BHhik0ZuKdWSPj3b339CZlid0j2Em
         pcg1HRkyCZ6lV+KiFQQR1uDEOFqAXYxXib3rlh+PQQwgzOvkWDoiaFJkAnfpGRwzpZaS
         Xp9QAiO/I3HFV32a8ToZZWBLAKTySV5GLJKg9SV07TO47ihBDKK0dEDxc5pVczClFyEA
         prZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=wN1g1xDoFb13lisdj6+cGYCXIaptZ92KuDnigLzcS88=;
        b=7Zywwigxq3P/gt2/5ZpR7J08L24zSsq7f7QOP9a8RF5vrkSFEz0zb81Wvr/0lL65SY
         3Qw9MqDNJeMseDRnbUbtqveSBkr9TGyY5PzFSus5WxSD63aMOHUsq88dmkkFqeWUGHKl
         ZYeQVwW8x3W/EHIJia5o4+6Zjeaq5tX6Kc+ojOkHIIgmD0Sx5INYQ4xOFLU55XkAhL0V
         YSbGWR8HVaLF4t0SiFYXI8zskGDkhAVcihe/IjJ9c5I2mCBOZWDB2FNmXbGTlVvMlsIz
         2QlrebKzsLfpCbGLrrOXubSoh6OATvVLllBzXTSABVFdIpcKU8ENgUpO9ViDp+zPe6Gj
         nuyA==
X-Gm-Message-State: ACgBeo0Dywo0ISzBwViNdtoxt/NjUydxUIJF6wwer1l5VP9u1YOhOJQ1
	8ilauELQLrvhAeJ8dABDsoshC0x5VbhjKN34EAo=
X-Google-Smtp-Source: AA6agR4katP00xVnTBW1U3/ZYh4xrZjbooFVNdP9HS5rJOykScomj2tHnTG8Rp6K5pKrfE1jskOuqDsLxWm/F5h9TcM=
X-Received: by 2002:a05:620a:288a:b0:6b8:fcfe:db02 with SMTP id
 j10-20020a05620a288a00b006b8fcfedb02mr23120785qkp.504.1662110354404; Fri, 02
 Sep 2022 02:19:14 -0700 (PDT)
MIME-Version: 1.0
References: <1662104841-55360-1-git-send-email-john.garry@huawei.com> <1662104841-55360-6-git-send-email-john.garry@huawei.com>
In-Reply-To: <1662104841-55360-6-git-send-email-john.garry@huawei.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Fri, 2 Sep 2022 12:18:38 +0300
Message-ID: <CAHp75VdfwGCUpZN3b1AD1kARc=FhyA4EDWDuZ8+1DKN3u73DeA@mail.gmail.com>
Subject: Re: [PATCH v2 5/5] bus: hisi_lpc: Use platform_device_register_full()
To: John Garry <john.garry@huawei.com>
List-Id: <soc.lore.kernel.org>
Cc: "xuwei (O)" <xuwei5@hisilicon.com>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Linuxarm <linuxarm@huawei.com>, 
	"Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, SoC Team <soc@kernel.org>, 
	Yang Yingliang <yangyingliang@huawei.com>
Content-Type: text/plain; charset="UTF-8"

On Fri, Sep 2, 2022 at 11:10 AM John Garry <john.garry@huawei.com> wrote:
>
> The code to create the child platform device is essentially the same as
> what platform_device_register_full() does, so change over to use
> that same function to reduce duplication.

Now statistics plays for you and not against.
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

> Signed-off-by: John Garry <john.garry@huawei.com>
> Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  drivers/bus/hisi_lpc.c | 64 ++++++++++++++++++++----------------------
>  1 file changed, 30 insertions(+), 34 deletions(-)
>
> diff --git a/drivers/bus/hisi_lpc.c b/drivers/bus/hisi_lpc.c
> index 74f4448bff9d..3555a6857214 100644
> --- a/drivers/bus/hisi_lpc.c
> +++ b/drivers/bus/hisi_lpc.c
> @@ -472,9 +472,7 @@ static int hisi_lpc_acpi_clear_enumerated(struct acpi_device *adev, void *not_us
>
>  struct hisi_lpc_acpi_cell {
>         const char *hid;
> -       const char *name;
> -       void *pdata;
> -       size_t pdata_size;
> +       const struct platform_device_info *pdevinfo;
>  };
>
>  static void hisi_lpc_acpi_remove(struct device *hostdev)
> @@ -505,28 +503,45 @@ static int hisi_lpc_acpi_add_child(struct acpi_device *child, void *data)
>                 /* ipmi */
>                 {
>                         .hid = "IPI0001",
> -                       .name = "hisi-lpc-ipmi",
> +                       .pdevinfo = (struct platform_device_info []) {
> +                               {
> +                                       .parent = hostdev,
> +                                       .fwnode = acpi_fwnode_handle(child),
> +                                       .name = "hisi-lpc-ipmi",
> +                                       .id = PLATFORM_DEVID_AUTO,
> +                                       .res = res,
> +                                       .num_res = num_res,
> +                               },
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
> +                                       .name = "serial8250",
> +                                       .id = PLATFORM_DEVID_AUTO,
> +                                       .res = res,
> +                                       .num_res = num_res,
> +                                       .data = (struct plat_serial8250_port []) {
> +                                               {
> +                                                       .iobase = res->start,
> +                                                       .uartclk = 1843200,
> +                                                       .iotype = UPIO_PORT,
> +                                                       .flags = UPF_BOOT_AUTOCONF,
> +                                               },
> +                                               {}
> +                                       },
> +                                       .size_data =  2 * sizeof(struct plat_serial8250_port),
>                                 },
> -                               {}
>                         },
> -                       .pdata_size = 2 *
> -                               sizeof(struct plat_serial8250_port),
>                 },
>                 {}
>         };
>
> -       for (; cell && cell->name; cell++) {
> +       for (; cell && cell->hid; cell++) {
>                 if (!strcmp(cell->hid, hid)) {
>                         found = true;
>                         break;
> @@ -540,31 +555,12 @@ static int hisi_lpc_acpi_add_child(struct acpi_device *child, void *data)
>                 return 0;
>         }
>
> -       pdev = platform_device_alloc(cell->name, PLATFORM_DEVID_AUTO);
> +       pdev = platform_device_register_full(cell->pdevinfo);
>         if (!pdev)
>                 return -ENOMEM;
>
> -       pdev->dev.parent = hostdev;
> -       ACPI_COMPANION_SET(&pdev->dev, child);
> -
> -       ret = platform_device_add_resources(pdev, res, num_res);
> -       if (ret)
> -               goto fail;
> -
> -       ret = platform_device_add_data(pdev, cell->pdata, cell->pdata_size);
> -       if (ret)
> -               goto fail;
> -
> -       ret = platform_device_add(pdev);
> -       if (ret)
> -               goto fail;
> -
>         acpi_device_set_enumerated(child);
>         return 0;
> -
> -fail:
> -       platform_device_put(pdev);
> -       return ret;
>  }
>
>  /*
> --
> 2.35.3
>


-- 
With Best Regards,
Andy Shevchenko
