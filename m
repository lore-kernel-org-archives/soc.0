Return-Path: <SRS0=QacK=XT=arndb.de=arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71A19C433EF
	for <soc@archiver.kernel.org>; Thu, 14 Jul 2022 14:45:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 30DB2C385A5; Thu, 14 Jul 2022 14:45:59 +0000 (UTC)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 4CE29C34114;
	Thu, 14 Jul 2022 14:45:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 4CE29C34114
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=arndb.de
Received: from mail-yw1-f171.google.com ([209.85.128.171]) by
 mrelayeu.kundenserver.de (mreue107 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1MAgMY-1oMxNz02LA-00B7mr; Thu, 14 Jul 2022 16:45:55 +0200
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-31c8a1e9e33so19323117b3.5;
        Thu, 14 Jul 2022 07:45:54 -0700 (PDT)
X-Gm-Message-State: AJIora8XpGpXOwkQKb8MTYHEqPzpIfYDKS6QTcaG1UK6JLjTiTeDGWb5
	O4PaeP2c5/Oaay5ZXetjMjgJhLONCZsiWvJ4TTs=
X-Google-Smtp-Source: AGRyM1sAiofyZ4eEN27XJwa3Mt9SWNENKQxEfVUFkxvE89dWciOhpZF91QPduWhp/J38s+Ac736VF37oa7KLX1u7GaM=
X-Received: by 2002:a81:1e4d:0:b0:31c:86f1:95b1 with SMTP id
 e74-20020a811e4d000000b0031c86f195b1mr10012474ywe.42.1657809953406; Thu, 14
 Jul 2022 07:45:53 -0700 (PDT)
MIME-Version: 1.0
References: <20220708185608.676474-1-thierry.reding@gmail.com>
 <20220708185608.676474-2-thierry.reding@gmail.com> <CAK8P3a1bKUr77t9xkNAX=-RqzRme6Hymr3V=36MSHT_sOFEW5A@mail.gmail.com>
 <Ys6lXD6BSxjH02mW@orome> <CAK8P3a0cSq47B=acZ854TVu=RckJNfyfKdqQUMzCX7SsV7Wt0g@mail.gmail.com>
 <Ys8phjCTfQTD41g+@orome>
In-Reply-To: <Ys8phjCTfQTD41g+@orome>
From: Arnd Bergmann <arnd@arndb.de>
Date: Thu, 14 Jul 2022 16:45:36 +0200
X-Gmail-Original-Message-ID: <CAK8P3a2NzWh7vtedeb6JXtWjQb1zaiPHQpgReie8a7ahwMzL3w@mail.gmail.com>
Message-ID: <CAK8P3a2NzWh7vtedeb6JXtWjQb1zaiPHQpgReie8a7ahwMzL3w@mail.gmail.com>
Subject: Re: [GIT PULL 1/7] soc/tegra: Changes for v5.20-rc1
To: Thierry Reding <thierry.reding@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, arm-soc <arm@kernel.org>, SoC Team <soc@kernel.org>, 
	Jon Hunter <jonathanh@nvidia.com>, 
	"open list:TEGRA ARCHITECTURE SUPPORT" <linux-tegra@vger.kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, linux-edac@vger.kernel.org, 
	Borislav Petkov <bp@alien8.de>, Mauro Carvalho Chehab <mchehab@kernel.org>, Tony Luck <tony.luck@intel.com>, 
	James Morse <james.morse@arm.com>, Robert Richter <rric@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:5T2+TQe08WWI+PsLq8TLlk/v0gItAEjghfp4MbBzSpa77rrHFIb
 DY1voPrfGNMuC4PxPQmtVh0vcrn8zI6Y3BxyeMA17lHfVdyB//XG9YXPE57AzblaArIfkfY
 rFKcfxgPUfzaAl/SYpwMYpeR4mMBFUYZfp8Cl6LNhgBBjkzBc0rAWemjEztDBxtozS8vR7S
 uyv+Ao38fqlRCLrXp5ioQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:z82CM5EMgI0=:SVHrr28k9riLH0wkqx+GnU
 jHyGpT13OjJlDiscaVfrae4X1FgLViXAnyv1DKcWWpAP6UmOp23cEhv2ef5bwfsPzddtVgM8N
 NzrRorA47Wwzy3okw1iQ+dbeZh7qnxluH1SM1ZcSuiWz3aUWbzR07dXpFPkxtiZu7P058ZG76
 Or55fR74EsScLoPp7NrkPClOJp5/Gihg4p56sREkPGF86Gv29vjvOGEhVIl76mvwPv8+OPcAC
 Eo8lEZw1lXgJZhsfl/PkM8oZCsfeeJWpCLiF/u0UotaqL9H4alUnrRqa1VGGSp+/bjryXsqua
 3/8xygNn9jKh78Rx3XJv2Iv4FQ9QRMUNHvvMfKxRNR1LN5A3aI68gOgxzn8Fg4ZT6PIyqkk/I
 x+TP6sHu1Guf6/fLAuU/Qy1NiftOu6pG9NkpRNFwITfDOGz7nz8bDpUrjbLy+Nui8dCao3SDo
 N98hwPfEKpYOAsbUwFrIJAtDfLdBAAhZi9LHwmTRfmBXCyKCyqod3UoCCduNBP1i6kpej/9fM
 LrUeqvzOxplYCXXxRvPP221rYmLblYGZ1hHHx5YqxIRx48xMrQEAwEA9GJFIX3L8ljBuMo9lY
 ZByDMYsIKFQkzvioFHE+hRLGf2k8KBBHsZNmsnxXbsVLZjpF0nsGXrwOMuxvK6QsWhkm7+YKG
 Yni4OvrSls4sC2MVxfP62F/E3Ib5cBOjeDaf1k3ZRL3i09/Y6cmhnWnnXE7+fZOY+3gKDsXtS
 hHtMA4tbXvRF+LwZ1Clr1ZhiOSb8Q9rqCTwF/eHkR8mbSDaTcvjPa8p/Bu/nhqydVFq8THkzW
 MRqXPeEDhBtmHaNlgwsjq9bZbMHnrJFzDjaIZB417mHAmSOv9PV+FCriVGSQ5RQRFDQ1KZj+G
 T7CXEh1O3kb83vzx04qg==

On Wed, Jul 13, 2022 at 10:22 PM Thierry Reding
<thierry.reding@gmail.com> wrote:
> On Wed, Jul 13, 2022 at 02:14:27PM +0200, Arnd Bergmann wrote:
> >
> > It's not a 100% strict rule, I've just tried to limit it as much as possible,
> > and sometimes missed drivers doing it anyway. My main goal here is
> > to make things consistent between SoC families, so if one piece of
> > information is provided by a number of them, I'd rather have a standard
> > attribute, or a common way of encoding this in the existing attributes
> > than to have too many custom attributes with similar names.
>
> The major/minor attributes that we have on Tegra SoCs should be easy to
> standardize. It seems like those could be fairly common.

I think these can just be folded into one of the other attributes, probably
either revision or soc_id dependending on what they actually refer to.

These properties are intentionally free-text fields that you can match
using wildcards with the soc_device_match() function. If I read this
part right, the information is already available in the soc_id field,
so we don't even need to change anything here.

> The other one
> that we have is the "platform" one, which I suppose is not as easy to
> standardize. I don't recall the exact details, but I think we're mostly
> interested in whether or not the platform is simulation or silicon. The
> exact simulation value is not something that userspace scripts will look
> at, as far as I recall.

This also looks like it's part of the chip_id.

> > > > > YueHaibing (1):
> > > > >      soc/tegra: fuse: Add missing DMADEVICES dependency
> > > >
> > > > This one fixes the warning the wrong way: we don't 'select' random
> > > > drivers from other subsystems, and selecting the entire
> > > > subsystem makes it worse. Just drop the 'select' here and
> > > > enable the drivers in the defconfig.
> > >
> > > This doesn't actually select the DMADEVICES property. It adds a
> > > dependency on DMADEVICES and if that is met it will select
> > > TEGRA20_APB_DMA.
> >
> > My mistake. However, I still think it's wrong to select
> > TEGRA20_APB_DMA here, unless there is a build-time
> > dependency that prevents it from being compiled otherwise.
> >
> > The dmaengine subsystem is meant to abstract the relation
> > between the drivers using DMA and those providing the feature,
> > the same way we abstract all the other subsystems. The
> > fuse driver may only be used on machines that use
> > TEGRA20_APB_DMA, but neither the driver code nor
> > Kconfig should care about that.
>
> This dependency has existed for quite a while and my recollection is
> that we wanted to make this very explicit because the lack of the
> TEGRA20_APB_DMA driver makes the FUSE driver completely useless on
> Tegra20 and that in turn has a very negative impact on the rest of the
> system, so we deemed a default configuration change insufficient.
>
> Perhaps a better way to solve this would be to make TEGRA20_APB_DMA
> default to "y" if ARCH_TEGRA_2x_SOC. And then perhaps make the FUSE
> driver depend on DMADEVICES. That still wouldn't ensure that we get
> SOC_TEGRA_FUSE enabled automatically all the time, but perhaps it'd
> document the dependency a bit more explicitly.

Ok, this sounds good to me.

          Arnd
