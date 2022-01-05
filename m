Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0815EC433EF
	for <soc@archiver.kernel.org>; Wed,  5 Jan 2022 01:40:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id B4CD6C36AF4; Wed,  5 Jan 2022 01:40:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F453C36AE0
	for <soc@kernel.org>; Wed,  5 Jan 2022 01:40:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1641346849;
	bh=fiprzdtapiHlkEqA6yRx3HnK1/XVZvHlqeF15R2sq/4=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=HNyR64a1/LIyTGWzUcuXYVjTqHVYOQxSTrsKbGTRijv2Cq8NYkUnLlLd1KC5VpcEx
	 wpCw86ICMAZSdJAI4nu61DCNM9WHaA6YQq5Y3sNJohjfrYnutLlDpO8eTnxZcuNYq0
	 hG6UjEceS13MOEfaByIRncMhU6zUyY4GwzO2aASyhmSlzZafwPZw8/i0dlHJyEg7SN
	 AOcxEXzVacZNNYmQ36WiW+4Lc9AUy+DxvebjQ8FyP5NL/WYp2Izezhl2U6CHzE3krL
	 dTz9UPmz9Diekls/kIE1HpgQxD4fA7WUaZWOcrjNgWbNkLMzzh8TkkX3Uq2Qw0UdXw
	 H2kGqUs9J7qGg==
Received: by mail-wm1-f51.google.com with SMTP id n14-20020a7bcbce000000b00332f4abf43fso1398868wmi.0
        for <soc@kernel.org>; Tue, 04 Jan 2022 17:40:49 -0800 (PST)
X-Gm-Message-State: AOAM533UBwt1qt7RxMkl15Mq6iDnhnZ7hFGqbvDCaqP8Wc13uCjHetWN
	c7HpJbxq7RQ0qFRTG+dnzbwW0KFyEdz874KO4GU=
X-Google-Smtp-Source: ABdhPJy1uwTTKEA4wvzCvyAgRguHB0JnccPjbDXqYUvQ4StmL3SDLSOvMlZwJe049+0sBU8WSDkpEBSclCVdnUgCRzc=
X-Received: by 2002:a7b:c190:: with SMTP id y16mr455497wmi.35.1641346848065;
 Tue, 04 Jan 2022 17:40:48 -0800 (PST)
MIME-Version: 1.0
References: <CAK8P3a0RDZpLtWjMEU1QVWSjOoqRAH6QxQ+ZQnJc8LwaV7m+JQ@mail.gmail.com>
 <7e480da8-0d54-2d62-0a8e-184901c974b6@gmail.com> <ee2c92da-030c-b92f-0f41-1fdbbeed47c7@gmail.com>
 <CAOesGMgx99GJ3gQmdgauSs3aF8xr4FgcgsELRz4HSVXmujHJnQ@mail.gmail.com>
In-Reply-To: <CAOesGMgx99GJ3gQmdgauSs3aF8xr4FgcgsELRz4HSVXmujHJnQ@mail.gmail.com>
From: Arnd Bergmann <arnd@kernel.org>
Date: Tue, 4 Jan 2022 20:40:43 -0500
X-Gmail-Original-Message-ID: <CAK8P3a3sBADt4Cu=LGbjHQpQ32O-BtFk1aQFwhL8Ar=M_gj6Xw@mail.gmail.com>
Message-ID: <CAK8P3a3sBADt4Cu=LGbjHQpQ32O-BtFk1aQFwhL8Ar=M_gj6Xw@mail.gmail.com>
Subject: Re: [GIT PULL 0/5] SoC changes for 5.17
To: Olof Johansson <olof@lixom.net>
List-Id: <soc.lore.kernel.org>
Cc: Florian Fainelli <f.fainelli@gmail.com>, Linus Torvalds <torvalds@linux-foundation.org>, 
	SoC Team <soc@kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, Jan 4, 2022 at 7:40 PM Olof Johansson <olof@lixom.net> wrote:
> On Tue, Jan 4, 2022 at 1:58 PM Florian Fainelli <f.fainelli@gmail.com> wrote:
> > On 12/24/21 9:11 AM, Florian Fainelli wrote:
> > >
> > > Should I resend or fix something in those? Thanks!
> >
> >
> > Arnd, Olof, do I need to resend the 3 pull requests mentioned above?
> > Thanks and happy new year.
>
> I'm about to make a pass of merges, likely tomorrow -- I had to get my
> Honeycomb working again since it hosts all the trees and mailboxes for
> me.
>
> No need to resend at this time.

It's possible that I had accidentally merged them in the end but tagged
the branch without those merge commits, so have a look if it's in there.

I'm still traveling, so I have no access to my reflog. I'm sure there was
nothing wrong with the contents, so either they came after I had
tagged the branches, or I made a mistake.

        Arnd
