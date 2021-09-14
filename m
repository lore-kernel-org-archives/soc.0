Return-Path: <SRS0=PXfV=OE=0x0f.com=daniel@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6BAFCC433EF
	for <soc@archiver.kernel.org>; Tue, 14 Sep 2021 15:02:27 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 461FF610F9; Tue, 14 Sep 2021 15:02:27 +0000 (UTC)
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D2EE6610A6
	for <soc@kernel.org>; Tue, 14 Sep 2021 15:02:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D2EE6610A6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=0x0f.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=0x0f.com
Received: by mail-qk1-f182.google.com with SMTP id t190so15123951qke.7
        for <soc@kernel.org>; Tue, 14 Sep 2021 08:02:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0x0f.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ikRfZznVPSXgOHZwn7JV71/YZkay7rEY3B5GGPhJJ+U=;
        b=biWj6oOhhZxdxpaxbui8CnDRKvz3RAAV0JLgdSoWpp1s6sxukGfPhlHQql85u5sKC+
         eWAsEdfVzc4X63GeAFgSUC37oIZ9Qk7Z0iQ9/YARn8S7JZ9e0PyrsEDNqE9JMHEzHl14
         ZrSwlOi5vSL1nO4tt2CSeAWhK2qu2G34II0M0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ikRfZznVPSXgOHZwn7JV71/YZkay7rEY3B5GGPhJJ+U=;
        b=B3ZrIHeRfX7CUGlnQMbenJEJ29GzQAeaIW02bB/cp/E9Yg5mR4AGCGs5NmHbxtIT9P
         338HSsHEKlJOglhN34xV5iRDdjvIOdz4ZEN2/n62Xvm8S08H8SoGQU9mGg/yhGfWjbcT
         i1+GmFNzmLlFqeeqCIZoYudbEXCfAbKjOed6LLp64cylanfbJ0LLK0GRhrc4s01CF+Z3
         9e0DYykqd7wiNTfBzuy5XLhPY2QnNzRsNSR27OtBzNi9Tl7+eeKc3X9MFcO/IWQ81Nj4
         RVclRsq4gLw3fN4Rd+7WsTzFozBCGH3spWzEIZ3SFsSIgeL2RZ+aXNBvrPF88pVmKp3Q
         +PEA==
X-Gm-Message-State: AOAM533yzmbeDLiDMXzyNdGbMPdVrsR9wRTLmLkNkq6ULwz1Bbq0W13c
	jGmkJLMXjfNst9ShHk64LA2rki3/UxcPE6CNeqp7aw==
X-Google-Smtp-Source: ABdhPJy5FtjBECS7D5pqnI7V2Px/Rkc9Hc6UzmLi6RECLOhHNEvqX50enNMA3OI7/seaVcoHAcaFc+Ldf77gvG30rUs=
X-Received: by 2002:a37:a905:: with SMTP id s5mr5380057qke.63.1631631745930;
 Tue, 14 Sep 2021 08:02:25 -0700 (PDT)
MIME-Version: 1.0
References: <20210910190322.27058-1-romain.perier@gmail.com>
 <20210910190322.27058-5-romain.perier@gmail.com> <CAFr9PXnLZC1zfs4e1GqZU4UU3knU-BwREe0-abrWNq7akrTntw@mail.gmail.com>
 <CAK8P3a24NTmkyh01OEzDQ8=oTWpUnDtwWQgUUxUbW2wxsgAFeA@mail.gmail.com>
In-Reply-To: <CAK8P3a24NTmkyh01OEzDQ8=oTWpUnDtwWQgUUxUbW2wxsgAFeA@mail.gmail.com>
From: Daniel Palmer <daniel@0x0f.com>
Date: Wed, 15 Sep 2021 00:04:44 +0900
Message-ID: <CAFr9PXkipBnVDBOpdYhUD4bYNaL8qybPhGJi7YwSHaCNrPz6rw@mail.gmail.com>
Subject: Re: [PATCH 4/4] MAINTAINERS: Add myself as MStar/Sigmastar Armv7 SoC maintainers
To: Arnd Bergmann <arnd@arndb.de>
List-Id: <soc.lore.kernel.org>
Cc: Romain Perier <romain.perier@gmail.com>, Rob Herring <robh+dt@kernel.org>, 
	Olof Johansson <olof@lixom.net>, SoC Team <soc@kernel.org>, 
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, DTML <devicetree@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Arnd,

On Tue, 14 Sept 2021 at 22:54, Arnd Bergmann <arnd@arndb.de> wrote:
> Sounds good to me.
>
> One process issue though: These emails were sent 'cc:soc@kernel.org', so
> they end up in patchwork, but I'm guessing they were not actually meant
> for us to apply from there. I'm happy to take merge these patches (or
> a future version of the series) directly from patchwork if that's what you
> both had in mind, but for clarity please either
>
> a) drop soc@kernel.org from Cc for patches that are meant for review
> and will be part of a pull request.
>
> or
>
> b) put soc@kernel.org in the 'to:' field after they have been reviewed
> and you want them to get merged.

Noted for the future. Until now we haven't done pull requests so
having the patches go into the soc patchwork made sense but from now
on we'll send pull requests when needed to you and Olof for the ARM
specific bits. Which I don't think there will be much aside from dts
stuff.

> Or even better, add an explicit sentence below the '---' line asking
> for the patches to be merged directly into the soc tree when this
> is what you want.

Noted.

> FWIW, I'd suggest merging the MAINTAINERS file change as a
> bugfix for 5.15, it's generally better to do these as early as possible
> to make sure any patches reach all the right people.

That makes sense.
Would it be possible for you to merge that single commit for me?
Seems like that would be easier than me creating a fixes branch for a
single commit, sending you a PR, finding out I still don't actually
know how to do PR properly.. :)
If it's a hassle I'll do the PR though.

Cheers,

Daniel
