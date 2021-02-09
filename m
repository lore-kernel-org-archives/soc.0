Return-Path: <SRS0=xDNJ=HL=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97349C433E9
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Feb 2021 17:12:51 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 26DF264EC0
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Feb 2021 17:12:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 26DF264EC0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=sW4hPooDf+RCSuA9IYmYc0QmzX4GRhNKenrmNF8jSeQ=; b=fJG7Pc2Io73fm0EVDCCX8iAat
	WtsJujKMe6n/kiYgKzKGM98lfL7RmgnL19QJBz5CuvT4/iOdrKIaLltQmPCpPyuwPaEwcW8FEa6YY
	wU/zGnJ5nGETONOobIPDrmKGi8aTccd6dURW2IlFOg3/DkevHSVOYCLpLAmZQg/17DTFamlLMgOtW
	Q3iiP8eqeR61Img2QENqFgZheiLOvCapadUBbJJ/R1K/SwUwIgE5ezVcKFUtwfJdUm+TzPMhN23M2
	LLx8djT0ITSqgwPPDolHOb2aBvAZWkav4RNORp8EgtdXKdT0t+0IZJ6DmOBQq0OR+lL7dFabKgc//
	Dlxjg9c9g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l9WY2-0004mv-Sy; Tue, 09 Feb 2021 17:11:34 +0000
Received: from mail-oi1-x22e.google.com ([2607:f8b0:4864:20::22e])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l9WXz-0004lj-2R
 for linux-arm-kernel@lists.infradead.org; Tue, 09 Feb 2021 17:11:32 +0000
Received: by mail-oi1-x22e.google.com with SMTP id l19so7690931oih.6
 for <linux-arm-kernel@lists.infradead.org>;
 Tue, 09 Feb 2021 09:11:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=/M585z7ZzYXNwMMt9gcvkTvDIHc7/LPBrsNluqsDW04=;
 b=jjP+yMx/RnBV1Di0U/aHVSskc+93QxxwidegEwOpi9lmaTgAWGve0SttBEciPppPmA
 DunvXxLFRfsF/2VkhyAvba3hw9JBerLbbxDb28SWYBf3G6w0+OAbduiETqQhQyU8yIBU
 Pa+Up2445IBNhqbXnR8S/RlFeV8HU3nCYqtn3mgL6l3ttUE1UrarJvBlJ845xYtOlwik
 dV8O0tRLCEBm/xpkLctklvcbkPF1wkCoqbSiD9h7jQjr3Q7Bb/Q+3EX5CjDrZZYt7KG+
 72LeT6E/HjiJHn27Kjpv3ioubBhYwlW258NZTufp7uO+TykEV+IWHkf/p0Nyh/aNPYI/
 JvxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=/M585z7ZzYXNwMMt9gcvkTvDIHc7/LPBrsNluqsDW04=;
 b=rDt1/8qnFsuBVcsuSuZXeL5T4sqCdHx35fJw6RB/LN+XZseau77p/as4pq9nIN1+Q3
 sXZRDnOEf/W/imN5JV3VKajJud5CJiaGWBcgUWovutzOOC2Z+eT4pZ1rYElLV6Zdk99n
 9oGmpUlIRsNr/685VshQmlhlUN9AyPGWBAlVm2LKP5X1CabNgPKgPQI/lI8vUEKULw9f
 dq4ZzLU9NjUzZDWWZMsWIKaFYNzQxGEwmHZ6/w0FUCDwFVZTOp2l3m9N7twjoLKhjMCy
 Ar6bfxeWhsoMMnab2r/1isI0YEEGJ0WIFtHIjU8ArgNpITSQdlbRToUj/w08oIVvdbUv
 smCw==
X-Gm-Message-State: AOAM532YTkXfkx5UtG3hmHhfML7m6UbdTp6RH/yHBu4I2rhBFha/1JeL
 KzI7ykwGxvEWskezgNf9BFTdUg==
X-Google-Smtp-Source: ABdhPJwHt4G19lG9pP4nTma2e4koC2dEk87yls/3W9mzOMBIF8Jc/NpgIgypbQz3LP2NYfixSx9W1Q==
X-Received: by 2002:aca:dd08:: with SMTP id u8mr3233941oig.55.1612890688863;
 Tue, 09 Feb 2021 09:11:28 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net.
 [104.57.184.186])
 by smtp.gmail.com with ESMTPSA id m15sm4361297otl.11.2021.02.09.09.11.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Feb 2021 09:11:28 -0800 (PST)
Date: Tue, 9 Feb 2021 11:11:26 -0600
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Rob Herring <robh+dt@kernel.org>
Subject: Re: [GIT PULL 2/3] ARM: dts: samsung: DTS for v5.12
Message-ID: <YCLCPs7T72wH2HMI@builder.lan>
References: <20210206134531.l5vpzlmev4v3f3uo@kozik-lap>
 <CAK8P3a0Kgn9PTHjsU7MbJPC8vatvb9KYJJKWxrx7zQzTNgK10g@mail.gmail.com>
 <CAMuHMdWZ8QmiQCmiW9AvCpviNZeuaxThSo_4Xb2DGEs9hMTKMQ@mail.gmail.com>
 <YCGBIvRfoP0BeyrP@builder.lan>
 <20210208184230.onhlioflyylkx6xo@kozik-lap>
 <CAK8P3a3bsw8p2Geyo-vh1AJUfMQCCf3kpa_YB+tKmcvWHqRcEw@mail.gmail.com>
 <20210208213537.GA351084@piout.net>
 <CAK8P3a0QRcQM4rH9HgVMOHa_eATXsjRbGDXuMO7FgnA8OgPk0Q@mail.gmail.com>
 <20210208231040.GF351084@piout.net>
 <CAL_JsqJicBkH_a2kvM=+p3wde1T5Cx7C+qNR3r0WjksZfBnCKA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAL_JsqJicBkH_a2kvM=+p3wde1T5Cx7C+qNR3r0WjksZfBnCKA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210209_121131_503377_5E42CE82 
X-CRM114-Status: GOOD (  56.79  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
List-Id: <soc.lore.kernel.org>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>, Tony Lindgren <tony@atomide.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Frank Rowand <frowand.list@gmail.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 "moderated list:ARM/SAMSUNG EXYNOS ARM ARCHITECTURES"
 <linux-samsung-soc@vger.kernel.org>, Sylwester Nawrocki <snawrocki@kernel.org>,
 Kevin Hilman <khilman@baylibre.com>,
 Gregory Clement <gregory.clement@bootlin.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, arm-soc <arm@kernel.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, DTML <devicetree@vger.kernel.org>,
 Alexandre Torgue <alexandre.torgue@st.com>, Arnd Bergmann <arnd@arndb.de>,
 Maxime Ripard <mripard@kernel.org>, SoC Team <soc@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Arnd Bergmann <arnd@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Olof Johansson <olof@lixom.net>, Shawn Guo <shawnguo@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210209171126.U7O3asoLjcuBvUDL2F-41lXjdnxaEbvYK1vSCC_c888@z>

On Tue 09 Feb 08:27 CST 2021, Rob Herring wrote:

> On Mon, Feb 8, 2021 at 5:10 PM Alexandre Belloni
> <alexandre.belloni@bootlin.com> wrote:
> >
> > On 08/02/2021 23:14:02+0100, Arnd Bergmann wrote:
> > > On Mon, Feb 8, 2021 at 10:35 PM Alexandre Belloni
> > > <alexandre.belloni@bootlin.com> wrote:
> > > > On 08/02/2021 20:52:37+0100, Arnd Bergmann wrote:
> > > > > On Mon, Feb 8, 2021 at 7:42 PM Krzysztof Kozlowski <krzk@kernel.org> wrote:
> > > > > > Let me steer the discussion to original topic - it's about old kernel
> > > > > > and new DTB, assuming that mainline kernel bisectability is not
> > > > > > affected.
> > > > > >
> > > > > > Flow looks like this:
> > > > > >
> > > > > > 0. You have existing bidings and drivers.
> > > > > > 1. Patch changing bindings (with new compatible) and drivers gets
> > > > > >    accepted by maintainer.
> > > > > > 2. Patch above (bindings+drivers) goes during merge window to v5.11-rc1.
> > > > > > 3. Patch changing in-tree DTS to new compatible gets accepted by
> > > > > >    maintainer and it is sent as v5.12-rc1 material to SoC maintainers.
> > > > > >
> > > > > > So again: old kernel, using old bindings, new DTB.
> > > > > >
> > > >
> > > > I don't think forward compatibility was ever considered. I've seen it
> > > > being mentioned a few times on #armlinux but honestly this simply can't
> > > > be achieved. This would mean being able to write complete DT bindings
> > > > for a particular SoC at day 0 which will realistically never happen. You
> > > > may noteven have a complete datasheet and even if you have a datasheet,
> > > > it may not be complete or it may be missing hw errata that are
> > > > discovered later on and need a new binding to handle.
> > >
> > > You do not have to write the correct DT for this, the only requirement
> > > is that any changes to a node are backward-compatible, which is
> > > typically the case if you add properties or compatible strings without
> > > removing the old one. A bugfix in this case is also backward-compatible.
> > >
> > > The part that can not happen instead is to write a DT that can expose
> > > features that any future kernel will use.
> > >
> >
> > But I think we are speaking about the other way around were you would be
> > e.g. removing properties or splitting a node is multiple different
> > nodes following a different understanding of the hardware.
> > And in this case, any rework of the bindings will be forbidden, like
> > 32b7cfbd4bb2 ("ARM: dts: at91: remove deprecated ADC properties") will
> > break older kernels trying to use the new dtb.
> > 761f6ed85417 ("ARM: dts: at91: sama5d4: use correct rtc compatible") is
> > an other case.
> > I'm not sure want to keep the older properties or the older compatible
> > string as a fallback for this use case.
> >
> > > > > However, once the firmware is updated, it may no longer be possible to
> > > > > go back to the old kernel in case the new one is busted.
> > > > >
> > > >
> > > > Any serious update strategy will update both the kernel and device tree
> > > > at the same time, exactly like you already have to update the initramfs
> > > > with the kernel as soon as it is including kernel modules.
> > > > I would expect any embedded platform to actually use a container format,
> > > > like a FIT image that will ship the kernel, DT and intiramfs in a single
> > > > image and will allow to sign all parts.
> > >
> > > Embedded systems that do this have no requirement for backward
> > > or forward compatibility at all, the only requirement for these is bisectability
> > > of git commits.
> > >
> >
> > Yes and I can't see any drawbacks in this approach.
> >
> > > > > A similar problem can happen with the EBBR boot flow that relies on
> > > > > a uefi-enabled firmware such as a u-boot, while using grub2 as the
> > > > > actual boot loader. This is commonly supported across distros. While
> > > > > grub2 can load a matching set of kernel+initrd+dtb from disk and run
> > > > > that, this often fails in practice because u-boot needs to fill a
> > > > > board specific set of DT properties (bootargs, detected memory,
> > > > > mac address, ...). The usual way this gets handled is that u-boot loads
> > > > > grub2 and the dtb from disk and then passes the modified dtb to grub,
> > > > > which picks only kernel+initrd from disk and boots this with the dtb.
> > > > >
> > > > > The result is similar to case with dtb built into the firmware: after
> > > > > upgrading the dtb that gets loaded by u-boot, grub can still pick
> > > > > old kernels but they may not work as they did in the past. There are
> > > > > obviously ways to work around it, but it does lead to user frustration.
> > > > >
> > > >
> > > > Are there really any platforms with the dtb built into the firmware?
> > > > I feel like this is a mythical creature used to scare people into keeping
> > > > the DTB ABI stable. Aren't all the distribution already able to cope
> > > > with keeping DTB and kernel in sync?
> > >
> > > I think most traditional PowerPC systems fall into this category, most
> >
> > My understanding was that the traditional PPC systems had a small device
> > tree and usually are not affected by driver changes but I may be wrong.
> >
> > > systems that boot using UEFI+grub (as I explained), and anyone who
> > > uses a distro kernel on custom hardware with their own dtb.
> > >
> >
> > Aren't the ones using a distro kernel with a custom dtb more concerned
> > by backward compatibility (i.e. new kernel with old dtb) rather than old
> > kernel on new dtb? If they have an old dtb, an old kernel, and update to
> > a new kernel, backward compatibility will ensure this continues to work.
> > If then they work on updating their dtb, they still have the old one and
> > can make the distribution match dtb and kernel. This is already handled
> > properly by debian and I guess the other distributions as it is anyway
> > already matching kernel and initramfs.
> 
> SUSE is doing the opposite AIUI. This is a bit harder because adding
> any new provider breaks compatibility as the old kernel will wait for
> a non-existent driver for the new provider. That was the motivation
> for deferred probe timeouts. Of course, I wouldn't really call a
> platform stable if you are still adding clock, pinctrl, power-domain,
> etc. providers.
> 

IMHO "stable" in this context means that we've hit the point in
development when these questions are no longer relevant. Either because
the development is _done_ or more likely it's too old for anyone to
care.

Unfortunately this is the state that we're optimizing for and we're
simply relying on luck to boot Linux on a reasonably complex machine.

Regards,
Bjorn

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
