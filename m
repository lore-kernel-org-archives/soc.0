Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6D77C433E0
	for <soc@archiver.kernel.org>; Sun, 14 Feb 2021 22:52:47 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 9F2D464E61; Sun, 14 Feb 2021 22:52:47 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 793FF64E52
	for <soc@kernel.org>; Sun, 14 Feb 2021 22:52:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1613343167;
	bh=9c8uIGtBwhHMP6ynnak8KOMgUyv3JxvGHQXUn/ZjMwA=;
	h=References:In-Reply-To:From:Date:Subject:List-Id:To:From;
	b=s85/wyNl4MdGPnLABoECc2buwVBkH4miWdNaz5I84Gs5RL+947FqNAjE0mZqiS7Nb
	 /tSybUKOEYRt0cX11IuKvgrKpQJHgkxjO2eJLhHXqkm9nmCE7UakKyBEF4FdIvxYCx
	 J9K4moiKki5Rcw2xOpBJWZwr9YrYNmfPpru8dHMc941s5VNaskP+qWS6HqBJekCSqA
	 K5l4K6KMWJ0a6wd+QT+Bwua4JgHwiUHAjEuEPjShRRtHI7MxBrKFXU826WGjT0RdAl
	 a6/Pq47/thd4FzO7cJnYjApE+j9I9tRA+59gbiEPGGLpLaKWB4WwBpAnNbnTTuAIC/
	 ehDhFtmia5J7A==
Received: by mail-ot1-f45.google.com with SMTP id d7so4532668otq.6
        for <soc@kernel.org>; Sun, 14 Feb 2021 14:52:47 -0800 (PST)
X-Gm-Message-State: AOAM533+RP1l3HKbo+RG33pFjPlt7UPtWrmrB0D5a3zivF6edCsHRCXW
	q5vpKTPyjhEShInbYXh7ST7eZfuqO5P15RMJqQk=
X-Google-Smtp-Source: ABdhPJyofJ4TKo29RyeBXDtMlejhQetcGvWOGcjJWOXjlwc5aa/j88POM+i/2IIeJXcfyWH3JKzFvdr1vx+5yKutVb0=
X-Received: by 2002:a9d:3403:: with SMTP id v3mr9491439otb.305.1613343166842;
 Sun, 14 Feb 2021 14:52:46 -0800 (PST)
MIME-Version: 1.0
References: <CAK8P3a0w-vPNBF=4ieg3YUyNHzy+qiZ5iK-9M1cRxA+TakScYw@mail.gmail.com>
 <CAK8P3a24DeEegVmydqduEFDuiTy6cyOb9Qng9X+33rUuMqMw1Q@mail.gmail.com>
In-Reply-To: <CAK8P3a24DeEegVmydqduEFDuiTy6cyOb9Qng9X+33rUuMqMw1Q@mail.gmail.com>
From: Arnd Bergmann <arnd@kernel.org>
Date: Sun, 14 Feb 2021 23:52:31 +0100
X-Gmail-Original-Message-ID: <CAK8P3a0zm-f6mWq=DiahdNcssGKwpFJN43Owm3kmC6VRkL0oew@mail.gmail.com>
Message-ID: <CAK8P3a0zm-f6mWq=DiahdNcssGKwpFJN43Owm3kmC6VRkL0oew@mail.gmail.com>
Subject: Re: [GIT PULL 6/6] ARM SoC changes for v5.12
List-Id: <soc.lore.kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>, SoC Team <soc@kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"

On Sun, Feb 14, 2021 at 11:49 PM Arnd Bergmann <arnd@kernel.org> wrote:
> ----------------------------------------------------------------
> ARM: SoC drivers for v5.12

Obviously this should have been the subject line as well, not "SoC changes".

       Arnd
