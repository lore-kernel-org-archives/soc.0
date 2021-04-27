Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D0B8C433ED
	for <soc@archiver.kernel.org>; Tue, 27 Apr 2021 21:15:34 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 582D8613FC; Tue, 27 Apr 2021 21:15:34 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 41D07613F3
	for <soc@kernel.org>; Tue, 27 Apr 2021 21:15:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1619558134;
	bh=i507szrTtHZfZLlEV/ZOMGJNqqalciaEgSyEap3nc/g=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=qtOOm4BK3JI8xSV1auZcVxYgYdz4kmWcFw7tl6nc9jiNIa2FGnXInKrdr6vle6yIm
	 h0EJQuaQqnN35KsUxa5KY73Bp4ZxGUtuSm+gM85K9sXCn7Fbaulji4qXAjq+tdMWTb
	 q/Z4IIcJnhcYgl/vGYwyntMLkgm1Te30e5WL0RteD/GzAXxxQScT/Tyckhzlet7wGa
	 ID5qwEdMIrRFAamHYw5TZZHcZvZfC1vyhhzeT+Df1tN2Pobk2IBQgUHS0JrtR4Dsg6
	 hWPNW3MoQqA9Jll29SQ+6qXk8qfOYv3xM0YqXKlzn5G6dUynvzCwQYuZCd7zePDHTt
	 xGEQWwALoRWyQ==
Received: by mail-wr1-f52.google.com with SMTP id t18so3268740wry.1
        for <soc@kernel.org>; Tue, 27 Apr 2021 14:15:34 -0700 (PDT)
X-Gm-Message-State: AOAM531g4TZ09Ttn2ndn0uA9INXRy7nb/XFnZSjvjbA1LOYAWtz9GFih
	d0ztcCojDW3ulEensb0pAKOsTl9e+SiXp4kJZTM=
X-Google-Smtp-Source: ABdhPJwvgkH9IU3dceyL1THH2bO1xrcREUPiuDViOtI3gBoctKQJ1N5yrXJpA1+Izkij+05898svAmU+kOQszsbg5j8=
X-Received: by 2002:a5d:4452:: with SMTP id x18mr12863486wrr.286.1619558132858;
 Tue, 27 Apr 2021 14:15:32 -0700 (PDT)
MIME-Version: 1.0
References: <CAK8P3a2RjRSjTcmwVf3VHy2CUB2HBj5AaJTx=1NSYuA_Qy4E-w@mail.gmail.com>
 <CAHk-=wgDQ23kEkVVhjwcVPkQCDUVmJJdhO_HtjaRRCv_mtZgag@mail.gmail.com>
In-Reply-To: <CAHk-=wgDQ23kEkVVhjwcVPkQCDUVmJJdhO_HtjaRRCv_mtZgag@mail.gmail.com>
From: Arnd Bergmann <arnd@kernel.org>
Date: Tue, 27 Apr 2021 23:15:00 +0200
X-Gmail-Original-Message-ID: <CAK8P3a23sx+M1sh2pXmb3Peuy5hV_0hy4KP7sfcXkCNXto0EMg@mail.gmail.com>
Message-ID: <CAK8P3a23sx+M1sh2pXmb3Peuy5hV_0hy4KP7sfcXkCNXto0EMg@mail.gmail.com>
Subject: Re: [GIT PULL 0/6] ARM SoC branches for 5.13
To: Linus Torvalds <torvalds@linux-foundation.org>
List-Id: <soc.lore.kernel.org>
Cc: SoC Team <soc@kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, Apr 26, 2021 at 9:41 PM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> On Mon, Apr 26, 2021 at 8:53 AM Arnd Bergmann <arnd@kernel.org> wrote:
> >
> > Here are six branches for the SoC tree [...]
>
> Ok, all merged. Please do check my conflict resolutions - not because
> I think there is anything wrong there, but simply because the arm side
> doesn't get the same build coverage testing when I merge.
>
> All but the two first had some fairly trivial conflicts with the other
> trees I've been merging today.

I've inspected the merges and ran the tree through my randconfig
test box for today. It seems you fixed one merge that went wrong
in linux-next, but you missed a harmless mismerge in a DT binding
documentation file. I've applied a fix to the arm/fixes branch now
and sent it to the list [1].

       Arnd

[1] https://lore.kernel.org/linux-arm-kernel/20210427210121.1080364-1-arnd@kernel.org/T/#u
