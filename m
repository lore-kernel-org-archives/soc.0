Return-Path: <torvalds@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32A7FC433EF
	for <soc@archiver.kernel.org>; Fri, 15 Jul 2022 17:22:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id EADE6C341C8; Fri, 15 Jul 2022 17:22:52 +0000 (UTC)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 1EF5FC341C0
	for <soc@kernel.org>; Fri, 15 Jul 2022 17:22:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 1EF5FC341C0
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-ej1-f54.google.com with SMTP id dn9so10108688ejc.7
        for <soc@kernel.org>; Fri, 15 Jul 2022 10:22:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=cayr6gn0WZvykjHh/EvjvKv6RB+Cd+x9DmY92YQuFR8=;
        b=hy/4MlnGq4qDMH7OxmXHU8OlzyjNTTjPRuu4JX1D8JV3TD4oUR8E+KzdOmjcNQ8MDC
         5hbC6PT48Mmh0muZM4U7qQab7GAZ95pFUoZR6SG5BsO549qrmg7OiYOipH4KvvrhITsT
         PPV30Wi/6DUGo8FSufIw2ToJFUd3xkwsnlYXY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=cayr6gn0WZvykjHh/EvjvKv6RB+Cd+x9DmY92YQuFR8=;
        b=uc2KLlUkwlSI68Xz2Zl2eSCGP6wOf5NvCXY3nHLHKwbFP9YPG4BU/STNRXEdk+P9G0
         fPOYxo09auf3ruTzYYIgaDZu3HvSAur0eVo9YOePz0FKEdwt4oaie9l2IibU/d6ovJ2o
         E0Ti6qoFRKpFt4+MW9CsUuvSrVpi1pXFeOvHAczR5Pg/rG8FJ9NzLwTO19u/Wqpup7xL
         W6UACpazlWve6rsMgKrU05iqy9PqGUWybV0QvitGuPKC+LRZCD8ly8Cn1fQ6uuCu9wWh
         q5RW/osKcLecVJXLGKOZZ/CEQiPOxgXZy95DvdBoqKkousnMdklNYFnmS9nL/uCprmKO
         q/jw==
X-Gm-Message-State: AJIora+CZNUwu5r6RHABLbOB2EGfD+EQES7mNbzGkWAcMEVQkrO43+VR
	s4Vv7Pzl3nrEtIuZ1mvfloRAaM1GzvY37o9TbHY=
X-Google-Smtp-Source: AGRyM1tWVeZq4hftcP4Q1+QNH3T8U8WqDTt4IuXIuLFSvl5hFH1bt4OBsEnoNfHe1SkOsx4HlntMDg==
X-Received: by 2002:a17:907:6d1e:b0:72b:4add:75db with SMTP id sa30-20020a1709076d1e00b0072b4add75dbmr14797055ejc.717.1657905770112;
        Fri, 15 Jul 2022 10:22:50 -0700 (PDT)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com. [209.85.128.50])
        by smtp.gmail.com with ESMTPSA id d16-20020a170906175000b006fec56c57e6sm2238682eje.46.2022.07.15.10.22.49
        for <soc@kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 Jul 2022 10:22:49 -0700 (PDT)
Received: by mail-wm1-f50.google.com with SMTP id p4so3198112wms.0
        for <soc@kernel.org>; Fri, 15 Jul 2022 10:22:49 -0700 (PDT)
X-Received: by 2002:a05:600c:34c9:b0:3a0:5072:9abe with SMTP id
 d9-20020a05600c34c900b003a050729abemr15095435wmq.8.1657905768908; Fri, 15 Jul
 2022 10:22:48 -0700 (PDT)
MIME-Version: 1.0
References: <CAK8P3a3jSNJfJxkbqJ4Bfa0bkhNsF0CY+bGJMGKJOaFPm_Me5A@mail.gmail.com>
In-Reply-To: <CAK8P3a3jSNJfJxkbqJ4Bfa0bkhNsF0CY+bGJMGKJOaFPm_Me5A@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 15 Jul 2022 10:22:32 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgjOm8RMb7kvpcVT6=MEc+ACUL-QkvhF=8osQcs=e-Dbg@mail.gmail.com>
Message-ID: <CAHk-=wgjOm8RMb7kvpcVT6=MEc+ACUL-QkvhF=8osQcs=e-Dbg@mail.gmail.com>
Subject: Re: [GIT PULL] ARM: SoC fixes for 5.19, part 3
To: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, SoC Team <soc@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, Jul 15, 2022 at 5:29 AM Arnd Bergmann <arnd@kernel.org> wrote:
>
> ARM: SoC fixes for 5.19, part 3

Hmm. I'm not sure what you used as a base for your pull request, but I
already had most of this and your shortlog and diffstat didn't match
at all.

But the "for you to fetch changes up to d332a1f6b4c4.." part did
match, so I assume I got what you meant for me to get. Maybe you just
hadn't updated your upstream tree?

                  Linus
