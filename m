Received: from mail-yx1-f52.google.com (mail-yx1-f52.google.com [74.125.224.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C146378D93
	for <soc@lists.linux.dev>; Wed,  2 Sep 2026 10:02:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788343326; cv=pass; b=X5/vU7nIS32Uddi507we6W1Hqxg62OgiszE9tnbBziZgma+lvNyeIcwPxujNt6OxOSelyxJSYVVwdIByRCbHvcC02+8G2tusosMmkbjclwExgzvtIkoLQFzlK5ZOUIvPu89DiVxmZ/ivAipBz6A3GANOwy5dXQPOQFvwBTx7gxE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788343326; c=relaxed/simple;
	bh=BsYSShzm/APLl8qc9BTfD5vA4H/CGzk4/kuElmC6cRY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OMid2ovx81CxdPMDYonB4iO9ps9CmegjjYheUKv3VLdikTT636jZI86NyrxH2yFZcyV7pyCXFNdi3elOUKINhfoiLhfwj2rTzONfZfMKwhfIHZDRbS7OQA6qNtOg0sQGiGHFYV6axSRdkxGhhhxqBOcmanzWuj5firFPFHKPjiI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=starlabs.systems; spf=pass smtp.mailfrom=starlabs.systems; dkim=pass (2048-bit key) header.d=starlabs-systems.20251104.gappssmtp.com header.i=@starlabs-systems.20251104.gappssmtp.com header.b=H7XLwLD6; arc=pass smtp.client-ip=74.125.224.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=starlabs.systems
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starlabs.systems
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=starlabs-systems.20251104.gappssmtp.com header.i=@starlabs-systems.20251104.gappssmtp.com header.b="H7XLwLD6"
Received: by mail-yx1-f52.google.com with SMTP id 956f58d0204a3-66e64e6e3fbso890709d50.2
        for <soc@lists.linux.dev>; Wed, 02 Sep 2026 03:02:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788343322; cv=none;
        d=google.com; s=arc-20260327;
        b=ZpVXkd7r8mnn9fUp0yFsrbg2FVcNnmx0Mzl9V+nM7vRSySPKs2GuOR2oNvub9ms/Nz
         +pknvUCCHp+pCQguvj07LGIzIQLzRxd50KCB4CUXAx9qzF7DXKFglfEey361kV7Jns4O
         aYtif+Mfj5shRkl02BGuWw4ZCfVnDwDXZY7hJNOqhxp2bpoEjwKW2Y2+JdWJpvTBEb1h
         Koo1ojOmqMic0fWfILKMmAVNYpO/XSoW3N+SqoI5vgCps+DkTovzkxhJmzKarBsQ8+D4
         c+fDOjhjXjlI+AfeYsGaJvmDhFFF8JLT9fJjmfbe+POzNErUY6x+NkA4wAaaJ45UlSMa
         kk8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=7Yl5QmRxyNgI9FkGfHWferAKBRopNrYR4eAo0FssY70=;
        fh=vp9NxTgAWe3TZ9tQ9Zhc/wjfPyyQ/i/y4REvhuPVde8=;
        b=WpjKnZC3Oy5r46/wU2YdDMnMFqZoG6htM9wPzki6yBv5+SHhlsU3e7b1E3FPbGnFb+
         HwTjRojoLdAzwMZuCg+9Pj/9lrQlXy96O/2Q1feYtdAtntRLH/Ptm/KwR8k/4ONMaK8q
         nYzL7LIo4L4CeiLcs4SZvJJ0BLXfMnAlJzj8lcZhpNryqeJUY9aHT7FZTIby4typqokF
         57UFB17n8uzRbyrBiNPDqXL2ILC/k4iUwHu2qGWvfWB44i/u02S0L+r3FYIINsB+wzE0
         VrjF5asz9E0w9W5c+0N8u/Byul09cWIWZ/k9VZ906KqDfAiY3dUo3j6OSZTk20knJA04
         V5+Q==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=starlabs-systems.20251104.gappssmtp.com; s=20251104; t=1788343322; x=1788948122; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7Yl5QmRxyNgI9FkGfHWferAKBRopNrYR4eAo0FssY70=;
        b=H7XLwLD6c+HH41OzEBhy66pWIL+Eh3dD/uZD9u0dZgszhiujP+sujWECyeV4ZBHWnK
         nHDToq7uJufuikFI2BjwpU9BtRduuxuRJLHFfGsh/KqLRzpeH/gpmNjtZx8FwsmtoX3h
         nrYF08bHIzsbuBgXcTawMh76l+jAOqDD/DUfSn00A0xm4WBEFgO18AfpqHeN7iMUsfF4
         XdiAMbwGcMRJkMIOodcxJ6Ni4Ai2slxwqAgy3bQ/NYUTAj2siV1SkcDIfzcsHLxxJm7m
         9tYdGzRC3EQOrU4YIkfqEuxfCdrr9IXd7tubFFIYvD6KcpQMw4q1Ex1bqYP9oXYfvpGp
         KIoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788343322; x=1788948122;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=7Yl5QmRxyNgI9FkGfHWferAKBRopNrYR4eAo0FssY70=;
        b=KK0Sg2toD3S33kJjyrXwlfpp7k6zct8WJd1o/i/+13htWRKCf2M8Mjoe8zmYxC4bWA
         Ls3HiJnGTZbD53o+URCB+qOOiWoqBe7hB0Q2P7AOJQJGfjeVR8qpWojnLx6mrm1IjGdD
         gk4rxStUBwm+nSI/Ja8fZEPtq3TXq6x3hPhdpMlQtM8Ajg21fEZ62Hu8g2cx0KOT74ns
         ItvKA/SpQwTv9kQatcDyPhG1DbaPqLdcDpcMiAgQdptH/tByJ3YjjAWr8j0303VtO1C5
         YB6NnLvsAtb6m1sWxWuNyAto0XP/S9t5rbMNHD7z25iisdD1q09eTB4eOvCY9twIA+dG
         F31w==
X-Forwarded-Encrypted: i=1; AKwUvBxJcsd9a9T3s+I8BsDD8mg4PaSfQ4XuMDJevfh7qtAB++JERia+3s61vo7JpiuotXhv8pk=@lists.linux.dev
X-Gm-Message-State: AFuF++keVTQZb+ckI+CNv59rCkRfFDk0/8CJhpsLr2iylvSlxKZC3fOj
	+gt5a4DUSXYqaqYLEKLUygmo9HE//WSKthaXpHSUJ2sfX5k4XwpI+s+5eRC6bp5K2edfAtC4EmE
	Z7r9Xm/6Lqh/ZhAl9CZX6gD6uXZFUc3u50swH/Bl2
X-Gm-Gg: AYBFou3a74ATKm3RVvZlcIEUmJIwnN0zmArszTCPZAfPWOYsaTAosX5PD0lHCAuEely
	Jr2XLdl2X1IRRkhaCRX+5yCPcF41uZUE/Sg0gjOY/dHNkoOXCYj9KrLu3q+9XpSBYLI1ms46VPl
	I3DEcd/YDrwamm55y5LmZvsMod6z5hqhvh4luhj4Fgp19qtO0e2ztF6EQ94oaGgv3tXvzLwK8gt
	o5zkG96hK1xuzyAfSO9jxfjGrmikC4Rt/vONwvrtzTdj0118GRGfehYIEFWSqldCrffUGKpd6qV
	hXLs3c0IK5XaSoJCl2yCkQvYhppj43Nv9BqQdNRGbrIMNkBGzUDtfUS4iKb4OJxtK5vOHD72kDp
	R
X-Received: by 2002:a05:690e:1514:b0:66f:7c64:9d47 with SMTP id
 956f58d0204a3-66f9bd4991dmr1118782d50.23.1788343321975; Wed, 02 Sep 2026
 03:02:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1788284852.git.sean@starlabs.systems> <apfz3lf1RIfAkKYS@google.com>
In-Reply-To: <apfz3lf1RIfAkKYS@google.com>
From: Sean Rhodes <sean@starlabs.systems>
Date: Wed, 2 Sep 2026 11:01:50 +0100
X-Gm-Features: AcwNN1XY2WlZI7b41cj9pFZjq4mCyoo_3nH6T_KZHZYXfCYS3mXFpBitd3ECMtg
Message-ID: <CABtds-0w2b0P6SGoAZGHJe-4usmG6B8SUP1ufRQyp0+9UFcF3g@mail.gmail.com>
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

Thank you :)

On Wed, 2 Sept 2026 at 11:01, Tzung-Bi Shih <tzungbi@kernel.org> wrote:
>
> On Tue, Sep 01, 2026 at 06:48:01PM +0100, Sean Rhodes wrote:
> > Move the firmware attributes class helper out of platform/x86, rename the
> > coreboot-table firmware driver directory from google to coreboot, and add a
> > coreboot CFR firmware attributes driver.
> >
> > Changes in v14:
> > - Rebase on current upstream master after Linux 7.3-rc1, preserving the
> >   intervening coreboot table bounds and CBMEM no-map changes.
> > - Drop the standalone include-order cleanup. Replace the affected relative
> >   includes directly in the firmware attributes helper move, as requested by
> >   Tzung-Bi.
> > - Split the DRM coreboot framebuffer dependency update from the firmware
> >   directory and Kconfig rename so it can receive a DRM Acked-by separately.
> > - Keep the CFR driver and its runtime behavior unchanged from v13.
> >
> > [...]
>
> Applied to
>
>     https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform/linux.git for-firmware-next
>
> [2/5] firmware: Rename google firmware directory to coreboot
>       commit: 44e33a5aaa2de3f5cf2701d6f4b0a7c63d4fe602
>
> Also created an immutable branch "ib-coreboot-rename-7.4"[1] for patch 3
> and patch 5 which build-time depend on it.
>
> Thanks!
>
> [1] https://lore.kernel.org/all/apfyaxKEEJz20wRC@google.com
