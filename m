Return-Path: <SRS0=C1Vs=TB=arndb.de=arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 928AFC433F5
	for <soc@archiver.kernel.org>; Fri, 18 Feb 2022 10:35:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 4FE00C340EB; Fri, 18 Feb 2022 10:35:49 +0000 (UTC)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 897A9C340E9;
	Fri, 18 Feb 2022 10:35:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 897A9C340E9
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=arndb.de
Received: from mail-wm1-f49.google.com ([209.85.128.49]) by
 mrelayeu.kundenserver.de (mreue010 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1N63i4-1oMpYX1rg0-016O8D; Fri, 18 Feb 2022 11:35:45 +0100
Received: by mail-wm1-f49.google.com with SMTP id l67-20020a1c2546000000b00353951c3f62so6052954wml.5;
        Fri, 18 Feb 2022 02:35:45 -0800 (PST)
X-Gm-Message-State: AOAM531P6G8g5IiVdiPKeT60SnVXD/oBi63fS6lmyFDXHCqggSkUMarp
	zhm9BBWOCS6RhfdevQPIkla7yQZrQsdEd3lPMIA=
X-Google-Smtp-Source: ABdhPJxegF6Lx2MRfZLiyyJbPRuvy1H0vVQp0nSTW6sUo3a4VvdtM0CLnAmCs3mdimm+ojDxtBptmtjSQF23Pl5wm9I=
X-Received: by 2002:a05:600c:2108:b0:34e:870:966e with SMTP id
 u8-20020a05600c210800b0034e0870966emr10029708wml.173.1645180545005; Fri, 18
 Feb 2022 02:35:45 -0800 (PST)
MIME-Version: 1.0
References: <20220218092010.1327309-1-hasegawa-hitomi@fujitsu.com>
In-Reply-To: <20220218092010.1327309-1-hasegawa-hitomi@fujitsu.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Fri, 18 Feb 2022 11:35:29 +0100
X-Gmail-Original-Message-ID: <CAK8P3a027OWYrRDm3r930pYo+He7bqVSEpQKjM9od1W8ciamyw@mail.gmail.com>
Message-ID: <CAK8P3a027OWYrRDm3r930pYo+He7bqVSEpQKjM9od1W8ciamyw@mail.gmail.com>
Subject: Re: [PATCH] soc: fujitsu: Add A64FX diagnostic interrupt driver
To: Hitomi Hasegawa <hasegawa-hitomi@fujitsu.com>
List-Id: <soc.lore.kernel.org>
Cc: Linux ARM <linux-arm-kernel@lists.infradead.org>, SoC Team <soc@kernel.org>, 
	Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:6dSjOHl8iyNouXUIKIh10/l02u2jGcrQq1VHRsUryjTXSjxxUZR
 dVjZuvXkH7mhT3+QfdXVxm+ISRoeHKjeBj0aGWhnPVrh9KawCge4Hrr9DuLxSB5guU6mI+d
 w6svrXmxfPUG6O47gFc8OSSgV1go8UN+9zhF10w5hDsXXFe1wjUsKvp234fWdgdlt2DV/Mm
 oI39s8RtYCGBkxwnD3f3Q==
X-UI-Out-Filterresults: notjunk:1;V03:K0:mtELuJjWyUc=:MANd7HdvVcPT9Rw2hqoC/j
 TtAc2AoTmmr6OtBzgo1EACFmPzizqA3sLPhAyNHtrrmVnci6S8SzG7lIg6+K7eWgCCYRL/8fO
 8rjgnwBzQ0hDk8MzbMR4khc+Vs7sy4tCwdyvsaw4If9EDkYKgMkT04MMl8k6R1DKOWsRbW91m
 mMt3VjbtHnmJc5SclYhDTmQXtx5SSljDwGdWjEYrwOmlYrmdaiwHxb47XEBWCIGaZQwkNcpcQ
 BkOm9y9bB+hkp7F9QolDASMqI9q/JiezluVewNWVT/ZrOfIbxWamkg70jUqrjxggAhwdGfK10
 7hs0L7bxWodku+6LKqZ53/LTsziVcBxYjDWCebnyTmtHnBqj0Tjr/yY00Sf4mjNi0PKiIK1Fl
 43Fbs74S4Qf2dQWXjPl6hb9M51hfIpYOrA3ypRquI2G//P6ojFybxTKiW+1kXgsSeft8N2ZrK
 jevF8SF14L9wCPfsMIFDL7HNaLTPD/cPd7C7OEtZtFgqaFtQMrSF6pOy0Dgjtx1R/R2ZWmc95
 92/v6wCAYNEDGZ+dTm1o+yoJIgcHjSmumx260auLUdClUz064oB8S5YjqPK4960pvjv8jjJqO
 hmncl8ZQQMi/sFmRRQAyWaBZLmYmSd0iIA+fURlRpO0aMydVoGZ0s02nLwdumLfLiaYXLFuiA
 POjTWlUSZVfyJ77XjqSxsmFYCR0NXHRuHVYu/LtpH+JmzKMqKhJ+5RjRhaeXZsn8vhna7r3U1
 RFndDlaTO+gCRHcWwr17EW4UxmRVdGwF6EZ9YdIOaRIIEysk5IQhz+kp/oQr6RjRZak0W8ZZ6
 GjxxtjLjYVnh6PkymvHBvQYIpGTHg5XXfm8YFgcIAooW/07OXg=

On Fri, Feb 18, 2022 at 10:20 AM Hitomi Hasegawa
<hasegawa-hitomi@fujitsu.com> wrote:
> +
> +static irqreturn_t a64fx_panic_interrupt_nmi(int irq, void *dev_id)
> +{
> +       nmi_panic(NULL, "a64fx_panic_interrupt: interrupt received\n");
> +
> +       return IRQ_HANDLED;
> +}
> +
> +static irqreturn_t a64fx_panic_interrupt_irq(int irq, void *dev_id)
> +{
> +       panic("a64fx_panic_interrupt: interrupt received\n");
> +
> +       return IRQ_HANDLED;
> +}

Is panic() the best action for this? I'm not familiar with this feature, but
it sounds like handle_sysrq() might be more appropriate. How does a
user trigger the event, and is there any sideband data that can be
sent along with the interrupt?

> +static void a64fx_diag_interrupt_clear(struct a64fx_diag_priv *priv)
> +{
> +       u32 mmsc;
> +       const void __iomem *diag_status_reg_addr;
> +
> +       diag_status_reg_addr = priv->mmsc_reg_base + BMC_DIAG_INTERRUPT_STATUS_OFFSET;
> +       mmsc = readl_relaxed(diag_status_reg_addr);
> +       if (mmsc & BMC_INTERRUPT_STATUS_MASK)
> +               writel_relaxed(BMC_INTERRUPT_STATUS_MASK, (void *)diag_status_reg_addr);
> +}

Normal driver code should use readl()/writel(), not
readl_relaxed()/writel_relaxed().
If you do need the relaxed versions, please add a comment explaining why,
otherwise change the code here and below.

       Arnd
