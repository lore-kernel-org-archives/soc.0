Return-Path: <robh+dt@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B218C07E95
	for <soc@archiver.kernel.org>; Tue, 13 Jul 2021 13:36:43 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 26F1861289; Tue, 13 Jul 2021 13:36:43 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0F79361249;
	Tue, 13 Jul 2021 13:36:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1626183403;
	bh=dUuuil3FNclHfU0hgNsvr1+/2KGW1rd9qC6xCZI5siM=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=NPlKsctmgId6e+BDM4JZRg2qj065mefmyy1spALWFJVk+tP+wp6Mkv9H1Q2T5qk5r
	 YzSfNQ1rZp/V05iXJjC1pjUqxorDT2QMIhzowQ9SdoZDvPvq0Ahy5H35y2xD79u4pL
	 OG7f6pKn4NXOL40WfvGcMdYxh6qrAXHFphIE2+PHOsFOw7dpEzm7Tp768eF1evgcO0
	 s7k+eIeJefCPuQiyZrihyCkprjb3JV9SO1jpJPDMQC1cPQApSzBnl4MALKiAwlyNgs
	 u+78vk6NxWAIEGYmjXROV+qirTcNNZ0TI6hPu7pYle0LRpJEJZaHoTGNZd4Sp4UNZl
	 14/Ky/4COvOxQ==
Received: by mail-ed1-f52.google.com with SMTP id v1so33203273edt.6;
        Tue, 13 Jul 2021 06:36:42 -0700 (PDT)
X-Gm-Message-State: AOAM532akK8nJ3cKG538RTZzL3Gd5F5LGoDSWD7GZBy5ZjkFu6keAUAg
	ddIg2aOKin1sVXlqb5XROqzMcxOhMKH/T6wlbw==
X-Google-Smtp-Source: ABdhPJxAk85E96qSDxs1/Hj1DjW30bcMd4SYl7HlX9oIog54BumtzJey+4nkHsDA3BwaS7P8javG0hb6nEOCw1zsFqc=
X-Received: by 2002:aa7:df12:: with SMTP id c18mr5836670edy.62.1626183401479;
 Tue, 13 Jul 2021 06:36:41 -0700 (PDT)
MIME-Version: 1.0
References: <20210625073604.13562-1-krzysztof.kozlowski@canonical.com> <cdce189d-9f98-dfee-e8a4-b35aef346c0b@canonical.com>
In-Reply-To: <cdce189d-9f98-dfee-e8a4-b35aef346c0b@canonical.com>
From: Rob Herring <robh+dt@kernel.org>
Date: Tue, 13 Jul 2021 07:36:29 -0600
X-Gmail-Original-Message-ID: <CAL_JsqKX7Ju-R0fjvE044E9LenD-o5qyX44j6hO3uJraXN-YUg@mail.gmail.com>
Message-ID: <CAL_JsqKX7Ju-R0fjvE044E9LenD-o5qyX44j6hO3uJraXN-YUg@mail.gmail.com>
Subject: Re: [GIT PULL] memory: tegra for v5.14, late fixes
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>, Arnd Bergmann <arnd@arndb.de>, 
	Olof Johansson <olof@lixom.net>
List-Id: <soc.lore.kernel.org>
Cc: ARM-SoC Maintainers <arm@kernel.org>, SoC Team <soc@kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Thierry Reding <treding@nvidia.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, Jul 13, 2021 at 2:32 AM Krzysztof Kozlowski
<krzysztof.kozlowski@canonical.com> wrote:
>
> On 25/06/2021 09:36, Krzysztof Kozlowski wrote:
> > Hi,
> >
> > Late fixes for Tegra memory controllers drivers for issues introduced in this
> > branch in previous tags.
> >
> > On top of previous pull (memory-controller-drv-tegra-5.14-2).
> >
> > If it is too late, I can send as fixes after merge window, but maybe better to
> > get these into merge windows earlier.
> >
> > Best regards,
> > Krzysztof
> >
> >
> > The following changes since commit 2c1bc371268862a991a6498e1dddc8971b9076b8:
> >
> >   iommu/arm-smmu: Use Tegra implementation on Tegra186 (2021-06-11 08:44:53 +0200)
> >
> > are available in the Git repository at:
> >
> >   https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux-mem-ctrl.git tags/memory-controller-drv-tegra-5.14-3
> >
> > for you to fetch changes up to bf3ec9deaa33889630722c47f7bb86ba58872ea7:
> >
> >   dt-bindings: arm-smmu: Fix json-schema syntax (2021-06-23 07:55:10 +0200)
> >
> > ----------------------------------------------------------------
> > Memory controller drivers for v5.14 - Tegra SoC, late fixes
> >
> > Two fixes for recent series of changfesi n Tegra SoC memory controller
> > drivers:
> > 1. Add a stub for tegra_mc_probe_device() to fix compile testing of
> >    arm-smmu without TEGRA_MC.
> > 2. Fix arm-smmu dtschema syntax.

BTW, this really should have been applied to the iommu tree as that
was where the breakage was.

> >
>
> Hi Arnd and Olof,
>
> Let me remind about this pull request with fixes for current merge
> window. Without it, certain configurations (build/dt_binding) are broken.

Please send this to Linus before rc2 so folks have a working base for
schema or I can apply the schema fix and send it.

Rob
