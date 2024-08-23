Return-Path: <SRS0=8bxS=PW=linaro.org=linus.walleij@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BC42C52D7C
	for <soc@archiver.kernel.org>; Fri, 23 Aug 2024 15:51:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id EF3FBC4AF09; Fri, 23 Aug 2024 15:51:44 +0000 (UTC)
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id E8F35C32786
	for <soc@kernel.org>; Fri, 23 Aug 2024 15:51:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org E8F35C32786
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2f3f68dd44bso24711821fa.3
        for <soc@kernel.org>; Fri, 23 Aug 2024 08:51:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724428302; x=1725033102; darn=kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ems5Yuh3jeXb/TrU83+Z84W4Dg/l4S5Z1gzeQy+U0XE=;
        b=VHaJGb2tND5FdLhag6cKr1qemaVeRdVZx52jsZqCD9ktwRSdw4hTbKDFOUtsQJSQ0A
         uAJPz2j6C+EHYpA6OHF5CbLG0gOu0tZLWuj5IBg83kTku1lAK7ogkkrCaQD7CwSjLLAS
         nqxktF6UdYSfGst/WFcY0kBb23o6wwN7yTqEz0VOg8opLOkB/uVWQ8SzKYI25xNHjRNR
         I5dmy/iOUrLJlfGC4Vj1BaVMyywxPRKwGYvIQSUlmpTF2cuPxEnm88QCuKQUOswLRLUz
         vFE5MoaUWgPYqqxJB/RocO032Tdwi+c4gPIOzNIrhUUu13AqMCesdDx0cvo6AUOIHM7A
         2mPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724428302; x=1725033102;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ems5Yuh3jeXb/TrU83+Z84W4Dg/l4S5Z1gzeQy+U0XE=;
        b=T9C24sQ5G3QvrgESrS2qDoq+5J1U30+BWM10LoqrceP9B48Kcdq3aT6V+vGGC1jsE3
         kgCayx0oJ5sgdasSt3lkcdqGfSSVJLGkqX2AoNgpw5Mo4BYYRKXdtGSOPX1ITl6X4AXV
         wSUC4c9KCZEqOGlazwVcdgMSCN7zKdddoEQsSyabOVxwR93DEqiTVKYvwGYZ6fKESM96
         AhEWlL50QFrehhCmbk2N9v1QmVYsP1xKXdO19p2Lp7RfPNQCx9HUrcZKgi6DQwDhcTDL
         tXpsUCo87kPoxpMv4sp+GS69wwJuxZpSlEi1QDvqMbWFSDBhLM2alVhcZGMdzyhPtd1m
         3XvA==
X-Forwarded-Encrypted: i=1; AJvYcCUrtDwTNyw0aXGBdFizz9lqAVIk2UPNKnhBa0Zg1EK74z3POXGD6g6DBmVs0MNgFNzxyNw=@kernel.org
X-Gm-Message-State: AOJu0YxjXHBmZOVg59/mBmQl/88cCrAxqR0v+Iw+GWEjZEriOXQuPBNt
	4/LaUUlksAYSKjhvjGgSrevLIdhNUvHq+PTqBIASbCTo/5/0bKorbT2vI4SpapuYX9xBYLphNvA
	xyzwR7+Q+6IC+Q8BPNXqMm113TqIE0aIWIxXBpw==
X-Google-Smtp-Source: AGHT+IGvS1m3SwVCUZI5gnVQXJAs13Rd9dcYnhQeTub9j2B6KWYvXRtdAKKxqsWhnDiaK1fwjiJmwMVrg93543EtDjo=
X-Received: by 2002:a05:6512:10cd:b0:52e:fa6b:e54a with SMTP id
 2adb3069b0e04-53438785b05mr1938698e87.30.1724428301706; Fri, 23 Aug 2024
 08:51:41 -0700 (PDT)
MIME-Version: 1.0
References: <20240805014710.1961677-1-dmitry.torokhov@gmail.com>
In-Reply-To: <20240805014710.1961677-1-dmitry.torokhov@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 23 Aug 2024 17:51:30 +0200
Message-ID: <CACRpkdYFc8vuz__7DkFSMFxUC=LSwCJmEun2KXgUvPMq+_e17A@mail.gmail.com>
Subject: Re: [PATCH 0/5] Remove support for platform data from matrix keypad driver
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: Haojian Zhuang <haojian.zhuang@gmail.com>, Daniel Mack <daniel@zonque.org>, 
	Robert Jarzmik <robert.jarzmik@free.fr>, Arnd Bergmann <arnd@arndb.de>, soc@kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-input@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 5, 2024 at 3:47=E2=80=AFAM Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:

> This series attempts to remove support for platform data from
> matrix_keypad driver, and have it use generic device properties only
> for the keypad configuration. Spitz is the only board [left] that
> uses platform data.
>
> As part of the migration I am also dropping support for "clustered"
> interrupt mode, as it was only available through platform data and there
> are no users of it in the mainline kernel.
>
> Additionally gpio-keys device used by Spitz converted to use device
> properties instead of platform data.
>
> I would prefer not to have the song and dance of merging first 2 patches
> through the input tree, waiting, merging the spitz patches through SoC
> tree, waiting, and finally merging the last patch to matrix keypad
> through input again, so maybe we could merge it all through SoC?
> Alternatively, I could merge everything through input. What do you
> think?

Sounds like a plan. The series:
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
