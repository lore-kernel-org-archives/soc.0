Return-Path: <SRS0=Ha9N=RG=konsulko.com=trini@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1CABC433EF
	for <soc@archiver.kernel.org>; Tue, 21 Dec 2021 15:32:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id B0DB9C36AEC; Tue, 21 Dec 2021 15:32:54 +0000 (UTC)
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 08BADC36AE8
	for <soc@kernel.org>; Tue, 21 Dec 2021 15:32:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 08BADC36AE8
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=konsulko.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=konsulko.com
Received: by mail-qk1-f181.google.com with SMTP id e16so2056503qkl.12
        for <soc@kernel.org>; Tue, 21 Dec 2021 07:32:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Lka+nGx+QENdU30QdcR8chT7MVCTMSeGX8UU+IeXhWw=;
        b=g6EwqyAMhaxM9Yvs7yKjLEd0puCQeAiQYQa5KN9KsWH8YxT3NftU562j2506w3c8K7
         57HjeBQyzsZFg/W/QsZs60j5wqTkOrwbYn+GF7Y8lP4YHKkxJCntd/HqEkj7EY/1rI99
         5qa856FisHdPLjs5f7XIp/meyHPmLHY8Aov9g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Lka+nGx+QENdU30QdcR8chT7MVCTMSeGX8UU+IeXhWw=;
        b=lMmb4f0E/ild5R1D7KQQhDdxYWkKWOBJCj21v74WSfQa+Dk0ZzC2yP6ZqwARSTkL9x
         0MAWtZB4SriAuhuyzXGrbRnGCnjKDeW66EQ0DKGkJeg+abo35kfORItRLdAuw0CEpMrS
         QEfepC0fXpPhEPufJMryGvFXPrvKfvu3SgNmDQOPbll8IDL/1G9P20pKHzMCklOqMycb
         BzK3XuuBDLTsQXDj5A2KKL5UG5kDG7HR5UtjVjigMSbVZ3Xcg10ga8/qrAYeIiptbvSj
         qDFAneyoFvmtImcegMkPoYnQc0QGtuqwPgUYbLH0fVjX+KXwxNkmsIvj/sSyjrtGJyNJ
         OIdw==
X-Gm-Message-State: AOAM5324GwSzJML2RYootIzepcOdRqpnKbjxjMhEL/BLCtOnTBrl/4gT
	EJIKmnKh/yHmytokIyiqgQCKxw==
X-Google-Smtp-Source: ABdhPJzDeH3ZWeS6afDt752uqKthWBJAZWoNe8KrHLoPvNDzqALwTg7/fFoT8wUiYxgE128K4H8/yQ==
X-Received: by 2002:a05:620a:2903:: with SMTP id m3mr2400649qkp.390.1640100772932;
        Tue, 21 Dec 2021 07:32:52 -0800 (PST)
Received: from bill-the-cat (2603-6081-7b01-cbda-04c9-073b-bd3f-c77c.res6.spectrum.com. [2603:6081:7b01:cbda:4c9:73b:bd3f:c77c])
        by smtp.gmail.com with ESMTPSA id i6sm14433172qkn.26.2021.12.21.07.32.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Dec 2021 07:32:52 -0800 (PST)
Date: Tue, 21 Dec 2021 10:32:50 -0500
From: Tom Rini <trini@konsulko.com>
To: Vignesh Raghavendra <vigneshr@ti.com>
List-Id: <soc.lore.kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Nishanth Menon <nm@ti.com>,
	Olof Johansson <olof@lixom.net>, SoC <soc@kernel.org>,
	arm-soc <arm@kernel.org>, Tero Kristo <kristo@kernel.org>,
	Linux ARM <linux-arm-kernel@lists.infradead.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [GIT PULL 1/2] arm64: TI K3 SoC configs changes for v5.17
Message-ID: <20211221153250.GA2081238@bill-the-cat>
References: <20211217172806.10023-1-vigneshr@ti.com>
 <CAK8P3a2VSBvOn1o+q1PYZaQ6LS9U4cz+DZGuDbisHkwNs2dAAw@mail.gmail.com>
 <06e60038-1365-fc35-801e-448c9025fb2a@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <06e60038-1365-fc35-801e-448c9025fb2a@ti.com>
X-Clacks-Overhead: GNU Terry Pratchett

On Mon, Dec 20, 2021 at 11:10:25PM +0530, Vignesh Raghavendra wrote:
> Hi Arnd,
> 
> On 20/12/21 8:57 pm, Arnd Bergmann wrote:
> > On Fri, Dec 17, 2021 at 6:28 PM Vignesh Raghavendra <vigneshr@ti.com> wrote:
> >>
> >> The following changes since commit fa55b7dcdc43c1aa1ba12bca9d2dd4318c2a0dbf:
> >>
> >>   Linux 5.16-rc1 (2021-11-14 13:56:52 -0800)
> >>
> >> are available in the Git repository at:
> >>
> >>   https://git.kernel.org/pub/scm/linux/kernel/git/ti/linux.git tags/ti-k3-config-for-v5.17
> >>
> >> for you to fetch changes up to 8d73aedca28cbed8030067b0d9423a0694139b9c:
> >>
> >>   arm64: defconfig: Enable USB, PCIe and SERDES drivers for TI K3 SoC (2021-12-14 16:22:25 +0530)
> >>
> >> ----------------------------------------------------------------
> >> ARM64 defconfig changes for TI K3 platforms for v5.17 merge window:
> >>
> >> - Increase No. of 8250 UARTs supported in System to 16 for J721s2
> > 
> > This looks a little excessive, I'm holding off on this pull request
> > for now, as I'm
> > not sure exactly what the downsides are.
> > 
> > I see that your dtsi file has
> > 
> > +       aliases {
> > +               serial0 = &wkup_uart0;
> > +               serial1 = &mcu_uart0;
> > +               serial2 = &main_uart0;
> > +               serial3 = &main_uart1;
> > +               serial4 = &main_uart2;
> > +               serial5 = &main_uart3;
> > +               serial6 = &main_uart4;
> > +               serial7 = &main_uart5;
> > +               serial8 = &main_uart6;
> > +               serial9 = &main_uart7;
> > +               serial10 = &main_uart8;
> > +               serial11 = &main_uart9;
> > +               mmc0 = &main_sdhci0;
> > +               mmc1 = &main_sdhci1;
> > +               can0 = &main_mcan16;
> > +               can1 = &mcu_mcan0;
> > +               can2 = &mcu_mcan1;
> > +               can3 = &main_mcan3;
> > +               can4 = &main_mcan5;
> > +       };
> > 
> > which I think is the underlying problem here. The aliases are really meant to
> > be board specific, and I would assume that none of the boards actually
> > uses all the
> > uart and can bus devices, usually this isn't even possible due to pinctrl
> > constraints, so please follow up by moving these to the .dts files listing only
> > the actually used devices instead of working around it in the defconfig.
> 
> Yes indeed, aliases can be trimmed and moved to board dts. With that,
> defconfig patch in question can be dropped. Thanks for the hint.
> 
> > 
> >> - Enable USB, PCIe and SERDES drivers on TI K3 SoC
> > 
> > I see the PCIe driver is built-in here. Is that necessary for booting?
> > If not, please
> > make it a loadable module.
> > 
> 
> Currently its not possible to build PCIE_CADENCE_PLAT_HOST/EP drivers as
> modules (symbols are bool only).
> PCIe is not necessary for basic boot either. So, I can drop these
> configs until these drivers are build able as modules, if you prefer.

Is PCIe required for basic boot for the other platforms in the defconfig
which do enable it in the defconfig today?  It is required for non-basic
boot (whatever storage one puts in a PCIe slot).  If someone is going to
be fixing the PCIe driver to be able to be modular, that's fine too but
I ran in to this trying to see what works out of the box in the
defconfig, on this platform and hit both of these rather large
omissions.

-- 
Tom
