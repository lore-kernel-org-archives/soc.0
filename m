Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED990C433FE
	for <soc@archiver.kernel.org>; Wed,  9 Dec 2020 17:45:49 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id C24CA23D22; Wed,  9 Dec 2020 17:45:49 +0000 (UTC)
X-Gm-Message-State: AOAM531a7XyejWrLHkE9qRPqAnE91uXdhWSE6ayckqki9lX0/T6H0sB+
	DQ9n2TYxLRHxaKNE/2dG+rpYZ0zPB+sjI0zGPSs=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1607535949;
	bh=fIc3D8aOxqtezDWTUeH5a6/4xchyDWUNEXST3nSLAkw=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=Bpe7vKouCkRSyQ1Ipr/XuR/qzTh2MMID46Nb2CAP3lvmFw/jv/fpWNEXiFwzk3xkr
	 52B1pw0+CEuyMfniqkIGXLkPAFjSdh2gqw1RYIHXZctv+5miWc6db/aqP0wynF+YSa
	 urp+IReGbC4s7/C3w8j0mhMed9aqDCvZANY2cVCrbK8oc3Z7CYeKjievfw5OLlGG+6
	 T0cvfK1iLGvTMBRkKuSmhkSiS2VGYSEXz0IqekscmYA4dfgf1xpFEKa5MHRs1PT2IN
	 656X4hLElqW9TTzkRxoBalD/V0S+/MZ+j5nyGpYE9ukbCkL3GoFgFWyr9NyQAaUPj2
	 QJerZqeaD3OVA==
X-Google-Smtp-Source: ABdhPJxI4CSXg4rYiEkbPRmEtP+i77kAz27CFNAUQJLWmwro9f063ABQy2CEN1uI6TSE7xm3IWLb5F0LaDw8Ek7pHaU=
X-Received: by 2002:a9d:7a4b:: with SMTP id z11mr2759576otm.305.1607535948906;
 Wed, 09 Dec 2020 09:45:48 -0800 (PST)
MIME-Version: 1.0
References: <20201201134330.3037007-1-daniel@0x0f.com> <20201201134330.3037007-2-daniel@0x0f.com>
 <20201209163536.GB566058@robh.at.kernel.org>
In-Reply-To: <20201209163536.GB566058@robh.at.kernel.org>
From: Arnd Bergmann <arnd@kernel.org>
Date: Wed, 9 Dec 2020 18:45:32 +0100
X-Gmail-Original-Message-ID: <CAK8P3a0D+XQREm7Gw5-7-byiz7eufYGT_r-XC3H6_whdOB0a1w@mail.gmail.com>
Message-ID: <CAK8P3a0D+XQREm7Gw5-7-byiz7eufYGT_r-XC3H6_whdOB0a1w@mail.gmail.com>
Subject: Re: [PATCH v2 01/10] dt-bindings: mstar: Add binding details for mstar,smpctrl
To: Rob Herring <robh@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: Daniel Palmer <daniel@0x0f.com>, DTML <devicetree@vger.kernel.org>, 
	SoC Team <soc@kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Olof Johansson <olof@lixom.net>, 
	Arnd Bergmann <arnd@arndb.de>, Willy Tarreau <w@1wt.eu>
Content-Type: text/plain; charset="UTF-8"

On Wed, Dec 9, 2020 at 5:35 PM Rob Herring <robh@kernel.org> wrote:
>
> On Tue, Dec 01, 2020 at 10:43:21PM +0900, Daniel Palmer wrote:
> > This adds a YAML description of the smpctrl node needed by the
> > platform code for the MStar/SigmaStar Armv7 SoCs to boot secondary cpus.
>
> You need an 'enable-method' string defined too.

I had already applied the series by the time I saw this reply.

Daniel, please send patches on top of this series to address Rob's
comments.

       Arnd
