Return-Path: <SRS0=ZyEH=G7=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62D23C433E0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 Jan 2021 13:10:16 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0EA7564D9F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 Jan 2021 13:10:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0EA7564D9F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=KgIMPlPcCEGIUaO/V6X1dEgbOiMLYPeeXHTZZNFo/8k=; b=iWvj4u4AradmFa7ml1QYXJLI7
	p1yhovECKpJ9fJTdyGSGK3C8jsNpXT4dgSQnUcnFXFSl6MY/rk0X09vY46bDj4BPuAcy/QF5jPC7F
	nnxpvgL91AWljzR62DyX5iTdbDbrwAtG5xzKWPQzMpwbWzrwt7RfhREZq2m3bpWTSh2Qc5/tRAyzw
	NFhiL1rYHRhYHIHhcVzG5j6wWH5W5O7Ovp4AL5kRbYnzFBE9GTtlnx60i75wSl/gPCK0spe2A28E1
	JAZ0xkVA/mN4M1XNsX9KH4zGR8OdczKA/OX+oh1Sd2eM3q+/cWhLM3n99H9L76AwkwbeJMcY47MPX
	fWeeygiRA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l572u-0006Mg-LZ; Thu, 28 Jan 2021 13:09:12 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l572q-0006LA-P6
 for linux-arm-kernel@lists.infradead.org; Thu, 28 Jan 2021 13:09:09 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id C120564DDE
 for <linux-arm-kernel@lists.infradead.org>;
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
Received: by mail-oo1-f51.google.com with SMTP id x23so1397063oop.1
 for <linux-arm-kernel@lists.infradead.org>;
 Thu, 28 Jan 2021 05:09:07 -0800 (PST)
X-Gm-Message-State: AOAM5339e39Brb0R0Ch/QsvxifRBmLjlatphjsWR4HXL0OuubnXgp1X7
 UUTC8Ax9mRW3YhxFevULNyjxvA2lH9raIjboU8k=
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
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210128_080908_913280_01D06DB3 
X-CRM114-Status: GOOD (  15.62  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
List-Id: <soc.lore.kernel.org>
Cc: DTML <devicetree@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Patrice Chotard <patrice.chotard@st.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 SoC Team <soc@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Olof Johansson <olof@lixom.net>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210128130851.T9UhkvUPqRiSzlTEGruwqetY0pxAyUvyiIJKUKyo1x0@z>

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

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
