Return-Path: <torvalds@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D2B2C71153
	for <soc@archiver.kernel.org>; Wed, 30 Aug 2023 00:19:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 1C042C433C8; Wed, 30 Aug 2023 00:19:23 +0000 (UTC)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 83F06C433C7
	for <soc@kernel.org>; Wed, 30 Aug 2023 00:19:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 83F06C433C7
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-500b0f06136so5726353e87.0
        for <soc@kernel.org>; Tue, 29 Aug 2023 17:19:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1693354758; x=1693959558; darn=kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=0TRiwO9brInVsWGB1zNLCt57WQP0un85fvRaKypoTus=;
        b=P7oHno8UaZwjFp8gCXqfjESjG625Z8IuGRG5uP33IiWa/DMJJpfyeTbAYiyN4XVJmh
         EbQ63SSFcBZ8Q/0MD7zLrLMPicfdzkWswirdfiBkLgQH1N4sAtseQcaV5UojQqlnl8Ng
         Bc1TABC2IloJh/YBNRAUy4PrNr+gHWALRVv/M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693354758; x=1693959558;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0TRiwO9brInVsWGB1zNLCt57WQP0un85fvRaKypoTus=;
        b=iP2MYtQT06zxmkc6I5F1J3M386By88IRkmqxK7jBhMZlzSKJhZaM5bpY+yWI+Ko4bj
         vKgmPjIIJF2GVh9IUN8vbud/iYPj2SAay7YUA4G1zZH1mmTZaXtlpYNfN7Tuv45npUWf
         /M9IXsOJz8CA2/lSs6OPq/olf0jVUkEpBThfob+aMl7CXc17ojPVzocaEkMcdo1XUAcG
         rPJJ/FSz9S5bSKg8XluAjLKBwnBQecR7K7OTuif2QcuejFZaaLs2sflP1kp4smpofd3D
         S5E0Gaku0hkGN6j/h63U1X00bgfEuwUWstZfZimU4XwB3u4LOSkRPdclx+isimWSa3rK
         0dqw==
X-Gm-Message-State: AOJu0Ywqf64RrQ01X8YuHH1h6Uo3GBqn6PvfFcjS1chfiZJ9Ka0tpHwd
	hhAA6O7rPymSHKP9eC9+uWBLkonWcJLTk2aV3IOPuxtB
X-Google-Smtp-Source: AGHT+IEAf4JjX/noZauA8tJPpwpjTWJJxGBYwu31MNv7zNGKSux7KrNfrYodpsfRmtdHoO3GKKnxGQ==
X-Received: by 2002:ac2:4d0b:0:b0:500:95f6:ba3d with SMTP id r11-20020ac24d0b000000b0050095f6ba3dmr304280lfi.21.1693354757929;
        Tue, 29 Aug 2023 17:19:17 -0700 (PDT)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com. [209.85.218.41])
        by smtp.gmail.com with ESMTPSA id n25-20020a05640206d900b0052a1c0c859asm6192347edy.59.2023.08.29.17.19.16
        for <soc@kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Aug 2023 17:19:16 -0700 (PDT)
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-9a2185bd83cso657947866b.0
        for <soc@kernel.org>; Tue, 29 Aug 2023 17:19:16 -0700 (PDT)
X-Received: by 2002:a17:906:251:b0:994:4095:3abf with SMTP id
 17-20020a170906025100b0099440953abfmr439145ejl.14.1693354756312; Tue, 29 Aug
 2023 17:19:16 -0700 (PDT)
MIME-Version: 1.0
References: <20230829213441.310655-1-ulf.hansson@linaro.org>
In-Reply-To: <20230829213441.310655-1-ulf.hansson@linaro.org>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 29 Aug 2023 17:18:59 -0700
X-Gmail-Original-Message-ID: <CAHk-=wg0gc4Cc90OL29Vr5gDtd4mnsKD+TxtoNtQbAryaWHkZQ@mail.gmail.com>
Message-ID: <CAHk-=wg0gc4Cc90OL29Vr5gDtd4mnsKD+TxtoNtQbAryaWHkZQ@mail.gmail.com>
Subject: Re: [GIT PULL] ARM: SoC/genpd driver updates for v6.6
To: Ulf Hansson <ulf.hansson@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, soc@kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 29 Aug 2023 at 14:34, Ulf Hansson <ulf.hansson@linaro.org> wrote:
>
> Here's a pull-request that introduces the genpd provider subsystem.

I was starting to pull this, and then tried to figure out what the
heck "genpd" is.

Absolutely nothing in the pull request explains what it might be.

Even after actually pulling it, I couldn't really find anything useful.

The closest seems to be the MAINTAINERS file entry that says "GENERIC
PM DOMAIN PROVIDERS", which doesn't actually clarify anything.

Ok, so we have a Kconfig option for PM_GENERIC_DOMAINS, so I looked at
that. It has no help-text, as it is entirely an internal generated
one.

End result: I decided that without any kind of explanation at all,
"genpd" is a completely useless name, and that I don't want to
randomly add a new directory with zero explanation for what the heck
it is.

So I ended up unpulling it, because if I had to google what it is, I
wasn't going to pull it.

Can we please agree that

 (a) five random letters in a row does not documentation make

 (b) if we have a new subsystem, it should damn well have some
explanation for it

And even if you send me a new pull request with an actual explanation
for the term, do we really have to use such a horribly nasty name?

This is not some kind of industry standard shorthand.

Yes, google does find the term "genpd" having been used for a few
years in Linux SoC-land, but are we really so short on diskspace that
we can't use more descriptive names?

Now I look at this disaster area with no documentation, and realize
that it ends up also being part of Arnd's series of SoC pulls.

What a horrible thing this is. Please don't use random letter
combinations that have absolutely no meaning to anybody else, and that
aren't even explained.

               Linus
