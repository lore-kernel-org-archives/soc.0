Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 322D8C4338F
	for <soc@archiver.kernel.org>; Mon,  2 Aug 2021 15:05:20 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 015DD610FC; Mon,  2 Aug 2021 15:05:20 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id DF508610FD;
	Mon,  2 Aug 2021 15:05:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1627916719;
	bh=i7LosUdlnDD+7W1WrlNbJWfurTKOoCnxj5SBBdDzMR0=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=oE3COk00MwvfeYa9SSd2CRBax9YyKmBNzXwhVEyZO0r5xxhAFSDrf9qwphgWmi44q
	 0+JqxDjtOZhCocDQGywMt5D5/i1bEfUoyKlQEi2NYOCEupgenCmWxRK1nt69kS4M99
	 2NKMGwxb++X4MSba324nHF1UyIBYdRhn7Z/kULbFRMR8IeCok8VPN65netOZCMEhYQ
	 3WNMJ++/ZYIYES6aGddSsBqs70/ENASUqjgmzsl89jKTeg7YwuI4cdr84IwJs45guO
	 /OtxurNY0m47uGRrTF9XGgRMPqVeLQyFb85WVFTmrOv/feZ2bZiUlFdSCcLvYTVAJD
	 h6/avNgl6kYrA==
Received: by mail-wm1-f50.google.com with SMTP id e25-20020a05600c4b99b0290253418ba0fbso178410wmp.1;
        Mon, 02 Aug 2021 08:05:19 -0700 (PDT)
X-Gm-Message-State: AOAM531s5uX6FTer066P4F/ZQYFQVa0mzDdsWH0/rc6aFidpm/Nkjgnv
	U+FyskLxK/YBf5lHNKnJw3DQoQqsO3gw+xTaHKY=
X-Google-Smtp-Source: ABdhPJxpSgNiRp0xOEtNyUiyODBaWQOOMke4hglO4YrUHAi/3IMeAARhblcx9jeg2mJc5HF/S01VYRUrfE0PY/YeRhw=
X-Received: by 2002:a05:600c:414b:: with SMTP id h11mr17001925wmm.120.1627916717091;
 Mon, 02 Aug 2021 08:05:17 -0700 (PDT)
MIME-Version: 1.0
References: <20210721232616.1935-1-digetx@gmail.com> <YQgC/POOrX4t9hUN@orome.fritz.box>
 <CAK8P3a1oVOqdyYUNBM8UiakEkznQ--SPEHVz4U0HQOMy4DiCbw@mail.gmail.com>
In-Reply-To: <CAK8P3a1oVOqdyYUNBM8UiakEkznQ--SPEHVz4U0HQOMy4DiCbw@mail.gmail.com>
From: Arnd Bergmann <arnd@kernel.org>
Date: Mon, 2 Aug 2021 17:05:01 +0200
X-Gmail-Original-Message-ID: <CAK8P3a1ycMhqZ-nvsxusPa5JijjL1hBOpBffhJ0okm5Kav0jzA@mail.gmail.com>
Message-ID: <CAK8P3a1ycMhqZ-nvsxusPa5JijjL1hBOpBffhJ0okm5Kav0jzA@mail.gmail.com>
Subject: Re: [PATCH v2] soc/tegra: Make regulator couplers depend on CONFIG_REGULATOR
To: Thierry Reding <thierry.reding@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: Dmitry Osipenko <digetx@gmail.com>, Thierry Reding <treding@nvidia.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Mark Brown <broonie@kernel.org>, SoC Team <soc@kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	"open list:TEGRA ARCHITECTURE SUPPORT" <linux-tegra@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, Aug 2, 2021 at 5:03 PM Arnd Bergmann <arnd@kernel.org> wrote:
> On Mon, Aug 2, 2021 at 4:35 PM Thierry Reding <thierry.reding@gmail.com> wrote:
>
> If you have other fixes that are already in your fixes branch
... that you want to have in rc5, please send them soon, as I'm going
to prepare that pull request in a few days.

I'll probably do another one for -rc6 though.

       Arnd
