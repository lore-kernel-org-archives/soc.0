Return-Path: <SRS0=+DPY=GO=gmail.com=prabhakar.csengg@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FF73C4167B
	for <soc@archiver.kernel.org>; Wed,  1 Nov 2023 16:55:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 3CA4BC433C9; Wed,  1 Nov 2023 16:55:05 +0000 (UTC)
Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id D0971C433C8
	for <soc@kernel.org>; Wed,  1 Nov 2023 16:55:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org D0971C433C8
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f52.google.com with SMTP id 46e09a7af769-6ce322b62aeso4338410a34.3
        for <soc@kernel.org>; Wed, 01 Nov 2023 09:55:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698857701; x=1699462501; darn=kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CwUrtJF5cSmaSOwk46tcXUzBT42i9cnlTuP0Y/SquhQ=;
        b=R30+S23Dc9pyg2EfaG90z3ab2xr4CYQmUPdPIC/mDERsmwYGWj5gj+q2R97J4B0KEd
         68Ml/LGZIuyZxOQEgepEgoUtPu3gEfvnW2fy63otyr3tt13e3syGxGMNp/ixH6k4SrN1
         u1DVubhxS5gqPsA9DfFy+CvLJTAcND1BtxZugFmDn9azc1OdfBd7j6INz4ibsbHD/Fev
         Hv4KQ7bUt4a6Rr4tE8YLqdIWF3EP8IqglgtjHNf1/7nrHbe26Vv4za9HQUqlLt1soO6a
         0SRghEfX6+0rhX5vxE5IBH78fi3vxqYp9EDZ9sOh8Ygl4MGbtJQ4LSCfxLna+XFEz+yW
         XCvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698857701; x=1699462501;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CwUrtJF5cSmaSOwk46tcXUzBT42i9cnlTuP0Y/SquhQ=;
        b=XXdpUSFa0CGJy+sbsEAHzcfUikAqFe+XGkOO5Be5DD8L9AaIoF2P0rI+3hpCG93KeS
         gsaemWOChhXTvaWBHXQ876/lazcHSYlHofWJ1+cBe4la2r4U77UJu+8mac0cxXu3bPql
         zNrRcg0ZBSYdNHUJLbTPjblvXeTufZvesxbFXEgsJCDpx9wt0BtsIdvUntRPZKqEM1zz
         TmoJw1O+x9B6P+ohhyCV/CD1dmSPh/Eh4weO2UGlB4Rp+3UR4bHNqvnxsk9UQ12T3YT+
         pwpuiM4uFBBztaJFIP7NfA4X0x46sPHKd6AXgPNaM3JWUedR9e/3kV4pMBKgRwc2Q8XX
         3BSA==
X-Gm-Message-State: AOJu0YxWSwsmKFMfAdFyDmiBOOJOkD0f9dANjHKxItnhLPi/u2qWk676
	ANbIBOeXv4BiKyJRZ6t/i1TllMV2+xDb8QWIakA=
X-Google-Smtp-Source: AGHT+IGzIOOf5ZiXWYX06EYatfjv+c51rMmsFsnzhtgelnRLy2iIgVtHs5uhL5C9EoNmX/zPv7+Bc99ty25L52+enwA=
X-Received: by 2002:a05:6830:410b:b0:6b9:bd9d:e333 with SMTP id
 w11-20020a056830410b00b006b9bd9de333mr17880966ott.3.1698857700794; Wed, 01
 Nov 2023 09:55:00 -0700 (PDT)
MIME-Version: 1.0
References: <20231028155101.1039049-1-hch@lst.de>
In-Reply-To: <20231028155101.1039049-1-hch@lst.de>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Wed, 1 Nov 2023 16:54:31 +0000
Message-ID: <CA+V-a8sEO38o2OKcW7nryD=dnPowF9s3Ov0R2rKJecZ4ZVEYQg@mail.gmail.com>
Subject: Re: [PATCH] riscv: split cache ops out of dma-noncoherent.c
To: Christoph Hellwig <hch@lst.de>
List-Id: <soc.lore.kernel.org>
Cc: geert+renesas@glider.be, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	conor.dooley@microchip.com, linux-riscv@lists.infradead.org, soc@kernel.org, 
	kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 28, 2023 at 4:55=E2=80=AFPM Christoph Hellwig <hch@lst.de> wrot=
e:
>
> The cache ops are also used by the pmem code which is unconditionally
> built into the kernel.  Move them into a separate file that is built
> based on the correct config option.
>
> Fixes: fd962781270e ("riscv: RISCV_NONSTANDARD_CACHE_OPS shouldn't depend=
 on RISCV_DMA_NONCOHERENT")
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  arch/riscv/mm/Makefile          |  1 +
>  arch/riscv/mm/cache-ops.c       | 17 +++++++++++++++++
>  arch/riscv/mm/dma-noncoherent.c | 15 ---------------
>  3 files changed, 18 insertions(+), 15 deletions(-)
>  create mode 100644 arch/riscv/mm/cache-ops.c
>

Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Tested-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com> #
On RZ/Five SMARC

Cheers,
Prabhakar

> diff --git a/arch/riscv/mm/Makefile b/arch/riscv/mm/Makefile
> index 9c454f90fd3da2..3a4dfc8babcf8c 100644
> --- a/arch/riscv/mm/Makefile
> +++ b/arch/riscv/mm/Makefile
> @@ -36,3 +36,4 @@ endif
>
>  obj-$(CONFIG_DEBUG_VIRTUAL) +=3D physaddr.o
>  obj-$(CONFIG_RISCV_DMA_NONCOHERENT) +=3D dma-noncoherent.o
> +obj-$(CONFIG_RISCV_NONSTANDARD_CACHE_OPS) +=3D cache-ops.o
> diff --git a/arch/riscv/mm/cache-ops.c b/arch/riscv/mm/cache-ops.c
> new file mode 100644
> index 00000000000000..a993ad11d0eca9
> --- /dev/null
> +++ b/arch/riscv/mm/cache-ops.c
> @@ -0,0 +1,17 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) 2021 Western Digital Corporation or its affiliates.
> + */
> +
> +#include <asm/dma-noncoherent.h>
> +
> +struct riscv_nonstd_cache_ops noncoherent_cache_ops __ro_after_init;
> +
> +void
> +riscv_noncoherent_register_cache_ops(const struct riscv_nonstd_cache_ops=
 *ops)
> +{
> +       if (!ops)
> +               return;
> +       noncoherent_cache_ops =3D *ops;
> +}
> +EXPORT_SYMBOL_GPL(riscv_noncoherent_register_cache_ops);
> diff --git a/arch/riscv/mm/dma-noncoherent.c b/arch/riscv/mm/dma-noncoher=
ent.c
> index b76e7e192eb183..341bd6706b4c56 100644
> --- a/arch/riscv/mm/dma-noncoherent.c
> +++ b/arch/riscv/mm/dma-noncoherent.c
> @@ -15,12 +15,6 @@ static bool noncoherent_supported __ro_after_init;
>  int dma_cache_alignment __ro_after_init =3D ARCH_DMA_MINALIGN;
>  EXPORT_SYMBOL_GPL(dma_cache_alignment);
>
> -struct riscv_nonstd_cache_ops noncoherent_cache_ops __ro_after_init =3D =
{
> -       .wback =3D NULL,
> -       .inv =3D NULL,
> -       .wback_inv =3D NULL,
> -};
> -
>  static inline void arch_dma_cache_wback(phys_addr_t paddr, size_t size)
>  {
>         void *vaddr =3D phys_to_virt(paddr);
> @@ -162,12 +156,3 @@ void __init riscv_set_dma_cache_alignment(void)
>         if (!noncoherent_supported)
>                 dma_cache_alignment =3D 1;
>  }
> -
> -void riscv_noncoherent_register_cache_ops(const struct riscv_nonstd_cach=
e_ops *ops)
> -{
> -       if (!ops)
> -               return;
> -
> -       noncoherent_cache_ops =3D *ops;
> -}
> -EXPORT_SYMBOL_GPL(riscv_noncoherent_register_cache_ops);
> --
> 2.39.2
>
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv
