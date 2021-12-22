Return-Path: <SRS0=fNXJ=RH=konsulko.com=trini@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB627C433F5
	for <soc@archiver.kernel.org>; Wed, 22 Dec 2021 16:41:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id B6ED8C36AEC; Wed, 22 Dec 2021 16:41:01 +0000 (UTC)
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id E3CDFC36AEA
	for <soc@kernel.org>; Wed, 22 Dec 2021 16:41:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org E3CDFC36AEA
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=konsulko.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=konsulko.com
Received: by mail-qt1-f180.google.com with SMTP id v22so2433343qtx.8
        for <soc@kernel.org>; Wed, 22 Dec 2021 08:41:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=zdnOtqH49FH1fYSxifA1900Fs7Gze7wTJmeR7vfENR8=;
        b=nPyWZp9kN4YMVBYp2L51x8LeEuE5RmMKfdr9ToP4mwLI5eWu4HcHT/duQVXnKzNKZ7
         AXiQ+FTmo+w6iMgwAQkimWPa6MBafVDQU+X1eu/13sLNcp9AixdFjFSrG3mRpxhudzdw
         L370rgVD867T1JWTjsg02nBiwx0Tsnv/gym0E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=zdnOtqH49FH1fYSxifA1900Fs7Gze7wTJmeR7vfENR8=;
        b=SxHOuPUfYrOYKmwDmOVAa9yEvYNTKFryPpAUs1guS6cDRwhtTJWsrGRKwF0VFNuWf6
         o3TtKeSZO58z0hKpZF8VIzmv3a375y7wRiVIsKx+w6GOy+s4qoMKy+qsejm/gty3LI6C
         6GpGrQp5sLEQu6jOG6thY60POLuRFIvgEZIi/3YchhLzIobsdLhgcD9VrIx+vkCkSMei
         9Gk4Dqes26RfVxmHirtlIcz2chzLWyEDU3Rab3fIUm50i5XfJZv2ltOMtzo7La4kvzn+
         PkmroQ2X3MRFeSnZfNJTfB1sDsH+jr5KH9R5jG6oZH5Mxvz3c7a2OOWl99bcwj+Lb7O/
         wvAw==
X-Gm-Message-State: AOAM532YEcag1k+gZyhNrL/Nbl6fwMBOJmkXqpHSFhJxRPuVmYJgZ5wC
	3ReS4jjZdqnFu3CyBHiiOo+ybQ==
X-Google-Smtp-Source: ABdhPJyXqqeFwTthMvo3+JnH55PTWd1DXt2aOuMGGTCA2lQhyF8hEjLaiuai/kcU7kuEQ6sx29auuQ==
X-Received: by 2002:ac8:5d89:: with SMTP id d9mr2748336qtx.49.1640191259808;
        Wed, 22 Dec 2021 08:40:59 -0800 (PST)
Received: from bill-the-cat (2603-6081-7b01-cbda-d9c0-d76f-ebfe-a14d.res6.spectrum.com. [2603:6081:7b01:cbda:d9c0:d76f:ebfe:a14d])
        by smtp.gmail.com with ESMTPSA id l15sm2177207qtx.77.2021.12.22.08.40.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Dec 2021 08:40:59 -0800 (PST)
Date: Wed, 22 Dec 2021 11:40:57 -0500
From: Tom Rini <trini@konsulko.com>
To: Vignesh Raghavendra <vigneshr@ti.com>
List-Id: <soc.lore.kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Nishanth Menon <nm@ti.com>,
	Olof Johansson <olof@lixom.net>, SoC <soc@kernel.org>,
	arm-soc <arm@kernel.org>, Tero Kristo <kristo@kernel.org>,
	Linux ARM <linux-arm-kernel@lists.infradead.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	KISHON VIJAY ABRAHAM <kishon@ti.com>
Subject: Re: [GIT PULL 1/2] arm64: TI K3 SoC configs changes for v5.17
Message-ID: <20211222164057.GN2773246@bill-the-cat>
References: <20211217172806.10023-1-vigneshr@ti.com>
 <CAK8P3a2VSBvOn1o+q1PYZaQ6LS9U4cz+DZGuDbisHkwNs2dAAw@mail.gmail.com>
 <06e60038-1365-fc35-801e-448c9025fb2a@ti.com>
 <20211221153250.GA2081238@bill-the-cat>
 <CAK8P3a2wNNSQkN_m3DzEF5RLmq1aED1JpOkXW9Yq13+ypiAaGQ@mail.gmail.com>
 <20211221160933.GM2773246@bill-the-cat>
 <9a5d6b32-7e2a-0eae-aed4-97291e4c3f97@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9a5d6b32-7e2a-0eae-aed4-97291e4c3f97@ti.com>
X-Clacks-Overhead: GNU Terry Pratchett

On Wed, Dec 22, 2021 at 12:56:06PM +0530, Vignesh Raghavendra wrote:
> 
> 
> On 21/12/21 9:39 pm, Tom Rini wrote:
> > On Tue, Dec 21, 2021 at 04:55:48PM +0100, Arnd Bergmann wrote:
> >> On Tue, Dec 21, 2021 at 4:32 PM Tom Rini <trini@konsulko.com> wrote:
> >>> On Mon, Dec 20, 2021 at 11:10:25PM +0530, Vignesh Raghavendra wrote:
> >>>>
> >>>> Currently its not possible to build PCIE_CADENCE_PLAT_HOST/EP drivers as
> >>>> modules (symbols are bool only).
> >>>> PCIe is not necessary for basic boot either. So, I can drop these
> >>>> configs until these drivers are build able as modules, if you prefer.
> >>>
> >>> Is PCIe required for basic boot for the other platforms in the defconfig
> >>> which do enable it in the defconfig today?  It is required for non-basic
> >>> boot (whatever storage one puts in a PCIe slot).  If someone is going to
> >>> be fixing the PCIe driver to be able to be modular, that's fine too but
> >>> I ran in to this trying to see what works out of the box in the
> >>> defconfig, on this platform and hit both of these rather large
> >>> omissions.
> >>
> >> If PCI is often used for storage, then that's ok. There are a number of
> >> other platforms where PCIe is only used for wireless networking or
> >> other secondary devices, but they are still built-in because they got
> >> added before it became possible for PCIe host drivers to be loadable
> >> modules. I would like to eventually go through and turn those into
> >> loadable modules, but for the moment it would be good to only add
> >> built-in drivers where this is actually useful.
> > 
> > That's good to know.  My question tho is, what's actually useful?  The
> > EVM is 2 PCIe x8 type slots.  I honestly don't know if that means "super
> > useful, arbitrary devices are expected to work" or "not useful,
> > arbitrary devices are not expected to work".  Is the functional
> > definition of what's in the defconfig vs left up to users,
> > distributions, etc, to find and enabled defined, or at least well known
> > / explained somewhere?  Where I'm coming from on this is that these
> > platforms practically are, and can be SystemReady IR certified.  So
> > what's needed here to ensure there's a good experience distros to enable
> > what needs enabling for full functionality?  What we hit was "lets throw
> > some stuff at this board to test it out and.. wait, PCIe isn't enabled
> > at all? USB host isn't enabled at all?"
> > 
> > And all that said, if someone is going to be fixing the PCIe drivers to
> > be enabled as modules soon, and just getting it handled that way in the
> > next appropriately timed merge window, OK, fine, good enough.
> > 
> 
> Looks like its not a big effort to convert J7 PCIe driver to build as
> module and can be done for v5.18 Merge Window. So how about we enable
> only USB controller drivers now and then enable PCIe after its
> build-able as module?

Works for me, thanks!

-- 
Tom
