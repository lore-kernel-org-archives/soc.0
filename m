Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75F82C4361B
	for <soc@archiver.kernel.org>; Thu, 10 Dec 2020 20:22:22 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 34BA423E1F; Thu, 10 Dec 2020 20:22:22 +0000 (UTC)
X-Gm-Message-State: AOAM530sL22WgKrFPhVz918cAVMFHia3GHGYAWOoZwvaQEtj0lPZ2IaE
	uAO+x6TAZaBfg/8T3tmeOr8LP+n84Don0KMilzw=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1607631742;
	bh=8TQ1bUVPk8mSwF7lFyW8OxP9kuYRMvtYBaxVPJ14Hao=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=LmemddH0eISy+dJVujpx3ALD9+yen2fzEtp8zOQINkjxq+B5hDbe4HS3M8A7nOp8v
	 WBovG/B1gN8KIAXyHZW+j7a76VRXYD4Psc7nQPokaiW19j+VgvaGq71r8T0k9Q9ioa
	 xaPY5ajr6lqKIgu6c5QhWM0o5KsfO7bqdIJEEm1E2LhHsraj0GrkLkwUyvQb8mD3L+
	 wBgA0zg6VM5AZ0VXljFydTLw18zv/6Nc5ie/4qwaEO6tEbf388Tt/VqrBNqLzwvjOh
	 izbhUwxR95Mrf/AdsfVQVhRsK3/idvvNdqDophEo25e+9jSPIvYA7m2RWuGQjoDMeI
	 yrxQ61zXZchhA==
X-Google-Smtp-Source: ABdhPJxpr7G1kGMUrmTW1nCq9okIroksVn1Y8gcDkWIIb7j4ouv4Upl/Vr7Ae3KCHLUqI0iz/3uXUIgx/px9a/O1BPc=
X-Received: by 2002:aca:44d:: with SMTP id 74mr6798421oie.4.1607631741379;
 Thu, 10 Dec 2020 12:22:21 -0800 (PST)
MIME-Version: 1.0
References: <20201129110803.2461700-1-daniel@0x0f.com> <20201129110803.2461700-4-daniel@0x0f.com>
 <CAK8P3a2DGLfkOEm3JeXN-jWvDfxberaXXqOtu4wKdtYzqDWiNQ@mail.gmail.com>
 <CAFr9PX=fhKiZF80iKaGeBWOONm3VpwtzgbB+yBHk8MHdTotaHg@mail.gmail.com>
 <CAK8P3a0zCa0Dq8uUDoSbu64sGLeNWrSk=6i4pKzgwerRseXfnA@mail.gmail.com> <CAFr9PXnGF1PV8vnCpdCuSB-z9ns5BPDjhJvPg7b+rUC0GrjhqQ@mail.gmail.com>
In-Reply-To: <CAFr9PXnGF1PV8vnCpdCuSB-z9ns5BPDjhJvPg7b+rUC0GrjhqQ@mail.gmail.com>
From: Arnd Bergmann <arnd@kernel.org>
Date: Thu, 10 Dec 2020 21:22:05 +0100
X-Gmail-Original-Message-ID: <CAK8P3a0HzxVcuY-6hTf5e9yeM_NF6AafG_Pv5YrOvrMVuUdrEw@mail.gmail.com>
Message-ID: <CAK8P3a0HzxVcuY-6hTf5e9yeM_NF6AafG_Pv5YrOvrMVuUdrEw@mail.gmail.com>
Subject: Re: [PATCH v4 3/5] gpio: msc313: MStar MSC313 GPIO driver
To: Daniel Palmer <daniel@0x0f.com>
List-Id: <soc.lore.kernel.org>
Cc: SoC Team <soc@kernel.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, 
	DTML <devicetree@vger.kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
	Rob Herring <robh@kernel.org>, Willy Tarreau <w@1wt.eu>
Content-Type: text/plain; charset="UTF-8"

On Thu, Dec 10, 2020 at 4:49 PM Daniel Palmer <daniel@0x0f.com> wrote:
> On Thu, 10 Dec 2020 at 23:28, Arnd Bergmann <arnd@kernel.org> wrote:
> > > > It would be helpful here to replace all the readb_relaxed/writeb_relaxed()
> > > > with normal readb()/writeb(). Don't use _relaxed() unless there is a strong
> > > > reason why you have to do it, and if you do, explain it in a comment what
> > > > the reason is.
> > >
> > > The reason is that readb()/writeb() will invoke the heavy memory
> > > barrier even though it's not needed for peripheral registers.
> > > I guess it doesn't actually make all that much difference in reality.
> >
> > Ah, I forgot you had that heavy barrier. It depends a bit on what you
> > use the GPIOs for then. For most uses I think the overhead does not
> > matter, but if there is any bit-banged I/O it might make a difference.
>
> Bit-banged buses are likely to happen I think as there is a lot of
> gpio compared to hardware peripherals.
> Anyhow, I'll add a comment for the readb_relaxed()/writeb_relaxed() usage.

In that case, maybe add an abstraction for register access in an inline
function that takes a pointer to your device-private data and the register
offset, so you have a good place to describe it once.

      Arnd
