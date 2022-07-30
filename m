Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBC32C04A68
	for <soc@archiver.kernel.org>; Sat, 30 Jul 2022 09:50:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 7401BC433C1; Sat, 30 Jul 2022 09:50:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4857BC43470
	for <soc@kernel.org>; Sat, 30 Jul 2022 09:50:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1659174606;
	bh=eJdYl+7HTz6rvJ5y4KauiwXp8QgyJ4pKM0LFjwd5jvE=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=KlMHK7jR51Ko4KtD/Q+MW9zG+X5M8FQwZ7M5TcH2ycojOa0ULZLTlUj1IxD8P2W+G
	 7Ror97PSYp1NH76ik+QlhjGA23DHKJ/HsDrU9yQjeZcdDrQIvfCT6RvPsSWHC3HICv
	 fEYNU1og0UVmBb7sh6n5M6aoqEGVAibuA3wszvCKWThq/PglcjYbkbbzdIvb3sDbcy
	 OtDIS9xSWaBL/qOgLv8iS2dW/xWJsDnd48OPhvYu8YOi8bHi70uYqjvCVsefkTYrT0
	 ZSlqRXRCHvucdSBkZ/dgvPacYAXJrGqb+fsOFo0kz5RCnzTe+XElnE9hyEFItLesFf
	 hBeq2homDTnCg==
Received: by mail-ej1-f53.google.com with SMTP id sz17so12242798ejc.9
        for <soc@kernel.org>; Sat, 30 Jul 2022 02:50:06 -0700 (PDT)
X-Gm-Message-State: AJIora/uJYpOIDDtazj+34fOJDpVeDQxVKcr8DiH2v63Umfug42oMIOk
	trAhc2J6tC8d/YE5LaQqA8U5cXKVN23eJTZvU1s=
X-Google-Smtp-Source: AGRyM1spCL6f8KRU/I4MUfqoI1Jvg3+Pgtg5WhSIuxvscGUE7ABsYMk8dE87oDsMxXYWHoTOccVigM5FMLWV/kD9f48=
X-Received: by 2002:a17:906:98c7:b0:72b:20fe:807d with SMTP id
 zd7-20020a17090698c700b0072b20fe807dmr5793125ejb.75.1659174604488; Sat, 30
 Jul 2022 02:50:04 -0700 (PDT)
MIME-Version: 1.0
References: <CAK8P3a3GTzeJUdcjVv-1fL7h7e6XRFPA65-5xseQ4=tyZE8UDg@mail.gmail.com>
 <CAHk-=wgdnnAmDopTKXbS5u3Ty8GgAfuFOSOycsCfe6pSAqunHg@mail.gmail.com>
 <CAK8P3a0L24AxQD_72bHYY7CKvnvcYi4e_+Zq_n6KqWXzD7-G9g@mail.gmail.com> <CAHk-=wjPm7q4ikoErhEn3dgGsO_-RSyYuRYox2oHp+Z0z8FUGA@mail.gmail.com>
In-Reply-To: <CAHk-=wjPm7q4ikoErhEn3dgGsO_-RSyYuRYox2oHp+Z0z8FUGA@mail.gmail.com>
From: Arnd Bergmann <arnd@kernel.org>
Date: Sat, 30 Jul 2022 11:49:45 +0200
X-Gmail-Original-Message-ID: <CAK8P3a1DVcc=AV29AJJxMzBVoU-grFaNet0ndxPgPFvpK-ZANQ@mail.gmail.com>
Message-ID: <CAK8P3a1DVcc=AV29AJJxMzBVoU-grFaNet0ndxPgPFvpK-ZANQ@mail.gmail.com>
Subject: Re: [GIT PULL 0/6] SoC branches for 5.20
To: Linus Torvalds <torvalds@linux-foundation.org>
List-Id: <soc.lore.kernel.org>
Cc: SoC Team <soc@kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, Jul 29, 2022 at 6:15 PM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> On Fri, Jul 29, 2022 at 12:15 AM Arnd Bergmann <arnd@kernel.org> wrote:
> >
> > On Fri, Jul 29, 2022 at 1:15 AM Linus Torvalds
> > <torvalds@linux-foundation.org> wrote:
> > >
> > > Hmm. I'm missing 2/6. I don't see it on lore either, so I don't think
> > > the problem is on my end..
> >
> > I got a reject from the mailing list because of the size limit, not sure why you
> > didn't get it though. Sent a smaller version of the email now.
>
> You resent 3/6. Which I had.
>
> It's 2/6 that I'm missing.

Damn, I guess that's what I get for trying to fix it on the way out the
door. It looks like the arm-dt-5.20 pull request is the one that bounced,
so I resent that thinking you meant this one, but arm-drivers-5.20 never
got sent at all.

The order of the first five does not matter, only the 6/6 (arm-boardfiles-5.20)
has a dependency on the arm-defconfig-5.20 tag. None of this is urgent
as I can send a new formal 2/6 pull request when I'm home on Tuesday,
or you can just pull it from

https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git arm-drivers-5.20

with the commit message from the tag. Sorry again for messing this up
twice.

        Arnd
