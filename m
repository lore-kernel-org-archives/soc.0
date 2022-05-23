Return-Path: <SRS0=4JMP=V7=arndb.de=arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FDDFC433F5
	for <soc@archiver.kernel.org>; Mon, 23 May 2022 12:55:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 383EBC385AA; Mon, 23 May 2022 12:55:17 +0000 (UTC)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id D1A21C385A9;
	Mon, 23 May 2022 12:55:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org D1A21C385A9
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=arndb.de
Received: from mail-ot1-f51.google.com ([209.85.210.51]) by
 mrelayeu.kundenserver.de (mreue108 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1MYvPq-1oO2Wv2L8y-00UsTh; Mon, 23 May 2022 14:55:13 +0200
Received: by mail-ot1-f51.google.com with SMTP id g13-20020a9d6b0d000000b0060b13026e0dso2021299otp.8;
        Mon, 23 May 2022 05:55:13 -0700 (PDT)
X-Gm-Message-State: AOAM530iyN43xUOLj85I4HD9whmAd5xTyRwNxhTDjWfAj71dN8kq0uCh
	ppXKZS4qTZIJ9y5sLGODCUVYCDCAj0JHklQwhGY=
X-Google-Smtp-Source: ABdhPJz25Gt24MhXl+E72qufCOdw4x39awhhvsl+Xnqa65r2iahWrusogj8vUUSxWLBZ/N0deY8KYQbSs9eoO99jFuc=
X-Received: by 2002:a05:6902:1143:b0:64f:9ab6:691e with SMTP id
 p3-20020a056902114300b0064f9ab6691emr8642845ybu.480.1653303099023; Mon, 23
 May 2022 03:51:39 -0700 (PDT)
MIME-Version: 1.0
References: <20220516163310.44842-1-nick.hawkins@hpe.com> <CAK8P3a0914=TM9f1CNcg_PXfHvt6nHDPyrvLp=0KO4hZM2GT5w@mail.gmail.com>
 <DM4PR84MB192761B3970E4934D059C3F188D19@DM4PR84MB1927.NAMPRD84.PROD.OUTLOOK.COM>
In-Reply-To: <DM4PR84MB192761B3970E4934D059C3F188D19@DM4PR84MB1927.NAMPRD84.PROD.OUTLOOK.COM>
From: Arnd Bergmann <arnd@arndb.de>
Date: Mon, 23 May 2022 12:51:22 +0200
X-Gmail-Original-Message-ID: <CAK8P3a1Pvn46kMoAv+HtRAOGDYcL76jPN2Wk-MqyJSPm--0sGQ@mail.gmail.com>
Message-ID: <CAK8P3a1Pvn46kMoAv+HtRAOGDYcL76jPN2Wk-MqyJSPm--0sGQ@mail.gmail.com>
Subject: Re: [PATCH v8 0/8] Introduce HPE GXP Architecture
To: "Hawkins, Nick" <nick.hawkins@hpe.com>
List-Id: <soc.lore.kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, "Verdun, Jean-Marie" <verdun@hpe.com>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Russell King - ARM Linux <linux@armlinux.org.uk>, Olof Johansson <olof@lixom.net>, SoC Team <soc@kernel.org>, 
	Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, 
	DTML <devicetree@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	LINUXWATCHDOG <linux-watchdog@vger.kernel.org>, Joel Stanley <joel@jms.id.au>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:TY0yM949mhFLwqWsEhXjgkNozW7uZOgMzhplLUxeV3Udz7ewmOZ
 WSg+B2VyI0KPLp/mYg9/BAXy8D3dURjfY/psksC1/oc4zqGw7qyGmgjdmw1lazqU3GciQ/4
 cfbTmSZxTy/XYJMO325Xs/nMZL125A8K9hOP7MCY1dDfRhWWxbTZ6j3Q+ZBazLHoZeKqln6
 t9yoaCANC/ptKlcec6Uug==
X-UI-Out-Filterresults: notjunk:1;V03:K0:VsWZU76us7o=:SDNzjVL9cTaOC5biOO3h2X
 pyxBAHAcnqTpyhOXmeUR2GuhAKR6Eo6LpqML023puzs2gu8x4WVrzVDSnIwn7xRhzlODSakLU
 8UcTjJl5vCY6FJzrExuijHEr4vjd1OqXpO6oib9C+gHhMRvyXfoExY3jgUZCnv1QFT1v+Mohf
 uIHFf76WnTd0YLa8g2VM0K/XLbSuGD1TvIxMI9zZq6iuXnwbKrm7+LSs8TukiM9RihAU0wTW6
 68tKkvA7SCLMsSlkVZFnmh3RO77Ar9N9OxRTlpQN+jNLsngATAcWfvx2CbWkS62c+NJ1j68Vs
 C044zmb9K2m5wx1yJLorNasWeZma7PCfzhiZRWiNaU+9dUsQu56WgWH47X05j+Qb+nV5Cq+pY
 oKTFWRqKz4bU/CUARhy8QqoeponVdK3C+wTVXGtwm2fMgfZGz0Lj74NaRrmyuXT2sfQTrqAB0
 JGk8UoUK2PTDigZldSDicTxnNVOgIp6XXAmpHE6MfYxq2rTV+6vdHdAcKBslbEOlmEXxG1Ppm
 ji+oq2l7vrHz1TLR7CSZKIBrzqqI4W8ZZRtWJek/IVgRo5KZri8a8vOoGpwVTajfGZ9QrAm4M
 //T6JN8lbYNyj4bthK0qybHwLW7+2qui8cLhjQxhyqVzml5iYgtrboFY76Rv9Qv2iWoVH7Mpe
 7c+rgTFFu6hCTdBD0vKdFYAUvHYAbYbvgSXi+V2QmIkaxhyUIDTOhB20MIv0OrJmMWyzrtgnM
 NljGYVJHVjNsSOvxXAYmO4QBTKZ2tPWAzZ1zzbHVmYh/NXi3S4MvE/AzWfFuE51llDPnPl5NI
 8wo/4wiZaqUS86hWgcKPDYnaRoWU4+t6edEZQuUdfR73wdaJvaWSt3hyO9FPQuTMFBBNHuNfn
 muBIT8JORCXvj4T1EU3g==

On Wed, May 18, 2022 at 3:12 PM Hawkins, Nick <nick.hawkins@hpe.com> wrote:
>
> We have a talk planned for the North America Open Source Summit (June 20-24)
> and it would be great if this patch set could be in Linux by then. If it is not possible
> we can handle that.

That's a good enough reason for me, I'll see what I can do, and will
keep it in the
arm/late branch until next week. If everything goes well with the soc
tree and your
patches, I'll send it on then, otherwise it will have to wait a release.

      Arnd
