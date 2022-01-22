Return-Path: <SRS0=Xi8I=SG=linaro.org=semen.protsenko@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF2C1C433F5
	for <soc@archiver.kernel.org>; Sat, 22 Jan 2022 12:38:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 9BA7CC340E0; Sat, 22 Jan 2022 12:38:22 +0000 (UTC)
Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com [209.85.222.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id E886AC004E1
	for <soc@kernel.org>; Sat, 22 Jan 2022 12:38:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org E886AC004E1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ua1-f44.google.com with SMTP id y4so21918361uad.1
        for <soc@kernel.org>; Sat, 22 Jan 2022 04:38:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=k4uslepZlx+doJxsNKmyezSBQMtw/R3k+N4S5l4lrBo=;
        b=BsOpApkNdWIaU/sRtOQjwh4eUZx+LBSaRTuxHUaQyNWCQyCl8bai1Wx1qwWnoNC27H
         UMptAV67VXy6USh28okTjWJFOwzkUvxxcLMSLabutXTFPFkNtnBbMa7eeEuwDF9073we
         fZ42v9DyP2u9LYxoNaoBkYFla0cFFWJTgKvbYKo6jtRIKNaRM4r9fnxMTi2N2LASC/k9
         X39719sqIGKXjMPBleMQhBU6ZNT6uQtRYekkR4ZsEjG8s5q28dme/sNuxTeRGLrTi/+J
         rYybXofWvCBIJpgUyR+L0PKRAlkQvadEp4ZKYSPYub9VCRQ08Tx0DtOa0OrsEetEIl6F
         +IBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=k4uslepZlx+doJxsNKmyezSBQMtw/R3k+N4S5l4lrBo=;
        b=Jf1yn3GPu3dft2eiwJv4UZ2FDiZ8cG6cQWFDwW9pXla6Z9u7Rw8W6AjNE/EdHMRT1x
         EgofdlN5w61p9C6B3YEBaf1PDHYtan/dX50amUXyq/4eRG6oBP7hAVC+XX7iAQ/sS+Rp
         rkGbNHZpyzm0Hmc1I8EUT+CGdYZWhV2a5cjJTKLUh/D4zbZldWVFfAodJdAzRXRaapAw
         2uDmGw6RznYTzelTZoyGFbyb+7rfkbVuLhkrX9u+PwexfN88AJdhJKWGXsDNU9HLcF6T
         H8Qy+z51mw3yOWg9xrrqRmvL6YMACDjs3WEmZsHqjXALdnubm95iIjQhdFTNBtVnOZop
         K7sg==
X-Gm-Message-State: AOAM532SV22IXH0d0ZNLGUCMb3QidsyQcfjFn63TSA5kRcxtpQEavL8+
	nkSR9oAPsUcK5/q29nklax69LCPSG2YW2Kzj9Z4o0w==
X-Google-Smtp-Source: ABdhPJxAkMtrFRW4Pnd6Ntwnglxpjg12Vi1yx2PNmdt/WUzgwtaT1gqfGWUrAGaiAKvIFUvMWfcsFCo1mDlwWWDzqJ0=
X-Received: by 2002:a67:c093:: with SMTP id x19mr1768383vsi.20.1642855099794;
 Sat, 22 Jan 2022 04:38:19 -0800 (PST)
MIME-Version: 1.0
References: <20211227112959.7325-1-krzysztof.kozlowski@canonical.com>
 <CAPLW+4n-1H5Yu3wQaus-UJ_VW_TjHrNUHaPCGCMURXg8EqxjyA@mail.gmail.com>
 <CAK8P3a1ou-ZdrXN0MHQoJ+gGbvhXT-e2qt96_f9M8VwrdX0pAg@mail.gmail.com> <CAOesGMgF3S5_XsWjEqq=-zfYXwOWFpFNA6afL81wceRUA_0FeQ@mail.gmail.com>
In-Reply-To: <CAOesGMgF3S5_XsWjEqq=-zfYXwOWFpFNA6afL81wceRUA_0FeQ@mail.gmail.com>
From: Sam Protsenko <semen.protsenko@linaro.org>
Date: Sat, 22 Jan 2022 14:38:08 +0200
Message-ID: <CAPLW+4k8=ymx56R7bKOt8kMVG_uUgrTsCkVd5wiY_rkYq8dYbQ@mail.gmail.com>
Subject: Re: [GIT PULL] arm64: dts: samsung: Second pull for v5.17
To: Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>
List-Id: <soc.lore.kernel.org>
Cc: arm-soc <arm@kernel.org>, SoC Team <soc@kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	"moderated list:ARM/SAMSUNG EXYNOS ARM ARCHITECTURES" <linux-samsung-soc@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, 19 Jan 2022 at 18:53, Olof Johansson <olof@lixom.net> wrote:
>
> On Wed, Jan 19, 2022 at 8:07 AM Arnd Bergmann <arnd@arndb.de> wrote:
> >
> > On Wed, Jan 19, 2022 at 4:11 PM Sam Protsenko
> > <semen.protsenko@linaro.org> wrote:
> > > On Mon, 27 Dec 2021 at 13:30, Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com> wrote:
> > >
> > > Hi Olof, Arnd,
> > >
> > > Just want to check if it's possible for those patches to be applied in
> > > v5.17? Sorry for the noise, but that's important to me.
> >
> > I can see that Olof merged merged this into the "arm/late" branch in
> > the soc tree,
> > so I assume he still plans to send it in the next few days.
>
> Yep, will be sent up today most likely.
>

Thanks for detailed answer! Glad to hear it's still a possibility.
Please let me know if you need any actions on my side (like rebasing,
etc).

> > With the timing over Christmas, I sent out the large bulk of the
> > contents (anything
> > I merged before Dec 23) last year, and Linus already merged it, the rest ended
> > up in the "late" branch.
> >
> > As usual, there is no guarantee that late changes make it in, but I have seen
> > no indication of any problems so far.
>
> Correct. Been sitting on it for a while in case there were fixes
> coming in for the first pieces that got merged, but in traditional
> fashion I'm guessing those will start to show up a few days after the
> late branch gets merged. :)
>
>
> -Olof
