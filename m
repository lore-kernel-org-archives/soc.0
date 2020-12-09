Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F1DCC4361B
	for <soc@archiver.kernel.org>; Wed,  9 Dec 2020 21:41:05 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 4AA9123D21; Wed,  9 Dec 2020 21:41:05 +0000 (UTC)
X-Gm-Message-State: AOAM530oucN7ODs5YNBa/QlcbinC1vL4dxXv4Bb3Ttx00NhMK5tBc7HX
	4OLoAPqLWxLxkikcf0rbJqhSDrQWzH2+ScPVpEs=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1607550065;
	bh=4B+BjMNpABWXM3n7PCJ/W2GaQRP7WBAsFSLK9YRNYUk=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=Dwr5mFaAaynWP/7dNHqjy1BfsUx2k2Hs2nfrSEWdDQG3BESdVywW2NPos0Z0qiw6W
	 vh3MmplTJOZ9qe7EzPeOojiTiqNGGfzjxpP+oWdgdmRtCw+8ox5nvsqDJKtqSfTN6Q
	 ky1Tcj1ZRPy2EgVw6T+zbFTPwJLY3p8hgaTUkw26kF7GHhnNciG+smsx/4daa/QZ99
	 g1yV2xzbDwy2aM6fHjp1YUsheSJbExaONIuD1TqZgzrmBfFhbY35RwmCE4a8L//1kN
	 0kn2hblFovn22fdlCz2vYjn0fSNeYdjaMEM9eiiv67YzZZrw3KmDxzihW0O6ge+Gy3
	 vfuKfXxBgwY1g==
X-Google-Smtp-Source: ABdhPJzPUyteN0KBUkcXYbviZy9ByW6Yy08enpG5Z1j8rVnDAR9zgBhDk+tIfS9/FDCEMWUMvLeImBFqADC4rJ9O+1g=
X-Received: by 2002:aca:bd0b:: with SMTP id n11mr3190942oif.11.1607550064431;
 Wed, 09 Dec 2020 13:41:04 -0800 (PST)
MIME-Version: 1.0
References: <20201129110803.2461700-1-daniel@0x0f.com> <CACRpkdYEzFYw=CbBFCs9=DfarsCQKD0zA2WvE95nF8ehA_2i1g@mail.gmail.com>
 <CAFr9PXmx1XZmVOp8mLygnDUfEKPpo6=ZQPMKSCnZf0i23mNqVw@mail.gmail.com> <CAK8P3a0KHiO0Xis9+hiJa7uDZET9xzf7wRExxZXBUFXeAEMXqQ@mail.gmail.com>
In-Reply-To: <CAK8P3a0KHiO0Xis9+hiJa7uDZET9xzf7wRExxZXBUFXeAEMXqQ@mail.gmail.com>
From: Arnd Bergmann <arnd@kernel.org>
Date: Wed, 9 Dec 2020 22:40:48 +0100
X-Gmail-Original-Message-ID: <CAK8P3a2Kokj+fgRPGcSCcSW8x2=4_P1LJqmBp09_QtBRD0yf4w@mail.gmail.com>
Message-ID: <CAK8P3a2Kokj+fgRPGcSCcSW8x2=4_P1LJqmBp09_QtBRD0yf4w@mail.gmail.com>
Subject: Re: [PATCH v4 0/5] Add GPIO support for MStar/SigmaStar ARMv7
To: Daniel Palmer <daniel@0x0f.com>
List-Id: <soc.lore.kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Olof Johansson <olof@lixom.net>, SoC Team <soc@kernel.org>, 
	"open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Rob Herring <robh@kernel.org>, Willy Tarreau <w@1wt.eu>
Content-Type: text/plain; charset="UTF-8"

On Wed, Dec 9, 2020 at 5:47 PM Arnd Bergmann <arnd@kernel.org> wrote:
>
> On Mon, Dec 7, 2020 at 11:55 AM Daniel Palmer <daniel@0x0f.com> wrote:
> >
> > Hi Linus,
> >
> > On Sun, 6 Dec 2020 at 06:43, Linus Walleij <linus.walleij@linaro.org> wrote:
> >
> > > OK finished!
> > > Patches 1, 2 & 3 applied to the GPIO tree for v5.11.
> >
> > Awesome! Thank you Linus. :)
> >
> > Arnd and Olof: Sorry for being a noob.. Is there anything I need to do
> > for patches 4 and 5 (device tree bits)?
> > They are in the Linux SoC patchwork.
>
> I've picked them up from there along with the second series of DT changes.

And I made a mess, as I had not realized that the DT patches depend on
the dt-binding header. I've applied that patch on top now to make my
branch build cleanly again, even though it is not fully bisectable.

        Arnd
