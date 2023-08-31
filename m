Return-Path: <SRS0=XNXb=EQ=linaro.org=ulf.hansson@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 325E0C83F10
	for <soc@archiver.kernel.org>; Thu, 31 Aug 2023 11:30:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id EF6F2C433CA; Thu, 31 Aug 2023 11:30:19 +0000 (UTC)
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id D2C5BC433C8
	for <soc@kernel.org>; Thu, 31 Aug 2023 11:30:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org D2C5BC433C8
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-5922b96c5fcso8701807b3.0
        for <soc@kernel.org>; Thu, 31 Aug 2023 04:30:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693481418; x=1694086218; darn=kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=P69XUW20N8v7WEMjFdBLz18m8BcCG/JpWdxrnZjKH6E=;
        b=rNZfKl5jgU9EZigRoOPlaWhTDq16JalAqm0f6SHfvqPEQKhR2AspnBlfZXzz9PmIbI
         kVraXkHyfIdoXJHcPSrfv7mn2zAyF7OdMwhJH61dwiK9cYccz17n1FVODVENfo0l0wTg
         sxNMfRn2JA+CdAKWDJw410GcQ5yLYCGvvTMRoiim+RobjU0TIigrB6xQ7hyKRpK2wkTB
         cafe7GAIe6IpSDcxx2Oxr/VtsX4EILmURoFbH/TzQcVLhCBnCgMMT6SDnxGp9W9Ygcq8
         dKeOYsNC8ttPboCJwbUAHVWSkm705LgXUh6626aeYKd/G3kFnwwANlsXEY4V9IUGzL1Y
         LhJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693481418; x=1694086218;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=P69XUW20N8v7WEMjFdBLz18m8BcCG/JpWdxrnZjKH6E=;
        b=S/aMpnuWzbF1iOZ/DTFKw7hJZW6pgdhttadu1ONw3cPHfeKUFgg5F7OFvHuLH5EfBx
         UM6SDBwQvvGkyoF8/lQwkUmXTZ44es5W3g/CaIKKXikQfz5pdqR6y9Wqvlry0bn0Scut
         9FBTszUTX90uGgNvMXbDRa3CQLw5jPZe9s02QmVPxQgQYtmspyeqpZhH9/XeOy2GaOjp
         phe6ad79E5oW40Wy0wQU0KcgLe6zccn/jZjnvlPzQzE2qwMBhQfRRw9U8xAbrDXAPlNq
         bjUye06Ro+PeohkAYtvgsur6bxbdBeVeAjSds/Ir3/zSL8Yobd2gYSspboSyNKJv6LD9
         7LUQ==
X-Gm-Message-State: AOJu0Yy2mmRkJCk6tVeSHJRO/wRL6et/qhw73/1fEMkfjpuejI1vt97K
	RAeWm6zhGEiDLEkIVahFsVyMePaAhuYJf4TJ+xeSbQ==
X-Google-Smtp-Source: AGHT+IG3wpX5o5TiwoJaSIAlQpooeho0BC4+cHA8fCogEyPi1wHFnguG8bxZPAZFD7dF/rKVCn4IqkeFKeyBGy0NZRo=
X-Received: by 2002:a5b:889:0:b0:d78:5d61:ddee with SMTP id
 e9-20020a5b0889000000b00d785d61ddeemr4745877ybq.30.1693481417767; Thu, 31 Aug
 2023 04:30:17 -0700 (PDT)
MIME-Version: 1.0
References: <20230829213441.310655-1-ulf.hansson@linaro.org>
 <CAHk-=wg0gc4Cc90OL29Vr5gDtd4mnsKD+TxtoNtQbAryaWHkZQ@mail.gmail.com>
 <CAHk-=wjLO=Jsdk2prq0piznMMCk+V0_fRaFRHEPuaALpF8J=hw@mail.gmail.com>
 <96bb0de0-06d9-46f8-b02f-dc924afff13c@app.fastmail.com> <CAHk-=wi5Lh-NG_rvcx3Zyqd2Uhj76G4V73tWCFULhVzOU6e1xg@mail.gmail.com>
 <CAPDyKFrJH-1uaPCwnWZDPi4MRtOm=N2CHSRyvjXRDbQ1y-oOrw@mail.gmail.com>
 <CAHk-=wj1j0HuNWKLEzi74zEr2rGnMLEFZjLvV=rzdqzQPqOzdQ@mail.gmail.com> <CAHk-=whpfnSqToqx9f7G4-QssDHW2TBPqiXc5q1=q7w9NKxiSg@mail.gmail.com>
In-Reply-To: <CAHk-=whpfnSqToqx9f7G4-QssDHW2TBPqiXc5q1=q7w9NKxiSg@mail.gmail.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Thu, 31 Aug 2023 13:29:41 +0200
Message-ID: <CAPDyKFpeH5XV36NaaoWQw8tuXhi6jOtEAfWujC9An-tSzSStvQ@mail.gmail.com>
Subject: Re: [GIT PULL] ARM: SoC/genpd driver updates for v6.6
To: Linus Torvalds <torvalds@linux-foundation.org>
List-Id: <soc.lore.kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Olof Johansson <olof@lixom.net>, soc@kernel.org, linux-arm-kernel@lists.infradead.org, 
	Sebastian Reichel <sebastian.reichel@collabora.com>, "Rafael J . Wysocki" <rafael@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, 31 Aug 2023 at 02:08, Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> On Wed, 30 Aug 2023 at 08:07, Linus Torvalds
> <torvalds@linux-foundation.org> wrote:
> >
> > On Wed, 30 Aug 2023 at 01:34, Ulf Hansson <ulf.hansson@linaro.org> wrote:
> > >
> > > Please advise me on how to move forward.
> >
> > Just to not cause pain during the merge window, I think I'll take the
> > current trees (eventually - I still have other things pending first),
>
> I took the existing pull requests since they were next in my pile.

Thanks!

>
> But I hope we can get the naming sorted out still during this merge
> window and not leave it pending for some later time.

No problem, I will take care of this. Allow me a few days to send you
another pull-request for this.

Would "drivers/pmdomain" be okay for you, as suggested by Rafael?

Kind regards
Uffe
