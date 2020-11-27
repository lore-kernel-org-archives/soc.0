Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 116F5C63777
	for <soc@archiver.kernel.org>; Fri, 27 Nov 2020 19:45:08 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id E7D7024178; Fri, 27 Nov 2020 19:45:07 +0000 (UTC)
Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id C066A2415A;
	Fri, 27 Nov 2020 19:45:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1606506307;
	bh=/nFIIbdCgdcVm2qLxpVFyfzz6wSNmIf9UB5D7XhHWjw=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=IV5hGtZd27vdRjuMwWdGd2hp/XkJGTtDo9/JbhTUK/9XI/Lrr1KlkohF4TbM6S+1k
	 ueYLQ3uAMQT+1bpMqpNZ3/Ro3V/BrxilOgycl9hcN/6t2Qqf0/iz7rVssG850Z6M4N
	 P9kFnA/cX/SGs5aXZLz4ejL8ahvlBhdFIJMw2r20=
Received: by mail-ot1-f47.google.com with SMTP id z23so1928225oti.13;
        Fri, 27 Nov 2020 11:45:07 -0800 (PST)
X-Gm-Message-State: AOAM531vCMQ5/+tZ1/Cs1INtc1A/kWgcubI1dSTc6dduRJ1XoOpyJMAQ
	b/enWjkCBZllCIaIKL3hxt87xuT6Ig28I1FiAqI=
X-Google-Smtp-Source: ABdhPJxAJIMAFi0t99Si8IUlccu1IFVQVEM5rk2SCFFLDp5EjAKPWl3XqpLr8TbN4D5fmrqszqvVxkUjfIjwrLBoQlk=
X-Received: by 2002:a9d:6317:: with SMTP id q23mr7461137otk.251.1606506307179;
 Fri, 27 Nov 2020 11:45:07 -0800 (PST)
MIME-Version: 1.0
References: <20201127144329.124891-1-thierry.reding@gmail.com> <20201127144329.124891-5-thierry.reding@gmail.com>
In-Reply-To: <20201127144329.124891-5-thierry.reding@gmail.com>
From: Arnd Bergmann <arnd@kernel.org>
Date: Fri, 27 Nov 2020 20:44:51 +0100
X-Gmail-Original-Message-ID: <CAK8P3a2vcd0QgfwjTTPM1gk=tTqD+n-4ww-vhJQ3M0z_AZMyDQ@mail.gmail.com>
Message-ID: <CAK8P3a2vcd0QgfwjTTPM1gk=tTqD+n-4ww-vhJQ3M0z_AZMyDQ@mail.gmail.com>
Subject: Re: [GIT PULL 5/6] arm64: tegra: Device tree changes for v5.11-rc1
To: Thierry Reding <thierry.reding@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: arm-soc <arm@kernel.org>, SoC Team <soc@kernel.org>, Jon Hunter <jonathanh@nvidia.com>, 
	"open list:TEGRA ARCHITECTURE SUPPORT" <linux-tegra@vger.kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, Nov 27, 2020 at 3:43 PM Thierry Reding <thierry.reding@gmail.com> wrote:
>
> Note that you've already pulled part of this earlier as fixes for
> v5.10-rc6, but I've included the whole lot for completeness. Let me know
> if that doesn't work for you and you'd rather have a completely separate
> branch.

The way you did it works best in my opinion, as it helps with bisectability
and it avoids the backmerge of a later -rc into an existing branch.

     Arnd
