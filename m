Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E730C63777
	for <soc@archiver.kernel.org>; Thu, 26 Nov 2020 20:55:08 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id BCF9E221FA; Thu, 26 Nov 2020 20:55:07 +0000 (UTC)
Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 9015A221F7;
	Thu, 26 Nov 2020 20:55:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1606424107;
	bh=TU2hnTVLI0D2XF4ELV52kz7cc+O4mr44XQxrLdC81tw=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=VmM2Bo6SMoy/OB+AAKk/UPM6UwmjK80s95v86+jylIGjKkshqNus9ACEdVXIoFz1W
	 3jG+enfRcxD2nE2jEs1aBQK+/kG5qwNnmwTsM2iTaDMsMN9hgH04rFa70/Zf1F4L3r
	 3dMTOVbf+Iz/DHfzA2sNJlvvlbuhiJkLKndlBSP8=
Received: by mail-ot1-f46.google.com with SMTP id k3so2853576otp.12;
        Thu, 26 Nov 2020 12:55:07 -0800 (PST)
X-Gm-Message-State: AOAM530G6O89FxhgFwCB9pxJEo8iwHDVjeT97oMgHyhIHwQq0rxpXSom
	wZ2+14MKwTs7zV/0eySDaKtb6hbgB4C2VWhrxoI=
X-Google-Smtp-Source: ABdhPJxejRNBcduT13gnFKxzJVkg35SQW/KkD54UlLkoAU2flKw1/NlaYeapb3fHwxFe2jFwMd7UVCiQi7fX3xhFyXU=
X-Received: by 2002:a9d:6317:: with SMTP id q23mr3507660otk.251.1606424106926;
 Thu, 26 Nov 2020 12:55:06 -0800 (PST)
MIME-Version: 1.0
References: <20201124122412.22386-1-sudeep.holla@arm.com>
In-Reply-To: <20201124122412.22386-1-sudeep.holla@arm.com>
From: Arnd Bergmann <arnd@kernel.org>
Date: Thu, 26 Nov 2020 21:54:50 +0100
X-Gmail-Original-Message-ID: <CAK8P3a3xN70zumQ-gwiBxGwoia2bkfGF-c5r=KY3ihhXy4F89g@mail.gmail.com>
Message-ID: <CAK8P3a3xN70zumQ-gwiBxGwoia2bkfGF-c5r=KY3ihhXy4F89g@mail.gmail.com>
Subject: Re: [GIT PULL] firmware: arm_scmi: Updates for v5.11
To: Sudeep Holla <sudeep.holla@arm.com>
List-Id: <soc.lore.kernel.org>
Cc: SoC Team <soc@kernel.org>, ARM SoC Team <arm@kernel.org>, 
	ALKML <linux-arm-kernel@lists.infradead.org>, Arnd Bergmann <arnd@arndb.de>, 
	Kevin Hilman <khilman@kernel.org>, Olof Johansson <olof@lixom.net>
Content-Type: text/plain; charset="UTF-8"

On Tue, Nov 24, 2020 at 1:24 PM Sudeep Holla <sudeep.holla@arm.com> wrote:
>
> Hi ARM SoC Team,
>
> Please pull ! The tag is based on v5.10-rc2 to avoid conflicts with
> the fixes that got merged in -rc2.

Is there no way to avoid this? I would really prefer not to have to backmerge
rc2 into my existing branch if it's just about the bugfix.

I tried rebasing your branch onto -rc2 and only got a trivial conflict
in one line, and even that could be avoided by merging in your
bugfix branch instead of the whole -rc2.

     Arnd
