Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5DF44C433E0
	for <soc@archiver.kernel.org>; Fri,  8 Jan 2021 12:30:47 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 211AA23A01; Fri,  8 Jan 2021 12:30:47 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id E80F923975;
	Fri,  8 Jan 2021 12:30:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1610109047;
	bh=Ja5WumJNYYF3GiM2fjvXHc+0JMUiD+4+ROqFLlil7r8=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=sUpSIHxdP/YN8CEHOAibt0IqfP1SR+b9Xw34PU1OMisxHhu2s8PgGYoFrT7rGFtG4
	 XuMkv2n3cImlK3Msc/WmzrAghDBmek/tBRmAa95q1fGsppfZvQ2RzoGIszCOnQ/Ida
	 cUkUV/obv6sxOrWonp73ts58bDrGf/hZZVuDJFddc6J1y1J+NdGKRFGJh1kCTph9kv
	 S50EpVwCVXy6aNGYzrbeD1uBLeS8r5GNi921YQZp9ys7xePfEj1FJukj43+k/DJOUA
	 kseSUY5vI4W7MIddsuk2/zn7onNpz+B3GQqEiIuQ0acm6At21UrutZx3dZdyK4nvTZ
	 LR3Og0DC6ZCuA==
Received: by mail-ot1-f51.google.com with SMTP id i6so9509444otr.2;
        Fri, 08 Jan 2021 04:30:46 -0800 (PST)
X-Gm-Message-State: AOAM533oJweXe8vlWCedRvEgoa/le9P4uodrBV3R470fKIMGkcxpfy6r
	NOWbQ+UZ68ROUCIus+i9e6v9GHi6cHNthUmSBuo=
X-Google-Smtp-Source: ABdhPJysXAXNEOfDICgD4h3HRTqqV3EqtHWOdw0EOX8Yx2ygIsqKgJLyD6MfnvdE3ipzagkzNo24qqXrGWoua1flZcY=
X-Received: by 2002:a9d:7a4b:: with SMTP id z11mr2387041otm.305.1610109046167;
 Fri, 08 Jan 2021 04:30:46 -0800 (PST)
MIME-Version: 1.0
References: <20210108103227.1740865-1-misono.tomohiro@jp.fujitsu.com>
In-Reply-To: <20210108103227.1740865-1-misono.tomohiro@jp.fujitsu.com>
From: Arnd Bergmann <arnd@kernel.org>
Date: Fri, 8 Jan 2021 13:30:30 +0100
X-Gmail-Original-Message-ID: <CAK8P3a1TxK_+gX1wNBEi_h664YS2Nw57MECknbZEkZQRiuCQVw@mail.gmail.com>
Message-ID: <CAK8P3a1TxK_+gX1wNBEi_h664YS2Nw57MECknbZEkZQRiuCQVw@mail.gmail.com>
Subject: Re:
To: Misono Tomohiro <misono.tomohiro@jp.fujitsu.com>
List-Id: <soc.lore.kernel.org>
Cc: Linux ARM <linux-arm-kernel@lists.infradead.org>, SoC Team <soc@kernel.org>, 
	Will Deacon <will@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Arnd Bergmann <arnd@arndb.de>, 
	Olof Johansson <olof@lixom.net>
Content-Type: text/plain; charset="UTF-8"

On Fri, Jan 8, 2021 at 11:32 AM Misono Tomohiro
<misono.tomohiro@jp.fujitsu.com> wrote:
> Subject: [RFC PATCH 00/10] Add Fujitsu A64FX soc entry/hardware barrier driver
> [RFC]
>  This is the first time we upstream drivers for our chip and I want to
>  confirm driver location and patch submission process.
>
>  Based on my observation it seems drivers/soc folder is right place to put
>  this driver, so I added Kconfig entry for arm64 platform config, created
>  soc/fujitsu folder and updated MAINTAINER entry accordingly (last patch).
>  Is it right?

This looks good as a start. It may be possible that during review, we
come up with a different location or a different user interface that may
change the code, but if it stays in drivers/soc/fujitsu, then the other
steps are absolutely right.

>  Also for final submission I think I need to 1) create some public git
>  tree to push driver code (github or something), 2) make pull request to
>  SOC team (soc@kernel.org). Is it a correct procedure?

Yes. I would prefer something other than github, e.g. an account
on a fujitsu.com host, on kernel.org, or on git.linaro.org, but github
works if none of the alternatives are easy for you.

When you send a pull request, make sure you sign the tag with
a gpg key, ideally after getting it on the kernel.org keyring [1].

       Arnd

[1] https://korg.docs.kernel.org/pgpkeys.html
