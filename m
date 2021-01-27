Return-Path: <SRS0=Ur2y=G6=linaro.org=jens.wiklander@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95CC0C433DB
	for <soc@archiver.kernel.org>; Wed, 27 Jan 2021 07:50:31 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 6A5232074F; Wed, 27 Jan 2021 07:50:31 +0000 (UTC)
Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com [209.85.167.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2726520724
	for <soc@kernel.org>; Wed, 27 Jan 2021 07:50:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2726520724
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=jens.wiklander@linaro.org
Received: by mail-oi1-f178.google.com with SMTP id w8so1287493oie.2
        for <soc@kernel.org>; Tue, 26 Jan 2021 23:50:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=g8OubAhTN/FBQdhO7MDq1GqB/O5DeyzyzVaszDHHBlw=;
        b=CylHfKQfND0ZaUPjRGelQmAttTLMWiaTOama/0Vy7y3wYmRArkRRnEovnBqO31wE15
         ST+3niaQmTW0s9hvPemAvrR+2mFfkWFnE5C3sAjGqTWRHmospgtuu3XU3IDydyOuzKPo
         74QM1XTz6uadFWveqUS/i3xamF0OPGzAiSWBcHjGrKrEBb+5QDljqoyK+KmycwIxKG2A
         cWhT1IY37KRb6/gDuXalY/6bRIEDtBkKd9SFd7lk2lMYYheNVq19mBTWe4D28+4N7fwx
         TstRzmlwUXhIWcfdJLmaEc33YRqe0lSX0ik57nF/CyPnLE8mxpUk6SuLwNaydk1hEij9
         uaOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=g8OubAhTN/FBQdhO7MDq1GqB/O5DeyzyzVaszDHHBlw=;
        b=Dq1cia7B7biG+8uY0k3eRS8oXRwaHnzdSR9e9ZsNjuPhfY7cv3nm3sWBEWzXIhbzYS
         0dcZIEqc/qcsO80G8XKwVvkaHaevZwbqZmiBVVS09iBD2xM5JezuuwLKM27sNTiHvNAw
         w+gDc6VMLk1NBNSYVc63mYIV1PG210hZYkn3fb3C20l6tOSLrkJ7A6WUayaknhv5AElu
         aoeOikL6L7aE4mi6Mo1cZOwIbQmCMuApSRT101vY1h+dR9qkotQvjsxY4vilUh1t2opu
         /xHQW3+gGNGNjAmHYEZeDKdliLOJuniT821WmwSeTbMCEN9XjC1w/Z4nB09U0sywqEEt
         cymQ==
X-Gm-Message-State: AOAM5316LdO19WFWzLuBIc6clKBFGm3gsfqfN4EbosTmpat9RC7Hy7vb
	zMCufyONMUB4EKFoG3KB/Z1NDmbS0a7w/wB2YAN62F9+LIA=
X-Google-Smtp-Source: ABdhPJzF47qYkC6IcX6+RreAhty5H5Rb9MDtGH4NvnpaAXbNmbpprAizvrlxNQdB2qmGI2OH3qlsNqwtePo9exXrf4o=
X-Received: by 2002:aca:6702:: with SMTP id z2mr2325437oix.149.1611733830187;
 Tue, 26 Jan 2021 23:50:30 -0800 (PST)
MIME-Version: 1.0
References: <20210122074234.GA1074747@jade> <161135641124.29035.6761157228532077144.git-patchwork-notify@kernel.org>
 <CAHUa44HCnzgYndTccs=SSb1BQ9nk05k8vUQ-TO6Z2ZukwQcUPA@mail.gmail.com>
 <CAK8P3a3gbLPsSz1c95ExBqnZ=y-4p=b9awpDQjVSEXXUTr13LQ@mail.gmail.com> <CAK8P3a2G9q+fu7jir7AvmsZuBY3kz7rKCCVKg4o8oDyPE34pfg@mail.gmail.com>
In-Reply-To: <CAK8P3a2G9q+fu7jir7AvmsZuBY3kz7rKCCVKg4o8oDyPE34pfg@mail.gmail.com>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Wed, 27 Jan 2021 08:50:19 +0100
Message-ID: <CAHUa44HwHWjARDbyOBAcOA_4kzgwwUAsToGzA_YiN-f1s4h_mQ@mail.gmail.com>
Subject: Re: [GIT PULL] OP-TEE driver fix for v5.11
To: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: SoC Team <soc@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, Jan 26, 2021 at 9:22 PM Arnd Bergmann <arnd@kernel.org> wrote:
>
> On Mon, Jan 25, 2021 at 10:30 AM Arnd Bergmann <arnd@kernel.org> wrote:
> >
> > On Mon, Jan 25, 2021 at 8:21 AM Jens Wiklander
> > <jens.wiklander@linaro.org> wrote:
> > >
> > > Was this merged by mistake? You had some concerns about the need_resched() test.
> > >
> >
> > Indeed, thanks for noticing!
> >
> > Could you send a fixup to remove the need_resched() check after verifying that
> > it works? Alternatively I can remove the patch I merged by accident and send
> > my next pull request without it, but I'd prefer to avoid rebasing the fixes I
> > merged later.
>
> I need to send out the fixes branch for upstream. As it was my mistake to
> merge the fix while complaining about it, and the it's also harmless, I'll
> leave the version I pulled now.

Thanks, it seems it takes a little time to get the updating patch verified.

>
> It would be nice to get a follow-up in your pull request for v5.12 though.

I'll see to that.

Thanks,
Jens
