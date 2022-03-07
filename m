Return-Path: <SRS0=IkeH=TS=linaro.org=sumit.garg@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFBB2C433F5
	for <soc@archiver.kernel.org>; Mon,  7 Mar 2022 11:49:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 9259DC340F7; Mon,  7 Mar 2022 11:49:59 +0000 (UTC)
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 33C39C340F5
	for <soc@kernel.org>; Mon,  7 Mar 2022 11:49:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 33C39C340F5
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f173.google.com with SMTP id z26so11810467lji.8
        for <soc@kernel.org>; Mon, 07 Mar 2022 03:49:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=3oNYsvo/F5DGbw8OUwaIiDSPumnbVG2IEq3aeIvy6mQ=;
        b=q9YyJ+jhCvpuHK0K7JPpF2ke/kCBSFI5muT5vbDOE32JHr8TsYQTl2S1DMiAeB+qfa
         n6p6OkDZhS7gYcrBsTXclKrTitHbvBOWPjgjs35rMA8S9N77+ePdBO34Tp3BlAtbFSeC
         5GVf7eS+M/CrXoV5qxm53zW0RxjQ8tI0V1Xh8sv+dmywWKVWHWmA5qh7u4YvweR1yPHF
         ydDSUGhwe3HLomIY33JF8EWuQuu6gnIwLb5lrvN+bzykYEc0ue7dRv3ubp8p7wsUVSYD
         AMtfPQvv3rWa6hu1SDByWuvR+HUWp2ZnH4MkjGtSC1I/mVTrekZ08cbiOullyY+2bpEC
         9RwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3oNYsvo/F5DGbw8OUwaIiDSPumnbVG2IEq3aeIvy6mQ=;
        b=8R28dwSZRJQ+5aRoJVq/Pq94k+tbk6LNdG13i3JZC9D1mHYwudO0btjPN9LvECcKrh
         REqFf/IwOdJ6liHRWzG7E/qAHz5oWX/5F3V5ucHSIHHEIpABVRe1ABuPd5Fo8cmjoB7d
         ZlqUpTfiyKERjkBcNjgaA8Rn4UbIP6YvJVaK3e+yNY8VvFj1X+9rtoliUW+y/tRs5WsD
         M+AvAACL77EmjMt49hkm6fn7RYyiu2QAoFtBl6MO/PTC03GfH+VrNNldgJesfl8QfDrv
         Wl6QxXU/R5y/ZlkqWSeU8FwGrDrHBOOZgChlxpc26fFF70nfgg0AuPzZLRJs92UaROyr
         UH/g==
X-Gm-Message-State: AOAM532C88uj+Ia2W9h3Tv4+J6cuFA2sG/gDpPhu9xsZfRfN5VVOu/e5
	sSRdQWYZO3yEoUf8UbyPYPEoGfYevz7dA1YM+CqgxA==
X-Google-Smtp-Source: ABdhPJw4bJq4WfIgUCEtKkQKqNSB/sOky7s1uibTCNu/t+Y6ALSxpyerIB06LbZuJvmINwIq9p7zHptOUtcn3LbcAYk=
X-Received: by 2002:a2e:8798:0:b0:244:d49b:956a with SMTP id
 n24-20020a2e8798000000b00244d49b956amr7227130lji.420.1646653796221; Mon, 07
 Mar 2022 03:49:56 -0800 (PST)
MIME-Version: 1.0
References: <20220304064324.331217-1-hasegawa-hitomi@fujitsu.com> <20220304064324.331217-3-hasegawa-hitomi@fujitsu.com>
In-Reply-To: <20220304064324.331217-3-hasegawa-hitomi@fujitsu.com>
From: Sumit Garg <sumit.garg@linaro.org>
Date: Mon, 7 Mar 2022 17:19:44 +0530
Message-ID: <CAFA6WYMESyto9bFtk2qNBMi40BkJOoUKpYtAScXjb3yunhHTJA@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] soc: fujitsu: Add A64FX diagnostic interrupt driver
To: Hitomi Hasegawa <hasegawa-hitomi@fujitsu.com>
List-Id: <soc.lore.kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, soc@kernel.org, 
	linux-serial@vger.kernel.org, arnd@arndb.de, olof@lixom.net, 
	catalin.marinas@arm.com, will@kernel.org, gregkh@linuxfoundation.org, 
	jirislaby@kernel.org, jason.wessel@windriver.com, daniel.thompson@linaro.org, 
	dianders@chromium.org, linux-kernel@vger.kernel.org, 
	kgdb-bugreport@lists.sourceforge.net, peterz@infradead.org
Content-Type: text/plain; charset="UTF-8"

Hi Hitomi,

On Fri, 4 Mar 2022 at 12:15, Hitomi Hasegawa
<hasegawa-hitomi@fujitsu.com> wrote:
>
> Enable diagnostic interrupts for the A64FX.
> This is done using a pseudo-NMI.
>
> Signed-off-by: Hitomi Hasegawa <hasegawa-hitomi@fujitsu.com>
> ---
>  MAINTAINERS                      |   5 +
>  drivers/soc/Kconfig              |   1 +
>  drivers/soc/Makefile             |   1 +
>  drivers/soc/fujitsu/Kconfig      |  13 +++
>  drivers/soc/fujitsu/Makefile     |   3 +
>  drivers/soc/fujitsu/a64fx-diag.c | 151 +++++++++++++++++++++++++++++++
>  6 files changed, 174 insertions(+)
>  create mode 100644 drivers/soc/fujitsu/Kconfig
>  create mode 100644 drivers/soc/fujitsu/Makefile
>  create mode 100644 drivers/soc/fujitsu/a64fx-diag.c
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index dd36acc87ce6..e9663fa92a52 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -239,6 +239,11 @@ F: include/trace/events/9p.h
>  F:     include/uapi/linux/virtio_9p.h
>  F:     net/9p/
>
> +A64FX DIAG DRIVER
> +M:     Hitomi Hasegawa <hasegawa-hitomi@fujitsu.com>
> +S:     Supported
> +F:     drivers/soc/fujitsu/a64fx-diag.c
> +
>  A8293 MEDIA DRIVER
>  M:     Antti Palosaari <crope@iki.fi>
>  L:     linux-media@vger.kernel.org
> diff --git a/drivers/soc/Kconfig b/drivers/soc/Kconfig
> index e8a30c4c5aec..0405ff0b3be6 100644
> --- a/drivers/soc/Kconfig
> +++ b/drivers/soc/Kconfig
> @@ -8,6 +8,7 @@ source "drivers/soc/atmel/Kconfig"
>  source "drivers/soc/bcm/Kconfig"
>  source "drivers/soc/canaan/Kconfig"
>  source "drivers/soc/fsl/Kconfig"
> +source "drivers/soc/fujitsu/Kconfig"
>  source "drivers/soc/imx/Kconfig"
>  source "drivers/soc/ixp4xx/Kconfig"
>  source "drivers/soc/litex/Kconfig"
> diff --git a/drivers/soc/Makefile b/drivers/soc/Makefile
> index a05e9fbcd3e0..86596405a39c 100644
> --- a/drivers/soc/Makefile
> +++ b/drivers/soc/Makefile
> @@ -11,6 +11,7 @@ obj-$(CONFIG_SOC_CANAAN)      += canaan/
>  obj-$(CONFIG_ARCH_DOVE)                += dove/
>  obj-$(CONFIG_MACH_DOVE)                += dove/
>  obj-y                          += fsl/
> +obj-y                          += fujitsu/
>  obj-$(CONFIG_ARCH_GEMINI)      += gemini/
>  obj-y                          += imx/
>  obj-y                          += ixp4xx/
> diff --git a/drivers/soc/fujitsu/Kconfig b/drivers/soc/fujitsu/Kconfig
> new file mode 100644
> index 000000000000..b41cdac67637
> --- /dev/null
> +++ b/drivers/soc/fujitsu/Kconfig
> @@ -0,0 +1,13 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +menu "fujitsu SoC drivers"
> +
> +config A64FX_DIAG
> +       bool "A64FX diag driver"
> +       depends on ARM64
> +       help
> +         Say Y here if you want to enable diag interrupt on A64FX.
> +         This driver uses pseudo-NMI if available.
> +
> +         If unsure, say N.
> +
> +endmenu
> diff --git a/drivers/soc/fujitsu/Makefile b/drivers/soc/fujitsu/Makefile
> new file mode 100644
> index 000000000000..945bc1c14ad0
> --- /dev/null
> +++ b/drivers/soc/fujitsu/Makefile
> @@ -0,0 +1,3 @@
> +# SPDX-License-Identifier: GPL-2.0
> +
> +obj-$(CONFIG_A64FX_DIAG)       += a64fx-diag.o
> diff --git a/drivers/soc/fujitsu/a64fx-diag.c b/drivers/soc/fujitsu/a64fx-diag.c
> new file mode 100644
> index 000000000000..c6f895cf8912
> --- /dev/null
> +++ b/drivers/soc/fujitsu/a64fx-diag.c
> @@ -0,0 +1,151 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * A64FX diag driver.
> + */
> +
> +#include <linux/acpi.h>
> +#include <linux/interrupt.h>
> +#include <linux/irq.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +#include <linux/sysrq.h>
> +
> +#define A64FX_DIAG_IRQ 1
> +#define BMC_DIAG_INTERRUPT_STATUS_OFFSET (0x0044)
> +#define BMC_INTERRUPT_STATUS_MASK ((1U) << 31)
> +#define BMC_DIAG_INTERRUPT_ENABLE_OFFSET (0x0040)
> +#define BMC_INTERRUPT_ENABLE_MASK ((1U) << 31)
> +
> +struct a64fx_diag_priv {
> +       int irq;
> +       void __iomem *mmsc_reg_base;
> +       bool has_nmi;
> +};
> +
> +static irqreturn_t a64fx_diag_handler(int irq, void *dev_id)
> +{
> +       handle_sysrq('c');
> +

Would it be possible to pass a dynamic sysrq key from BMC to the host
as that would unleash the true power of sysrq in an NMI context
capable of launching kdb as one example?

-Sumit

> +       return IRQ_HANDLED;
> +}
> +
> +static void a64fx_diag_interrupt_clear(struct a64fx_diag_priv *priv)
> +{
> +       u32 mmsc;
> +       const void __iomem *diag_status_reg_addr;
> +
> +       diag_status_reg_addr = priv->mmsc_reg_base + BMC_DIAG_INTERRUPT_STATUS_OFFSET;
> +       mmsc = readl(diag_status_reg_addr);
> +       if (mmsc & BMC_INTERRUPT_STATUS_MASK)
> +               writel(BMC_INTERRUPT_STATUS_MASK, (void *)diag_status_reg_addr);
> +}
> +
> +static void a64fx_diag_interrupt_enable(struct a64fx_diag_priv *priv)
> +{
> +       u32 mmsc;
> +       const void __iomem *diag_enable_reg_addr;
> +
> +       diag_enable_reg_addr = priv->mmsc_reg_base + BMC_DIAG_INTERRUPT_ENABLE_OFFSET;
> +       mmsc = readl(diag_enable_reg_addr);
> +       if (!(mmsc & BMC_INTERRUPT_ENABLE_MASK)) {
> +               mmsc |= BMC_INTERRUPT_STATUS_MASK;
> +               writel(mmsc, (void *)diag_enable_reg_addr);
> +       }
> +}
> +
> +static void a64fx_diag_interrupt_disable(struct a64fx_diag_priv *priv)
> +{
> +       u32 mmsc;
> +       const void __iomem *diag_enable_reg_addr;
> +
> +       diag_enable_reg_addr = priv->mmsc_reg_base + BMC_DIAG_INTERRUPT_ENABLE_OFFSET;
> +       mmsc = readl(diag_enable_reg_addr);
> +       if (mmsc & BMC_INTERRUPT_ENABLE_MASK) {
> +               mmsc &= ~BMC_INTERRUPT_ENABLE_MASK;
> +               writel(mmsc, (void *)diag_enable_reg_addr);
> +       }
> +}
> +
> +static int a64fx_diag_probe(struct platform_device *pdev)
> +{
> +       int ret;
> +       unsigned long irq_flags;
> +       struct device *dev = &pdev->dev;
> +       struct a64fx_diag_priv *priv;
> +
> +       priv = devm_kzalloc(dev, sizeof(struct a64fx_diag_priv), GFP_KERNEL);
> +       if (priv == NULL)
> +               return -ENOMEM;
> +
> +       priv->mmsc_reg_base = devm_platform_ioremap_resource(pdev, 0);
> +       if (IS_ERR(priv->mmsc_reg_base))
> +               return PTR_ERR(priv->mmsc_reg_base);
> +
> +       priv->irq = platform_get_irq(pdev, A64FX_DIAG_IRQ);
> +       if (priv->irq < 0)
> +               return priv->irq;
> +
> +       platform_set_drvdata(pdev, priv);
> +
> +       a64fx_diag_interrupt_clear(priv);
> +       a64fx_diag_interrupt_enable(priv);
> +
> +       irq_flags = IRQF_PERCPU | IRQF_NOBALANCING | IRQF_NO_AUTOEN |
> +                  IRQF_NO_THREAD;
> +       ret = request_nmi(priv->irq, &a64fx_diag_handler, irq_flags,
> +                       "a64fx_diag_nmi", NULL);
> +       if (ret) {
> +               ret = request_irq(priv->irq, &a64fx_diag_handler,
> +                               irq_flags, "a64fx_diag_irq", NULL);
> +               if (ret) {
> +                       dev_err(dev, "cannot register IRQ %d\n", ret);
> +                       return ret;
> +               }
> +               enable_irq(priv->irq);
> +               priv->has_nmi = false;
> +               dev_info(dev, "registered for IRQ %d\n", priv->irq);
> +       } else {
> +               enable_nmi(priv->irq);
> +               priv->has_nmi = true;
> +               dev_info(dev, "registered for NMI %d\n", priv->irq);
> +       }
> +
> +       return 0;
> +}
> +
> +static int __exit a64fx_diag_remove(struct platform_device *pdev)
> +{
> +       struct a64fx_diag_priv *priv = platform_get_drvdata(pdev);
> +
> +       a64fx_diag_interrupt_disable(priv);
> +       a64fx_diag_interrupt_clear(priv);
> +
> +       if (priv->has_nmi)
> +               free_nmi(priv->irq, NULL);
> +       else
> +               free_irq(priv->irq, NULL);
> +
> +       return 0;
> +}
> +
> +static const struct acpi_device_id a64fx_diag_acpi_match[] = {
> +       { "FUJI2007", 0 },
> +       { },
> +};
> +MODULE_DEVICE_TABLE(acpi, a64fx_diag_acpi_match);
> +
> +
> +static struct platform_driver a64fx_diag_driver = {
> +       .driver = {
> +               .name = "a64fx_diag_driver",
> +               .acpi_match_table = ACPI_PTR(a64fx_diag_acpi_match),
> +       },
> +       .probe = a64fx_diag_probe,
> +       .remove = a64fx_diag_remove,
> +};
> +
> +module_platform_driver(a64fx_diag_driver);
> +
> +MODULE_LICENSE("GPL v2");
> +MODULE_AUTHOR("Hitomi Hasegawa <hasegawa-hitomi@fujitsu.com>");
> +MODULE_DESCRIPTION("A64FX diag driver");
> --
> 2.27.0
>
