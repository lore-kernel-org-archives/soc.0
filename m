Return-Path: <torvalds@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B35EBC3DA59
	for <soc@archiver.kernel.org>; Tue, 16 Jul 2024 20:35:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 77E48C4AF0D; Tue, 16 Jul 2024 20:35:00 +0000 (UTC)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 45A71C116B1
	for <soc@kernel.org>; Tue, 16 Jul 2024 20:34:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 45A71C116B1
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-52ea2b6a9f5so6234982e87.0
        for <soc@kernel.org>; Tue, 16 Jul 2024 13:34:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1721162097; x=1721766897; darn=kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=V+OfEIDNMP4T2UfyjkE4klMf3HvL7XLJvT+HBJZwot8=;
        b=BIVB9FeyF8/MSJ6sgVfUpYNHcwq+iUIr+oqqEIiGlI0ggJ952TliZUjsC/HMHV3cLw
         tbG1AW0k8FKw3RMdqsEmCvNEYVk2jFdd9pnzP9JQzjw02qPWKVxJX0tz9cysFnpjkMHh
         Rthz2xmgSxJi0a6KUhAeGhxz/UkYRxdYc8EJM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721162097; x=1721766897;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V+OfEIDNMP4T2UfyjkE4klMf3HvL7XLJvT+HBJZwot8=;
        b=FFSd2CYPthYfSWA/nlOJq1Br3vNuK4gzRIXfeu/v0i6kClEwLHR4X3fdQNp9aD3roK
         X5d8Vpszbzad98Z5LUkNaoZ+NW58bxDTC1iM9gjB9I8AaBvt16xnkGJaEBabS2TgbXjl
         XKp0aE2FqZ0xBnPfsjgRKhkvaeBUkM6PfT1V7wM45U4PUu2ImxQIi7oGI2Jz93Eqd4lc
         d8hhMM0Maf3nIWwd8OBgSPK0VXsS4SiVCyGa2cmrntH4jhkXFGxfk1Ipv5ayGgghZmVi
         pH0h7MgPowl6gR76jAIS9Y3LPPg7QuyD3Eb1RJLmPzFZL7YzwqD/g02EGpYl+rRzxri0
         zacA==
X-Forwarded-Encrypted: i=1; AJvYcCW6ozmoG+H0G+jCV43ZSHdiqZZTjC5qLpxcGMz/gocc0im99bjqmS1sIivbtSdkFM7TS2MoSu1U/koVdBVszA==
X-Gm-Message-State: AOJu0YyiNLabiJ4j4QdKbhUN5rOVEwoKqAgAoxNiz15hEyE8WH5DJ1rF
	FKVvLyjGivC3TgJBwBzoH8Lhe7Sr9qx1o+gZVo0Oe4/7cFXCAYyDFvf3N/VNoF1ibCXDZfh7p4c
	HWqu2Qw==
X-Google-Smtp-Source: AGHT+IEuHiZVt6KC2VEOsDX8ZDa0dTEvc+UpY6m7MbiabyvKJcsgk7Rk0UQEVuEJk9nLeQhMWl5ZDg==
X-Received: by 2002:a05:6512:132a:b0:52c:d947:586f with SMTP id 2adb3069b0e04-52edf032de1mr2022795e87.63.1721162096951;
        Tue, 16 Jul 2024 13:34:56 -0700 (PDT)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com. [209.85.167.53])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52ed252d8cesm1249818e87.157.2024.07.16.13.34.56
        for <soc@kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Jul 2024 13:34:56 -0700 (PDT)
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-52ea79e6979so6856574e87.2
        for <soc@kernel.org>; Tue, 16 Jul 2024 13:34:56 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWZ3QnFLTxMpKqUGdz5znT35h2nhBCS21yvuh+MbTHP7ErKMKSrv1gymoc7dN2GCu5AeOQR/AOZsiRTPVxj3Q==
X-Received: by 2002:a05:6512:1281:b0:52c:d5b3:1a6a with SMTP id
 2adb3069b0e04-52edf019226mr2346130e87.28.1721162095855; Tue, 16 Jul 2024
 13:34:55 -0700 (PDT)
MIME-Version: 1.0
References: <fe3126a0-7c32-426a-9997-77d76ade5179@app.fastmail.com>
 <1df9dda1-1f40-4e13-b79b-350690295ab5@app.fastmail.com> <CAHk-=wg+38EHPKGou1MqXwAAXC30cM8sMgZAGnZ7TcFO4L9J2w@mail.gmail.com>
 <CACMJSetbuZ4u64fksB26AxMxYpiB2_i5=NJefDW_aN_-aHd62g@mail.gmail.com>
In-Reply-To: <CACMJSetbuZ4u64fksB26AxMxYpiB2_i5=NJefDW_aN_-aHd62g@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 16 Jul 2024 13:34:39 -0700
X-Gmail-Original-Message-ID: <CAHk-=wiqETvfxW_mG6++9uX4tY5gYbqqXsMURDw1nQy0q0qohw@mail.gmail.com>
Message-ID: <CAHk-=wiqETvfxW_mG6++9uX4tY5gYbqqXsMURDw1nQy0q0qohw@mail.gmail.com>
Subject: Re: [GIT PULL 1/4] soc: driver updates for 6.11
To: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, soc@kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 16 Jul 2024 at 13:16, Bartosz Golaszewski
<bartosz.golaszewski@linaro.org> wrote:
>
> TBH it never occurred to me to test pure `make config`. I use `make
> menuconfig` almost exclusively and never noticed this issue for that
> reason.

I use "make oldconfig" for every single machine I boot, because why wouldn't I?

Isn't that what everybody does?

I'm surprised that anybody would re-make their config from scratch
every time, or use some GUI tool.

But yes, I'm also perhaps a bit odd in that I do a *lot* of rebooting
on several machines, and I do it with all these things that come from
outside.

So I see all those cases where random developers added new Kconfig
options, and then I have to go look at *why* it's asking me for some
new driver or whatever, when my hardware hasn't changed.

If I see anything that doesn't default to "n", it immediately raises
my hackles. Why is somebody trying to push new code on my machine that
worked just fine without it?

And if I see the same question repeated multiple times (in just
slightly different guises) for a new feature, I get annoyed.

              Linus
