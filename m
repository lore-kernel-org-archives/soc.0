Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ACCB5C433E0
	for <soc@archiver.kernel.org>; Tue, 16 Feb 2021 11:45:15 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 6FB5764DF0; Tue, 16 Feb 2021 11:45:15 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3F08D64DA8
	for <soc@kernel.org>; Tue, 16 Feb 2021 11:45:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1613475915;
	bh=/kzaja8DNSe1SHWnI5GP+tpsJt5X++V0e1zEjcYTwGw=;
	h=References:In-Reply-To:From:Date:Subject:List-Id:To:From;
	b=r4CThgpg1U5TVrh76eVAviuAnN0y9GyGB+BQv396ictCe1W/vrH16I8mA3BmyJjv8
	 WyJhRsaYt9qiMwZ3zwOH3GxpyJTY6F7btTI86a/kmT15gH8Js65d62sNLuQ5VLnhcc
	 +AGPgqLYPPNv2ak1RIT8Tuc2MZSgGpn8vbu+HizwGfKZ0DahZQuJbablN0ZUfbug8Q
	 x5azADs8qh5/u9NMZJfTSfpEG1+srToRhmhfMecURyBovIaTV79dr6IMjTzwc3/6YC
	 i8qzeB2Zzmzul81aXuUrgJhUnDWv9Z++C7qaP18ik7Y7/etv2l1MwZsgaAmldyt2f+
	 uZafzPz29bOVA==
Received: by mail-ot1-f52.google.com with SMTP id e4so8729114ote.5
        for <soc@kernel.org>; Tue, 16 Feb 2021 03:45:15 -0800 (PST)
X-Gm-Message-State: AOAM53051T6+jvvBtReZpBSYieGAqLc5kr2O7WvcouPW4SnXkeg+WKim
	4J1nclw+bknD3Hq6qBjW8rm021b/WTEHfKvnSOc=
X-Google-Smtp-Source: ABdhPJzTNFu6FIQuOIpauhGHN7g8rlWHJ4iRSBz9NymNB3CrWpN9HichPI55VgDXhRC7uRzrmE8C5iAPY3NR3Clza4s=
X-Received: by 2002:a9d:3403:: with SMTP id v3mr14361372otb.305.1613475914444;
 Tue, 16 Feb 2021 03:45:14 -0800 (PST)
MIME-Version: 1.0
References: <CAK8P3a0w-vPNBF=4ieg3YUyNHzy+qiZ5iK-9M1cRxA+TakScYw@mail.gmail.com>
 <CAK8P3a1bF_6yzYn6We3A7sC_nJf+FVO2Pv1pgyu3-qa_YotT_Q@mail.gmail.com>
In-Reply-To: <CAK8P3a1bF_6yzYn6We3A7sC_nJf+FVO2Pv1pgyu3-qa_YotT_Q@mail.gmail.com>
From: Arnd Bergmann <arnd@kernel.org>
Date: Tue, 16 Feb 2021 12:44:58 +0100
X-Gmail-Original-Message-ID: <CAK8P3a0cZZna6SrrWkHr9w_=_JgiOhzu4ZMS7TA06jMdGEoByg@mail.gmail.com>
Message-ID: <CAK8P3a0cZZna6SrrWkHr9w_=_JgiOhzu4ZMS7TA06jMdGEoByg@mail.gmail.com>
Subject: Re: [GIT PULL 5/6] ARM SoC devicetree updates for v5.12
List-Id: <soc.lore.kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>, SoC Team <soc@kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"

On Sun, Feb 14, 2021 at 11:45 PM Arnd Bergmann <arnd@kernel.org> wrote:
>
> Broadcom:
>  - BCM4906/BCM4908 networking chip
>  - Netgear R8000P router (BCM5906)

Two corrections here, for anyone picking up the description:

- BCM4908 support was already merged in 5.11, BCM4906 is what is new here,
  but there are very few differences so it's almost not newsworthy

- BCM5906 was just a typo, this was meant to be BCM4906.

         Arnd
