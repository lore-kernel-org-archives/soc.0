Return-Path: <SRS0=fVYF=XQ=linaro.org=linus.walleij@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E32BC43334
	for <soc@archiver.kernel.org>; Mon, 11 Jul 2022 11:30:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id D9E44C341CB; Mon, 11 Jul 2022 11:30:11 +0000 (UTC)
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id BB5E1C34115
	for <soc@kernel.org>; Mon, 11 Jul 2022 11:30:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org BB5E1C34115
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-31c8bb90d09so45417157b3.8
        for <soc@kernel.org>; Mon, 11 Jul 2022 04:30:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=1iWMmA127Gg5lOoaWkG1KBJAYgq+HRLNHtX1ayHyC44=;
        b=aRX5cVC1eQubSOLRC6qIks4ltxXchsaDGgRp1XbnxwjrsAcyfQ1opQlzAnMhcPj35m
         hyNz2ZpTFFYPM4VyKi7IlwQ02246ygI6qrCbArKKKOQAR3eG4CypynSg70E/jubhxRRn
         vJ3otbMHEt462afCKxWtRXVLAzLov39d7BcQpytrBXTCzyUm211fVfR2WmuWv0RkgujE
         H+HZ49U2s8Fu8Oc+ZBQmWO14sREVP776c4QKQUFnUUt7nPElnB9KA/yHndkSs8RMOqJl
         fCrZzBis+AaUSrZosIrdQmy9yCBLGbha8b6ulRCiLyZzUlzYaWgGZsD4Gxg2JqUtJBx/
         tXag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=1iWMmA127Gg5lOoaWkG1KBJAYgq+HRLNHtX1ayHyC44=;
        b=g38WmgBnr9lIQ8rW5zERnDHgYOBYAWys2AW/l4/1v2fWgzmDHqp7HOq7qDzWtrIjnv
         zYTuCQ/DjXrFqKUsFVQrdjfJaZXZA7tQSJCaUCPtbUzhCCoeRrYLkWcQVjwdovbMoPVc
         Ognu1JM/L54PBOOvqcxpTHWLPQslt5bTTTWN2lByNcfSkFwntnM0EsXw72OxnMoKShOs
         BWL325A/2VK9dg29xls1b5xgAfnOKeNADD6vSvHvD+nKjS3FaYbWd7td66w/4kzFfsUX
         hyvJ5SPKEV5YEZhaWzGKTxMDB8srmmz7I6IUjrjIAMswYm3UuV7U9SB07q39bWBk2qoA
         qmiQ==
X-Gm-Message-State: AJIora8oor9+wjuwOVU5S4dRy3yIh9bdr3Ov2uVTcnNyKRP73m8nMVSY
	sTKJ2qxZZgD6HkQnwboS1k3vgetpiH4vEv6CgIjZ7A==
X-Google-Smtp-Source: AGRyM1v535dVzDEPObWlYyijnLbxHPJx3ZVhjWGe9tgYeNB44FST8BeZlGSNKAfBByLs5/+9J3rAeZnrUCf5PbamuZE=
X-Received: by 2002:a81:71c6:0:b0:318:38d5:37f3 with SMTP id
 m189-20020a8171c6000000b0031838d537f3mr18684619ywc.268.1657539008767; Mon, 11
 Jul 2022 04:30:08 -0700 (PDT)
MIME-Version: 1.0
References: <CACRpkdZh8GdZzGsJ=h_E8RPgAHX8HqXs1871w95TVZD0SXHbkA@mail.gmail.com>
 <CAK8P3a2fXtAHJL7-Qs0dm3fwjFn0NvmotfpeW2zUOqh9ymK2cw@mail.gmail.com>
In-Reply-To: <CAK8P3a2fXtAHJL7-Qs0dm3fwjFn0NvmotfpeW2zUOqh9ymK2cw@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 11 Jul 2022 13:29:57 +0200
Message-ID: <CACRpkdbEiLfONF_=RAonyJCdgzOPo2BQuaeu1SxZgSn1qt8rog@mail.gmail.com>
Subject: Re: [GIT PULL] Delete two DaVinci boards
To: Arnd Bergmann <arnd@arndb.de>
List-Id: <soc.lore.kernel.org>
Cc: SoC Team <soc@kernel.org>, arm-soc <arm@kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, Sekhar Nori <nsekhar@ti.com>, 
	Bartosz Golaszewski <brgl@bgdev.pl>
Content-Type: text/plain; charset="UTF-8"

On Mon, Jul 11, 2022 at 12:44 PM Arnd Bergmann <arnd@arndb.de> wrote:
> On Mon, Jul 11, 2022 at 10:11 AM Linus Walleij <linus.walleij@linaro.org> wrote:

> > two patches deleting two unmainatined DaVinci boards.
(...)
> Your git tag description however needs a little more background,
> I don't want to pull this and bypass the maintainers with a one-line
> commit text. Can you update the tag to describe more about why
> speeding up the removal is important to you?

Tag is updated like this:

The following changes since commit f2906aa863381afb0015a9eb7fefad885d4e5a56:

  Linux 5.19-rc1 (2022-06-05 17:18:54 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git
tags/davinci-boards-delete-v5.20

for you to fetch changes up to b4aed01de48652928c8299f793625936f14d1739:

  ARM: davinci: Delete DM646x board files (2022-07-01 14:10:20 +0200)

----------------------------------------------------------------
Delete the two DaVinci board families DM644x and DM646x.

The reason why I'm pushing for this is that I have floated
patches to update the board files to use GPIO descriptors,
iterated and fixed bugs in the patches reported by reviewers
and build robots, and then the patches have not been merged.
See:

v6:
https://lore.kernel.org/linux-arm-kernel/20201103000158.325147-1-linus.walleij@linaro.org/
https://lore.kernel.org/linux-arm-kernel/20210715191141.430307-3-linus.walleij@linaro.org/

v7:
https://lore.kernel.org/linux-arm-kernel/20220507124536.171930-1-linus.walleij@linaro.org/
https://lore.kernel.org/linux-arm-kernel/20220507124536.171930-2-linus.walleij@linaro.org/

I assume this is not getting merged because of lack of interest
in the platform, and such things happen. To save myself and
others from spending work hours on maintaining and modernizing
a platform that is not used, delete the board files.

----------------------------------------------------------------
Linus Walleij (2):
      ARM: davinci: Delete DM644x board files
      ARM: davinci: Delete DM646x board files

Yours,
Linus Walleij
