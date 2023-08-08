Return-Path: <SRS0=GMDj=DZ=linaro.org=ulf.hansson@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F4FDC001DB
	for <soc@archiver.kernel.org>; Tue,  8 Aug 2023 14:43:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id E329CC433CA; Tue,  8 Aug 2023 14:43:01 +0000 (UTC)
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id BECFCC433CB
	for <soc@kernel.org>; Tue,  8 Aug 2023 14:42:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org BECFCC433CB
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-583b3939521so66161287b3.0
        for <soc@kernel.org>; Tue, 08 Aug 2023 07:42:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691505778; x=1692110578;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=hpGMNxDDvo9T1v6v+RkICvblRXd4nkGe288y9gyoNGg=;
        b=PedPSrSpmrUdDKDIWni1uzt9dOQEhkcJXBt03X8fOj8cA2I4oXdOk+/JR/O646UVmn
         Lo/X0oO4bABVAJWVnLqejcHktzU+On5DUnRN/iEThDrLcHJV3B0NGtr+ETaFutgXAbQ4
         yKyW0CjQ6bvkIW1s7njggN4U9S/fRSlqNMsNWexb5Rq0mLeZhHV08LvHiNpJElZMW4Nf
         eKNMoOav0AcaSbUxc1BFJdgWmjbkN8GWNWCtvvge8QeFWOYe1taiElNa2rquEuALXsRU
         OsLNRtxErDGr7eXnxZD1YoZ+N6ifYV05DAuWRZT8zk+mvOdmdS1/IzXioS+NgKUNcXvK
         ZUOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691505778; x=1692110578;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hpGMNxDDvo9T1v6v+RkICvblRXd4nkGe288y9gyoNGg=;
        b=VpnwyHbIjNUjZYG3xnhcfrxUPDiljTuWYx5zSFzZUijZEWCByulopmHQLSQoRIjrRg
         7IDPPJlPv9GHop2dHlEdT6rGaMtuEQybLT5Yg5SGU2/RSy8C6FqKoOtu4PZsE+qytqxA
         4e3fIRnbSJKg9wUdbpNJhWWYVwPOo5CqAkg/K5XQqwb5YbEivGVaFSYhbZy7vXNzUPe9
         n8js/rHwFqGTgIF8P1TVeXCX9CevG0OGhJtFouHkmOI4YMlV2y2t0QMnFZ91YthckTjU
         vcnbp8HJSsSUk/U8dVg/kjl3KJpm5EzyOCft3WO+Wdv34HVl/P8HDkmHqV6IyHXyORLG
         pxIA==
X-Gm-Message-State: AOJu0YzujNqr56Jsz71VnhhviuOqaNNEv2o0nTW93EBLVV+zk+iFaKCE
	kYereRA7XZD9CvV1K6gZnEF1mqwcRQA2NZG9nndvng==
X-Google-Smtp-Source: AGHT+IEQ0B+zFHwu6lwq9ShhqNgqoAUPtqEjQdph6xX3V3JEjoRX0Qpcb7z9XgUddzrDP+CIGW7eIVIsmdM1+EjIYR4=
X-Received: by 2002:a25:df82:0:b0:d47:4ed4:43eb with SMTP id
 w124-20020a25df82000000b00d474ed443ebmr10840010ybg.63.1691505778468; Tue, 08
 Aug 2023 07:42:58 -0700 (PDT)
MIME-Version: 1.0
References: <20230803063703.5659-1-zhuyinbo@loongson.cn> <20230803063703.5659-3-zhuyinbo@loongson.cn>
 <4fef9725-7aea-43fb-b8ef-d20a4c6d9a68@app.fastmail.com>
In-Reply-To: <4fef9725-7aea-43fb-b8ef-d20a4c6d9a68@app.fastmail.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 8 Aug 2023 16:42:22 +0200
Message-ID: <CAPDyKFo7p=aEWWrW2OGbhN1tFjHanpqjLApzCMipdPSzE+NknQ@mail.gmail.com>
Subject: Re: [PATCH v6 2/2] soc: loongson2_pm: add power management support
To: Arnd Bergmann <arnd@arndb.de>
List-Id: <soc.lore.kernel.org>
Cc: Yinbo Zhu <zhuyinbo@loongson.cn>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-pm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, soc@kernel.org, 
	Jianmin Lv <lvjianmin@loongson.cn>, wanghongliang@loongson.cn, 
	Liu Peibao <liupeibao@loongson.cn>, loongson-kernel@lists.loongnix.cn, 
	loongarch@lists.linux.dev, Liu Yun <liuyun@loongson.cn>
Content-Type: text/plain; charset="UTF-8"

On Thu, 3 Aug 2023 at 09:03, Arnd Bergmann <arnd@arndb.de> wrote:
>
> On Thu, Aug 3, 2023, at 08:37, Yinbo Zhu wrote:
> > The Loongson-2's power management controller was ACPI, supports ACPI
> > S2Idle (Suspend To Idle), ACPI S3 (Suspend To RAM), ACPI S4 (Suspend To
> > Disk), ACPI S5 (Soft Shutdown) and supports multiple wake-up methods
> > (USB, GMAC, PWRBTN, etc.). This driver was to add power management
> > controller support that base on dts for Loongson-2 series SoCs.
> >
> > Co-developed-by: Liu Yun <liuyun@loongson.cn>
> > Signed-off-by: Liu Yun <liuyun@loongson.cn>
> > Co-developed-by: Liu Peibao <liupeibao@loongson.cn>
> > Signed-off-by: Liu Peibao <liupeibao@loongson.cn>
> > Cc: soc@kernel.org
> > Cc: Ulf Hansson <ulf.hansson@linaro.org>
> > Signed-off-by: Yinbo Zhu <zhuyinbo@loongson.cn>
>
> I'm still waiting for Ulf to take a look here to see whether
> this should be in drivers/genpd instead, but he might still
> be on vacation.

I don't think this belongs in drivers/genpd/ as it's not a genpd
provider. Besides that, no further comments from me at this point.

Kind regards
Uffe

>
> A few minor comments from me in the meantime:
>
> > +#define loongson2_pm_readw(reg)              readw(loongson2_pm.base + reg)
> > +#define loongson2_pm_readl(reg)              readl(loongson2_pm.base + reg)
> > +#define loongson2_pm_writew(val, reg)        writew(val, loongson2_pm.base +
> > reg)
> > +#define loongson2_pm_writel(val, reg)        writel(val, loongson2_pm.base +
> > reg)
>
> I would prefer these to be 'static inline' functions rather than
> macros, or you can just open-code them, as each macro is only
> used once at the moment.
>
> > +static irqreturn_t loongson2_pm_irq_handler(int irq, void *dev_id)
> > +{
> > +     u16 status = loongson2_pm_readw(LOONGSON2_PM1_STS_REG);
> > +
> > +     if (!loongson2_pm.suspended && (status & LOONGSON2_PM1_PWRBTN_STS)) {
> > +             pr_info("Power Button pressed...\n");
>
> The message is probably more appropriate as a pr_debug() than
> pr_info().
>
> > +static int __maybe_unused loongson2_pm_suspend(struct device *dev)
> > +{
> > +     loongson2_pm.suspended = true;
> > +
> > +     return 0;
> > +}
> > +
> > +static int __maybe_unused loongson2_pm_resume(struct device *dev)
> > +{
> > +     loongson2_pm.suspended = false;
> > +
> > +     return 0;
> > +}
> > +static SIMPLE_DEV_PM_OPS(loongson2_pm_ops, loongson2_pm_suspend,
> > loongson2_pm_resume);
>
> Please change this to DEFINE_SIMPLE_DEV_PM_OPS() and remove the
> __maybe_unused, this is what all drivers should have these days.
>
> > +
> > +static int loongson2_pm_probe(struct platform_device *pdev)
> > +{
> > +     int irq, retval;
> > +     u64 suspend_addr;
> > +     struct device *dev = &pdev->dev;
> > +
> > +     loongson2_pm.base = devm_platform_ioremap_resource(pdev, 0);
> > +     if (IS_ERR(loongson2_pm.base))
> > +             return PTR_ERR(loongson2_pm.base);
> > +
> > +     irq = platform_get_irq(pdev, 0);
> > +     if (irq < 0)
> > +             return irq;
> > +
> > +     if (!device_property_read_u64(dev, "loongson,suspend-address",
> > &suspend_addr))
> > +             loongson_sysconf.suspend_addr = (u64)phys_to_virt(suspend_addr);
> > +     else
>
> Having a custom "loongson,suspend-address" property here feels wrong
> to me. Can't this be moved into the "regs" property that holds
> the other mmio registers?
>
>     Arnd
