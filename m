Return-Path: <SRS0=d6TJ=O3=arndb.de=arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 798D4C433F5
	for <soc@archiver.kernel.org>; Thu,  7 Oct 2021 13:19:43 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 5233F611C1; Thu,  7 Oct 2021 13:19:43 +0000 (UTC)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 81C0760F9D;
	Thu,  7 Oct 2021 13:19:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 81C0760F9D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=arndb.de
Received: from mail-wr1-f48.google.com ([209.85.221.48]) by
 mrelayeu.kundenserver.de (mreue010 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1M6UuX-1mS8dL0xk9-006w5A; Thu, 07 Oct 2021 15:14:38 +0200
Received: by mail-wr1-f48.google.com with SMTP id v17so18966242wrv.9;
        Thu, 07 Oct 2021 06:14:38 -0700 (PDT)
X-Gm-Message-State: AOAM533sfYW7mUSRYv4EIxJNT5XTgF6mLWgHEPSJtt4VAHqPFjpoOpDl
	Md3lp7umcMRvOWMQJ1PsC6uoCgEPcjiRpAgWLas=
X-Google-Smtp-Source: ABdhPJxlorxaf1Zgj5Rs+eFsSNCfJHstb4n53ThIOsns1KYcxF/bXpbsGzOdHOqKwYnWgIneWV4ZKX7ki2fMu7OD7KY=
X-Received: by 2002:adf:b1c4:: with SMTP id r4mr5369225wra.428.1633612477750;
 Thu, 07 Oct 2021 06:14:37 -0700 (PDT)
MIME-Version: 1.0
References: <20210821030519.127-1-yuzenghui@huawei.com> <39c2b2f9-4de2-8e7d-2135-96f1dab750e0@canonical.com>
 <5991e347-18f0-30cd-58b9-9e3276bd98bd@huawei.com> <YV7HGniKSKe7nXp/@arm.com> <1ebc899f-b7d7-fff4-9204-a0edd2be4387@huawei.com>
In-Reply-To: <1ebc899f-b7d7-fff4-9204-a0edd2be4387@huawei.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Thu, 7 Oct 2021 15:14:21 +0200
X-Gmail-Original-Message-ID: <CAK8P3a30pdkERK2CREDmpVDtL9+mVBU3iok8DkNoayOTSE9yFQ@mail.gmail.com>
Message-ID: <CAK8P3a30pdkERK2CREDmpVDtL9+mVBU3iok8DkNoayOTSE9yFQ@mail.gmail.com>
Subject: Re: [PATCH] arm64: defconfig: drop obsolete ARCH_* configs
To: Zenghui Yu <yuzenghui@huawei.com>
List-Id: <soc.lore.kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, SoC Team <soc@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Will Deacon <will@kernel.org>, 
	wanghaibin.wang@huawei.com, Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:nQIvAus8rehwUGzeV/T5PrQXpYZgRyQy+kZ8hP6/P22yzW32/bz
 4ssRtoIX7Y4tYz4YOAhH7OATc9LYkiHZ/ukZ2XmwWASA3sgmJHZ4K7UI0SmYrqSEgOWXgHY
 pB118YehoWl4y0Coz1c6okP+lqo8PniIH6Cbu9bU4lV3wMqgGXt5M52agp0uURdSdRSgANU
 Yt8f4QUy9Up3ibKpJ9KRg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:b9ATAa75N1I=:DBs6tmQLqkeG8M0K1pYMz0
 a6dYb3FRbnyshzSNdycBeRr1yNqGUbnxksn2P/ldS1h7SPBBLGJH4kILfPw6RfcSzd1b2NKdY
 hc1165/wTsTFCRL9osgxIbQp9vzFGsCJpkXuT5N7SkXui7UrRXTmjHy9vne5CxPzt4Bce7PAe
 mxEkdKhkq72vOhvZW4z9HsLmV7p3yqarj18pEUA0lpfEfoWa0fWzWnyY0H7gVYqi6m16FKQe4
 uIkDYUMFLL5viGr0wEB51g9Du+CIUt2fQT4yenoxjMSHOO0tV3mG5rF873zWwxfR7Hn3d5sZJ
 nS2zGNRID1yu1Z8hhHnApOGQIOdrhhVHiEc+3RL9pBU1TGs1ZJgsJ2Yp1IR8qpgjc2oz+OJ2X
 e/N6uT5j80iThQSTKk8bby96zMgWmfxxBEpuNgXIujReMHammUS7jEEqBTOE+h9UnYF84UQyw
 oqnFlMnenXV5GhRsDGfdj8582u5k09fou+N6oTP0WJKWsMCUW9baAoVxzZCS3rwWXPUUvtu9+
 E+V0halvuka3yrOBt+fendyxnU0GpfKE+nXJniace/rndavug10PvNrgQcB9kSjaYptJfxnRm
 J43418iGZWLOF+/wtGam42B/Ebb/aV7ajviGmnRw5nHOU71fz8wbyqfmhAGswZM6TI0yXcEjv
 4pk/n2Hanhq9kdj8pPtidvs0VPEdVS3Zn6o7k3mOjGob2t77yzFoIUKQta2lPxfquinkOIYkE
 ad3WTT/3db6r/gcnPlidx9cGYQRyMxtEbK7knM04YRN1hmKeeN5iGPeslEKEOtyoPC/jtJmtw
 RpDebaVh3oROYrNdcb7HD923a0NND/zHnK8P/HuoXGJcAjhq3yRQ03Ck9WQLIUEd5Y9HjsNZz
 bMbVphO95vlfSzYpVx0w==
Message-ID: <20211007131421.TZcIhPQDGBs4ZPh0iW_DT3UHSPuOoah9xVhJY9cRXc0@z>

On Thu, Oct 7, 2021 at 12:24 PM Zenghui Yu <yuzenghui@huawei.com> wrote:
>
> On 2021/10/7 18:08, Catalin Marinas wrote:
> > On Thu, Oct 07, 2021 at 05:42:46PM +0800, Zenghui Yu wrote:
> >> On 2021/8/23 21:01, Krzysztof Kozlowski wrote:
> >>> On 21/08/2021 05:05, Zenghui Yu wrote:
> >>>> Per commit 4a9a1a5602d8 ("arm64: socfpga: merge Agilex and N5X into
> >>>> ARCH_INTEL_SOCFPGA") and commit 89d4f98ae90d ("ARM: remove zte zx
> >>>> platform"), they can be dropped from defconfig now.
> >>>>
> >>>> Cc: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> >>>> Cc: Arnd Bergmann <arnd@arndb.de>
> >>>> Signed-off-by: Zenghui Yu <yuzenghui@huawei.com>
> >>>> ---
> >>>>  arch/arm64/configs/defconfig | 3 ---
> >>>>  1 file changed, 3 deletions(-)
> >>>
> >>> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> >>
> >> I have no idea about which tree should this patch go via, so a gentle
> >> ping here. I've verified that this can still be applied cleanly on top
> >> of today's -next.
> >
> > Usually defconfig changes go in via the arm-soc tree rather than the
> > arm64 one.
>
> Thanks for the pointer!
>
> [+ soc@kernel.org]

Applied to the arm/defconfig branch for 5.16, thanks!

        Arnd
