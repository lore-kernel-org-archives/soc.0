Return-Path: <SRS0=GX8l=SD=lixom.net=olof@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56F86C433FE
	for <soc@archiver.kernel.org>; Wed, 19 Jan 2022 19:43:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 2BD9FC004E1; Wed, 19 Jan 2022 19:43:42 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 330C5C340E3
	for <soc@kernel.org>; Wed, 19 Jan 2022 19:43:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 330C5C340E3
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=lixom.net
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=lixom.net
Received: by mail-pl1-f175.google.com with SMTP id d7so3158561plr.12
        for <soc@kernel.org>; Wed, 19 Jan 2022 11:43:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lixom-net.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=2JxLZ3v4Bv8bpwHY46hEuPtIdRIXaUCCMTr9cL9Lo5Y=;
        b=nr/v7Bo98eaUcUQlYthkka1KhZlp1Ut7bIDqOHADDCwAs/NYO/PVuJCoawnGAiknTO
         5Jv2cD0EOg4fYZmS2HjiPFvpq+uyAPHyBvIXV/mhsHb7FRwH/siAKDtGVjYEl8f86oGQ
         HvKQo2qtWrxEmlPjwgrrn3iDMbmTUqwKifIHUPxcYsMl/BTDZTY2Ev0t5n5NM5G9aPp6
         gRVFwE5XuUxm/vTIw1yQpHfaYimX+8kYiarmziRxG3O6dnniK+gdLhfQtMdHUkDP+HGx
         AL6YkvxFK4wf3lNdSgMBH6GnCt2MsAjCJA+Bsi/zeO5tBtKPJi+AFjcEiVjBL+a1GSh3
         seEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2JxLZ3v4Bv8bpwHY46hEuPtIdRIXaUCCMTr9cL9Lo5Y=;
        b=oyhifFc8+FZMkxyB4koQzBi2gEtRWRk+GOq0VSjdmsNl/5JqY1cEdaNZNe1ExVSzFx
         MTLzUHhWikvK1XoIb/2+37vTBIJMHBnL6aWpbD5yw6LRu2O2kct39xEUq2oThLGddjgS
         AfnxtkA4v/8sVZ0VMt4X6p9IV3YRs0wzXluKEgP8axRVhirCXKOoFR+BTsWziBv0JOXe
         k9D+ukfeC0VftXPBzhifUJCXP6vL6NSNJ9C5W6Jo23/d/2LFoBLLHzjHftdxN6O7D5s3
         x6HAGAxDyaO1PsBbg/mc4x62gHFdEr00BUy6Ze2i4+RbKd21tyYn7WENg16mG3TXSjMm
         iing==
X-Gm-Message-State: AOAM532trYlxvskdesj17ZEHtgo20E8V/LyvpbTsC1Hr6dXh9JLuLFwo
	XW1bVSBOssleNmbAroeAqdAqovPXdgyQAzk1D7jqRg==
X-Google-Smtp-Source: ABdhPJzXe7dJBFGrUenkqyUD6H0dibuwp58ksM51ItRoH4Zy7bxRPIQnoXriKBjPW4d8ewisdP6mPWQrBBWm0Ma26FY=
X-Received: by 2002:a17:902:b947:b0:14a:a6aa:4fa6 with SMTP id
 h7-20020a170902b94700b0014aa6aa4fa6mr21067587pls.149.1642621420467; Wed, 19
 Jan 2022 11:43:40 -0800 (PST)
MIME-Version: 1.0
References: <20211227112959.7325-1-krzysztof.kozlowski@canonical.com>
 <CAPLW+4n-1H5Yu3wQaus-UJ_VW_TjHrNUHaPCGCMURXg8EqxjyA@mail.gmail.com>
 <CAK8P3a1ou-ZdrXN0MHQoJ+gGbvhXT-e2qt96_f9M8VwrdX0pAg@mail.gmail.com>
 <CAOesGMgF3S5_XsWjEqq=-zfYXwOWFpFNA6afL81wceRUA_0FeQ@mail.gmail.com> <CA+Eumj5sosSkCCANOVqN8fVUDFaSNtB7+f95o+FAp7w6rM4A=A@mail.gmail.com>
In-Reply-To: <CA+Eumj5sosSkCCANOVqN8fVUDFaSNtB7+f95o+FAp7w6rM4A=A@mail.gmail.com>
From: Olof Johansson <olof@lixom.net>
Date: Wed, 19 Jan 2022 11:43:29 -0800
Message-ID: <CAOesGMiDqBPeNp8u_V0P6z0q+sHWhzwr+FbXrzXCRjnKu59TdQ@mail.gmail.com>
Subject: Re: [GIT PULL] arm64: dts: samsung: Second pull for v5.17
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
List-Id: <soc.lore.kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Sam Protsenko <semen.protsenko@linaro.org>, arm-soc <arm@kernel.org>, 
	SoC Team <soc@kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	"moderated list:ARM/SAMSUNG EXYNOS ARM ARCHITECTURES" <linux-samsung-soc@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, Jan 19, 2022 at 9:01 AM Krzysztof Kozlowski
<krzysztof.kozlowski@canonical.com> wrote:
>
> On Wed, 19 Jan 2022 at 17:53, Olof Johansson <olof@lixom.net> wrote:
> >
> > On Wed, Jan 19, 2022 at 8:07 AM Arnd Bergmann <arnd@arndb.de> wrote:
> > >
> > > On Wed, Jan 19, 2022 at 4:11 PM Sam Protsenko
> > > <semen.protsenko@linaro.org> wrote:
> > > > On Mon, 27 Dec 2021 at 13:30, Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com> wrote:
> > > >
> > > > Hi Olof, Arnd,
> > > >
> > > > Just want to check if it's possible for those patches to be applied in
> > > > v5.17? Sorry for the noise, but that's important to me.
> > >
> > > I can see that Olof merged merged this into the "arm/late" branch in
> > > the soc tree,
> > > so I assume he still plans to send it in the next few days.
> >
> > Yep, will be sent up today most likely.
> >
> > > With the timing over Christmas, I sent out the large bulk of the
> > > contents (anything
> > > I merged before Dec 23) last year, and Linus already merged it, the rest ended
> > > up in the "late" branch.
> > >
> > > As usual, there is no guarantee that late changes make it in, but I have seen
> > > no indication of any problems so far.
> >
> > Correct. Been sitting on it for a while in case there were fixes
> > coming in for the first pieces that got merged, but in traditional
> > fashion I'm guessing those will start to show up a few days after the
> > late branch gets merged. :)
>
> Actually I have such, but to prepare a pull with them, I would need to
> base it on some random Linus' commit, not on v5.17-rc1. Therefore I
> wait for v5.17-rc1. Would you prefer different approach?

If needed you can base it on Linus' last merge commit of arm-soc
contents for the first set of fixes (or your topic branch that you
sent the code up on), but it's also OK to wait if they're minor
bugs/fixes.


-Olof
