Return-Path: <SRS0=ZEIE=VT=gmail.com=jirislaby@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F78BC433F5
	for <soc@archiver.kernel.org>; Wed, 11 May 2022 06:47:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 64198C385DB; Wed, 11 May 2022 06:47:55 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 6CB63C385A7;
	Wed, 11 May 2022 06:47:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 6CB63C385A7
Authentication-Results: smtp.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f41.google.com with SMTP id i20-20020a05600c355400b0039456976dcaso2002176wmq.1;
        Tue, 10 May 2022 23:47:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=d0+VSEkVTN5UKp/1tlZfodLf5D5A+zx04J2EOUOCF00=;
        b=fAWE0MGqV8Yzv+L5Yj/ZYO+ETbKiRUXUZZ+gPReLd88FoBJyK6VV3RNK6GTdtTMydR
         fj8nm6p5C5eW2zPR++ZlDrJASjwXmoe9dUveGCAcwNMbi9NQGTfvGUsvK4B8RHAcY5vk
         XjI3MHEWkY4PqbVIAhc87Uzr3fyMg22tyhg1n42L/F1i35sFhmlbhlTYGatoC/W4MsYq
         3rvrunXESNwS2klNyaHbS88n10ngjq1lj/tmfjuTOJVv/iemBR8whGvXNhzpp7M1wIdc
         rKqt2vu+CfJvrB7wIVnDc29m2Q24njpkujQrfHUgCglvw7xx1i8B4+fcdazQIJIyPxxi
         ueWA==
X-Gm-Message-State: AOAM532CfLFrtGXLVKDDQhVFRXNmWqA0XWshUvOh0ltyRMCFqKEfKtFO
	U8+WBA/s8yBX925JntsKzEHDAVtuYyq/mX66
X-Google-Smtp-Source: ABdhPJzpnoc2OQxaCLNzOlLY2Q6PMGILiG41ZK3gGqRANQoSQNuIjjpR7zhzwOg/QpERIZ7XiCnJ5Q==
X-Received: by 2002:a05:600c:6021:b0:394:56be:18e with SMTP id az33-20020a05600c602100b0039456be018emr3207844wmb.86.1652251672631;
        Tue, 10 May 2022 23:47:52 -0700 (PDT)
Received: from ?IPV6:2a0b:e7c0:0:107::70f? ([2a0b:e7c0:0:107::70f])
        by smtp.gmail.com with ESMTPSA id m36-20020a05600c3b2400b003942a244edbsm1446971wms.32.2022.05.10.23.47.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 May 2022 23:47:52 -0700 (PDT)
Message-ID: <48cfa0b3-0424-81bd-ac6a-d631184b71b7@kernel.org>
Date: Wed, 11 May 2022 08:47:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v4 1/1] soc: fujitsu: Add A64FX diagnostic interrupt
 driver
Content-Language: en-US
List-Id: <soc.lore.kernel.org>
To: Hitomi Hasegawa <hasegawa-hitomi@fujitsu.com>,
 linux-arm-kernel@lists.infradead.org, soc@kernel.org,
 linux-serial@vger.kernel.org, sumit.garg@linaro.org
Cc: arnd@arndb.de, olof@lixom.net, catalin.marinas@arm.com, will@kernel.org,
 gregkh@linuxfoundation.org, jason.wessel@windriver.com,
 daniel.thompson@linaro.org, dianders@chromium.org,
 linux-kernel@vger.kernel.org, kgdb-bugreport@lists.sourceforge.net,
 peterz@infradead.org
References: <20220511062113.2645747-1-hasegawa-hitomi@fujitsu.com>
 <20220511062113.2645747-2-hasegawa-hitomi@fujitsu.com>
From: Jiri Slaby <jirislaby@kernel.org>
In-Reply-To: <20220511062113.2645747-2-hasegawa-hitomi@fujitsu.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11. 05. 22, 8:21, Hitomi Hasegawa wrote:
> Enable diagnostic interrupts for the Fujitsu A64FX.
> 
> Register the NMI/IRQ corresponding to the A64FX's device definition
> dedicated to diagnostic interrupts, so that when this interrupt is
> sent using the BMC, it causes a panic. This can be used to obtain
> a kernel dump.
> 
> Signed-off-by: Hitomi Hasegawa <hasegawa-hitomi@fujitsu.com>

Hi,

I'm not sure why you cc linux-serial, but anyway, comments below :).

> --- /dev/null
> +++ b/drivers/soc/fujitsu/a64fx-diag.c
> @@ -0,0 +1,155 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * A64FX diag driver.
> + * Copyright (c) 2022 Fujitsu Ltd.
> + */
> +
> +#include <linux/acpi.h>
> +#include <linux/interrupt.h>
> +#include <linux/irq.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +
> +#define A64FX_DIAG_IRQ 1
> +#define BMC_DIAG_INTERRUPT_STATUS_OFFSET (0x0044)
> +#define BMC_DIAG_INTERRUPT_ENABLE_OFFSET (0x0040)
> +#define BMC_DIAG_INTERRUPT_MASK BIT(31)
> +
> +struct a64fx_diag_priv {
> +	int irq;
> +	void __iomem *mmsc_reg_base;
> +	bool has_nmi;

There are unnecessary holes in the struct. If you reorder it, you drop 
some alignment. Like: pointer, int, bool.

> +};
> +
> +static irqreturn_t a64fx_diag_handler_nmi(int irq, void *dev_id)
> +{
> +	nmi_panic(NULL, "a64fx_diag: interrupt received\n");
> +
> +	return IRQ_HANDLED;
> +}
> +
> +static irqreturn_t a64fx_diag_handler_irq(int irq, void *dev_id)
> +{
> +	panic("a64fx_diag: interrupt received\n");
> +
> +	return IRQ_HANDLED;
> +}
> +
> +static void a64fx_diag_interrupt_clear(struct a64fx_diag_priv *priv)
> +{
> +	u32 mmsc;
> +	void __iomem *diag_status_reg_addr;

I'm not sure what soc/ maintainers prefer, but inverted xmas tree would 
look/read better.

> +
> +	diag_status_reg_addr = priv->mmsc_reg_base + BMC_DIAG_INTERRUPT_STATUS_OFFSET;
> +	mmsc = readl(diag_status_reg_addr);
> +	if (mmsc & BMC_DIAG_INTERRUPT_MASK)
> +		writel(BMC_DIAG_INTERRUPT_MASK, diag_status_reg_addr);
> +}
> +
> +static void a64fx_diag_interrupt_enable(struct a64fx_diag_priv *priv)
> +{
> +	u32 mmsc;
> +	void __iomem *diag_enable_reg_addr;
> +
> +	diag_enable_reg_addr = priv->mmsc_reg_base + BMC_DIAG_INTERRUPT_ENABLE_OFFSET;
> +	mmsc = readl(diag_enable_reg_addr);
> +	if (!(mmsc & BMC_DIAG_INTERRUPT_MASK)) {
> +		mmsc |= BMC_DIAG_INTERRUPT_MASK;
> +		writel(mmsc, diag_enable_reg_addr);
> +	}
> +}
> +
> +static void a64fx_diag_interrupt_disable(struct a64fx_diag_priv *priv)
> +{
> +	u32 mmsc;
> +	void __iomem *diag_enable_reg_addr;
> +
> +	diag_enable_reg_addr = priv->mmsc_reg_base + BMC_DIAG_INTERRUPT_ENABLE_OFFSET;
> +	mmsc = readl(diag_enable_reg_addr);
> +	if (mmsc & BMC_DIAG_INTERRUPT_MASK) {
> +		mmsc &= ~BMC_DIAG_INTERRUPT_MASK;
> +		writel(mmsc, diag_enable_reg_addr);
> +	}
> +}
> +
> +static int a64fx_diag_probe(struct platform_device *pdev)
> +{
> +	int ret;
> +	unsigned long irq_flags;
> +	struct device *dev = &pdev->dev;
> +	struct a64fx_diag_priv *priv;
> +
> +	priv = devm_kzalloc(dev, sizeof(struct a64fx_diag_priv), GFP_KERNEL);

Don't we prefer sizeof(*priv)?

> +	if (priv == NULL)
> +		return -ENOMEM;
> +
> +	priv->mmsc_reg_base = devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(priv->mmsc_reg_base))
> +		return PTR_ERR(priv->mmsc_reg_base);
> +
> +	priv->irq = platform_get_irq(pdev, A64FX_DIAG_IRQ);
> +	if (priv->irq < 0)
> +		return priv->irq;
> +
> +	platform_set_drvdata(pdev, priv);
> +
> +	a64fx_diag_interrupt_clear(priv);
> +	a64fx_diag_interrupt_enable(priv);
> +
> +	irq_flags = IRQF_PERCPU | IRQF_NOBALANCING | IRQF_NO_AUTOEN |
> +		   IRQF_NO_THREAD;
> +	ret = request_nmi(priv->irq, &a64fx_diag_handler_nmi, irq_flags,
> +			"a64fx_diag_nmi", NULL);
> +	if (ret) {
> +		ret = request_irq(priv->irq, &a64fx_diag_handler_irq,
> +				irq_flags, "a64fx_diag_irq", NULL);
> +		if (ret) {
> +			dev_err(dev, "cannot register IRQ %d\n", ret);

No a64fx_diag_interrupt_disable()?

> +			return ret;
> +		}
> +		enable_irq(priv->irq);

Hmm...

> +		priv->has_nmi = false;

No need to set zeroed priv member to zero.

> +	} else {
> +		enable_nmi(priv->irq);

Provided the above, I don't immediatelly see, what's the purpose of 
IRQF_NO_AUTOEN then?

> +		priv->has_nmi = true;
> +	}
> +
> +	return 0;
> +}
> +
> +static int __exit a64fx_diag_remove(struct platform_device *pdev)

Is __exit appropriate here at all -- I doubt that.

> +{
> +	struct a64fx_diag_priv *priv = platform_get_drvdata(pdev);
> +
> +	a64fx_diag_interrupt_disable(priv);
> +	a64fx_diag_interrupt_clear(priv);
> +
> +	if (priv->has_nmi)
> +		free_nmi(priv->irq, NULL);
> +	else
> +		free_irq(priv->irq, NULL);
> +
> +	return 0;
> +}
> +
> +static const struct acpi_device_id a64fx_diag_acpi_match[] = {
> +	{ "FUJI2007", 0 },
> +	{ },
> +};
> +MODULE_DEVICE_TABLE(acpi, a64fx_diag_acpi_match);
> +
> +
> +static struct platform_driver a64fx_diag_driver = {
> +	.driver = {
> +		.name = "a64fx_diag_driver",
> +		.acpi_match_table = ACPI_PTR(a64fx_diag_acpi_match),
> +	},
> +	.probe = a64fx_diag_probe,
> +	.remove = a64fx_diag_remove,
> +};
> +
> +module_platform_driver(a64fx_diag_driver);
> +
> +MODULE_LICENSE("GPL v2");
> +MODULE_AUTHOR("Hitomi Hasegawa <hasegawa-hitomi@fujitsu.com>");
> +MODULE_DESCRIPTION("A64FX diag driver");


-- 
js
suse labs
