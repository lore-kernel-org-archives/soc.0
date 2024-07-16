Return-Path: <SRS0=ARg9=OQ=linaro.org=bartosz.golaszewski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 701BEC3DA49
	for <soc@archiver.kernel.org>; Tue, 16 Jul 2024 20:49:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 3C9B4C4AF0C; Tue, 16 Jul 2024 20:49:39 +0000 (UTC)
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 3855EC116B1
	for <soc@kernel.org>; Tue, 16 Jul 2024 20:49:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 3855EC116B1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-6561850a7bcso55495147b3.3
        for <soc@kernel.org>; Tue, 16 Jul 2024 13:49:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721162977; x=1721767777; darn=kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=rew4uRo6G7ZD84SpgNe5tx363g5l3xHU+5cSV4Szuu4=;
        b=E+UdJ4mxNxJE759p+aHI2P6czXy+sAmad/Cf5RRMYhcU/a4INlZy8SEa3RglQoGzxb
         N46eJPYGTYo5D5UtBFqnoezyiuH+PN7xYQsLuu0PUSTJB97sK2n1G36yoS84LeQ8DiYB
         LL71omhxwL6Z5UpVd8MvJKjroT+L3p578ZM9K9PlZGlojsRl/2IzNeDRs2dAzBF0ehRg
         ltyD0ddxqY8Khis7Jv9r6mIVPTSSOupb6NpNZbNv64cLIWI0BhLCAJFJ842v4j/P5psB
         vQKOHdgJsJ76bCtXQeIalu+t+zy6kYnZ+nvqvsMwY7RGRsPp2eOEEPKiNMbp2jt0S4Dy
         Igzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721162977; x=1721767777;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rew4uRo6G7ZD84SpgNe5tx363g5l3xHU+5cSV4Szuu4=;
        b=vUXyOUMbsVIMvVrn/Gddvib4FvKJZSEDAleyKb/HW7nOsnRsq7wYw05fdUh4cGezaZ
         je64swNMVGK5yCotOFGVk1IuPh2wdIAuzr1PA2pl6j5Dq2BzqEPyVZ0iLLHCy/HLPIOm
         CDis2i+WxmzOhL21L3MlYghk2Csl8vk20Ja+6yvB+J8ADF8sAPaWoyQkM+CA5zAW3efW
         iHmT/7d6nTLyGlQCiKda+J9TI9MzVrr2tHRhQCRXnMquwv4V/IV3m2rtWzXJHn2rXHOt
         BkMvuEWni4oCvu4Myx4wmnTZz5wQE0nyDsLwMs5AwQeQOt5wiGrJutClMuXxI9sxIE+v
         XcUg==
X-Forwarded-Encrypted: i=1; AJvYcCXZGQNUhXlBwN6h+LbwcxiNanuwU2tBJs8xJbk3s8bWenlhiWR0WHUdCCvuVou09s5laWNXmR1+SCXMyB63jw==
X-Gm-Message-State: AOJu0Yx0XC4a/XYIq3Tutg2LgwrN9Km2MP2jwy9ZR6tD5Y0gjX1E4/uI
	7L11ztYIX0K/smLNFRYVwBL4hwUXMDOA15Hc8dd0JZciBU/e9AOJZ6cTsMt4uu/jieC6DLzvqGM
	JybRgdErCcQGs+C/idNZradulPHt/+dt0ShaOrg==
X-Google-Smtp-Source: AGHT+IEUdX2s17r2WHHg8RHUXPpMb2z72KIH+6Dg/67NFjaJeEnCa6Gr4j1apj2MOlPcupIWrwA/mK6t6st6WMBqhb4=
X-Received: by 2002:a81:5b44:0:b0:62a:2a7d:b512 with SMTP id
 00721157ae682-6637f0c9724mr40158917b3.10.1721162977202; Tue, 16 Jul 2024
 13:49:37 -0700 (PDT)
MIME-Version: 1.0
References: <fe3126a0-7c32-426a-9997-77d76ade5179@app.fastmail.com>
 <1df9dda1-1f40-4e13-b79b-350690295ab5@app.fastmail.com> <CAHk-=wg+38EHPKGou1MqXwAAXC30cM8sMgZAGnZ7TcFO4L9J2w@mail.gmail.com>
 <CACMJSetbuZ4u64fksB26AxMxYpiB2_i5=NJefDW_aN_-aHd62g@mail.gmail.com> <CAHk-=wiqETvfxW_mG6++9uX4tY5gYbqqXsMURDw1nQy0q0qohw@mail.gmail.com>
In-Reply-To: <CAHk-=wiqETvfxW_mG6++9uX4tY5gYbqqXsMURDw1nQy0q0qohw@mail.gmail.com>
From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Date: Tue, 16 Jul 2024 22:49:26 +0200
Message-ID: <CACMJSeteKVXEsasmXiqZhUQ_9bGCvxJLxTFGj6=WctBCkGXn0w@mail.gmail.com>
Subject: Re: [GIT PULL 1/4] soc: driver updates for 6.11
To: Linus Torvalds <torvalds@linux-foundation.org>
List-Id: <soc.lore.kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, soc@kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 16 Jul 2024 at 22:34, Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> On Tue, 16 Jul 2024 at 13:16, Bartosz Golaszewski
> <bartosz.golaszewski@linaro.org> wrote:
> >
> > TBH it never occurred to me to test pure `make config`. I use `make
> > menuconfig` almost exclusively and never noticed this issue for that
> > reason.
>
> I use "make oldconfig" for every single machine I boot, because why wouldn't I?
>
> Isn't that what everybody does?
>

I just do `make olddefconfig` hoping that the defaults are sane. Or
build the arm64 defconfig.

> I'm surprised that anybody would re-make their config from scratch
> every time, or use some GUI tool.
>

Nah, not from scratch. I just take the defaults and reuse them.

> But yes, I'm also perhaps a bit odd in that I do a *lot* of rebooting
> on several machines, and I do it with all these things that come from
> outside.
>

Yep, that's a totally different workflow from most developers I imagine.

> So I see all those cases where random developers added new Kconfig
> options, and then I have to go look at *why* it's asking me for some
> new driver or whatever, when my hardware hasn't changed.
>
> If I see anything that doesn't default to "n", it immediately raises
> my hackles. Why is somebody trying to push new code on my machine that
> worked just fine without it?
>
> And if I see the same question repeated multiple times (in just
> slightly different guises) for a new feature, I get annoyed.
>
>               Linus

I will pay attention to new config options in the future. Thanks for
bringing this to my attention.

Bartosz
