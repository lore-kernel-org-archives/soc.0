Return-Path: <robh+dt@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F335C433EF
	for <soc@archiver.kernel.org>; Thu, 14 Oct 2021 00:53:36 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id CDA4E611BF; Thu, 14 Oct 2021 00:53:35 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id B6EAA61183;
	Thu, 14 Oct 2021 00:53:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1634172815;
	bh=3KPseUxRNqX7s5JgcKYolFJTKXSJAtZzfaDv0lxJBP8=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=AhEsh3JJvcMjZFBhZvn/lvZeLjQk/sbi09VXw5sPo91c0861Z9Aw6tmhVY//UAWE0
	 W6LwWEQIcdKFWthsfp2S2U9CIZ9NizH5SMzfRF9vo1tRD7m51+NzJ5FHzNg3eXkSjX
	 xtgSyt1z+gOZg78EWcoZ49nLJsUJ6oKPpsw8s8LCeRS8c9gj641IPO81+nxbz3jae8
	 PZmjmeNLqAGDE0Vf1OaUtFkLWgTVxquZTfVqqyY67x4aB354nbjTWatQmWDh5nnVJu
	 ypuCVWGIrsbzutu7NQkmZ2wDxEpujgIL3gZG4e/acJKzXq4CL+7RTFHBDM/Bm9abqa
	 xVtv7RLH/oPmQ==
Received: by mail-ed1-f47.google.com with SMTP id z20so17437227edc.13;
        Wed, 13 Oct 2021 17:53:35 -0700 (PDT)
X-Gm-Message-State: AOAM532IgjzcS9mnEntoBtpT896ZCNa1xGV42GQ400yIpwHULKNs358A
	X4lMT88m362i7SYdl3GneMISgLO/vEm1WiwDGg==
X-Google-Smtp-Source: ABdhPJzmdBxqGuN5Y6dvnAmkJ+FPUu9AdVj2ElG+Da9w19ioQt2w4/WNtq9K9kc99aoUc0NmAZWyg7kd9vPJF9egBPY=
X-Received: by 2002:a17:906:5a47:: with SMTP id my7mr157436ejc.128.1634172814079;
 Wed, 13 Oct 2021 17:53:34 -0700 (PDT)
MIME-Version: 1.0
References: <20211013143810.2101838-1-arnd@kernel.org>
In-Reply-To: <20211013143810.2101838-1-arnd@kernel.org>
From: Rob Herring <robh+dt@kernel.org>
Date: Wed, 13 Oct 2021 19:53:22 -0500
X-Gmail-Original-Message-ID: <CAL_Jsq+WqboHoqHN-c5KAWPzMZm3dgExWr8RT7+-5bzwSA5BUQ@mail.gmail.com>
Message-ID: <CAL_Jsq+WqboHoqHN-c5KAWPzMZm3dgExWr8RT7+-5bzwSA5BUQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] ARM: versatile: remove leading 0 on unit address
To: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Arnd Bergmann <arnd@arndb.de>, 
	Liviu Dudau <liviu.dudau@arm.com>, SoC Team <soc@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rui Miguel Silva <rui.silva@linaro.org>, 
	Sudeep Holla <sudeep.holla@arm.com>, 
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, devicetree@vger.kernel.org, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, Oct 13, 2021 at 9:38 AM Arnd Bergmann <arnd@kernel.org> wrote:
>
> From: Arnd Bergmann <arnd@arndb.de>
>
> dtc now warns for the LED nodes on the versatile-ab board:
>
> versatile-ab.dts:126.12-132.5: Warning (unit_address_format): /core-module@10000000/led@08.7: unit name should not have leading 0s
> versatile-ab-ib2.dts:17.12-24.5: Warning (unit_address_format): /syscon@27000000/led@00.4: unit name should not have leading 0s
>
> Remove the extra zeroes.
>
> Fixes: 07ebfa59b9db ("ARM: versatile: add the syscon LEDs to the DT")
> Fixes: 7fbe5f7ff267 ("ARM: dts: Add Versatile IB2 device tree")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  arch/arm/boot/dts/arm-realview-eb.dtsi    | 18 +++++++++---------
>  arch/arm/boot/dts/arm-realview-pb1176.dts | 18 +++++++++---------
>  arch/arm/boot/dts/arm-realview-pb11mp.dts | 18 +++++++++---------
>  arch/arm/boot/dts/arm-realview-pbx.dtsi   | 18 +++++++++---------
>  arch/arm/boot/dts/versatile-ab-ib2.dts    |  2 +-
>  arch/arm/boot/dts/versatile-ab.dts        | 16 ++++++++--------
>  6 files changed, 45 insertions(+), 45 deletions(-)

Please apply these instead:
https://lore.kernel.org/all/20210913192816.1225025-7-robh@kernel.org/
https://lore.kernel.org/all/20210913192816.1225025-8-robh@kernel.org/

There's also also these fixes that I sent:
https://lore.kernel.org/all/20210928192143.1841497-1-robh@kernel.org/
https://lore.kernel.org/all/20210928192210.1842377-1-robh@kernel.org/
https://lore.kernel.org/all/20210928192123.1840842-1-robh@kernel.org/
https://lore.kernel.org/all/20210928191759.1835325-1-robh@kernel.org/
