Return-Path: <SRS0=DNrK=F7=gmail.com=geert.uytterhoeven@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1D80CDB474
	for <soc@archiver.kernel.org>; Tue, 17 Oct 2023 10:44:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id A4D68C433C9; Tue, 17 Oct 2023 10:44:56 +0000 (UTC)
Received: from mail-yw1-f194.google.com (mail-yw1-f194.google.com [209.85.128.194])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 78FD2C433C7;
	Tue, 17 Oct 2023 10:44:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 78FD2C433C7
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f194.google.com with SMTP id 00721157ae682-5a7ac4c3666so67827197b3.3;
        Tue, 17 Oct 2023 03:44:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697539494; x=1698144294;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fPRdJ+3TN8Zmg5SzFNo5gq2GpoI/z77WwxmQGbYRfiU=;
        b=dufxe0+1MNO8w8DaNCo2JmveU6kkn1ETRhVfjOX/SEo+K+qjH5XsiEDXarBwjUhK9O
         3xD3Po34pnkdHzG6d9DeyZJN8C2eZAY9RF0t1r3DdHaRRkO51pnpEFib81egmQkB3UQs
         0rE+0gRJUbeURJEq+4NZyOHaL1e26gMC+FrXVz+C2+MalgHcPMpfjbxpXkR0Pd8V1xCN
         naW5pK2Xt5OhdSog+MWyZN0KSEYNBa6Tf7HS7448gUywjYrpyWRqkoGCJWQv3up96MD/
         hVTlUJAWPNoIDiyHWbc40IxDJKYbYAzkyfDRDeNbNhBtFdcOqGaNUyoWAopZnCfM7ZKn
         DpMQ==
X-Gm-Message-State: AOJu0YzfUNy696tlepbs+LoWD4oPj5QQTnvhTmjtglNZCiTFptGJ7vLx
	4b51VL3iaMY1uYre5BEjIeY7/dc9yw1C2EqB
X-Google-Smtp-Source: AGHT+IGmKGFX2QTthlCWBFOBBdQ40eS4JtPdDyrz0gPqDa23pt7UnQPjJEBAQ9+6ONy6oYaBFLrgog==
X-Received: by 2002:a05:690c:314a:b0:5a1:e4bf:ee5a with SMTP id fc10-20020a05690c314a00b005a1e4bfee5amr1770603ywb.41.1697539494463;
        Tue, 17 Oct 2023 03:44:54 -0700 (PDT)
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com. [209.85.128.177])
        by smtp.gmail.com with ESMTPSA id q4-20020a0de704000000b005a4d922cf77sm504955ywe.119.2023.10.17.03.44.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Oct 2023 03:44:54 -0700 (PDT)
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-5a82f176860so46235617b3.1;
        Tue, 17 Oct 2023 03:44:54 -0700 (PDT)
X-Received: by 2002:a81:4996:0:b0:592:ffc:c787 with SMTP id
 w144-20020a814996000000b005920ffcc787mr1937845ywa.30.1697539494112; Tue, 17
 Oct 2023 03:44:54 -0700 (PDT)
MIME-Version: 1.0
References: <20231016054755.915155-1-hch@lst.de> <20231016054755.915155-5-hch@lst.de>
 <20231016-pantyhose-tall-7565b6b20fb9@wendy> <20231016131745.GB26484@lst.de>
In-Reply-To: <20231016131745.GB26484@lst.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 17 Oct 2023 12:44:41 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXVZz=YWMAgzUzme-U3qxYeLdi66xw2CGubpesGy+ZjRw@mail.gmail.com>
Message-ID: <CAMuHMdXVZz=YWMAgzUzme-U3qxYeLdi66xw2CGubpesGy+ZjRw@mail.gmail.com>
Subject: Re: [PATCH 04/12] soc: renesas: select RISCV_DMA_NONCOHERENT from ARCH_R9A07G043
To: Christoph Hellwig <hch@lst.de>
List-Id: <soc.lore.kernel.org>
Cc: Conor Dooley <conor.dooley@microchip.com>, Greg Ungerer <gerg@linux-m68k.org>, 
	iommu@lists.linux.dev, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Conor Dooley <conor@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Robin Murphy <robin.murphy@arm.com>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, Wei Fang <wei.fang@nxp.com>, 
	Shenwei Wang <shenwei.wang@nxp.com>, Clark Wang <xiaoning.wang@nxp.com>, 
	NXP Linux Team <linux-imx@nxp.com>, linux-m68k@lists.linux-m68k.org, netdev@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
	Jim Quinlan <james.quinlan@broadcom.com>, arm-soc <soc@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Christoph,

On Mon, Oct 16, 2023 at 3:17=E2=80=AFPM Christoph Hellwig <hch@lst.de> wrot=
e:
> On Mon, Oct 16, 2023 at 01:52:57PM +0100, Conor Dooley wrote:
> > > +   select RISCV_DMA_NONCOHERENT
> > >     select ERRATA_ANDES if RISCV_SBI
> > >     select ERRATA_ANDES_CMO if ERRATA_ANDES
> >
> > Since this Kconfig menu has changed a bit in linux-next, the selects
> > are unconditional here, and ERRATA_ANDES_CMO will in turn select
> > RISCV_DMA_NONCOHERENT.
>
> Oh, looks like another patch landed there in linux-next.  I had
> waited for the previous one go go upstream in -rc6.  Not sure
> how to best handle this conflict.

I think the easiest is to ask soc to apply this series?

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
