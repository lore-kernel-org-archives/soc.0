Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3698C433E0
	for <soc@archiver.kernel.org>; Thu, 11 Feb 2021 11:52:36 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 7CE2464ED0; Thu, 11 Feb 2021 11:52:36 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4AFFF64E6F;
	Thu, 11 Feb 2021 11:52:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1613044356;
	bh=PBeGwLjGEVNJ7GvWXwV/HotbITgDYxhkIawMCH+Lrbs=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=UWUJO+bsvWVj78WCD0fvipRTLnOXddNZEaQduxHnMCUXe77oubK0cIAs9RDYceIvG
	 cooHtk01MuGnQsKy5R9I0hwrTPTpmTc3bOU2jsOakaZzwz9PZ14g9XY92xu9EroeDz
	 86Pae8VNn9oqBg72oBPh8UzbLdSaaxXvC8WA9721EJmHmJZiXOdTQ6tHGSRgN5jKYt
	 m/56TcdYnvel4dhiyjVJPnxd8M4BKBTKfKZgm6O6+UHTj7f5GJ/Hcu5DiT2+oSNbmS
	 6LITPe3qmLaQFJQD13hmuw8tozlRoV0LRNo56kNCkMlu25moBI2ycn0Waxp8Mk4RsU
	 BMoejHV7l3gCA==
Received: by mail-oi1-f180.google.com with SMTP id f3so2002701oiw.13;
        Thu, 11 Feb 2021 03:52:36 -0800 (PST)
X-Gm-Message-State: AOAM5326pNmboRhihZAYGm9iggXA8xfcH38uGfliCyr7Y+HRngYyoefh
	KlpXahGKJsSl14dcWqZ+W9TOgxvPsJjo07D6E98=
X-Google-Smtp-Source: ABdhPJzGRc5cUize8GW1KygKY5QB0/6HYJu2d/5NJ6GASLOCiQXtKEwJmHvgaTx+l4EO/iyAwaQnn0uo6oHda0i+L3M=
X-Received: by 2002:aca:e103:: with SMTP id y3mr2307802oig.11.1613044355483;
 Thu, 11 Feb 2021 03:52:35 -0800 (PST)
MIME-Version: 1.0
References: <20210210190506.1923684-1-anders.roxell@linaro.org>
In-Reply-To: <20210210190506.1923684-1-anders.roxell@linaro.org>
From: Arnd Bergmann <arnd@kernel.org>
Date: Thu, 11 Feb 2021 12:52:19 +0100
X-Gmail-Original-Message-ID: <CAK8P3a2ysNApoG2FDsLdNoWA7nPXvzLMzkjXWdCig9jaSWwuKw@mail.gmail.com>
Message-ID: <CAK8P3a2ysNApoG2FDsLdNoWA7nPXvzLMzkjXWdCig9jaSWwuKw@mail.gmail.com>
Subject: Re: [PATCH] arm64: defconfig: enable modern virtio pci device
To: Anders Roxell <anders.roxell@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: SoC Team <soc@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	Russell King - ARM Linux <linux@armlinux.org.uk>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	Michael Ellerman <mpe@ellerman.id.au>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Chris Zankel <chris@zankel.net>, Max Filippov <jcmvbkbc@gmail.com>, 
	"open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, 
	linux-riscv <linux-riscv@lists.infradead.org>, linux-xtensa@linux-xtensa.org, 
	"Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>, 
	virtualization@lists.linux-foundation.org, Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="UTF-8"

On Wed, Feb 10, 2021 at 8:05 PM Anders Roxell <anders.roxell@linaro.org> wrote:
>
> Since patch ("virtio-pci: introduce modern device module") got added it
> is not possible to boot a defconfig kernel in qemu with a virtio pci
> device.  Add CONFIG_VIRTIO_PCI_MODERN=y fragment makes the kernel able
> to boot.
>
> Signed-off-by: Anders Roxell <anders.roxell@linaro.org>
> ---
>  arch/arm/configs/multi_v7_defconfig         | 1 +
>  arch/arm64/configs/defconfig                | 1 +

Acked-by: Arnd Bergmann <arnd@arndb.de>

Michael, can you pick this up in the vhost tree that introduces the regression?

         Arnd
