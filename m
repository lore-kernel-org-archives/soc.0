Return-Path: <robh@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E451C433F5
	for <soc@archiver.kernel.org>; Tue,  9 Nov 2021 00:26:03 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 481DD61242; Tue,  9 Nov 2021 00:26:03 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3178D61178;
	Tue,  9 Nov 2021 00:26:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1636417563;
	bh=tNyHmn7MoFG7hGgzaH5iztXIDQ91XHEjgXIf7yVyImg=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=tEBqybOJxNaLmxWJg40hpf+l8w9g/ZPAo/0zDbagXH+0uKT4OOi6bksxuXMI91Rw6
	 wx/uOt102JX1Vdni+9yVGrSRTzxTdGgwVUw5taC0yviF39/nfezDbefmjUpAUVvn85
	 o5r0yiqxBSIV9RfKkt68QLnoaARB/coEcrbVgVTQZn3O3/nv3Qfbf9YaHBBVaotRmh
	 Pr5rxUiCVkgeVmEUaS+6O/wfbkXU5TyM9Z5Lr/bklLIcvrHPIxYBnQlyCkSfUoibZ/
	 MaEjrvu+4RPhF/HeUYQ0KHHVJgBQyM/0mvfaXWh3yp5Xy/7XDj4zEM0rdIVYk5IMyF
	 9sSxcEGNfZBHg==
Received: by mail-ed1-f47.google.com with SMTP id ee33so69894674edb.8;
        Mon, 08 Nov 2021 16:26:03 -0800 (PST)
X-Gm-Message-State: AOAM532REPGuISWdnGu0AKXJNroLk1bhrT/mPYsk5zD8kBQd4PgVuftc
	18CVVjIPVoQ2PzFllDvlI5MOJaUq4yWzPZO7mA==
X-Google-Smtp-Source: ABdhPJwOg7U7/SkPH9Z9GutFtAb8W9OtiSRxQGQ5YxNEBT5VNJyIgLfLqyka+tL2yoRRAm53DoLYkgdk5kNLrUyxb+s=
X-Received: by 2002:a50:da06:: with SMTP id z6mr4231493edj.355.1636417561688;
 Mon, 08 Nov 2021 16:26:01 -0800 (PST)
MIME-Version: 1.0
References: <20211024232003.211484-1-linus.walleij@linaro.org> <20211105183930.GA1448386@roeck-us.net>
In-Reply-To: <20211105183930.GA1448386@roeck-us.net>
From: Rob Herring <robh@kernel.org>
Date: Mon, 8 Nov 2021 18:25:50 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+XAVio9Drvi-XPN=wHojE2PaxLa3pjxdO73H_0iVXi3A@mail.gmail.com>
Message-ID: <CAL_Jsq+XAVio9Drvi-XPN=wHojE2PaxLa3pjxdO73H_0iVXi3A@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: arm: Update register-bit-led nodes 'reg' and
 node names
To: Guenter Roeck <linux@roeck-us.net>
List-Id: <soc.lore.kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, ARM-SoC Maintainers <arm@kernel.org>, SoC Team <soc@kernel.org>, 
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, Liviu Dudau <liviu.dudau@arm.com>, 
	Sudeep Holla <sudeep.holla@arm.com>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Content-Type: text/plain; charset="UTF-8"

On Fri, Nov 5, 2021 at 1:39 PM Guenter Roeck <linux@roeck-us.net> wrote:
>
> Hi,
>
> On Mon, Oct 25, 2021 at 01:20:03AM +0200, Linus Walleij wrote:
> > From: Rob Herring <robh@kernel.org>
> >
> > Add a 'reg' entry for register-bit-led nodes on the Arm Ltd platforms.
> > The 'reg' entry is the LED control register address. With this, the node
> > name can be updated to use a generic node name, 'led', and a
> > unit-address.
> >
> > Cc: Linus Walleij <linus.walleij@linaro.org>
> > Cc: Liviu Dudau <liviu.dudau@arm.com>
> > Cc: Sudeep Holla <sudeep.holla@arm.com>
> > Cc: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
> > Cc: linux-arm-kernel@lists.infradead.org
> > Signed-off-by: Rob Herring <robh@kernel.org>
> > Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> > ---
> > SoC folks: please apply this directly for v5.16.
>
> This patch results in widespread sysfs backtraces with various qemu arm
> emulations (versatilepb, versatileab, realview-pb-a8, realview-pbx-a9,
> realview-eb, realview-eb-mpcore, integratorcp, mps2-an385).

Sigh. I'm working on a fix for this. Though the only way to fix
without a DT ABI break is reverting. A stable kernel update is
probably good enough.

There's a problem with the clock changes, too, but it looks like it
just affects the CLCD.

Rob
