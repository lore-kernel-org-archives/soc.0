Return-Path: <SRS0=xyye=XL=arndb.de=arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E13BCCA480
	for <soc@archiver.kernel.org>; Wed,  6 Jul 2022 20:36:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id B85C1C341CD; Wed,  6 Jul 2022 20:36:47 +0000 (UTC)
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 26EE7C3411C;
	Wed,  6 Jul 2022 20:36:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 26EE7C3411C
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=arndb.de
Received: from mail-yb1-f177.google.com ([209.85.219.177]) by
 mrelayeu.kundenserver.de (mreue106 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1N5W0q-1nY5dx2rwg-016xKI; Wed, 06 Jul 2022 22:36:43 +0200
Received: by mail-yb1-f177.google.com with SMTP id j7so22849710ybj.10;
        Wed, 06 Jul 2022 13:36:43 -0700 (PDT)
X-Gm-Message-State: AJIora+OkHtekQ192pog1In4ekB4LwUifWfWu3EF+alUOwjDYcMBb8IP
	vfBVJnRlrjp7hZq7IVk4NFgJY3QlRSCibxwoIbs=
X-Google-Smtp-Source: AGRyM1sqECDY6Ty2JVXKP7IDdD1y1TQ6Py0CtljndDWu3dH5J2zxLu0EXVa9MU25ZG+FhT8oJ3JCsFYoCYm6EiiYqo0=
X-Received: by 2002:a5b:b47:0:b0:66e:3617:d262 with SMTP id
 b7-20020a5b0b47000000b0066e3617d262mr23033810ybr.106.1657139802201; Wed, 06
 Jul 2022 13:36:42 -0700 (PDT)
MIME-Version: 1.0
References: <20220706163754.33064-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220706163754.33064-1-krzysztof.kozlowski@linaro.org>
From: Arnd Bergmann <arnd@arndb.de>
Date: Wed, 6 Jul 2022 22:36:25 +0200
X-Gmail-Original-Message-ID: <CAK8P3a3rwOBA=Pp+jin7PF4YifoihEyGAUsfuyBy1jFBnhPakg@mail.gmail.com>
Message-ID: <CAK8P3a3rwOBA=Pp+jin7PF4YifoihEyGAUsfuyBy1jFBnhPakg@mail.gmail.com>
Subject: Re: [GIT PULL 1/2] arm64: dts: cleanup for v5.20, second round
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, arm-soc <arm@kernel.org>, 
	SoC Team <soc@kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	"moderated list:ARM/SAMSUNG EXYNOS ARM ARCHITECTURES" <linux-samsung-soc@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Krzysztof Kozlowski <krzk@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:twtEqaD130w49Uw9ntDBfIaOsYvJd6+IJ3QVK4AT8zQKjTvrQ+m
 eee0vEgcl+4isdeBVIrPXn6ozAebEZKgSe+3z5aNTdSQ0LzBAB87AQFLFXsCNs4cO5bLA02
 6yKFQfSzqgtn/1XSNLvc/NNOtoCLJe358xU2XbWOWLbipxKR5HUxjV+znJ9anVq4A9sFR3T
 vDIJ79uBsovFJRLerU5OA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:4grmPQ3cJ9M=:oaPvbUtruE+hWSn9+jKLQw
 zyTCq2Og/6/Fv5CkeHGqL3zhAXtg3rRvlp0Yg/XG+e7oQuxqd8OxZgi5baSYo8YyUB09r9QeZ
 TFBfqIAxQfBC5N8QsIpKIDqx1uJD8FSsB78O4Waeemc1gHbIS4gGmMORoTQuzxpwFhbIHLa/K
 1WwGZ2HYm2kDkkZmIqaw0Lr6vrzTYI1/SFpqvJWoutKOgWGNQB85/21zhuHaiHP+w10xhIFiW
 bX9+UXKnzE8gm2U0qgtkJ4i0U79hkqGdn68Am6W6JeDCzrXkQI1Aa60fpUQcbfpyPo8gVl8Jd
 X2EfXsI40r/A0nK/WcKIDTmHmNmfS0hSNCLS9Y1mSCXmjGhRsLRZE2IKoCv0eA0gpS+7TiWM3
 GAMZ90KtMOna2n8srFy6kVzURHOrAfLFi59n/c3D21IHnlq30OVTnNUCmEStBzY460nVW3VTM
 wGJc+vQjGOu3nTzgm+ocK8FYsRR30RwCBz1/VCxt5GYHerPPrqg0KvQj2Sd6/WCLEVN38oVBD
 wJO3ujcwUkob39FYzZTFECqqYf7T7DPme3kbkIqJKPmoX2+DmDq/tWF1bFUMOS9ufqsvp6TQM
 RrovY1dK/y1CD55bv7/reUZq0Ng/TCduhTqctOIj7L8/6cbyVueyrrYZq++BvTOXytm+hGis7
 RDZKYQOshNLsy5BC5VGB2En7z/PQNK3p6WjE2kbWFi6aI2YHvdRpB7DFGJZnvfbmGWu5Zvvq7
 IxJ2kZNQ/e0spVfuTIQkwt9CyBk+IgEUx3D+Kg==

On Wed, Jul 6, 2022 at 6:37 PM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> Hi,
>
> This should conclude my cleanup session for ARM/ARM64.
>
> On top of previous pull request.

Pulled both, thanks!

        Arnd
