Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FABAC4338F
	for <soc@archiver.kernel.org>; Mon,  2 Aug 2021 15:03:48 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 6B3F0610FC; Mon,  2 Aug 2021 15:03:48 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5526960FC4;
	Mon,  2 Aug 2021 15:03:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1627916628;
	bh=q2lNaB5QepuI6Nt9H25qQeNHKm86UQd25um3zLI86jA=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=MCDNI+vnrW1o2tI+w/76jb55+oHCTuc8czse+dLaUAunZqz37OmBZ/qwnTz0NFh13
	 J2+HO07MZBxZNZeLyA5Xm67mb0cgIB7GWKNzhrdUKwO41SqzhEhV2AIVz5PUNfMHqG
	 bz5p31o4D45AhbHVS83tJjtH5UvgceWP0/vLa5CnM77qPinSm/Q6QuMfSfyOq0ingf
	 xMJDk3GKFBpeEabpnfo/UX4Nsakbt+sdkyZ8xL+kwMADjg5XYViXAnUm5CDqjWBUzH
	 bG6eSu00TSogKQZSib09mmfe47qjjxMnlVoEOGH4436WGCgq+VmFZR4y3ahlhyaMiG
	 cKKZH6x7+jHng==
Received: by mail-wm1-f48.google.com with SMTP id k4so10609141wms.3;
        Mon, 02 Aug 2021 08:03:48 -0700 (PDT)
X-Gm-Message-State: AOAM531EA7tpoVA965anTKsPd9EGg/x7cxJ1B+EbH1A2KQmYHD+HqsZW
	UpV8bUZkUMwdj1OoNyrIi0odh7a1w7GkspbAqBM=
X-Google-Smtp-Source: ABdhPJwvuhleab/7iPgY1r12fkDb1gfYdC1+rHZz0IxfpBtHUQUFt6AL+kaz3EBq4xo31nO6fzVAZbhzwZORnydnHOM=
X-Received: by 2002:a1c:208e:: with SMTP id g136mr17270142wmg.142.1627916627031;
 Mon, 02 Aug 2021 08:03:47 -0700 (PDT)
MIME-Version: 1.0
References: <20210721232616.1935-1-digetx@gmail.com> <YQgC/POOrX4t9hUN@orome.fritz.box>
In-Reply-To: <YQgC/POOrX4t9hUN@orome.fritz.box>
From: Arnd Bergmann <arnd@kernel.org>
Date: Mon, 2 Aug 2021 17:03:31 +0200
X-Gmail-Original-Message-ID: <CAK8P3a1oVOqdyYUNBM8UiakEkznQ--SPEHVz4U0HQOMy4DiCbw@mail.gmail.com>
Message-ID: <CAK8P3a1oVOqdyYUNBM8UiakEkznQ--SPEHVz4U0HQOMy4DiCbw@mail.gmail.com>
Subject: Re: [PATCH v2] soc/tegra: Make regulator couplers depend on CONFIG_REGULATOR
To: Thierry Reding <thierry.reding@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: Dmitry Osipenko <digetx@gmail.com>, Thierry Reding <treding@nvidia.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Mark Brown <broonie@kernel.org>, SoC Team <soc@kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	"open list:TEGRA ARCHITECTURE SUPPORT" <linux-tegra@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, Aug 2, 2021 at 4:35 PM Thierry Reding <thierry.reding@gmail.com> wrote:
>
> On Thu, Jul 22, 2021 at 02:26:16AM +0300, Dmitry Osipenko wrote:
> > The regulator coupler drivers now use regulator-driver API function that
> > isn't available during compile-testing. Make regulator coupler drivers
> > dependent on CONFIG_REGULATOR in Kconfig.
> >
> > Fixes: 03978d42ed0d ("soc/tegra: regulators: Bump voltages on system reboot")
> > Reported-by: kernel test robot <lkp@intel.com>
> > Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> > ---
> >
> > Changelog:
> >
> > v2: - No changes. Re-sending to Arnd Bergmann and soc@kernel.org.
> >
> >  drivers/soc/tegra/Kconfig | 6 ++++--
> >  1 file changed, 4 insertions(+), 2 deletions(-)
>
> Seeing that Arnd hasn't picked this up yet, I've now applied it to the
> Tegra tree and plan to send out a PR for v5.14 later this week.

Sorry about the mixup. In fact I have just picked it up two hours ago.
If you have other fixes that are already in your fixes branch.

       Arnd
