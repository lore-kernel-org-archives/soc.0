Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDC93C433DB
	for <soc@archiver.kernel.org>; Thu, 11 Feb 2021 15:12:14 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 9669864F57; Thu, 11 Feb 2021 15:12:14 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6E1D964F55;
	Thu, 11 Feb 2021 15:12:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1613056334;
	bh=G5O9X8lLfCw+5orVdXQ5BL6xgTpGfxqJMDGWNR/SHk0=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=q1OOKkhnhYXCJS/JLa9K10QgvEuIglm7ceQowNYjPQfhsw5fP/qRyRCrqNSIKVVrA
	 7uVtnqryo9mlXkikHyqwQHrzaqEXGt6bwzSX3cNlKZ6uLQHSa3bolmZyFBgoSfHhl6
	 tc7JxLzKAeo2bEUQ9g1nb9rwVmSTPwhYdrMsWHEnCPnI2xLOP2UcuO2zDUf30v3Job
	 WsfBMYHwqXgLbpWaEM3+6mBFwvux5x8L6B05WkGfR4OrSd1ZjTxjiR/wU/Pspmf4MY
	 KSAsS4wlukD+yWLCWToVO7MHVv/VEzTRKPyovmgEb21Fy9aacX6Q2e2kawBKF4PikM
	 oq4VSIHILFi0A==
Received: by mail-ot1-f54.google.com with SMTP id i20so5408243otl.7;
        Thu, 11 Feb 2021 07:12:14 -0800 (PST)
X-Gm-Message-State: AOAM531jV1FIiqY/D2jQm/24egQ7VdN1U062JnC9fwtvSiwLQtKKkYn8
	4wzWwTurqI5ZeDlHCEuD0ptWm+9cngJLZmXcxs4=
X-Google-Smtp-Source: ABdhPJx4uR1mBjP/Z3xRy9O2P87ajcGa7rO0KcGBMmIxt15WLAjClElnBM1gVBXiLhVZpgSUnSC4BI9HGSJxJVk9iT0=
X-Received: by 2002:a05:6830:18e6:: with SMTP id d6mr6135363otf.251.1613056333830;
 Thu, 11 Feb 2021 07:12:13 -0800 (PST)
MIME-Version: 1.0
References: <19e0e0c9-1bed-bba5-6c80-6903937b3d96@xilinx.com>
 <161305573925.259289.17212813544897085950.b4-ty@arndb.de> <bd383faf-b615-329b-1357-1d1f2ef1f9d1@xilinx.com>
In-Reply-To: <bd383faf-b615-329b-1357-1d1f2ef1f9d1@xilinx.com>
From: Arnd Bergmann <arnd@kernel.org>
Date: Thu, 11 Feb 2021 16:11:57 +0100
X-Gmail-Original-Message-ID: <CAK8P3a2PiJr4pw0TymTH0sRucJRoWJcOoYoOP+-okha30iLZSQ@mail.gmail.com>
Message-ID: <CAK8P3a2PiJr4pw0TymTH0sRucJRoWJcOoYoOP+-okha30iLZSQ@mail.gmail.com>
Subject: Re: [GIT PULL v2] ARM: dts zynq: Xilinx DT changes for v5.12
To: Michal Simek <michal.simek@xilinx.com>
List-Id: <soc.lore.kernel.org>
Cc: SoC Team <soc@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, arm-soc <arm@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, Feb 11, 2021 at 4:07 PM Michal Simek <michal.simek@xilinx.com> wrote:
> On 2/11/21 4:04 PM, Arnd Bergmann wrote:
> > From: Arnd Bergmann <arnd@arndb.de>
> >
> > On Thu, 11 Feb 2021 12:33:01 +0100, Michal Simek wrote:
> >> please pull the following DT changes to your tree. The major part is
> >> adding one new board and qspi dt binding conversion.
> >> I have dropped one patch based on communication with Arnd.
> >>
> >> Thanks,
> >> Michal
> >>
> >> The following changes since commit 5c8fe583cce542aa0b84adc939ce85293de36e5e:
> >>
> >> [...]
> >
> > Merged into arm/dt, thanks!
> >
> > merge commit: 78155527283ddb04bb4a5b78320c861e1035d357
>
> I see that you have there toshiba/dt-2 which is my v1 pull request.
> https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git/
> Maybe better to clean it up.
>

Yes, I noticed that already and removed it a few minutes ago.
It now points to the correct contents.

       Arnd
