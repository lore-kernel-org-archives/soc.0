Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5189FC433B4
	for <soc@archiver.kernel.org>; Fri, 23 Apr 2021 13:48:09 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 21EA261463; Fri, 23 Apr 2021 13:48:09 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0CA3C61460
	for <soc@kernel.org>; Fri, 23 Apr 2021 13:48:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1619185689;
	bh=zLi5x1sC9WOXj9HAtVI7DhaxVPxmTPooKmLPsEGZs8A=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=W4hLBGON1IFbdbBYCl0CCE02i3Wttdb+QibmfopVnK+wlvFJ8rlPuG+xW4YZRwdqm
	 PS4DsqDFadu+sDrln3x0+ytYrIBIN1iHjnTsZene0LnS0HHGL0O89+TVorIHooCUYV
	 nhV77JSumyt5F97SJKhR1MGyJl+uSfyQxqQ3dkYzz7i5lIt6NVQ0yvn/fi1mBo6Uz1
	 XdtbfiyqGx7yBE6L6ffNcHcwEMsqdtpnJL8uf+71nBBXqnXlNF+tQCPs8BYhWpTGOe
	 oor7bd4zg/tC/APMSBJp8JptK4Xv22exHmiK3YIUNzExw/pHkCFJbkQuRd01MD8Mf0
	 /ZhCSH1QVfXEQ==
Received: by mail-wm1-f47.google.com with SMTP id n127so14269021wmb.5
        for <soc@kernel.org>; Fri, 23 Apr 2021 06:48:08 -0700 (PDT)
X-Gm-Message-State: AOAM5315A0Smt5zP6KQj+ElENl86UVw9n41upGs/bYKiwf9+13FYqkm6
	xp1+8e2sq+ktpuObTKnvQnXs289+O/6s4rybsCk=
X-Google-Smtp-Source: ABdhPJygoTRm8fteVdnqwcXtTEkbSmTTyzL+scFg0e8teY+/geuDsF37+mNNxFz9YcRndpDzH5TeJljHATMDcjJUPvk=
X-Received: by 2002:a7b:c344:: with SMTP id l4mr5605549wmj.120.1619185687518;
 Fri, 23 Apr 2021 06:48:07 -0700 (PDT)
MIME-Version: 1.0
References: <20210422140945.4131092-1-daniel@0x0f.com> <20210422140945.4131092-2-daniel@0x0f.com>
In-Reply-To: <20210422140945.4131092-2-daniel@0x0f.com>
From: Arnd Bergmann <arnd@kernel.org>
Date: Fri, 23 Apr 2021 15:47:44 +0200
X-Gmail-Original-Message-ID: <CAK8P3a3fkjy2YYwhmsFQt-MSyOh=1zf1wqzQB7usjsHbUBWdtQ@mail.gmail.com>
Message-ID: <CAK8P3a3fkjy2YYwhmsFQt-MSyOh=1zf1wqzQB7usjsHbUBWdtQ@mail.gmail.com>
Subject: Re: [RFC PATCH 1/2] ARM: mstar: Add header with macros for RIU
 register access
To: Daniel Palmer <daniel@0x0f.com>
List-Id: <soc.lore.kernel.org>
Cc: SoC Team <soc@kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Olof Johansson <olof@lixom.net>, Willy Tarreau <w@1wt.eu>
Content-Type: text/plain; charset="UTF-8"

On Thu, Apr 22, 2021 at 4:11 PM Daniel Palmer <daniel@0x0f.com> wrote:

> +
> +#include <linux/io.h>
> +
> +static inline u32 riu_readl(__iomem void *base, unsigned int offset)

The __iomem token comes after the type, so this should be 'void __iomem *'.

> +       return readw_relaxed(reg + 4) << 16 | readw_relaxed(reg);

This should probably be using 'readw' instead of 'readw_relaxed'. If you
absolutely need to use one of the relaxed accessors somewhere,
better add both sets and make sure drivers use the non-relaxed version
by default.

Maybe both types of accessors can be in a single header.

     Arnd
