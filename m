Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD4C3C4338F
	for <soc@archiver.kernel.org>; Fri, 23 Jul 2021 18:43:01 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id A32D760F39; Fri, 23 Jul 2021 18:43:01 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8B50F60F12;
	Fri, 23 Jul 2021 18:43:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1627065781;
	bh=QYqg4gIDhqs1ZAAOUt89PxNpJdd1nRpEaEeaE2yiuJ0=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=lyNwv663UA1uuAm/0W4LHKx9BbRmD53xmGWEV7c7BeblUh5V56PcMwYkYKV76UglF
	 YI5+UZvo8a4MsrRBDvJKFm29Ug48PumvDFCvJ5jKYhVlSJSxQsMIg5++7Hsq+k6+oJ
	 pbccAFf+GTmGU72sMaWd8IY4OiiHZjafRwGxHq47dvvackKTpnKr779ic7z0xteGiw
	 qGN7ZZ6NlHYums5NlZftD18fWRTmak0/jOjk57FvfHtELUrzWinHKnHabcamY78eaw
	 HUxbS8Do0JT2+wS9eHRSSKXEuT//YkXwM31YW5eF9CXa21U/0EUgC2RVlSw9T6bsm7
	 1wZN1AVJg39cA==
Received: by mail-wr1-f48.google.com with SMTP id r2so3388407wrl.1;
        Fri, 23 Jul 2021 11:43:01 -0700 (PDT)
X-Gm-Message-State: AOAM5311DbJtbmZha3T3Dj1tcLw1DgYrregTdi2FED4o8G5msBFWPF/8
	sDgSSBhYfq1Z010NtPpJx99EHCUCBqsL5u0+leI=
X-Google-Smtp-Source: ABdhPJxoQq2VQ2w6DBydXsB6afqEER/ozdnaFLgwa9gVk2VkfIvkZepq+XzAelVd1ktGQjI+zhUop3cwvl2R/+k55N0=
X-Received: by 2002:a5d:65cb:: with SMTP id e11mr6966911wrw.105.1627065780129;
 Fri, 23 Jul 2021 11:43:00 -0700 (PDT)
MIME-Version: 1.0
References: <20210721151546.2325937-1-arnd@kernel.org> <20210723145026.GA3330@lpieralisi>
In-Reply-To: <20210723145026.GA3330@lpieralisi>
From: Arnd Bergmann <arnd@kernel.org>
Date: Fri, 23 Jul 2021 20:42:44 +0200
X-Gmail-Original-Message-ID: <CAK8P3a2C1JiVmcHnt0aJmvJWQ1Dnqhz5f781FhGWp+UE+=4N1Q@mail.gmail.com>
Message-ID: <CAK8P3a2C1JiVmcHnt0aJmvJWQ1Dnqhz5f781FhGWp+UE+=4N1Q@mail.gmail.com>
Subject: Re: [PATCH] ARM: ixp4xx: fix building both pci drivers
To: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
List-Id: <soc.lore.kernel.org>
Cc: Linus Walleij <linusw@kernel.org>, SoC Team <soc@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Imre Kaloz <kaloz@openwrt.org>, Krzysztof Halasa <khalasa@piap.pl>, Rob Herring <robh@kernel.org>, 
	=?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, 
	Bjorn Helgaas <bhelgaas@google.com>, Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-pci <linux-pci@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, Jul 23, 2021 at 4:51 PM Lorenzo Pieralisi
<lorenzo.pieralisi@arm.com> wrote:

> > Fixes: f7821b493458 ("PCI: ixp4xx: Add a new driver for IXP4xx")
> > Cc: soc@kernel.org
> > Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> > ---
> >  .../mach-ixp4xx/include/mach/ixp4xx-regs.h    | 48 +++++++++----------
> >  drivers/pci/controller/pci-ixp4xx.c           |  8 ++--
> >  2 files changed, 28 insertions(+), 28 deletions(-)
>
> Are you picking this up via arm-soc ? I can take this via the PCI tree,
> just let me know:
>
> Acked-by: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>

I'm fine either way, if you have other fixes queued up already, please
add this one
to your tree.

       Arnd
