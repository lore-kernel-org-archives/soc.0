Return-Path: <SRS0=0Q5n=FX=gmail.com=geert.uytterhoeven@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 167CCE95A91
	for <soc@archiver.kernel.org>; Mon,  9 Oct 2023 11:10:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id DC8FAC433C9; Mon,  9 Oct 2023 11:10:41 +0000 (UTC)
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 6397FC433C8
	for <soc@kernel.org>; Mon,  9 Oct 2023 11:10:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 6397FC433C8
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-5a1ec43870cso53796207b3.0
        for <soc@kernel.org>; Mon, 09 Oct 2023 04:10:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696849839; x=1697454639;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TWthkWDqr7tBRS16dMRTYjQcxpjwoRQd7noLnGne1cw=;
        b=xDzvX7MPFi1kJDQ475jjq85Tp/Xi3gx1vQ8vBPV88fYsoQL3pZEJiO+1CKxHr49sQz
         z5MdCmvojiowJGM5tBEZmWegdLvoGZhM6Ejc5YHGKBMqGej0tPIxdiFeNx3WPa66qM6m
         zdSIG26BbW9oakfCsNFruImbv6E1e6M66vg1A6/VU7oYzQd2oVWUXpx+cQ9g1JLd63M6
         lyMZ+iPW702bj/YSS79ZvLHfHdN/5SBDIlNkNxOp2p3CeHcTP5Ps2Jrn9IfGqCfiKrkV
         7wiIjkMTIYnoqHSnG20nOFnT8JdubWRTfeDXALgC3MiMYeeK3QVG+en/kYawXMBd9it9
         UY2A==
X-Gm-Message-State: AOJu0YxFsuakeL+cz95EtpxkaSPov1ifIUUyDHFCpbMqwo+Uh2qA7gF6
	yH98dEIVekIAEhX74oRqC51mFQEFSZEL3w==
X-Google-Smtp-Source: AGHT+IE7KVw9FmCwQCQ00naQWmu3WGBeWXMy8aagPV4XUcjN1+dycbYrPDWSkcgX7VQ88EDzpT4v5A==
X-Received: by 2002:a05:6902:1105:b0:d85:ab4a:836 with SMTP id o5-20020a056902110500b00d85ab4a0836mr16471392ybu.39.1696849839195;
        Mon, 09 Oct 2023 04:10:39 -0700 (PDT)
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com. [209.85.128.182])
        by smtp.gmail.com with ESMTPSA id u74-20020a25ab50000000b00d7481ed7e45sm3045061ybi.56.2023.10.09.04.10.38
        for <soc@kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Oct 2023 04:10:38 -0700 (PDT)
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-59f6441215dso53530897b3.2
        for <soc@kernel.org>; Mon, 09 Oct 2023 04:10:38 -0700 (PDT)
X-Received: by 2002:a81:7b54:0:b0:595:e1b:b978 with SMTP id
 w81-20020a817b54000000b005950e1bb978mr16558396ywc.21.1696849838737; Mon, 09
 Oct 2023 04:10:38 -0700 (PDT)
MIME-Version: 1.0
References: <20231009074121.219686-1-hch@lst.de> <20231009074121.219686-2-hch@lst.de>
 <CAMuHMdWiYDQ5J7R7hPaVAYgXqJvpjdksoF6X-zHrJ_80Ly4XfQ@mail.gmail.com>
 <20231009091625.GB22463@lst.de> <CAMuHMdUZNewD-QC8J7MWSBP197Vc169meOjjK6=b7M11kVjUzg@mail.gmail.com>
 <20231009094330.GA24836@lst.de> <CAMuHMdV2FXdUHtjYW8JyXGBgHhR8De0vp3Ee77e6G8Vbs3gG8Q@mail.gmail.com>
 <1cd44af1-10ac-465a-8d20-e0aa268e036f@arm.com>
In-Reply-To: <1cd44af1-10ac-465a-8d20-e0aa268e036f@arm.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 9 Oct 2023 13:10:26 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXNX7+VLnSYhj=M9dTSTWLJqjS_WaT0ceMRUYoa5_MSeA@mail.gmail.com>
Message-ID: <CAMuHMdXNX7+VLnSYhj=M9dTSTWLJqjS_WaT0ceMRUYoa5_MSeA@mail.gmail.com>
Subject: Re: [PATCH 1/6] dma-direct: add depdenencies to CONFIG_DMA_GLOBAL_POOL
To: Robin Murphy <robin.murphy@arm.com>
List-Id: <soc.lore.kernel.org>
Cc: Christoph Hellwig <hch@lst.de>, iommu@lists.linux.dev, 
	Marek Szyprowski <m.szyprowski@samsung.com>, Wei Fang <wei.fang@nxp.com>, 
	Shenwei Wang <shenwei.wang@nxp.com>, Clark Wang <xiaoning.wang@nxp.com>, 
	NXP Linux Team <linux-imx@nxp.com>, linux-m68k@lists.linux-m68k.org, netdev@vger.kernel.org, 
	Jim Quinlan <james.quinlan@broadcom.com>, linux-riscv <linux-riscv@lists.infradead.org>, 
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>, 
	"Lad, Prabhakar" <prabhakar.mahadev-lad.rj@bp.renesas.com>, arm-soc <soc@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Robin,

On Mon, Oct 9, 2023 at 12:04=E2=80=AFPM Robin Murphy <robin.murphy@arm.com>=
 wrote:
> On 2023-10-09 10:51, Geert Uytterhoeven wrote:
> > On Mon, Oct 9, 2023 at 11:43=E2=80=AFAM Christoph Hellwig <hch@lst.de> =
wrote:
> >> On Mon, Oct 09, 2023 at 11:34:55AM +0200, Geert Uytterhoeven wrote:
> >>> The fix you are referring too is probably commit c1ec4b450ab729e3
> >>> ("soc: renesas: Make ARCH_R9A07G043 (riscv version) depend
> >>> on NONPORTABLE") in next-20231006 and later.  It is not yet upstream.
> >>>
> >>> Still, it merely makes ARCH_R9A07G043 (which selects DMA_GLOBAL_POOL)
> >>> depend on ARCH_R9A07G043.
> >>> RISCV_DMA_NONCOHERENT still selects DMA_DIRECT_REMAP, so both can end
> >>> up being enabled.
> >>
> >> Ok, so we need to actually fix this properly.  Lad, can you respin
> >> the fix to not select DMA_DIRECT_REMAP, for ARCH_R9A07G043?
> >
> > ARCH_R9A07G043 does not select DMA_DIRECT_REMAP directly,
> > RISCV_DMA_NONCOHERENT does.  And there are other users of
> > RISCV_DMA_NONCOHERENT (RISCV_ISA_ZICBOM and ERRATA_THEAD_CMO).
> > Should the selection of DMA_DIRECT_REMAP moved to their users?
>
> No, the selection of DMA_GLOBAL_POOL should be removed from
> RISV_DMA_NONCOHERENT and selected directly by ARCH_R9A07G043 (along with
> any of the other implied symbols it needs). Or if as suggested this
> physical-attribute-remap wackiness is due to show up on more platforms
> as well, maybe have a common config for that which selects
> DMA_GLOBAL_POOL plus the relevant cache maintenance extensions as an
> equivalent to RISCV_DMA_NONCOHERENT, and can itself explicitly depend on
> NONPORTABLE for clarity.

RISCV_DMA_NONCOHERENT does not select DMA_GLOBAL_POOL,
ARCH_R9A07G043 selects DMA_GLOBAL_POOL.
RISCV_DMA_NONCOHERENT does select DMA_DIRECT_REMAP if MMU.

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
