Return-Path: <SRS0=H6g9=F2=gmail.com=geert.uytterhoeven@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80973CDB46E
	for <soc@archiver.kernel.org>; Thu, 12 Oct 2023 12:15:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 403F4C433C8; Thu, 12 Oct 2023 12:15:36 +0000 (UTC)
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id CFA6AC433C7;
	Thu, 12 Oct 2023 12:15:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org CFA6AC433C7
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-5a7c08b7744so10836157b3.3;
        Thu, 12 Oct 2023 05:15:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697112933; x=1697717733;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wl3I/2bXbjqN636hLulYiW7jhp7Ro5bp+FnjB/CpQr8=;
        b=CPMlvluXq4ErIKul2SAGbpQvFZB1l14gqqBVG4WsZgwtITEzcx0J6MRk+L3XTwk78P
         GI3GSnaZjMiRYtMVXKf2eL11zrXZHURSXojEgx+hQpGkmvqzpdUbE4GaV3YSfYMAa1VN
         4Flknsw3tq98QKxmc+HCzbcxjHRAyhfM6M/aQbXoaYiDREoJ7SxawDReFAf1yjYpXTwH
         OB+iKNhjq2zaHFqW2X4guhQDEJRIjZms+QEjpDb9BSbd9BmJj78gTHLIxQWQQYF5+jka
         CAKFpFrCprE2/IokzVdzueG1yFNYhahQxxuuNUuCVAkWgOGD4y4m552vSSmSP18ygGED
         yocQ==
X-Gm-Message-State: AOJu0YyQ3Is/YGMsiUk2H3Qs26fRPpltRgkKMRI0M9gFcwIy2zQ8VPG4
	Et14CzvXmIWynp8kNv9oRBp4RLza97SIRg==
X-Google-Smtp-Source: AGHT+IERolPXvQTgQhw9TRd4L32CSkta8hv2sOMDEXogIAmX6vo70hmx5s6CW/XfAhsjcw2Vs4qcmA==
X-Received: by 2002:a25:d048:0:b0:d9a:49cd:8327 with SMTP id h69-20020a25d048000000b00d9a49cd8327mr8790972ybg.55.1697112933569;
        Thu, 12 Oct 2023 05:15:33 -0700 (PDT)
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com. [209.85.128.181])
        by smtp.gmail.com with ESMTPSA id z4-20020a254c04000000b00d9a36ded1besm2179414yba.6.2023.10.12.05.15.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Oct 2023 05:15:33 -0700 (PDT)
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-5a7dafb659cso11218417b3.0;
        Thu, 12 Oct 2023 05:15:33 -0700 (PDT)
X-Received: by 2002:a0d:d40f:0:b0:59b:fe46:82de with SMTP id
 w15-20020a0dd40f000000b0059bfe4682demr24538814ywd.18.1697112932799; Thu, 12
 Oct 2023 05:15:32 -0700 (PDT)
MIME-Version: 1.0
References: <20231012-pouch-parkway-7d26c04b3300@spud>
In-Reply-To: <20231012-pouch-parkway-7d26c04b3300@spud>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 12 Oct 2023 14:15:21 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWRzoBgxxkF6kpxr4tpUM4BzHnMUmW3vDR_BrrXiKae5Q@mail.gmail.com>
Message-ID: <CAMuHMdWRzoBgxxkF6kpxr4tpUM4BzHnMUmW3vDR_BrrXiKae5Q@mail.gmail.com>
Subject: Re: [PATCH v2] soc: renesas: make ARCH_R9A07G043 depend on required options
To: Conor Dooley <conor@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: linux-renesas-soc@vger.kernel.org, 
	Conor Dooley <conor.dooley@microchip.com>, Randy Dunlap <rdunlap@infradead.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, soc@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Conor,

On Thu, Oct 12, 2023 at 1:11=E2=80=AFPM Conor Dooley <conor@kernel.org> wro=
te:
> From: Conor Dooley <conor.dooley@microchip.com>
>
> Randy reported a randconfig build issue against linux-next:
> WARNING: unmet direct dependencies detected for ERRATA_ANDES
>   Depends on [n]: RISCV_ALTERNATIVE [=3Dn] && RISCV_SBI [=3Dy]
>   Selected by [y]:
>   - ARCH_R9A07G043 [=3Dy] && SOC_RENESAS [=3Dy] && RISCV [=3Dy] && NONPOR=
TABLE [=3Dy] && RISCV_SBI [=3Dy]
>
> ../arch/riscv/errata/andes/errata.c:59:54: warning: 'struct alt_entry' de=
clared inside parameter list will not be visible outside of this definition=
 or declaration
>    59 | void __init_or_module andes_errata_patch_func(struct alt_entry *b=
egin, struct alt_entry *end,
>
> On RISC-V, alternatives are not usable in XIP kernels, which this
> randconfig happened to select. Rather than add a check for whether
> alternatives are available before selecting the ERRATA_ANDES config
> option, rework the R9A07G043 Kconfig entry to depend on the
> configuration options required to support its non-standard cache
> coherency implementation.
>
> Without these options enabled, the SoC is effectively non-functional to
> begin with, so there's an extra benefit in preventing the creation of
> non-functional kernels.
>
> The "if RISCV_DMA_NONCOHERENT" can be dropped, as ERRATA_ANDES_CMO will
> select it.
>
> Reported-by: Randy Dunlap <rdunlap@infradead.org>
> Closes: https://lore.kernel.org/all/09a6b0f0-76a1-45e3-ab52-329c47393d1d@=
infradead.org/
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>
> I dropped Randy's t-b etc since this patch is quite different.
>
> v2: drop the extra condition on the select of ERRATA_ANDES, move instead
> to depending on required options.

Thanks for the update!

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-fixes for v6.6.

> --- a/drivers/soc/renesas/Kconfig
> +++ b/drivers/soc/renesas/Kconfig
> @@ -340,10 +340,12 @@ if RISCV
>  config ARCH_R9A07G043
>         bool "RISC-V Platform support for RZ/Five"
>         depends on NONPORTABLE
> +       depends on RISCV_ALTERNATIVE
> +       depends on RISCV_SBI
>         select ARCH_RZG2L
> -       select AX45MP_L2_CACHE if RISCV_DMA_NONCOHERENT
> +       select AX45MP_L2_CACHE
>         select DMA_GLOBAL_POOL
> -       select ERRATA_ANDES if RISCV_SBI
> +       select ERRATA_ANDES
>         select ERRATA_ANDES_CMO if ERRATA_ANDES

As ERRATA_ANDES is now selected unconditionally, the test
for it can be removed.  I can do that while applying.

>         help
>           This enables support for the Renesas RZ/Five SoC.

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
