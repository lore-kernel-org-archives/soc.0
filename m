Return-Path: <SRS0=0Q5n=FX=gmail.com=geert.uytterhoeven@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27630E95A91
	for <soc@archiver.kernel.org>; Mon,  9 Oct 2023 09:51:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id E3A60C433C8; Mon,  9 Oct 2023 09:51:41 +0000 (UTC)
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 7FEDFC433C9
	for <soc@kernel.org>; Mon,  9 Oct 2023 09:51:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 7FEDFC433C9
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-5a7a7e9357eso1010537b3.0
        for <soc@kernel.org>; Mon, 09 Oct 2023 02:51:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696845099; x=1697449899;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EcpLpgd1f1+Ipojmn8r+iB3J9d+aLm5CFxyQ8kyrL4E=;
        b=Y9NZdMe3E0Owfp+ewTpfXT+Q+CdH+4fGMuCXg+Tcg/z5SWRHjyRpW2kdS52UZyo9nr
         tWNYrFCWxp4zzE55Q8dVQ5saoKbOrtureGio37kdXy8a7KZKWRivLBhoEJx8Z9pYUqdb
         4O3ZAw6EuJyHaqmOkw8jzHnYAmsjg9TQmYeizlTFW+g9uTB3c5amra6jqtH0Bpzo8x1H
         ni31+LSeEcl7XR7MVGxGvvHCMGoU0N4ax2YzecDi1d+ajuyy4US0mdEvebJ93WV9xZFT
         5YOopbUVP1mI8jJ16WiK+Iq4ou3B3zFmhirYnIwdofG6Mdw1+ZHaVJdq3WvSE+v578ML
         EwUA==
X-Gm-Message-State: AOJu0YyhgNW7xQgTeEf+RaUc/exro2NkpiNJIG16Oif8VeRD6G2Dy7NL
	Orkem0cTg1Oi6R4ogp35X6jYvVtr8S07Xg==
X-Google-Smtp-Source: AGHT+IHsb/zzlvZM28lTQQjpK4TtCm+kWAmf90GtnkFcDkSXy8Vgpf8mYWjsbNcBffYtXCcf0YNVDQ==
X-Received: by 2002:a81:52c3:0:b0:59f:7ddc:ecd with SMTP id g186-20020a8152c3000000b0059f7ddc0ecdmr14182929ywb.18.1696845099265;
        Mon, 09 Oct 2023 02:51:39 -0700 (PDT)
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com. [209.85.219.169])
        by smtp.gmail.com with ESMTPSA id s20-20020a81bf54000000b0059f7ca6beb4sm3573586ywk.55.2023.10.09.02.51.38
        for <soc@kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Oct 2023 02:51:38 -0700 (PDT)
Received: by mail-yb1-f169.google.com with SMTP id 3f1490d57ef6-d8162698f0dso4811452276.0
        for <soc@kernel.org>; Mon, 09 Oct 2023 02:51:38 -0700 (PDT)
X-Received: by 2002:a25:18c1:0:b0:d81:61fd:ef5d with SMTP id
 184-20020a2518c1000000b00d8161fdef5dmr11643273yby.27.1696845098183; Mon, 09
 Oct 2023 02:51:38 -0700 (PDT)
MIME-Version: 1.0
References: <20231009074121.219686-1-hch@lst.de> <20231009074121.219686-2-hch@lst.de>
 <CAMuHMdWiYDQ5J7R7hPaVAYgXqJvpjdksoF6X-zHrJ_80Ly4XfQ@mail.gmail.com>
 <20231009091625.GB22463@lst.de> <CAMuHMdUZNewD-QC8J7MWSBP197Vc169meOjjK6=b7M11kVjUzg@mail.gmail.com>
 <20231009094330.GA24836@lst.de>
In-Reply-To: <20231009094330.GA24836@lst.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 9 Oct 2023 11:51:25 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV2FXdUHtjYW8JyXGBgHhR8De0vp3Ee77e6G8Vbs3gG8Q@mail.gmail.com>
Message-ID: <CAMuHMdV2FXdUHtjYW8JyXGBgHhR8De0vp3Ee77e6G8Vbs3gG8Q@mail.gmail.com>
Subject: Re: [PATCH 1/6] dma-direct: add depdenencies to CONFIG_DMA_GLOBAL_POOL
To: Christoph Hellwig <hch@lst.de>
List-Id: <soc.lore.kernel.org>
Cc: iommu@lists.linux.dev, Robin Murphy <robin.murphy@arm.com>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, Wei Fang <wei.fang@nxp.com>, 
	Shenwei Wang <shenwei.wang@nxp.com>, Clark Wang <xiaoning.wang@nxp.com>, 
	NXP Linux Team <linux-imx@nxp.com>, linux-m68k@lists.linux-m68k.org, netdev@vger.kernel.org, 
	Jim Quinlan <james.quinlan@broadcom.com>, linux-riscv <linux-riscv@lists.infradead.org>, 
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>, 
	"Lad, Prabhakar" <prabhakar.mahadev-lad.rj@bp.renesas.com>, arm-soc <soc@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Christoph,

CC soc

On Mon, Oct 9, 2023 at 11:43=E2=80=AFAM Christoph Hellwig <hch@lst.de> wrot=
e:
> On Mon, Oct 09, 2023 at 11:34:55AM +0200, Geert Uytterhoeven wrote:
> > The fix you are referring too is probably commit c1ec4b450ab729e3
> > ("soc: renesas: Make ARCH_R9A07G043 (riscv version) depend
> > on NONPORTABLE") in next-20231006 and later.  It is not yet upstream.
> >
> > Still, it merely makes ARCH_R9A07G043 (which selects DMA_GLOBAL_POOL)
> > depend on ARCH_R9A07G043.
> > RISCV_DMA_NONCOHERENT still selects DMA_DIRECT_REMAP, so both can end
> > up being enabled.
>
> Ok, so we need to actually fix this properly.  Lad, can you respin
> the fix to not select DMA_DIRECT_REMAP, for ARCH_R9A07G043?

ARCH_R9A07G043 does not select DMA_DIRECT_REMAP directly,
RISCV_DMA_NONCOHERENT does.  And there are other users of
RISCV_DMA_NONCOHERENT (RISCV_ISA_ZICBOM and ERRATA_THEAD_CMO).
Should the selection of DMA_DIRECT_REMAP moved to their users?

Note that the fix is already in soc/for-next, so we need coordination
with the soc people.

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
