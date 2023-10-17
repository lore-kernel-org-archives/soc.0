Return-Path: <SRS0=DNrK=F7=gmail.com=geert.uytterhoeven@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E874CDB474
	for <soc@archiver.kernel.org>; Tue, 17 Oct 2023 13:19:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 4C550C433C7; Tue, 17 Oct 2023 13:19:02 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 307BCC43395;
	Tue, 17 Oct 2023 13:19:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 307BCC43395
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-6b89ab5ddb7so3277535b3a.0;
        Tue, 17 Oct 2023 06:19:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697548740; x=1698153540;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hrjVOTU4vVWhg8rZEFBUd1El+uZlCjcijcwvkBEbBus=;
        b=FEBchzskRjVVUIwfkUnoF+iV4ekjKm2CSyqCyvnn+Qz/bgFJNt2ZsbmD/nAwmwm/kO
         j5eo9vF1uq3D8NTpPpYLidYVuA06+hadvuzVp2dqrRs+9H1iVGN2AmpaP9j+RPhs3P54
         ovGR/h34pmqCUBNQH1JH0ivy2a+sdP2sh172sj8BOj6kXdU68vp8nfH1KJ7/6kxiqyFJ
         ogb+ZJq0ZMRVpx+ZWC52KMb6RsBIv8nB6Y0H+yT7YTrXtxrk33qg9r04ae6kdoIeGksW
         Iq7nBItjK7Fj8rzaEbyzUy0jfOIRS4KbVEnxo7UxiUyg++fddXYDbwN/FsGweS7ey/jG
         2dxw==
X-Gm-Message-State: AOJu0YxRQSAILLo/45yjimB0v/gn/KY0PhU2Q2aEDJvETIV8TMxXlhsW
	e5As14GAl8xLnUDu11uR+ADfwjZLv+1U5A==
X-Google-Smtp-Source: AGHT+IG1HlHk0kruMled/PRSMJgSoqE7tyWNNIp49R2rKiNBathG74wntFLe2/+7hiwk5DyPsCMLDA==
X-Received: by 2002:a05:6a00:2da4:b0:6ba:4f2e:33ca with SMTP id fb36-20020a056a002da400b006ba4f2e33camr2538366pfb.2.1697548740301;
        Tue, 17 Oct 2023 06:19:00 -0700 (PDT)
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com. [209.85.215.173])
        by smtp.gmail.com with ESMTPSA id y5-20020aa78f25000000b00682868714fdsm1416748pfr.95.2023.10.17.06.18.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Oct 2023 06:19:00 -0700 (PDT)
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-5ac88d2cfaaso3007587a12.2;
        Tue, 17 Oct 2023 06:18:59 -0700 (PDT)
X-Received: by 2002:a0d:cb10:0:b0:5a7:afcc:80fe with SMTP id
 n16-20020a0dcb10000000b005a7afcc80femr2307771ywd.3.1697548354803; Tue, 17 Oct
 2023 06:12:34 -0700 (PDT)
MIME-Version: 1.0
References: <20231016054755.915155-1-hch@lst.de> <20231016054755.915155-5-hch@lst.de>
 <20231016-pantyhose-tall-7565b6b20fb9@wendy> <20231016131745.GB26484@lst.de>
 <CAMuHMdXVZz=YWMAgzUzme-U3qxYeLdi66xw2CGubpesGy+ZjRw@mail.gmail.com> <20231017124608.GA4386@lst.de>
In-Reply-To: <20231017124608.GA4386@lst.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 17 Oct 2023 15:12:21 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVavDc4g3ALqxFRn45ySCJ16F-Ay72=P3fxXipk0uXFiQ@mail.gmail.com>
Message-ID: <CAMuHMdVavDc4g3ALqxFRn45ySCJ16F-Ay72=P3fxXipk0uXFiQ@mail.gmail.com>
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

On Tue, Oct 17, 2023 at 2:46=E2=80=AFPM Christoph Hellwig <hch@lst.de> wrot=
e:
> On Tue, Oct 17, 2023 at 12:44:41PM +0200, Geert Uytterhoeven wrote:
> > On Mon, Oct 16, 2023 at 3:17=E2=80=AFPM Christoph Hellwig <hch@lst.de> =
wrote:
> > > On Mon, Oct 16, 2023 at 01:52:57PM +0100, Conor Dooley wrote:
> > > > > +   select RISCV_DMA_NONCOHERENT
> > > > >     select ERRATA_ANDES if RISCV_SBI
> > > > >     select ERRATA_ANDES_CMO if ERRATA_ANDES
> > > >
> > > > Since this Kconfig menu has changed a bit in linux-next, the select=
s
> > > > are unconditional here, and ERRATA_ANDES_CMO will in turn select
> > > > RISCV_DMA_NONCOHERENT.
> > >
> > > Oh, looks like another patch landed there in linux-next.  I had
> > > waited for the previous one go go upstream in -rc6.  Not sure
> > > how to best handle this conflict.
> >
> > I think the easiest is to ask soc to apply this series?
>
> I don't think pulling all the DMA bits into a random other tree
> would be a good idea.   I can hand off the first few bits, but I'd
> need a stable branch to pull in after that.  Which of the half a dozen
> soc trees we have in linux-next is this anyway?

The one and only https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.gi=
t/

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
