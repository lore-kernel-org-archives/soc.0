Return-Path: <SRS0=iIJr=SI=linaro.org=semen.protsenko@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F084C433F5
	for <soc@archiver.kernel.org>; Mon, 24 Jan 2022 13:50:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 1485FC340E7; Mon, 24 Jan 2022 13:50:55 +0000 (UTC)
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com [209.85.222.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 10F0BC340E4
	for <soc@kernel.org>; Mon, 24 Jan 2022 13:50:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 10F0BC340E4
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ua1-f49.google.com with SMTP id b16so31077057uaq.4
        for <soc@kernel.org>; Mon, 24 Jan 2022 05:50:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=elnpBLQARnRLZNvPKlv8JLeoq3JtZl1fu0Kwxhb6W4Q=;
        b=pOSKjTusGjLhqw45TfjvAeEDkHrppVglkaZ3biN4z+B1+eDjER6arxBNrUVxd9mTfB
         UiKon0CaJtb/ljtfx0tbtXe0iCGZyasNfl+l+vP2P+Ug5yMmEpmwF19mvStimWu9gVnS
         yvi50a5OOvl+pw6PX1wqAhCYu//gzXaz7WB3aOJW12F4aed4ECP1bZPZp5VkU3jJnXsC
         WtjmgJmLBACrR/Yt3FwA15sBFuxnGhT4/6ceDUBAPfcIaUdTVVYyx+m1bv4eQoJxgjKa
         aQQr5sBuQQkPnQqqnKkXWxWxj1H9VXJMNOuM7uHdW6AMeW/LyGGy8E82jDLKWqZtm5JI
         QkxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=elnpBLQARnRLZNvPKlv8JLeoq3JtZl1fu0Kwxhb6W4Q=;
        b=EYRWU6dt+Edbftl45lJJe/dBihdHqTI6wYCjfEDd6IrsOl1A765JqSlkb7LXXt0CF3
         y1ji84wPv+l1gfBCwV1IWlgWsgp4Woe87WpziuqJyc9llEzs8rKJdC2zxfqJRKmbb+lS
         0UQWQYOH+tKoYUbB7uzaUMOfWOqetxPtBDwcTM0gH7h//8tfJH05nhGlKV3dM6IZVYi+
         W/UgRXZtjpwxehzODhOrl2VQBHu9QYb6yCZui2FITyjZdUXkwo6RCwevFc4fn1snAS19
         T0q5NOZ7xphcp2uByA1/5C8lLjsE3y5JN4/TxxDZvSfQTD9PluqvqLZRiWo6yovyVWJr
         EHtg==
X-Gm-Message-State: AOAM53185XrJdJ7tBmrec8jhYcaBAC5LcHSn1vDttw8VnNiRCY0jfRJu
	g+vS0FD2fGSRwHVSNeyRUoOPJhQeIPcONbTx6JBsAVf27S6mpw==
X-Google-Smtp-Source: ABdhPJxvi5cZdB24aTyLiac3wH/da4Ee9sNkiG0jVsHFaPMStmGQ3+FEHBnkb+seTBGiIWnc3xn/pq1JWy1QVANrkXY=
X-Received: by 2002:a67:c591:: with SMTP id h17mr4539820vsk.86.1643032252928;
 Mon, 24 Jan 2022 05:50:52 -0800 (PST)
MIME-Version: 1.0
References: <20211227112959.7325-1-krzysztof.kozlowski@canonical.com>
 <CAPLW+4n-1H5Yu3wQaus-UJ_VW_TjHrNUHaPCGCMURXg8EqxjyA@mail.gmail.com>
 <CAK8P3a1ou-ZdrXN0MHQoJ+gGbvhXT-e2qt96_f9M8VwrdX0pAg@mail.gmail.com>
 <CAOesGMgF3S5_XsWjEqq=-zfYXwOWFpFNA6afL81wceRUA_0FeQ@mail.gmail.com>
 <CAPLW+4k8=ymx56R7bKOt8kMVG_uUgrTsCkVd5wiY_rkYq8dYbQ@mail.gmail.com> <72a50afd-df9f-ceb3-898e-070d70dc0221@canonical.com>
In-Reply-To: <72a50afd-df9f-ceb3-898e-070d70dc0221@canonical.com>
From: Sam Protsenko <semen.protsenko@linaro.org>
Date: Mon, 24 Jan 2022 15:50:41 +0200
Message-ID: <CAPLW+4=xaHA2a=-F4ikuUPDpoO8Waj7qrrfpgkift1aMi_hU+g@mail.gmail.com>
Subject: Re: [GIT PULL] arm64: dts: samsung: Second pull for v5.17
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
List-Id: <soc.lore.kernel.org>
Cc: Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, arm-soc <arm@kernel.org>, 
	SoC Team <soc@kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	"moderated list:ARM/SAMSUNG EXYNOS ARM ARCHITECTURES" <linux-samsung-soc@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Sun, 23 Jan 2022 at 21:27, Krzysztof Kozlowski
<krzysztof.kozlowski@canonical.com> wrote:
>
> On 22/01/2022 13:38, Sam Protsenko wrote:
> > On Wed, 19 Jan 2022 at 18:53, Olof Johansson <olof@lixom.net> wrote:
> >>
> >> On Wed, Jan 19, 2022 at 8:07 AM Arnd Bergmann <arnd@arndb.de> wrote:
> >>>
> >>> On Wed, Jan 19, 2022 at 4:11 PM Sam Protsenko
> >>> <semen.protsenko@linaro.org> wrote:
> >>>> On Mon, 27 Dec 2021 at 13:30, Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com> wrote:
> >>>>
> >>>> Hi Olof, Arnd,
> >>>>
> >>>> Just want to check if it's possible for those patches to be applied in
> >>>> v5.17? Sorry for the noise, but that's important to me.
> >>>
> >>> I can see that Olof merged merged this into the "arm/late" branch in
> >>> the soc tree,
> >>> so I assume he still plans to send it in the next few days.
> >>
> >> Yep, will be sent up today most likely.
> >>
> >
> > Thanks for detailed answer! Glad to hear it's still a possibility.
> > Please let me know if you need any actions on my side (like rebasing,
> > etc).
> >
> >>> With the timing over Christmas, I sent out the large bulk of the
> >>> contents (anything
> >>> I merged before Dec 23) last year, and Linus already merged it, the rest ended
> >>> up in the "late" branch.
> >>>
> >>> As usual, there is no guarantee that late changes make it in, but I have seen
> >>> no indication of any problems so far.
> >>
> >> Correct. Been sitting on it for a while in case there were fixes
> >> coming in for the first pieces that got merged, but in traditional
> >> fashion I'm guessing those will start to show up a few days after the
> >> late branch gets merged. :)
>
> Olof,
> v5.17-rc1 came earlier, so I see this part did not make into it. Is
> there a chance for a past-rc1 pull to Linus with it?
>
> Sam,
> Anyway the patches wont' get lost (you mentioned such worry in previous
> email to me). They might just need to wait. Unfortunately if patch,
> especially with new feature, is coming in the end of cycle, there is a
> risk it won't make it. The patches have to wait a few days in my trees
> before I send them to Arnd/Olof, so if the patch is coming after rc6, I
> can push it to Arnd/Olof around rc7, you see there is very little time.
>

Should I send the patch fixing hard-coded clock numbers though? I
remember you said I should send it once -rc1 is out. But now that dts
patches are not merged in mainline, I'm not sure it can still be
applied?

> Best regards,
> Krzysztof
