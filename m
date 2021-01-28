Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BD02C433DB
	for <soc@archiver.kernel.org>; Thu, 28 Jan 2021 13:09:08 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id E0D9064D9F; Thu, 28 Jan 2021 13:09:07 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id BA22964DCE;
	Thu, 28 Jan 2021 13:09:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1611839347;
	bh=9UUhdzVs1Luzsc36rjprbo7SHkOZfpWE3bDthRfo4tQ=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=V/ciuMreyajgRfXDv1LXcikvp4ftxunWi9u2CXmpngghhtj1wQHOfeMT6xFDYTbEB
	 fyptP9NV6AaVya7y0ySoa1YsVdxrvcHP4wSq+8LCU06wRTCCpWqPMrMUaKINMRc4nB
	 +zTXDCque9rmLJzESpgu4Z0xtZAAE0SeLpC3GgxiXqz9/diydP3K00EFq2ZTy4jXv4
	 PAu11C2YWYthtt4GpweLOsDYt2TIfBdZ2tHFqA0WEKFj7I4cSgF4UyHUXm5KUvbVA7
	 q62TNp3ZrAk/XC2sY0qy5AF4VER/CWwSR5v7JrCdZ1vD2E4tVkxWnp04jeWgKUFxWK
	 lt04bQooytW8g==
Received: by mail-oo1-f49.google.com with SMTP id g46so1384835ooi.9;
        Thu, 28 Jan 2021 05:09:07 -0800 (PST)
X-Gm-Message-State: AOAM531mEgtUaJAQrvrmBpa4QLlAzp3LIR+NsJ0cc+Q/G1gLWd0nCo1B
	VGE++1kA3gFyrPWe+ghoSYnJepq2kbuZt7lsNI4=
X-Google-Smtp-Source: ABdhPJwEHr8rXznwbZ4T8LesNhwR1DrcOoDhimytnVFtIhLM1cbCLRmadQRp1G+XggAUgaqOFcQE1ZlayRg1zh+aHOQ=
X-Received: by 2002:a4a:bb01:: with SMTP id f1mr11445306oop.66.1611839347000;
 Thu, 28 Jan 2021 05:09:07 -0800 (PST)
MIME-Version: 1.0
References: <20210128075825.10368-1-avolmat@me.com>
In-Reply-To: <20210128075825.10368-1-avolmat@me.com>
From: Arnd Bergmann <arnd@kernel.org>
Date: Thu, 28 Jan 2021 14:08:51 +0100
X-Gmail-Original-Message-ID: <CAK8P3a2TxPHc60c7+FoLm831rTPvyftRixL+BQfeVf3p_szopA@mail.gmail.com>
Message-ID: <CAK8P3a2TxPHc60c7+FoLm831rTPvyftRixL+BQfeVf3p_szopA@mail.gmail.com>
Subject: Re: [PATCH 2/2] ARM: dts: sti: Introduce 4KOpen (stih418-b2264) board
To: Alain Volmat <avolmat@me.com>
List-Id: <soc.lore.kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, SoC Team <soc@kernel.org>, 
	Rob Herring <robh+dt@kernel.org>, Patrice Chotard <patrice.chotard@st.com>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, DTML <devicetree@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, Jan 28, 2021 at 8:58 AM Alain Volmat <avolmat@me.com> wrote:
>
> 4KOpen (B2264) is a board based on the STMicroelectronics STiH418 soc:
>   - 2GB DDR
>   - HDMI
>   - Ethernet 1000-BaseT
>   - PCIe (mini PCIe connector)
>   - MicroSD slot
>   - USB2 and USB3 connectors
>   - Sata
>   - 40 pins GPIO header
>
> Signed-off-by: Alain Volmat <avolmat@me.com>

The changelog text seems fine here.

> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (C) 2021 STMicroelectronics
> + * Author: Alain Volmat <avolmat@me.com>
> + */
> +/dts-v1/;
> +#include "stih418.dtsi"
> +#include <dt-bindings/gpio/gpio.h>
> +/ {
> +       model = "STiH418 B2264";
> +       compatible = "st,stih418-b2264", "st,stih418";
> +
> +       chosen {
> +               bootargs = "console=ttyAS0,115200 clk_ignore_unused";
> +               stdout-path = &sbc_serial0;
> +       };

I don't think the bootargs should be there, both are just hacks
when things don't work correctly. If they don't, then try to fix them
first, by making sure that all clocks are properly listed, and that the
stdou-path points the working console.

> +&rng11 {
> +       status = "disabled";
> +};

Why do you disable the random number generator?

       Arnd
