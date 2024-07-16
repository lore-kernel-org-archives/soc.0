Return-Path: <torvalds@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84C3FC3DA49
	for <soc@archiver.kernel.org>; Tue, 16 Jul 2024 19:53:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 564BDC116B1; Tue, 16 Jul 2024 19:53:34 +0000 (UTC)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id EF6CFC4AF0C
	for <soc@kernel.org>; Tue, 16 Jul 2024 19:53:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org EF6CFC4AF0C
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-58b0dddab63so9057144a12.3
        for <soc@kernel.org>; Tue, 16 Jul 2024 12:53:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1721159610; x=1721764410; darn=kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=9A04c1sCzDtDJHwgWZ25LKwlEh7gHT/ykOd5hucUk6E=;
        b=dxv2POxXCF4bOa//6Cs6C8/ujPhtTorH7EYQTxnyFrJsWFeJGhZ9GctlaW0f1RwKSb
         BBiRV3RLh/sLs9Wpceks7bMhtxM9EZo/PhaoUXA7lqhLCQHhUNoGLUQmn1JMQeuOcc21
         VkWcfa4e/GkR6AkOVCDfrXPQ92lurK3I9SPJU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721159610; x=1721764410;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9A04c1sCzDtDJHwgWZ25LKwlEh7gHT/ykOd5hucUk6E=;
        b=v1bG122gcHD2VyRSWf7UhOgiqLa22Zn8znu2CHMN+iF0vN749jkxqEe8sKr8zvb61/
         WhdrI/GTnhnY2rnC77nKuvreb2YV3ftzI1Y3VybAn8Owxry2xn97rzxtAXi4uMzVofiM
         2AxYEI47Xgw5ZytngkdjqEFqgpHvzF62NHYGPp7XIX91kxn7brhZN7tJ+TP6mfVqCMP5
         ONqD7iyDMVpC8smQoWio5S0zjgX+7TEQp8sK0zAUbct553/t3V59554vMpTZSZXQs2FB
         xcmHSybuZuCBpeHyFMpkgGzKuOR1NGVJutqZxDAQ/lzNPFSImm5ymLn84gmrg9Erx9s/
         88kw==
X-Forwarded-Encrypted: i=1; AJvYcCUZxlGyyE4N72KsJ5sAVlY9eT5TCQ2lnt7TyO+BYFg4HluwAHz74IV4Oz+8Wi3/MVt5xvT/NwzGhHpYUALpyQ==
X-Gm-Message-State: AOJu0YyfHE/WrvkDIMmuQFtBDafKF/ghkX5X8v7bZnhOh+foAVufizfR
	cqlX8VR6iTX8/eqVv8iEwXNKgsLeQuuMkM4rcBc8oCsUYVMkFl9g65TAsDO6v/No7n+hrr9MXgc
	WADeBzw==
X-Google-Smtp-Source: AGHT+IFSm4UcPC8E4rFRxhq4XsVYLf21GJ6dJBKXUjt1LVe3Q+VizTo/UVryIDTdYI3t6kpOvj4KSA==
X-Received: by 2002:a17:907:1701:b0:a77:c26c:a56e with SMTP id a640c23a62f3a-a79eaa3f2f3mr220928966b.45.1721159610029;
        Tue, 16 Jul 2024 12:53:30 -0700 (PDT)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com. [209.85.208.43])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a79bc5a3a21sm359856566b.18.2024.07.16.12.53.29
        for <soc@kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Jul 2024 12:53:29 -0700 (PDT)
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-58b0dddab63so9057108a12.3
        for <soc@kernel.org>; Tue, 16 Jul 2024 12:53:29 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWGWp00Un2KbIoNaXLupmxrXYwF4NQNAoj4DKEl5BvwH04rBVA9jy/jIJUSJ2qaHf8RibPWY/Y48ES3ydGaIQ==
X-Received: by 2002:a17:906:2409:b0:a6f:c268:ff2e with SMTP id
 a640c23a62f3a-a79ea3d7952mr224501066b.5.1721159609118; Tue, 16 Jul 2024
 12:53:29 -0700 (PDT)
MIME-Version: 1.0
References: <fe3126a0-7c32-426a-9997-77d76ade5179@app.fastmail.com> <1df9dda1-1f40-4e13-b79b-350690295ab5@app.fastmail.com>
In-Reply-To: <1df9dda1-1f40-4e13-b79b-350690295ab5@app.fastmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 16 Jul 2024 12:53:12 -0700
X-Gmail-Original-Message-ID: <CAHk-=wg+38EHPKGou1MqXwAAXC30cM8sMgZAGnZ7TcFO4L9J2w@mail.gmail.com>
Message-ID: <CAHk-=wg+38EHPKGou1MqXwAAXC30cM8sMgZAGnZ7TcFO4L9J2w@mail.gmail.com>
Subject: Re: [GIT PULL 1/4] soc: driver updates for 6.11
To: Arnd Bergmann <arnd@arndb.de>, Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	soc@kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 15 Jul 2024 at 13:59, Arnd Bergmann <arnd@arndb.de> wrote:
>
> soc: driver updates for 6.11

Christ people, am I the only one actually testing any of this?

> Bartosz Golaszewski (14):
>       firmware: qcom: add a dedicated TrustZone buffer allocator

This causes me to get a new and COMPLETELY NONSENSICAL question on my
regular AMD Threadripper workstation config.

I'm getting quite fed up with all the constant complete disregard for
any sanity in Kconfig files. People are putting in COMPLETE GARBAGE
here, and apparently nobody bothers to test it for any kind of sanity.

This kind of crap needs to stop.

I think the fix is to just add a

        depends on QCOM_TZMEM

to that thing, but on my Altra machine even that doesn't fix this
horror, because it turns out that everybody and their dog ends up
doing

        select QCOM_SCM

and we have QCOM_SCM doing

        select QCOM_TZMEM

so it's hard as hell to actually get rid of that pointless churn,
because you have to figure out which random driver ends up allegedly
"needing" this.

Are any of these actually _needed_? Because while I like automatic
"select" things just picking the infrastructure that a driver actually
requires to work, this all does *NOT* smell like "required
infrastructure".

This smells like random "do you actually want this?" to me.

And the answer is "No. No I damn well do not". Particularly on my AMD
machine that most definitely does not have some Qualcomm TrustZone
thing.

                Linus
