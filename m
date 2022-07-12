Return-Path: <SRS0=km/W=XR=arndb.de=arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4FC5C433EF
	for <soc@archiver.kernel.org>; Tue, 12 Jul 2022 13:27:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 9DA25C341CB; Tue, 12 Jul 2022 13:27:38 +0000 (UTC)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 2BB41C3411C;
	Tue, 12 Jul 2022 13:27:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 2BB41C3411C
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=arndb.de
Received: from mail-yb1-f172.google.com ([209.85.219.172]) by
 mrelayeu.kundenserver.de (mreue012 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1M5Qhx-1o9sTj3tob-001UHk; Tue, 12 Jul 2022 15:27:35 +0200
Received: by mail-yb1-f172.google.com with SMTP id n74so13915096yba.3;
        Tue, 12 Jul 2022 06:27:34 -0700 (PDT)
X-Gm-Message-State: AJIora/GIDs8dvwzao9O2VqbsGohvM6lN4xxEeiZB+eQglEf+eK7eRPI
	wZoCpnQNs0XDsWJT9MDWnvzYIeRHnJbmqFkpo/E=
X-Google-Smtp-Source: AGRyM1uXh17pWsKX+Lt0fZNfqCjvNyiaSb6/cGIjflgREtQ0O3M/xH24ftkEVDT58/8HfALKjaLufIJ+KNAVd7QIuNI=
X-Received: by 2002:a25:73d1:0:b0:66e:aee4:feb3 with SMTP id
 o200-20020a2573d1000000b0066eaee4feb3mr23156338ybc.452.1657632453362; Tue, 12
 Jul 2022 06:27:33 -0700 (PDT)
MIME-Version: 1.0
References: <20220708185608.676474-1-thierry.reding@gmail.com> <20220708185608.676474-2-thierry.reding@gmail.com>
In-Reply-To: <20220708185608.676474-2-thierry.reding@gmail.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Tue, 12 Jul 2022 15:27:16 +0200
X-Gmail-Original-Message-ID: <CAK8P3a1bKUr77t9xkNAX=-RqzRme6Hymr3V=36MSHT_sOFEW5A@mail.gmail.com>
Message-ID: <CAK8P3a1bKUr77t9xkNAX=-RqzRme6Hymr3V=36MSHT_sOFEW5A@mail.gmail.com>
Subject: Re: [GIT PULL 1/7] soc/tegra: Changes for v5.20-rc1
To: Thierry Reding <thierry.reding@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: arm-soc <arm@kernel.org>, SoC Team <soc@kernel.org>, Jon Hunter <jonathanh@nvidia.com>, 
	"open list:TEGRA ARCHITECTURE SUPPORT" <linux-tegra@vger.kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, linux-edac@vger.kernel.org, 
	Borislav Petkov <bp@alien8.de>, Mauro Carvalho Chehab <mchehab@kernel.org>, Tony Luck <tony.luck@intel.com>, 
	James Morse <james.morse@arm.com>, Robert Richter <rric@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:lMGBr5EEW5j6yf/ncl0o1KrhmbcBa2hGddHOyKlAp36ptWhGxSG
 Qr7B9Eb8h4gQA1VenS47j9jDzXQRcIeep8/pqzuWfuA0mHkz4dg6B5sT54LZNpeIGBvWboH
 2nAXQwB/ks/LnT6BLDRcXwi2By/Sl3jYAWGIRWr1PNBc39sq0+pmdYhpE7WAaDOtVJNl2hh
 +HezT9ooyZlAh2tURcCcg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:Xd5KqdFfkuk=:4l4emE52DDCEeABEGsXVeC
 z6NHfgHRt7/hheLKiNFg8yvguGSfH3DAwwEMVuWSQJn30i7JQmOizjquJwlnQTRYYJTv8Uofp
 ev042VQCx/SM5da8Cu+/m0GVI8q8nrj4lgwKIxKQYJT3HAwXBwemz0HNDtDbWaq0PjcoCzKyi
 7Vn6T05NTCNpDE5qAAlmXDSXlaiE3MCKUAnP0CoQh1qTxFoOKMtM1GkvY5CR87iBJJZfcW+lJ
 sRu2j1HTdqIBEs0PjgLSApoTpNNfD3rr1OB9islfuprjKgb+GMqGGrlZbS7mn9SciMArszoTy
 hHSzPjsPhYySMm+jQC0mxeBDpK/cHemcyjZ0oAf9nr98GiGupVzSLSPlzMVYNfdDo/2HCPbDo
 7cCRjXqvd/8xxSnVxvlU6vUXUssLxHu48PlEDXS+EXjAhFgSPKK75sX2s6PQ6Clqw+2FyJBe7
 Es9LmTU54ZSz88xn+Wx5lqKSSoOvRhRjvl+Zd/edkcHjk6CQBTksEh2N4Me14HdxlTKLZds3G
 5JrN2l1mqK1UH2Kz3AiMGr2ndDqxQMAplkIjL/MWhBECRWw/TVHoynWHS2wvaeacyjQP+0P0X
 WjhC7y4JiX/UWBBdfOkNVPI2S8RffM9nShYoobSEqkRIKcoPQ/Jb7LdETmEX1TkFOUbaLNIcG
 LMnDsn93YGyyt6+UlU/N6RD4qAf44G7OblM6EIrw0MyrYKl/CBKXyWO3b9XH6yHbedawAPvlv
 Jyv5nVSgkWImagq8vvO36v9b3I/sOGAwHMgQAg==

On Fri, Jul 8, 2022 at 8:56 PM Thierry Reding <thierry.reding@gmail.com> wrote:
>   git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-5.20-soc
...
> ----------------------------------------------------------------
> soc/tegra: Changes for v5.20-rc1
>
> The bulk of these changes is the new CBB driver which is used to provide
> (a lot of) information about SErrors when things go wrong, instead of
> the kernel just crashing or hanging.
>
> In addition more SoC information is exposed to sysfs and various minor
> issues are fixed.
>

Hi Thierry,

I fear I'm going to skip this for the current merge window. It looks like
the CBB driver you add here would fit into the existing drivers/edac/
subsystem, or at the minimum should have been reviewed by the
corresponding maintainers (added to Cc)  to decide whether it goes
there or not.

I had not previously seen this driver, but I'll let them have a look first.

For the other patches, I found two more problems:

> Bitan Biswas (1):
>       soc/tegra: fuse: Expose Tegra production status

Please don't just add random attributes in the soc device infrastructure.
This one has a completely generic name but a SoC specific
meaning, and it lacks a description in Documentation/ABI.
Not sure what the right ABI is here, but this is something that needs
to be discussed more broadly when you send a new version.

I see there are already some custom attributes in the same device,
we should probably not have added those either, but I suppose
we are stuck with those, so please add the missing documentation.

> YueHaibing (1):
>      soc/tegra: fuse: Add missing DMADEVICES dependency

This one fixes the warning the wrong way: we don't 'select' random
drivers from other subsystems, and selecting the entire
subsystem makes it worse. Just drop the 'select' here and
enable the drivers in the defconfig.

         Arnd
