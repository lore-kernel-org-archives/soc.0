Return-Path: <SRS0=AF9W=NK=arndb.de=arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4DD73C43216
	for <soc@archiver.kernel.org>; Thu, 19 Aug 2021 21:41:16 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 204AB60C3E; Thu, 19 Aug 2021 21:41:16 +0000 (UTC)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4609B60C40;
	Thu, 19 Aug 2021 21:41:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4609B60C40
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=arndb.de
Received: from mail-wr1-f52.google.com ([209.85.221.52]) by
 mrelayeu.kundenserver.de (mreue106 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1Mf0uq-1mikbr2wFW-00gbKC; Thu, 19 Aug 2021 23:41:13 +0200
Received: by mail-wr1-f52.google.com with SMTP id q6so11117083wrv.6;
        Thu, 19 Aug 2021 14:41:13 -0700 (PDT)
X-Gm-Message-State: AOAM531BZUndlP5ePuA5UIyHA3FQWxQ73Rjk2/Ef1bWrGV7ntIeS236m
	o6q+uDvYRs3SaMwsN2Ah8j9B3DtP6bAcEuyLekE=
X-Google-Smtp-Source: ABdhPJwgQXlZtd9aQGhUETRO3j8EuerYQ1TH+GOAUcV1c6qR7kBSbBDaUf/YOR2NNp44khyUSHmTwZDd2CaItxBz1bo=
X-Received: by 2002:adf:e107:: with SMTP id t7mr6159638wrz.165.1629409273404;
 Thu, 19 Aug 2021 14:41:13 -0700 (PDT)
MIME-Version: 1.0
References: <20210818204422.17919-1-krzysztof.kozlowski@canonical.com> <162938788185.467628.13192922419725983504.b4-ty@arndb.de>
In-Reply-To: <162938788185.467628.13192922419725983504.b4-ty@arndb.de>
From: Arnd Bergmann <arnd@arndb.de>
Date: Thu, 19 Aug 2021 23:40:57 +0200
X-Gmail-Original-Message-ID: <CAK8P3a1RO=PWUGi_aFA2rzn2119W-kX2kTOycEG6hoTqPBj7=Q@mail.gmail.com>
Message-ID: <CAK8P3a1RO=PWUGi_aFA2rzn2119W-kX2kTOycEG6hoTqPBj7=Q@mail.gmail.com>
Subject: Re: [PATCH][PULL/direct] ARM: s3c: delete unneed local variable "delay"
List-Id: <soc.lore.kernel.org>
To: arm-soc <arm@kernel.org>, SoC Team <soc@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>, Olof Johansson <olof@lixom.net>
Cc: Arnd Bergmann <arnd@arndb.de>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Jason Wang <wangborong@cdjrlc.com>, 
	"moderated list:ARM/SAMSUNG EXYNOS ARM ARCHITECTURES" <linux-samsung-soc@vger.kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:HV+6tnNijaBBwqq2afjLVWchM8R4xHm3GLsancukfY2qaJrhoqV
 n7BBl8oWOK9Fn1KNrMHGWuCdBxRMZBhIB0zTWShBxAaS/zTKD4tcUubMB2KP/7/GwQEk65b
 xsFQab53MyzmHQJysY7WXxbiDUTxOhfZlEn2Vl0kNuzC1kCYa7P5/y89ASnnu/jIt6qDkQt
 Wi2xKtr853NSeIV2uxU6Q==
X-UI-Out-Filterresults: notjunk:1;V03:K0:qxc0OZbknX0=:LokahhDbT4fzMFT6zJ30HD
 vpikC0FGZ5wHNOiVUjzKyfJn1W0riDy/omlbu+TUSF9FwYVjQGkz7LZJhdZfGdTVvBk1w9PZM
 gkxfpRSVzt49IlX5n7bAqndBMLblYy0IA55bL17gv6N2gHsqgX99pHIPVQeoWzwj3VztTGfFa
 8S7JvWVOFZTbWtHWkVUY9FwyS6OX/ASJC8lSlFbbZYTN8mHVouVSRY9jX7WbEWYjJD7Vt1hMr
 PWwUSEyUc0G7toeNjdWaigwgW3NxqPykKn/k2T629CMQdQr//7zBH9bEOgeHOM0T7a5pmxZ9Z
 lZDq1htutcxNxmvk+P6oHwzqZa0uWOBLHVHYB0re1FHh+jv9o6760FnsD24wlaeR8jsACsY3t
 XHY/6vh9TlX9As3b7b5DzyXLTDTyDlcJCTuGSlqCq7lZOUgilKEj46bTO33jCxTGd4uyt3prQ
 fteu/xFitaa0IbFZhl0PZ9hPEqsBfnLlX+mioTSyosQwllMWVnGwd6g+cEMqDY8Ub9kutdsm5
 tnuEN8L4mc+DHwWgwywdoGRPyRyywJ16O2xTw1L8hFRteGtMgNRrZylretqOz/gZsyoZ75I0r
 ClbZ1LKJpihHNWc6xtfBgzT5Fs4EKA7cOAfmt+P9fmpS3NdiOj4xQo0G8671WKMkbfyNnxCQd
 xS6gz3z1qsqDvm85sx41gtf1jx5IoVeUOG6RNxccXKqH9LZd2K48A2f0l4SvJDUXQfqFcq2yb
 BfjNBmHHfTDSHFmUyWEWssVChoauaCcAfrAEzeaJLw0A/bV4t4o1Wz5Y9lNQ8rfG0wYlS144c
 42pAn9HTo26wFrnvaPGwcbD4aT112P9Lba8wq85FJ2IyHNE8bfG+bbcQVlgInZg8v8otlNDVU
 dCqQFG05tkckk9lJEHHUeg7Y11xRli2YK0KkQOmzPQGlauNGKS7CFBpEp9ZmhQujsn4nSbRUp
 mMIGlSa8J7I+ljEVGT54hMfKlmVFxHkrO33e9Xjb5N/wrsUGgJlSN

On Thu, Aug 19, 2021 at 5:44 PM Arnd Bergmann <arnd@kernel.org> wrote:
>
> From: Arnd Bergmann <arnd@arndb.de>
>
> On Wed, 18 Aug 2021 22:44:22 +0200, Krzysztof Kozlowski wrote:
> > "delay" variable on line 79 can be deleted by returning "0" on line 88.
>
> Applied to for-next, thanks!
>
> [1/1] ARM: s3c: delete unneed local variable "delay"
>       commit: 319a1b58f6c7432345f13383b26c8c10e7eb1dda

I had accidentally added this to the arm/fixes branch at first, but corrected
that now and applied it to arm/soc instead, as you intended.

          Arnd
