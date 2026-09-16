Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D641C4A2A5C
	for <soc@lists.linux.dev>; Wed, 16 Sep 2026 21:43:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789595014; cv=pass; b=F89RKIedg5e7bjKs8uP04WuFOL3Z3Zqc47MBwr/p+k7nBhUp3g5PcUeZfqcKNM34QwKfPQ2eQAJJDyzoJ6U9gb5Cs0qXo+qqdwhHryo0Dw6eGtQvejKfwn0A2VyD0sxr6X+QUivPPpcoCMG/bV224hf3kCYwKA6K/awQKZH6Utc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789595014; c=relaxed/simple;
	bh=AayDStxvWbgnmWnKvKHBN/OOsgvHcfSQuvWss2icNiE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=b1OEwsflGW/BPMuMxyTW5Qvnm4FRZw3fTr1zdP5zECJSbUSuRzt8FRSmB2J+HjYSGH88T0ViXhfOYoNd3NuAcCDeTPn1aHvm9LyezI6NjNaNBq7n+rynqtYU7QzFUHWG249LxCsad9rNaoz+h1YrHOThYTXj4YSflTsVA9v2+48=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=starlabs.systems; spf=pass smtp.mailfrom=starlabs.systems; dkim=pass (2048-bit key) header.d=starlabs-systems.20251104.gappssmtp.com header.i=@starlabs-systems.20251104.gappssmtp.com header.b=WX2gqR5j; arc=pass smtp.client-ip=209.85.128.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=starlabs.systems
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starlabs.systems
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=starlabs-systems.20251104.gappssmtp.com header.i=@starlabs-systems.20251104.gappssmtp.com header.b="WX2gqR5j"
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-86162c086f8so790337b3.1
        for <soc@lists.linux.dev>; Wed, 16 Sep 2026 14:43:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789595003; cv=none;
        d=google.com; s=arc-20260327;
        b=WKFW/cCPTPksXJvZBEn2JLAt/B1MGB3yjf1VBAB2pfjPWA3SMDIgDbjXAOtWlqNsld
         jCqGqIpiIN/YhrFAa9KEwRJCyuQwp8XhoDpTPstnrSx7MTJUm5dJJI81XcKaxTKU635p
         nXvCHV4kxfo77KG48OhNS4AFbzCi2KrIIpBBtKnQOw9kD43vGrqR0Acd3YwPQpvTUmpC
         RQqWqY0mxmsCQZ1677c12Mn2t9Ha7vM9ViLUQpRW0x5nFYmkI7SZp1THSs7rs3poxSJv
         D3CIcn1ll6fALc+Ij5sy5kgh0VU3jo7GEXqF8Xal4Yflgp4BaWy94887SuRqP0xeeywS
         0b0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=XcwxAB43YdszLPV10ZP5iQsr+p0JEvwgv6jHK+rlABU=;
        fh=rHOEVC9WRUQR5RRw6ULr2LM7vx6lzhI0ZrZdYNd5tQ0=;
        b=i9nbZ8jAfS8EVKObv4GVlyg03SmcrMFq9F5dFDicMa77inXX9SojyGbPOPfZJoYlpY
         qyfzt0ZauCsEEzOwCN/PyaakRXqNxF8Qo1SpRE7ktva9JXPw5whjghY0fzDyeaqw0igJ
         TioDLh/1I5sakVpCjcdGnNmgThk+BIRJonSblPNakWOccYQNb4RdZdlKpE1GHm//NPcK
         MCvs6DcUXjS2PyoSedzoRWJl1YITo8K81BJuZNrCXJ8xKsNFn3uVkZdxM/jVXwGUQdp3
         vI0Bb7trX+dDLVSwTSqIqswm+16U0w148Pn3arvH2m5TkwqrpLWYrr2yY7B3tosEdZAc
         ianA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=starlabs-systems.20251104.gappssmtp.com; s=20251104; t=1789595003; x=1790199803; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XcwxAB43YdszLPV10ZP5iQsr+p0JEvwgv6jHK+rlABU=;
        b=WX2gqR5j7oQQkb8X8KaLkQ+5dXufncPPrnYmjZGVkawrC/jcrGMDtmqooduq4LqHVv
         OoyB+CEGofboM9fuESWPIKxLsP6tsGgVa8A9lhTjLAtwMhB4JJGln91+WAczFLLejoTW
         Upiucq6KmXgVpboH3JuygAwrkZ35aR7520XBAdjTApG+clJ2DABIdjNZgCA8z3xo8itS
         OrrHleVB8fz/P9Ced0NlWa+MCQenUUd2PE9MSWmQH5zcZKvEusris2j2pSbWU54rliyq
         TY51i0JW8GKPbUnCojIqKzYvl3TAShWkgKp4G7OBe5i885ojrV8bIJHbPQhRLhlESoR4
         lrsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789595003; x=1790199803;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=XcwxAB43YdszLPV10ZP5iQsr+p0JEvwgv6jHK+rlABU=;
        b=MviDNIRyTiqirF6Yb9dLPQkmicY710fjZSThE7NzWP3lY1viSgkAN2DkNVRGT+T6OC
         j/f9KGxaIT1sxbiU84+WQq3g5aUgN5SC1s6OCENwW1Dc53zTMzRr6Fg8h2t+B29tOMnj
         mOBlL5MsisYVNPQXqjAVby905n7tt1/8xXomUpJvUwEBmcpOwJpmK2Vh/cjNeXzt+Epr
         dauejM9lJg8+AlzqWv7t08G9JLRZwG858Ymr9+HCg30g//FBp4jh5xdFevd0UXrVjNLg
         rm0wWiJL+k0tZiFOCRvNP/e8EyVPGfFb7cTeZfQp7FXmWr9ExMoY0wxL93TFE7WGWZAu
         gsng==
X-Forwarded-Encrypted: i=1; AKwUvBz3IgNIb0gMtVwdB5rs7wK8AvyLUefsbiYSU9NAF2GpDph0iizBWPvES1+XLL3jaPbdpRM=@lists.linux.dev
X-Gm-Message-State: AFuF++m2XVSKx9Fy8ChxoFWzW61NwRGlLk2YgsAE+okqkgs00xlur0Op
	RbuHxAn8bZUrR3KsxIBar3EtNQ1KGy9GJcRA6mIfamKVYp/jVHIY7xkyjNKxoEJmK2TWqjME+8W
	ft7rFY+UeNqbj6ZZKQP3ytVnrtvgXoX7sp5B/NnKTBgPh0QgyWK6alsdN
X-Gm-Gg: AYBFou2KYXv9AeaccSOIax5pqqsPaVgKMdiShe3mOxfpyNTY7HsdTmBib+W/86ysaeQ
	oCjRAKsdqvIjIyod7Z2QjnUrIDhP41NBR+pMuJC2V5NkV2smVsWk0AsSX90HepJcZ3HLEtQN6Ex
	v/XKOhyOcEdIO5vbJajKXhKoM3KL29xZwNeJQ2Yq+5sbIWU5AwxkiduwHNWvNrp24VaRUxsaqda
	dWSqmCiBTTunyJMAjnMSm3FbiOcFb1RGMNbeDWykj/9pPdTzWm9xTZxlRfALl9aMF7bBKbZAxVU
	q8S99F/lZvb/ONHPiWYjE/WNptBZYmw7WSl6Nfqlma5Tqzs4dC5k6Pv/T/OfQMmE0ulQmJTP8aY
	Dm6indOG8sA==
X-Received: by 2002:a05:690c:7:b0:873:5c7b:c12d with SMTP id
 00721157ae682-8944596a1a4mr2540477b3.21.1789595003466; Wed, 16 Sep 2026
 14:43:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1788284852.git.sean@starlabs.systems> <apfz3lf1RIfAkKYS@google.com>
 <CABtds-0w2b0P6SGoAZGHJe-4usmG6B8SUP1ufRQyp0+9UFcF3g@mail.gmail.com>
In-Reply-To: <CABtds-0w2b0P6SGoAZGHJe-4usmG6B8SUP1ufRQyp0+9UFcF3g@mail.gmail.com>
From: Sean Rhodes <sean@starlabs.systems>
Date: Wed, 16 Sep 2026 22:43:10 +0100
X-Gm-Features: AcwNN1U8ZB3podUdFXiPZ834VqBifCusJKONnKfdetS9jbEaRFfMhwBYCh_JS1c
Message-ID: <CABtds-2srRmKDvNj7g_0C2w8L72WczLsA+Vc_Yg3KC4gvSJyqw@mail.gmail.com>
Subject: Re: (subset) [PATCH v14 0/5] coreboot CFR firmware attributes
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: linux-kernel@vger.kernel.org, Hans de Goede <hansg@kernel.org>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Corentin Chary <corentin.chary@gmail.com>, "Luke D. Jones" <luke@ljones.dev>, 
	Denis Benato <denis.benato@linux.dev>, Prasanth Ksr <prasanth.ksr@dell.com>, 
	Jorge Lopez <jorge.lopez2@hp.com>, Mark Pearson <mpearson-lenovo@squebb.ca>, 
	"Derek J. Clark" <derekjohn.clark@gmail.com>, Joshua Grisham <josh@joshuagrisham.com>, 
	Will Deacon <will@kernel.org>, Douglas Anderson <dianders@chromium.org>, 
	"Kiryl Shutsemau (Meta)" <kas@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, 
	Chen-Yu Tsai <wenst@chromium.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	platform-driver-x86@vger.kernel.org, Dell.Client.Kernel@dell.com, 
	Brian Norris <briannorris@chromium.org>, Julius Werner <jwerner@chromium.org>, 
	Javier Martinez Canillas <javierm@redhat.com>, Bjorn Helgaas <bhelgaas@google.com>, 
	Danilo Krummrich <dakr@kernel.org>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>, 
	Titouan Ameline de Cadeville <titouan.ameline@gmail.com>, 
	Laxman Acharya Padhya <acharyalaxman8848@gmail.com>, Yidi Lin <yidilin@google.com>, 
	Kees Cook <kees@kernel.org>, Takashi Sakamoto <o-takashi@sakamocchi.jp>, 
	chrome-platform@lists.linux.dev, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
	Bjorn Andersson <andersson@kernel.org>, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, Arnd Bergmann <arnd@arndb.de>, Eric Biggers <ebiggers@kernel.org>, 
	Luca Weiss <luca.weiss@fairphone.com>, Michal Simek <michal.simek@amd.com>, 
	Sven Peter <sven@kernel.org>, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Linus Walleij <linusw@kernel.org>, Drew Fustini <fustini@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, soc@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

How about patch 1 and 4?

Thanks

Sean

On Wed, 2 Sept 2026 at 11:01, Sean Rhodes <sean@starlabs.systems> wrote:
>
> Thank you :)
>
> On Wed, 2 Sept 2026 at 11:01, Tzung-Bi Shih <tzungbi@kernel.org> wrote:
> >
> > On Tue, Sep 01, 2026 at 06:48:01PM +0100, Sean Rhodes wrote:
> > > Move the firmware attributes class helper out of platform/x86, rename the
> > > coreboot-table firmware driver directory from google to coreboot, and add a
> > > coreboot CFR firmware attributes driver.
> > >
> > > Changes in v14:
> > > - Rebase on current upstream master after Linux 7.3-rc1, preserving the
> > >   intervening coreboot table bounds and CBMEM no-map changes.
> > > - Drop the standalone include-order cleanup. Replace the affected relative
> > >   includes directly in the firmware attributes helper move, as requested by
> > >   Tzung-Bi.
> > > - Split the DRM coreboot framebuffer dependency update from the firmware
> > >   directory and Kconfig rename so it can receive a DRM Acked-by separately.
> > > - Keep the CFR driver and its runtime behavior unchanged from v13.
> > >
> > > [...]
> >
> > Applied to
> >
> >     https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform/linux.git for-firmware-next
> >
> > [2/5] firmware: Rename google firmware directory to coreboot
> >       commit: 44e33a5aaa2de3f5cf2701d6f4b0a7c63d4fe602
> >
> > Also created an immutable branch "ib-coreboot-rename-7.4"[1] for patch 3
> > and patch 5 which build-time depend on it.
> >
> > Thanks!
> >
> > [1] https://lore.kernel.org/all/apfyaxKEEJz20wRC@google.com
