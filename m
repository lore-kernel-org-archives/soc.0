Return-Path: <SRS0=ARg9=OQ=linaro.org=bartosz.golaszewski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79BDAC3DA59
	for <soc@archiver.kernel.org>; Tue, 16 Jul 2024 20:16:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 53B55C4AF0C; Tue, 16 Jul 2024 20:16:08 +0000 (UTC)
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 2B0A4C116B1
	for <soc@kernel.org>; Tue, 16 Jul 2024 20:16:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 2B0A4C116B1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-64789495923so55225037b3.0
        for <soc@kernel.org>; Tue, 16 Jul 2024 13:16:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721160966; x=1721765766; darn=kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=4r5i/GL7gQrxXPMEHJ1P9sQCgQu/V6Mo3LoCvPIMgzo=;
        b=uOXg21pkaoTsl+pY9rRaxXsjL+vJw8S1xTU/wJQ5AWrTbnFOZN846vzs7BCOEG5uxF
         MNxQN5ZWkzONJ5M5G3ebjfc/vAN72c4NwVlsg8B3Pta7BxYiDPU64fwqaGbe+emyWdJV
         9/Lc4W9mH4pMbhfxsz1p27nxQuQtMF1oMa993C/Qtd8tKucMlHdLOcsaRMs66KR/fUfh
         S4hAAoS4WYIhyvDDU3aBfRfhoYJbFv6OyghkBCzVUslQUUXHELvKlOWrwAMFo5FWDUAC
         1qaPwwoBMS+T4eYn9xbYeC0kUwb3OOqQzxdFMae3/WSt8ztjO3mZ9s8sLRGxUWIok69t
         8MtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721160966; x=1721765766;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4r5i/GL7gQrxXPMEHJ1P9sQCgQu/V6Mo3LoCvPIMgzo=;
        b=b2Seom8fLqiKfryuksAGHOI/P7Idsbz8iEyXzNfoN8WYyAU5VnYakrY8ACLYC4MyMu
         RCR2L0eky2hoETEffBhXSzHMvfVdKmOqpjdnQR4qyGezfjwzP06fqbrm4kzhORx7jPz6
         usapDSeoMU/qxAdngoxTZWRu9GhygumsKT7rpkK5mkospIzw4zT4eW8ISVFtin62h6RD
         PUDDGkCVJFApWpoU8rNxh6mQW8h7n5nMRHErs/w3cLQiDLQNBuaBxz5Jw3hXiAUt5Xdt
         uBbGsL/gFMXJlpwMkFNyGP7UHEVcaCFV2MmLtSqRvhd8DExFj/sCa0JLgl9Wk3PN0Fw8
         2zEg==
X-Forwarded-Encrypted: i=1; AJvYcCUe2NIKi29y2HNeCfq4DprOAhhfE8zBSlH88CKbA5I4GcJA3yDDJLAzpZJXPTA8T1mOtQ4mGyke60bm30SpSw==
X-Gm-Message-State: AOJu0YxQ5dDbG0aqaUhYA3sRnUVHEVRGXgvmkOm4oAZRmM0SQ+OYKl1F
	yrosCAEBHbGA9VDCQtEhxx7GrtcTqL0nBRJn7MkXzm90Sq0xoKc9nFgyyU1uSf/R2NCwOd/6Vq+
	upO6Is+oneqoiyeRI44zVXfCU/X249YzePsQuvAaE16y03M9Auxw=
X-Google-Smtp-Source: AGHT+IGgeeS6IJv/UGyjYLIS7MqCl7Q01RWDc3s9Js6V/opyH1mB5VO6EF6NYyVT9CRVp9JUv6NXuTvf98RvF2gZAp0=
X-Received: by 2002:a05:690c:d94:b0:64a:79f6:2f2d with SMTP id
 00721157ae682-66381105a8fmr46658017b3.31.1721160966101; Tue, 16 Jul 2024
 13:16:06 -0700 (PDT)
MIME-Version: 1.0
References: <fe3126a0-7c32-426a-9997-77d76ade5179@app.fastmail.com>
 <1df9dda1-1f40-4e13-b79b-350690295ab5@app.fastmail.com> <CAHk-=wg+38EHPKGou1MqXwAAXC30cM8sMgZAGnZ7TcFO4L9J2w@mail.gmail.com>
In-Reply-To: <CAHk-=wg+38EHPKGou1MqXwAAXC30cM8sMgZAGnZ7TcFO4L9J2w@mail.gmail.com>
From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Date: Tue, 16 Jul 2024 22:15:55 +0200
Message-ID: <CACMJSetbuZ4u64fksB26AxMxYpiB2_i5=NJefDW_aN_-aHd62g@mail.gmail.com>
Subject: Re: [GIT PULL 1/4] soc: driver updates for 6.11
To: Linus Torvalds <torvalds@linux-foundation.org>
List-Id: <soc.lore.kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, soc@kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 16 Jul 2024 at 21:53, Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> On Mon, 15 Jul 2024 at 13:59, Arnd Bergmann <arnd@arndb.de> wrote:
> >
> > soc: driver updates for 6.11
>
> Christ people, am I the only one actually testing any of this?
>

TBH it never occurred to me to test pure `make config`. I use `make
menuconfig` almost exclusively and never noticed this issue for that
reason.

> > Bartosz Golaszewski (14):
> >       firmware: qcom: add a dedicated TrustZone buffer allocator
>
> This causes me to get a new and COMPLETELY NONSENSICAL question on my
> regular AMD Threadripper workstation config.
>
> I'm getting quite fed up with all the constant complete disregard for
> any sanity in Kconfig files. People are putting in COMPLETE GARBAGE
> here, and apparently nobody bothers to test it for any kind of sanity.
>
> This kind of crap needs to stop.
>
> I think the fix is to just add a
>
>         depends on QCOM_TZMEM
>
> to that thing, but on my Altra machine even that doesn't fix this
> horror, because it turns out that everybody and their dog ends up
> doing
>
>         select QCOM_SCM
>
> and we have QCOM_SCM doing
>
>         select QCOM_TZMEM
>
> so it's hard as hell to actually get rid of that pointless churn,
> because you have to figure out which random driver ends up allegedly
> "needing" this.
>
> Are any of these actually _needed_? Because while I like automatic
> "select" things just picking the infrastructure that a driver actually
> requires to work, this all does *NOT* smell like "required
> infrastructure".
>
> This smells like random "do you actually want this?" to me.
>
> And the answer is "No. No I damn well do not". Particularly on my AMD
> machine that most definitely does not have some Qualcomm TrustZone
> thing.
>
>                 Linus

There's a patch from Geert already on the list[1] that should address this.

Bartosz

[1] https://lore.kernel.org/lkml/74947f7f132a811cc951749907b01bd25dcf23e6.1721135509.git.geert+renesas@glider.be/
