Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 446A3C56201
	for <soc@archiver.kernel.org>; Wed, 18 Nov 2020 19:33:04 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 018D624248; Wed, 18 Nov 2020 19:33:04 +0000 (UTC)
Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id C50D1238E6
	for <soc@kernel.org>; Wed, 18 Nov 2020 19:33:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1605727983;
	bh=YVRPp5/bWstjMGhwoIJRBLWZxy8EDIE1/NKrQi2o73A=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=zlHG5pqstAhybs5RhNvZqDcG7fWbF5AS47Cnezg4sPSilqiJeqbfg8ykerJjvzaLI
	 8gJ4mWD6NkCiSvOFEv4jY3BOLCZ0MIi5L1+J4eD205WJrfdyUMFDrUT1O24A73s9KB
	 k7LX9nxxhd0VF2mAwAtnQch0okGIpczy21ydNHig=
Received: by mail-ot1-f48.google.com with SMTP id y22so2912338oti.10
        for <soc@kernel.org>; Wed, 18 Nov 2020 11:33:03 -0800 (PST)
X-Gm-Message-State: AOAM531o+8O0i4oFIfc2a0RafJPAbGuPhYRzsOM50xfhYCkSPzYqPRJj
	rBT79PBRRu4kOupkv38ss62lVFg4RwlzF8ykyJQ=
X-Google-Smtp-Source: ABdhPJzo3AFVt6jZtW8sNaWLI122/DGCiSfq+6hhv9tcsWC8+wk1S+N1ioRqpYxdnSDG1cKbdXaPgRyCfps1LJrQ37Y=
X-Received: by 2002:a9d:65d5:: with SMTP id z21mr7042049oth.251.1605727983009;
 Wed, 18 Nov 2020 11:33:03 -0800 (PST)
MIME-Version: 1.0
References: <20201118183358.itb4xmsbapztzmoq@chatter.i7.local>
In-Reply-To: <20201118183358.itb4xmsbapztzmoq@chatter.i7.local>
From: Arnd Bergmann <arnd@kernel.org>
Date: Wed, 18 Nov 2020 20:32:47 +0100
X-Gmail-Original-Message-ID: <CAK8P3a2asxKk7kTk6pJv+DCLm=QKhAVGjoV2+XnhtsVQ3w6AJQ@mail.gmail.com>
Message-ID: <CAK8P3a2asxKk7kTk6pJv+DCLm=QKhAVGjoV2+XnhtsVQ3w6AJQ@mail.gmail.com>
Subject: Re: soc@kernel.org is now on lore
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
List-Id: <soc.lore.kernel.org>
Cc: SoC Team <soc@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, Nov 18, 2020 at 7:33 PM Konstantin Ryabitsev
<konstantin@linuxfoundation.org> wrote:
>
> Hi, all:
>
> I know that nobody requested it, but we're changing how mail is
> delivered to patchwork and it is now a requirement that all patchwork
> projects are delivered via lore.kernel.org. So, you get that part for
> free now. :)
>
> Assuming this works and everything gets properly delivered, it should
> initialize the following location:
>
> https://lore.kernel.org/soc

Awesome, thanks a lot! I guess this means that I can now reliable
combine pwclient (to look for incoming pull requests) with 'b4 pr'
and 'b4 ty' for applying them without requiring each mail to be
Cc:linux-arm-kernel.

       Arnd
