Return-Path: <SRS0=HjQG=G4=linaro.org=jens.wiklander@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB179C433E0
	for <soc@archiver.kernel.org>; Mon, 25 Jan 2021 07:22:07 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 868A7229C5; Mon, 25 Jan 2021 07:22:07 +0000 (UTC)
Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com [209.85.167.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 40DEC22482
	for <soc@kernel.org>; Mon, 25 Jan 2021 07:22:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 40DEC22482
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=jens.wiklander@linaro.org
Received: by mail-oi1-f173.google.com with SMTP id h6so12424975oie.5
        for <soc@kernel.org>; Sun, 24 Jan 2021 23:22:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=2BPYYmLlG/S95JyYI2DrALsiu06td2e2+btxJ0vaZGI=;
        b=QWc0yh73sc7zPQoUr7JYK9oMhm4+Kj2LguvuuPoTy7rAWW/jMVTL4R7A0dhupulOl+
         zBbeSIl1y0y/1gGXPtBFPH7PAMiKFWlFqpSgqjz9rMUNh0Sb8xJ+AcHcMy8wllDGDERo
         eT5hHFOT0A6DhheqwMRoykLqSKRdu9paTO3cGSI1AZrj3CNmlxdjlfLSvrDTdByjMOLD
         csQeRxV1nhzP/5vAVFYdgdph6pfR0QExemFE+TcxuALNzphEQOt/NpUjfT0EZQjjrdMY
         hEqU0QY6xieWK543ybPiOj6yGx7szMmil+skXeu2mpkmjby2rzEB2nb2VFFt6QOp1/JT
         mpUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2BPYYmLlG/S95JyYI2DrALsiu06td2e2+btxJ0vaZGI=;
        b=rhFgiQ/jI2M/rydS4rNFoGzmUgiQaZZ35SX4dyWsIk9YgSCj2TzHbzyeeFZUffn0ue
         8t3FriqElwMN6JC8rNXJH3fC5LykfqtV6HJlFZsGz8oN3/vWOhl2VWw4mPRB75C/P1b0
         bC2YwuIHS3761zzkvPncWeY0KWueP0JrCNqTAbZ1ca69yQVP3cCb3FEfLx982ySgYZcV
         XULFP+8y7mWN+JUMzII5xGTMFv7TWhuuvrdrh3qgnwUG4e6I4mBh9teNjM/llTyTy1dX
         Q8J5rRvJlnVX1wFMgjOWpDSDXuZ3g4jH0mrjOhQeLbLv0GBZDU3xFzdUl2P/dq21ZqwT
         pZLQ==
X-Gm-Message-State: AOAM5338V85gzJbbNXv+2LihZIs1FmlTdrBgxXrkhTLun6+K/kf1Zx/p
	UxFWBgJrukX7/2djRYdUCaWzKAlidfd99K70/auiFQ==
X-Google-Smtp-Source: ABdhPJx4MHOUPwaBpHp/IXHEZTGrYlIxfdHd8Hn/UJb+QfnU3jH9SzFKbTmPBo5wYPbBaCZ1aHv30cL5v7+OInzFSAQ=
X-Received: by 2002:aca:7252:: with SMTP id p79mr714697oic.47.1611559326153;
 Sun, 24 Jan 2021 23:22:06 -0800 (PST)
MIME-Version: 1.0
References: <20210122074234.GA1074747@jade> <161135641124.29035.6761157228532077144.git-patchwork-notify@kernel.org>
In-Reply-To: <161135641124.29035.6761157228532077144.git-patchwork-notify@kernel.org>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Mon, 25 Jan 2021 08:21:54 +0100
Message-ID: <CAHUa44HCnzgYndTccs=SSb1BQ9nk05k8vUQ-TO6Z2ZukwQcUPA@mail.gmail.com>
Subject: Re: [GIT PULL] OP-TEE driver fix for v5.11
To: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: SoC Team <soc@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Arnd,

Was this merged by mistake? You had some concerns about the need_resched() test.

Thanks,
Jens

On Sat, Jan 23, 2021 at 12:00 AM <patchwork-bot+linux-soc@kernel.org> wrote:
>
> Hello:
>
> This pull request was applied to soc/soc.git (refs/heads/arm/fixes):
>
> On Fri, 22 Jan 2021 08:42:34 +0100 you wrote:
> > Hello arm-soc maintainers,
> >
> > Please pull this small patch taking care of a rcu_sched trace in some
> > corner cases when OP-TEE is invoked.
> >
> > Thanks,
> > Jens
> >
> > [...]
>
> Here is the summary with links:
>   - [GIT,PULL] OP-TEE driver fix for v5.11
>     https://git.kernel.org/soc/soc/c/156d02914b7d
>
> You are awesome, thank you!
> --
> Deet-doot-dot, I am a bot.
> https://korg.docs.kernel.org/patchwork/pwbot.html
>
>
