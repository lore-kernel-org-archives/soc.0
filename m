Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C60BDC4338F
	for <soc@archiver.kernel.org>; Tue,  3 Aug 2021 17:12:06 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 9C87661108; Tue,  3 Aug 2021 17:12:06 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 80663610FD;
	Tue,  3 Aug 2021 17:12:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1628010726;
	bh=YKZgz2PIIA5ojPbgTMT8sUlcZDB7x/kiBLPAv6SkSCI=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=hEyoyKRHMnlr78wASkDHdVfwUbx5SJ9S1rBsLSdki2lkS5wcrB3Zn/FNnh3lHOXNm
	 KH4PO0xwCeNYsaABvvWrARC5xDBZrydayyPRczebhBBx92VOzA0o7nnfnTfDV6Jz+T
	 /4wuV+RIoDIrOERkwtVuOa9MsYu0mf8Zexwtv0LMo0tpRgJ24Y0CYUp0u0pcCNIP6h
	 c21Rkr9CMXd4sCVwvTlZ59frAdLz1faCVQdtx7v379LUyn7GYkKyB+/zkhRwDXTQcg
	 3BW6zvWI/HdOSHD3DW0HIN2PFR5CHH6qrxAKM34ifoH2+xzQ/xfPMvbDIJXV1dXSAz
	 +QCJv+z0yJ+fw==
Received: by mail-wm1-f54.google.com with SMTP id n12-20020a05600c3b8cb029025a67bbd40aso2225957wms.0;
        Tue, 03 Aug 2021 10:12:06 -0700 (PDT)
X-Gm-Message-State: AOAM531H+GEjmrshaNU5QFAKm8kIGE4x4Ywxp8Am33OZ5bok5oP4BE3v
	mEOhG+7mKwIVPEXoFSNU5OfuJmJbrMFp4CKEpTM=
X-Google-Smtp-Source: ABdhPJyFUUcsrSm1AzyQx3pvEZx6TT8YFnsUeo4wDlqkyr7TYiklG+prW2K275cVpvzd/XKyHL8AAT06vnq0iveLKzg=
X-Received: by 2002:a1c:208e:: with SMTP id g136mr5372161wmg.142.1628010725128;
 Tue, 03 Aug 2021 10:12:05 -0700 (PDT)
MIME-Version: 1.0
References: <20210802141245.1146772-1-arnd@kernel.org> <CAL4-wQqCL1S-GYu7VKJeTT37wh=rR=SMUuwgKiXnnn_Y=uydOA@mail.gmail.com>
 <CAL4-wQpKLtSj0xfNUXXLhbtN1wC051jpRneAuLYOi1riZfiinw@mail.gmail.com>
 <CAK8P3a2z_xxpz9hAYoBx5=bS81V=TkjEU6WHNhPi1UhQ3UScfw@mail.gmail.com> <817752520.64672.1628005929651.JavaMail.zimbra@savoirfairelinux.com>
In-Reply-To: <817752520.64672.1628005929651.JavaMail.zimbra@savoirfairelinux.com>
From: Arnd Bergmann <arnd@kernel.org>
Date: Tue, 3 Aug 2021 19:11:49 +0200
X-Gmail-Original-Message-ID: <CAK8P3a042r2V10WY=M3mvhZS2Q9_iBHLDgSNzJpJEGgNJOD7zQ@mail.gmail.com>
Message-ID: <CAK8P3a042r2V10WY=M3mvhZS2Q9_iBHLDgSNzJpJEGgNJOD7zQ@mail.gmail.com>
Subject: Re: [PATCH] ARM: ep93xx: remove MaverickCrunch support
To: Jerome Oufella <jerome.oufella@savoirfairelinux.com>
List-Id: <soc.lore.kernel.org>
Cc: martinwguy <martinwguy@gmail.com>, Russell King <linux@armlinux.org.uk>, 
	Hartley Sweeten <hsweeten@visionengravers.com>, 
	Alexander Sverdlin <alexander.sverdlin@gmail.com>, SoC Team <soc@kernel.org>, 
	Nikita Shubin <nikita.shubin@maquefel.me>, Arnd Bergmann <arnd@arndb.de>, 
	Oleg Nesterov <oleg@redhat.com>, Hubert Feurstein <hubert.feurstein@contec.at>, 
	Lukasz Majewski <lukma@denx.de>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Linus Walleij <linus.walleij@linaro.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	clang-built-linux <clang-built-linux@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, Aug 3, 2021 at 5:52 PM Jerome Oufella
<jerome.oufella@savoirfairelinux.com> wrote:
>
> You are correct on assuming usage of softfloat toolchains and not
> using the MaverickCrunch unit. AFAIK, I am not aware of active users
> of this FPU on recent setups.

Ok, thank you for the confirmation, I'll queue it up in the soc tree then.

Of course, as there is nothing wrong with the feature other than it
probably having no users and breaking the build when using the
clang integrated assembler, I don't mind reverting it later if we end
up finding a user that does rely on ancient MaverickCrunch binaries
to run on future kernels.

       Arnd
