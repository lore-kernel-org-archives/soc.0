Return-Path: <SRS0=2/Qf=FX=google.com=willmcvicker@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEE2CE95A9E
	for <soc@archiver.kernel.org>; Mon,  9 Oct 2023 16:10:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id B3FEDC433CB; Mon,  9 Oct 2023 16:10:09 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 65F2AC433CD
	for <soc@kernel.org>; Mon,  9 Oct 2023 16:10:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 65F2AC433CD
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-1c6052422acso268845ad.1
        for <soc@kernel.org>; Mon, 09 Oct 2023 09:10:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1696867806; x=1697472606; darn=kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=dGIYsu1MNfGtvrI3i3A4TgarZixnrBWwMgUCqpQdV34=;
        b=i5Rw78JxxGbpdm57YRWLCnycQtcNXlHqLdYa4QwtlFpuE7hoNeOQSWpU5kqNIEwJV+
         Di8nTK4XHfSCwP0styxSQSvXy51NQBPZt3afeNjbhXiOLUysyZPjF9T7YGEFSD+CP68X
         P/rIzz0PNeVi74V2pEouzM6ndcjnpWlhEuy0mO/Pz5JTGKJsl4lEOHv8coufeM/Nos7F
         WlMFfbmNbIoJdXjKNBnWbNt549BE0TCs2aSvhKa4NbNKzmLfs+8wvd5X5rtDAqqNmPa6
         yHV2Od6yXIOOBiFKSn3qCHAMljCTW+3kof8/JLxQMVK8/S2FFKLQeQwHt2NfftUpy5He
         V2kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696867806; x=1697472606;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dGIYsu1MNfGtvrI3i3A4TgarZixnrBWwMgUCqpQdV34=;
        b=OeH0oIEsdukNpAz2EgzWi2CkljVjupjRkcSrsS2IdvyP8TQ/SExTu+kf+jONQKERUN
         EJOoVvMZ7uswCnyzpKVTRk6lgjdFcolATHboSPiQold+UyroByQZLPrw7wFxGNvD+a8p
         Diamcq/pfLGBfI+rgVHRUxGKol09JkzU9sJR3fJE3ZGdNuL3Bc3DuWLdNBvbeGxn7uuz
         heY6cn8FLSIRenzcMrdXRZSiP/jmLkE8V6NVQfnpvWBBEBS0wnxm/creiKhtT/r+HSew
         VddJN2dsuQk/hFgLiTc+GPOVrKm1iDIoC8QvcYFv+vgIn6Wnq6NNp5T8/awu0HTQ3SH0
         +CkQ==
X-Gm-Message-State: AOJu0YwjRrH8svMAHLoyLVIn34I0tr1oBXxyFfhwiwlb2p0K6xFgswyr
	StzqyzMZOv0kYqSzPLse2r3e/Q==
X-Google-Smtp-Source: AGHT+IHy1UHB7+iKwEt/4HFm84LkAhlK5DfErxNNnYkX3w3H99+guWbxzofQ+qkXAw5azJ9m9sSRpw==
X-Received: by 2002:a17:903:18c:b0:1c7:5627:2053 with SMTP id z12-20020a170903018c00b001c756272053mr721817plg.18.1696867806422;
        Mon, 09 Oct 2023 09:10:06 -0700 (PDT)
Received: from google.com (13.65.82.34.bc.googleusercontent.com. [34.82.65.13])
        by smtp.gmail.com with ESMTPSA id 17-20020a17090a001100b00274262bcf8dsm11287754pja.41.2023.10.09.09.10.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Oct 2023 09:10:05 -0700 (PDT)
Date: Mon, 9 Oct 2023 09:10:02 -0700
From: William McVicker <willmcvicker@google.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	Rob Herring <robh+dt@kernel.org>, krzysztof.kozlowski+dt@linaro.org,
	Michael Turquette <mturquette@baylibre.com>,
	Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
	Tomasz Figa <tomasz.figa@gmail.com>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Olof Johansson <olof@lixom.net>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Tudor Ambarus <tudor.ambarus@linaro.org>, andre.draszik@linaro.org,
	semen.protsenko@linaro.org, soc@kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	"open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
	linux-watchdog@vger.kernel.org, kernel-team@android.com
Subject: Re: [PATCH 18/21] arm64: dts: google: Add initial Google gs101 SoC
 support
Message-ID: <ZSQl2tAgsUhhE3_P@google.com>
References: <ZR75cIvnQS2cqTT3@google.com>
 <2023100520-cleaver-sinless-fbae@gregkh>
 <99419159-cab0-4c79-a4a0-12229bfad3c0@linaro.org>
 <2023100513-mashing-scrubber-ea59@gregkh>
 <efc9f099-9c97-460b-b0c8-9891aa3b772a@linaro.org>
 <ZR9EnFw3vB92vlYM@google.com>
 <44816879-a3a7-4bd0-bb20-19a645107b4b@linaro.org>
 <e8b23683-36ac-4547-9386-935a1b211d7d@app.fastmail.com>
 <ZSA27y5CVs4yQC4a@google.com>
 <c4ea7ce3-5132-484c-870b-a62d30e2ee7a@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c4ea7ce3-5132-484c-870b-a62d30e2ee7a@linaro.org>

On 10/07/2023, Krzysztof Kozlowski wrote:
> On 06/10/2023 18:33, William McVicker wrote:
> > On 10/06/2023, Arnd Bergmann wrote:
> >> On Fri, Oct 6, 2023, at 08:06, Krzysztof Kozlowski wrote:
> >>> On 06/10/2023 01:19, William McVicker wrote:
> >>>> On 10/05/2023, Krzysztof Kozlowski wrote:
> >>>>> On 05/10/2023 21:23, Greg KH wrote:
> >>>>
> >>>> Being able to include SERIAL_SAMSUNG and SERIAL_MSM without all the vendor> specific drivers that ARCH_EXYNOS and ARCH_QCOM select is very
> >>> valuable for
> >>>> debugging early boot issues.
> >>>
> >>> Really? How related? The drivers are independent. You describe some
> >>> out-of-tree development process which we never needed for upstream work.
> >>> And we did here quite a lot of upstream, specially if you look at ARCH_QCOM.
> >>
> >> Right: in general, all drivers are independent of the platform
> >> besides the typical 'depends on ARCH_FOO || COMPILE_TEST' dependency,
> >> but I think it's worth mentioning the known exceptions, so Greg and
> >> Will can take that fight to the respective places rather than
> >> discussing it in the platform submission:
> >>
> >> - Some subsystems are considered 'special' and the maintainers
> >>   prefer the drivers to be automatically selected based on the
> >>   ARCH_* settings instead of having user-visible options. This is
> >>   traditionally true for large chunks of drivers/irqchip,
> >>   drivers/clocksource and drivers/pinctrl, though it has gotten
> >>   better over time on all of them.
> >>
> >> - Some older 32-bit platforms are still not as modular as we'd
> >>   like them to be, especially the StrongARM (ARMv4) platforms that
> >>   require a custom kernel build, and some of ARMv4T and ARMv5
> >>   boards that are still missing DT support. These tend to require
> >>   drivers they directly link to from board code, so disabling
> >>   the drivers would cause a link failure until this gets
> >>   cleaned up.
> >>
> >> - A couple of drivers are force-enabled based on the ARCH_*
> >>   options because booting without these drivers would risk
> >>   permanent damage to hardware, e.g. in overtemp or overcurrent
> >>   scenarios.
> >>
> >> - ACPI based platforms require the PCI host bridge driver to
> >>   be built-in rather than a loadable module because ACPI
> >>   needs to probe PCI devices during early boot.
> >>
> >> - Some subsystems (notably drivers/gpu/, but others as well)
> >>   have an excessive number of 'select' statements, so you
> >>   end up surprise-enabling a number of additional drivers
> >>   and subsystems by enabling certain less important platform
> >>   specific drivers.
> >>
> >>       Arnd
> > 
> > So if the argument is that the existing upstream Exynos platforms are required
> > to have these drivers built-in to the kernel to boot:
> >     COMMON_CLK_SAMSUNG
> >     CLKSRC_EXYNOS_MCT
> >     EXYNOS_PM_DOMAINS if PM_GENERIC_DOMAINS
> >     EXYNOS_PMU
> >     PINCTRL
> >     PINCTRL_EXYNOS
> >     PM_GENERIC_DOMAINS if PM
> >     SOC_SAMSUNG
> > 
> > ...then that is understandable and we can work to fix that.
> > 
> > My last question then is -- why do we need a new ARCH_GOOGLE_TENSOR config in
> > the platform Kconfig? For example, I don't really like this:
> > 
> > diff --git a/drivers/clk/samsung/Kconfig b/drivers/clk/samsung/Kconfig
> > index 76a494e95027..4c8f173c4dec 100644
> > --- a/drivers/clk/samsung/Kconfig
> > +++ b/drivers/clk/samsung/Kconfig
> > @@ -13,6 +13,7 @@ config COMMON_CLK_SAMSUNG
> >         select EXYNOS_5420_COMMON_CLK if ARM && SOC_EXYNOS5420
> >         select EXYNOS_ARM64_COMMON_CLK if ARM64 && ARCH_EXYNOS
> >         select TESLA_FSD_COMMON_CLK if ARM64 && ARCH_TESLA_FSD
> > +       select GOOGLE_GS101_COMMON_CLK if ARM64 && ARCH_GOOGLE_TENSOR
> > 
> > What happens when we have GOOGLE_GS101_COMMON_CLK, GOOGLE_GS201_COMMON_CLK, and
> > so on? 
> 
> Nothing happens... or happens anything you wish. Did you read the
> motivation why this was created like this?
> 
> 
> > How are we going to pick the right driver when e have a generic
> > ARCH_GOOGLE_TENSOR config?
> 

Okay, we can figure that out the gs201 specifics when the time comes.

> You do not have to pick. You select ARCH_GOOGLE_TENSOR and proper pick
> is done by you. Nothing to do more.
> 
> > Ideally, we should have one Exynos clock driver that
> > can detect what hardware is running (using the DT) to determine what it needs
> 
> It's already like this. We're done.
> 
> > to do. If you really want to compile out the other vendor's clock drivers using
> > some configs, then we should do that with SOC_GS101, SOC_GS201, SOC_TESLA_FSD
> 
> Whether you call it SOC or ARCH it is the same. We organized it as ARCH.
> 
> > configs (not ideal though). With that approach, we could drop the platform
> > ARCH_GOOGLE_TENSOR config and create an SOC_GS101 config that can be used for
> > things like the COMMON_CLK_SAMSUNG driver (for now) and building the GS101 dtb.
> 
> There is no need for this. ARCH does exactly the same.

Okay, sounds good. Thanks for the responses.

Regards,
Will

> 
> Best regards,
> Krzysztof
> 
