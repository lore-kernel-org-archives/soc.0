Return-Path: <SRS0=2Acm=TI=arndb.de=arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B17BC433EF
	for <soc@archiver.kernel.org>; Fri, 25 Feb 2022 15:00:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id DADBAC340F0; Fri, 25 Feb 2022 15:00:55 +0000 (UTC)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id AED55C340E7;
	Fri, 25 Feb 2022 15:00:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org AED55C340E7
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=arndb.de
Received: from mail-wr1-f50.google.com ([209.85.221.50]) by
 mrelayeu.kundenserver.de (mreue012 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1MMp08-1ngEts3CHE-00IlBf; Fri, 25 Feb 2022 16:00:52 +0100
Received: by mail-wr1-f50.google.com with SMTP id u1so4910226wrg.11;
        Fri, 25 Feb 2022 07:00:52 -0800 (PST)
X-Gm-Message-State: AOAM531E6OIbwBodGLEKSV5hKLem/i2Ec56T+1pHt6kqaH1Zq1tjkDnM
	68BDn0B2jxaJlfXnEJ7GQsKjeeFsKkNPGVJU4lA=
X-Google-Smtp-Source: ABdhPJy6fTg53HqFXzbO4YDd1EThSMPz2OTM//UiTSImrDpzm8tPbLw1NzQhPfsejsrgCw1VVVRj3nq+5OO7fu8GJEc=
X-Received: by 2002:adf:edc3:0:b0:1ec:5f11:5415 with SMTP id
 v3-20020adfedc3000000b001ec5f115415mr4573849wro.317.1645801252407; Fri, 25
 Feb 2022 07:00:52 -0800 (PST)
MIME-Version: 1.0
References: <f7d9ebf8-3f75-35bf-974e-a1a0651e8c63@foss.st.com>
In-Reply-To: <f7d9ebf8-3f75-35bf-974e-a1a0651e8c63@foss.st.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Fri, 25 Feb 2022 16:00:36 +0100
X-Gmail-Original-Message-ID: <CAK8P3a24rnYo3cSV32WcPSFpbNsN9krPLFcZzjfDtLKXvJY3yw@mail.gmail.com>
Message-ID: <CAK8P3a24rnYo3cSV32WcPSFpbNsN9krPLFcZzjfDtLKXvJY3yw@mail.gmail.com>
Subject: Re: [GIT PULL] STi DT update for v5.18 #1
To: Patrice CHOTARD <patrice.chotard@foss.st.com>
List-Id: <soc.lore.kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, olof Johansson <olof@lixom.net>, Kevin Hilman <khilman@kernel.org>, 
	SoC Team <soc@kernel.org>, "arm@kernel.org" <arm@kernel.org>, Alain Volmat <avolmat@me.com>, 
	Linux ARM Mailing List <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:ltJwEKESz0P1GRySOWgUUeIV3/NfX4acWNEUbEPtkFfXpLqMr7r
 uEMdhXKN1fkNGIO7MhEgCrn0SswnA+QNYV5a3POPq5sC8h0FPZktY4Ci8eGw89INnBduOdd
 VVIAED5qkKGl2RwyRzn99svpDNkEB8eED/EFKnhyDsSMaT3vyDFflAKZy+CXUg1sLai274G
 54XOVhPkFOdnP6X7JGS4w==
X-UI-Out-Filterresults: notjunk:1;V03:K0:DghX6hu45iM=:H0PY8PMmbXEggbblCJBpuc
 cBYrx1HArEEKkVeCzjFojIoEquPjXv6d1d4zLqA3NCnZXnx2L6SvVFOo2yucVZiB9acFY/Xiz
 t1IBUeIg4HqxA4hRjiZecpIKZ8GtHi6cAtEXRUi0fvEECAx9e8tu4XBv3myXxsOriM9dcsnrS
 bVX8FKiO6nbiIgXkZ8rt+WRt2BLM31PXFY3pEhLl47O97DdQIjOnEeFfYfzzywfgl2HSwepXZ
 InmRJkSp8I571hj6DsL9Rl7fi5NiCLlsWIL9kNxAq6IwpUFFZoOB1RHBZgKegnPcuO78OM14P
 S6qeGtrlKSZyGWSQVzBgYYs+D776wvJrYLh68pWINAX7fGyRWErB+NV5EkrBWV1iMFj/CfjR2
 zS0CvW4AdsMM8ghDTy3VN0X8sFm0MmlhkpINGv98ITfPZINYJFSuZnT7mQsWzMXoyUT/0CwaM
 baiikrX3fP73OkUhSGShE+YCNOhfFn3F+2Igi1Dj7EkpGajp4ORVCymhwlRwvaNoyIcsX0TWK
 i6IELFlLguXhp281/po+K6s/PNDiD+gT9/r14nl9r6k9+jA3icZcYQl6sndg9mgwkPxANGhGP
 eQj2ZpXyiV1skFu0r7aiDqA6tS2fOJh2ZEvUI1LYRxY3DEMg/mePTgnCubGTgi6AS69jiTdX7
 7x73hEnACp5IHwsMLk7Q+JsroBuXqPeEvlk69tjgcAf+XXvTN6egld+nAdEuqP1rMypd9Ykzl
 1kQ8O1KOyajht0mdK3w9adWj+5fMq5cTU8MuUNZjdn8YeCBnKIq5XHU2hfWc/71YW+7UI+cQx
 PnQh3+uqee3PVfWykp5JgUHaWYtTeKTofSszwBdWKwKlnD92Vs=

On Tue, Feb 15, 2022 at 6:32 PM Patrice CHOTARD
<patrice.chotard@foss.st.com> wrote:
>
> Dear ARM SoC maintainers,
>
> Please consider this first round of STi DT updates for v5.18.
>
> Thanks
> Patrice
>
> The following changes since commit e783362eb54cd99b2cac8b3a9aeac942e6f6ac07:
>
>   Linux 5.17-rc1 (2022-01-23 10:12:53 +0200)
>
> are available in the Git repository at:
>
>   git@gitolite.kernel.org:pub/scm/linux/kernel/git/pchotard/sti.git tags/sti-dt-for-v5.18-round1
>

You got the wrong URL here, please change your .git/config file to
have a separate
'pushurl' and 'url' line, with the latter pointing to the https address.

Pulled this one manually.

         Arnd
