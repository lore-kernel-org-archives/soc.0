Return-Path: <SRS0=vF0h=SD=arndb.de=arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD437C433EF
	for <soc@archiver.kernel.org>; Wed, 19 Jan 2022 16:07:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 7BBEEC340E1; Wed, 19 Jan 2022 16:07:13 +0000 (UTC)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 1E08EC004E1;
	Wed, 19 Jan 2022 16:07:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 1E08EC004E1
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=arndb.de
Received: from mail-ot1-f45.google.com ([209.85.210.45]) by
 mrelayeu.kundenserver.de (mreue010 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1MekrN-1mcWhE3MkX-00anKd; Wed, 19 Jan 2022 17:07:10 +0100
Received: by mail-ot1-f45.google.com with SMTP id l64-20020a9d1b46000000b005983a0a8aaaso3723344otl.3;
        Wed, 19 Jan 2022 08:07:09 -0800 (PST)
X-Gm-Message-State: AOAM533HPzn7QusaKnwTdxgnLTf3OSLOoKkA/SZaiMuLuCBwGxruK96g
	7Or0DvZvB2WqwOtUnEYZG8eqrsZnH7/raBqsBJg=
X-Google-Smtp-Source: ABdhPJwYmjzUwr3LqMDlVmKxu2P94HWVRZ2m5aOzrrEpILDroO2fGK4U5w+vgoOvlKMup1bpupuBPszbhpm3gtVSmXc=
X-Received: by 2002:a05:6830:2095:: with SMTP id y21mr22337764otq.368.1642608428193;
 Wed, 19 Jan 2022 08:07:08 -0800 (PST)
MIME-Version: 1.0
References: <20211227112959.7325-1-krzysztof.kozlowski@canonical.com> <CAPLW+4n-1H5Yu3wQaus-UJ_VW_TjHrNUHaPCGCMURXg8EqxjyA@mail.gmail.com>
In-Reply-To: <CAPLW+4n-1H5Yu3wQaus-UJ_VW_TjHrNUHaPCGCMURXg8EqxjyA@mail.gmail.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Wed, 19 Jan 2022 17:06:51 +0100
X-Gmail-Original-Message-ID: <CAK8P3a1ou-ZdrXN0MHQoJ+gGbvhXT-e2qt96_f9M8VwrdX0pAg@mail.gmail.com>
Message-ID: <CAK8P3a1ou-ZdrXN0MHQoJ+gGbvhXT-e2qt96_f9M8VwrdX0pAg@mail.gmail.com>
Subject: Re: [GIT PULL] arm64: dts: samsung: Second pull for v5.17
To: Sam Protsenko <semen.protsenko@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, arm-soc <arm@kernel.org>, 
	SoC Team <soc@kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	"moderated list:ARM/SAMSUNG EXYNOS ARM ARCHITECTURES" <linux-samsung-soc@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:nF1mO/GhNWX+EFxA0kxOuubamUt+3MoQ+Z5+77ugPocO5+hZh2F
 JhorqTkrAERH4Qv4aJsh+lUi+CJ+NzeNRQNv44nx6RLqDqXdKP5+VI2xZjyD8dwQPSGW6RJ
 B9h50qnqFNFHI5W10ZZ5nEA8aOQy6+gikbQBY96e0TSQxC9sNGnxoDNpBJaDxfKj5oxcPda
 oxX9q0wtXDxA65ntE6obw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:91750aXJRH8=:aU/YbCElTMh1asUkBOIgYa
 02DFvQr/NSwRidg4AcadoCesOZNj2QY3mlprq7Aj1wxh7U/k2CFS7suKh11+GrT8gNpOUR9vJ
 EeMCH60fGxlUvV5oAwvQGhPqwDt/anb4Sdc/tIeXnKpbI9jNVPjbQy+8nlyWz0XRjBpIW/zzl
 eoyNExIOv02SAQmL2xYVTJSd+zecl5ycXIrEJKuBPsfqDBccYWscQTeFEg6X/UYGvHR05TJMA
 l49Exv48/K/E6k8wHP259mWQrq0rX5I6G33nlLR2R0yIrCasQG0MW+ev2nipHPO+OaPGVKFY7
 cJCX0+wcS4WWbQUOVEXRg1CzFpxRhdoVdTHhCe3awlYrdZnVWj0ErXMXN6967HBbXbCHWNSyU
 5h4P1VGIM3AFa9IJgrE/duP+83xrRYQXj9lOuYUx+x1+qW0gx0+lq1c0x0HDWl/0XY9r/vb0A
 fJd9ih2EPq7/luOe7FHMx2ULCJEzvyzyqKwuLMFTm2O/R3b2W+6X7rvqsgxTBBFJzznHJ9x4z
 MvGvJtXB1TCAZ5jykXw/OHhB9ZpvbgKUB/8YXc6UDfAxEM3QNv4txeULgoe9HMkgc9HvcQMUP
 hxMULncT6V2p2hfSdQJUZUwYq/SNTKSukzyPpGHl5Eu/HkuAsV4nFvVpG3bUN3mfflisNVXrD
 7CiEkbmOMTtNn5JJtleFS8ViwZftE4aRvCgQ1it0xW1jFDmTTsQvoIVX+/u0GZ6lr/k0=

On Wed, Jan 19, 2022 at 4:11 PM Sam Protsenko
<semen.protsenko@linaro.org> wrote:
> On Mon, 27 Dec 2021 at 13:30, Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com> wrote:
>
> Hi Olof, Arnd,
>
> Just want to check if it's possible for those patches to be applied in
> v5.17? Sorry for the noise, but that's important to me.

I can see that Olof merged merged this into the "arm/late" branch in
the soc tree,
so I assume he still plans to send it in the next few days.

With the timing over Christmas, I sent out the large bulk of the
contents (anything
I merged before Dec 23) last year, and Linus already merged it, the rest ended
up in the "late" branch.

As usual, there is no guarantee that late changes make it in, but I have seen
no indication of any problems so far.

      Arnd
