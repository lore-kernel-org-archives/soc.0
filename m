Return-Path: <SRS0=OMfa=YG=arndb.de=arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 085DFC00140
	for <soc@archiver.kernel.org>; Tue,  2 Aug 2022 09:44:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id C48EFC43470; Tue,  2 Aug 2022 09:44:36 +0000 (UTC)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 07DBDC433D6;
	Tue,  2 Aug 2022 09:44:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 07DBDC433D6
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=arndb.de
Received: from mail-ed1-f41.google.com ([209.85.208.41]) by
 mrelayeu.kundenserver.de (mreue109 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1Mnac7-1nc1af3P9h-00jdlK; Tue, 02 Aug 2022 11:44:32 +0200
Received: by mail-ed1-f41.google.com with SMTP id p5so16857493edi.12;
        Tue, 02 Aug 2022 02:44:32 -0700 (PDT)
X-Gm-Message-State: ACgBeo3Zmavs/rzAnpNZY/jUIOFo2U4V81OueOX+OfoQXMbfE0/euLBB
	T4XHQfkNjAN5wqwbSZLNX1cyUAKOHY1TiIRqY+E=
X-Google-Smtp-Source: AA6agR5nyzdX8IbHsNPScb74HatdyJTovCmzu8DEh/pFcD3bW6ovAqRjoT3lZ2cQp4Zvm04iz5zqjb0cuDwEHwyUgAU=
X-Received: by 2002:a05:6402:100c:b0:43d:9009:c705 with SMTP id
 c12-20020a056402100c00b0043d9009c705mr10098254edu.49.1659433472407; Tue, 02
 Aug 2022 02:44:32 -0700 (PDT)
MIME-Version: 1.0
References: <20220720230140.2113129-1-bjorn.andersson@linaro.org> <CAOCOHw5vj7WExi2opJ+ZvxLroq9UScHMMTuyyysMs3zJEfxgEQ@mail.gmail.com>
In-Reply-To: <CAOCOHw5vj7WExi2opJ+ZvxLroq9UScHMMTuyyysMs3zJEfxgEQ@mail.gmail.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Tue, 2 Aug 2022 11:44:16 +0200
X-Gmail-Original-Message-ID: <CAK8P3a2KeNRSfVdd8F5cVp4oU+K+Nwo0bVx_kEVHXEx_0AkZAQ@mail.gmail.com>
Message-ID: <CAK8P3a2KeNRSfVdd8F5cVp4oU+K+Nwo0bVx_kEVHXEx_0AkZAQ@mail.gmail.com>
Subject: Re: [GIT PULL] Qualcomm ARM64 defconfig more updates for v5.20
To: Bjorn Andersson <bjorn.andersson@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: arm-soc <arm@kernel.org>, SoC Team <soc@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	linux-arm-msm <linux-arm-msm@vger.kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, Andy Gross <agross@kernel.org>, 
	Olof Johansson <olof@lixom.net>, Kevin Hilman <khilman@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:ZfhVgCUxbz7Gjb3a9M0v8acZydTAEBBAJWrgo97hK5H6nZ2W1J5
 Gtf0+XFg6rk+7YIjvCOtXfLw0sOdDAVYw6OJuRgbDRZdh9zKsKm25goxtuddmU68VOj4znQ
 lzTdWAo9lrHuwtivX9kqe5J/VHXA0HpFIkkgkf9cEGewRyLCatJ7mNeLoyF5oh5GGMBrMxC
 ePRMtorAfzJylNZxIy+7g==
X-UI-Out-Filterresults: notjunk:1;V03:K0:A903EWoSA+M=:jB6MYzrQd+py6XfcrW1kDx
 /vfqO4p/eseHnUwLt8pV7wYujO0X2xeuGd+dji0lDYlKpnAc3b0MnfemZfSNpnmWK5JBG1xen
 O/qW40w+NfD3zIOnZDLgk48xd7saoPp/1W+wvOKqHy/nbzNsPmL2SB6tG/fdYc7YW5zCyTqkc
 HSrb51HutgWPoX5g2w7PvsoMRChVaksCde4sdZqbE7QbRrEoSJ220XyBs+NFCg5S9SIpLx7FE
 LQwEcwMfFeAGYkX40p2HqcPB/4OI3kKFVwFnQW+sdUqwZG2g+orXybJpuxfuHTqx1RlI6evoi
 FNYrR4/q6GI3cLaC8i89Eh8EijKnMxJ6hOnnV/v8LFthT0DjCFsTClUHs0PaorVBEUYU81hRJ
 RpsXsE3UqN8OaZfUcKRFkTnitSzCrzhYWyL5ITIzcsFbcezb7gCi6AtcXWgRZpqEsUBuEzvGb
 bF0urRIOJj8hAPZnC0Ne4NgB/cMKG6i+Am2qctID/lVbzXsDj8dznYNUDKzoeyrniWJfZVw9T
 QxAxIb6pBIrMpAQ5tCHLC4o307RLY7/G826LACQ5nO4MiZwXpET5S85imLtAKyH8eTrQ2cV21
 0mZPVg/pkhPvI1UQfU671Q5Q3UkwezzZ2mgqvq0Fx0xrAWJrbqCpUCna0dlYiCCknSfhGNj1q
 3XCgBhUVobTyJokjbMPIPU4mwPygq6XI4az0ljsT/lDdQL7P5Ipip9Q8bejSf7uyN4j7Jq3DF
 oS8kFilLVQfX73KhvgxorHMv6VkA2gnjj6Xyhg==

On Mon, Aug 1, 2022 at 5:35 AM Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:
>
> On Wed, Jul 20, 2022 at 6:01 PM Bjorn Andersson
> <bjorn.andersson@linaro.org> wrote:
> >
>
> I don't seem to have received a response on this one, can you confirm
> if you were able to pick it up for v5.20?

Hi Bjorn,

sorry I missed sending out an email. For some reason the automatic notifications
don't work for some senders and I have to manually chase those up.

You can always see what I actually merged when looking at the
arch/arm/arm-soc-for-next-contents.txt file in my for-next branch, which is
also part of linux-next.

        Arnd
