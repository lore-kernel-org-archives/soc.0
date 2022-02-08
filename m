Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D505C433EF
	for <soc@archiver.kernel.org>; Tue,  8 Feb 2022 10:01:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 07853C340F4; Tue,  8 Feb 2022 10:01:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E438FC340ED;
	Tue,  8 Feb 2022 10:01:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1644314460;
	bh=zv8RO+uDkuEbrS7FtJnVjAJ7h/GcjdHdJ6ypYNC7gB0=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=meAOE6K0ZBH0cCgJGlfjwRZF9T+7f6hQQzgDcztK3QN5fWuetc/y+DBliUZrRx22N
	 8qrINyLjN2iQll7ADeTdUFc+vBt6Yo5buzUXm0tSp4UQrpsPIHQoChNXyuiVMbMWvW
	 uXd+YoeA/R761Q/0a6WALXssKxkzXQRTNzbH+4C9H6v0PdOZxfIVREzwUbwSCDPxzg
	 dMhpR+1ldIT7omEZmksoI6wAE2P7YgQnykuVMTBb2V+QRGPxeC9Q7XbN0u+inEFUTg
	 JWQU7WyFUpJDwqBynl4bIQ9EuFIbvkhbvTq9ClzuT8TbIcOlTUKSV1pNioyqv9JXX+
	 ExVKfsPWmubqA==
Received: by mail-wm1-f41.google.com with SMTP id k3-20020a1ca103000000b0037bdea84f9cso1213684wme.1;
        Tue, 08 Feb 2022 02:01:00 -0800 (PST)
X-Gm-Message-State: AOAM533XDDPZ3yt8Ele2Ksejxr2OVxGcN17YgQuHVwfDcLCMlUC95zL4
	3XRQ1k3cDS3eqFKuDQhm4n8irBXTEQ9KwUnl5xE=
X-Google-Smtp-Source: ABdhPJwLnxVuhgjKKfsp/D5fNUyb/g9sC5FPX0vAprVHloPb1V9sq4ose4FuAn6NPU7qVHSpXso1OsD6G1MV/UV5Efw=
X-Received: by 2002:a7b:cf18:: with SMTP id l24mr426893wmg.35.1644314459177;
 Tue, 08 Feb 2022 02:00:59 -0800 (PST)
MIME-Version: 1.0
References: <20211222141342.56395-1-sudeep.holla@arm.com> <20220107113740.f4zlz25largdjcfd@bogus>
 <20220108202410.GA1057@lx2k>
In-Reply-To: <20220108202410.GA1057@lx2k>
From: Arnd Bergmann <arnd@kernel.org>
Date: Tue, 8 Feb 2022 11:00:43 +0100
X-Gmail-Original-Message-ID: <CAK8P3a1qcZHFpxdqF1AFSCGR+AyDrYmucdBQGz5G1PvnEMbp8Q@mail.gmail.com>
Message-ID: <CAK8P3a1qcZHFpxdqF1AFSCGR+AyDrYmucdBQGz5G1PvnEMbp8Q@mail.gmail.com>
Subject: Re: [GIT PULL] firmware: arm_scmi: Updates for v5.17
To: Olof Johansson <olof@lixom.net>
List-Id: <soc.lore.kernel.org>
Cc: Sudeep Holla <sudeep.holla@arm.com>, ARM SoC Team <arm@kernel.org>, SoC Team <soc@kernel.org>, 
	ALKML <linux-arm-kernel@lists.infradead.org>, 
	Cristian Marussi <cristian.marussi@arm.com>
Content-Type: text/plain; charset="UTF-8"

On Sat, Jan 8, 2022 at 9:24 PM Olof Johansson <olof@lixom.net> wrote:
> On Fri, Jan 07, 2022 at 11:37:40AM +0000, Sudeep Holla wrote:
> > On Wed, Dec 22, 2021 at 02:13:42PM +0000, Sudeep Holla wrote:
> > > Hi ARM SoC Team,
> > >
> > > Please pull !
> > >
> >
> > I am aware I sent this pull request just around the same time Arnd finalised
> > the initial set. I have seen emails suggesting that Olof might be planning
> > to merge additional PR, so it would be great if this gets included in
> > that cut. All the changes are in -next since 21st December, so there should
> > be no surprises.
> >
> > Thanks again and sorry for nagging.
>
> Yeah, no worries -- I'd been letting pull requests sitting for a while over the
> holidays. I've merged this into our late branch now.

Hi Sudeep,

I'm going through all the stuff that we ended up not getting into v5.17.
As you probably already know, this pull request was part of the arm/late
branch that missed out, sorry for the mistake on our end.

As the contents are still fine, I could offer to either merge the branch again
for v5.18, or I can drop it and wait for a new pull request from you, please
let me know your preference.

If any of the patches are bug fixes that you think should be in v5.17,
it would be good to have a separate pull request or patch email for the
5.17 fixes branch.

       Arnd
