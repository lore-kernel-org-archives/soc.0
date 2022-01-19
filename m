Return-Path: <SRS0=7ACn=SD=canonical.com=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0FB9C433EF
	for <soc@archiver.kernel.org>; Wed, 19 Jan 2022 17:01:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 8027BC340E1; Wed, 19 Jan 2022 17:01:16 +0000 (UTC)
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 5ADB5C36AE7
	for <soc@kernel.org>; Wed, 19 Jan 2022 17:01:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 5ADB5C36AE7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=canonical.com
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com [209.85.208.69])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id C33523FFDE
	for <soc@kernel.org>; Wed, 19 Jan 2022 17:01:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1642611667;
	bh=DsitdWyrjwAWvscnA5nwUVt0TQXqCXM23k2Tf31EYy4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=D79HvQH3xbqg7euCnQasxq2FWu7klyaEN0YBiJT5jarFP/MpShs1zsjvsYVkfr1Xm
	 m4YZkJv9UxLqQz57ZNkcG63QBOY6gTLSOBMk1hPK8JoPh8i8yWhe2qRwCYxXrBKErs
	 9bu10pj2PfNA0yL2RVBexuSLEv1BjTPYiWozMbtBDuNzObYuAg3unANJKzzNLATmCw
	 aebjSzU/v7q/rPtbVAhp0JTGICXvBg+P1/nV5lG5CSNssWopA7urImlzOcT6peGWSk
	 AdlvaETKUST7EWP7yGjEnaBaHgSh06/+YizluEknhlLrtdraM6pNrd+jlUpDxnuua5
	 0PvFyoVABi0LQ==
Received: by mail-ed1-f69.google.com with SMTP id ee53-20020a056402293500b004022f34edcbso3131380edb.11
        for <soc@kernel.org>; Wed, 19 Jan 2022 09:01:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=DsitdWyrjwAWvscnA5nwUVt0TQXqCXM23k2Tf31EYy4=;
        b=1YndpTNBIz/MGSf0mu5IiQX7ZazoHnOFqsNKjm6pLeIfPinEO3A5F7SJIPotdYm5KS
         XfD8psWnAGOZcayyAFgn+K6pi+2KKv+B5mZUls+wrV/Wf8tQGzC87hBApS3gUHXZt7Oq
         DDEEmbGdF58ogCmm7mdk7wUDXUs2lVRNWvvg9ZzvLCIF+6sisOtt5U96cutN7mFbxjJj
         wCCfwql+6gpqUbCIiiYLlZMfN/myojXeBYalind98m+gKKU8Pf7DtD6tslX64jE91hTk
         kmEV8y3wnQXc797vbaKP5F3fZDbRaImgDVl93AdESAD2w8BG4bC/G1J10dsqp+xt8OuV
         EkkA==
X-Gm-Message-State: AOAM533S++PKhVzVr71ZCP+g629630WB43q9dCCja+GEMPn8WlUW4WWk
	kVGK2C54ALq4Iov0+NF7xkHVhChxdQvVT27NvTwIvELiGJ89c/THBhRrKfKgKDJEMJHEdRIA1J9
	VbXZrXuA/NMX5cB6zis5NW7/O/iMraS0dfV36d+g=
X-Received: by 2002:aa7:d28e:: with SMTP id w14mr32087797edq.53.1642611667405;
        Wed, 19 Jan 2022 09:01:07 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyyhnpS46ePzskaoSTeiKlHBBiCrPI1N2qHZbE92eCWdfUSfFp8D1OkXo3xWWwhcrEtVqXQLzR+2Mc1a01GT6g=
X-Received: by 2002:aa7:d28e:: with SMTP id w14mr32087767edq.53.1642611667167;
 Wed, 19 Jan 2022 09:01:07 -0800 (PST)
MIME-Version: 1.0
References: <20211227112959.7325-1-krzysztof.kozlowski@canonical.com>
 <CAPLW+4n-1H5Yu3wQaus-UJ_VW_TjHrNUHaPCGCMURXg8EqxjyA@mail.gmail.com>
 <CAK8P3a1ou-ZdrXN0MHQoJ+gGbvhXT-e2qt96_f9M8VwrdX0pAg@mail.gmail.com> <CAOesGMgF3S5_XsWjEqq=-zfYXwOWFpFNA6afL81wceRUA_0FeQ@mail.gmail.com>
In-Reply-To: <CAOesGMgF3S5_XsWjEqq=-zfYXwOWFpFNA6afL81wceRUA_0FeQ@mail.gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Date: Wed, 19 Jan 2022 18:00:56 +0100
Message-ID: <CA+Eumj5sosSkCCANOVqN8fVUDFaSNtB7+f95o+FAp7w6rM4A=A@mail.gmail.com>
Subject: Re: [GIT PULL] arm64: dts: samsung: Second pull for v5.17
To: Olof Johansson <olof@lixom.net>
List-Id: <soc.lore.kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Sam Protsenko <semen.protsenko@linaro.org>, arm-soc <arm@kernel.org>, 
	SoC Team <soc@kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	"moderated list:ARM/SAMSUNG EXYNOS ARM ARCHITECTURES" <linux-samsung-soc@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, 19 Jan 2022 at 17:53, Olof Johansson <olof@lixom.net> wrote:
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

Actually I have such, but to prepare a pull with them, I would need to
base it on some random Linus' commit, not on v5.17-rc1. Therefore I
wait for v5.17-rc1. Would you prefer different approach?

Best regards,
Krzysztof
