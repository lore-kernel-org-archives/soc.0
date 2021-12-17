Return-Path: <SRS0=XNqx=RC=arndb.de=arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D48C7C433F5
	for <soc@archiver.kernel.org>; Fri, 17 Dec 2021 16:11:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id BAB0DC36AE7; Fri, 17 Dec 2021 16:11:05 +0000 (UTC)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 81A52C36AE1;
	Fri, 17 Dec 2021 16:11:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 81A52C36AE1
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=arndb.de
Received: from mail-wr1-f45.google.com ([209.85.221.45]) by
 mrelayeu.kundenserver.de (mreue011 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1Mati7-1mNYEB1nqt-00cMdQ; Fri, 17 Dec 2021 17:11:00 +0100
Received: by mail-wr1-f45.google.com with SMTP id i22so4926782wrb.13;
        Fri, 17 Dec 2021 08:11:00 -0800 (PST)
X-Gm-Message-State: AOAM530jegvsQFwOMLjCnUYnnl1BaF48rbNeopYDTVPSRrJxRqIQn/1S
	zSTBynVdbnSAA5U5PYyRujn8CZm/KRlJResuMLo=
X-Google-Smtp-Source: ABdhPJyRMqlCm9oM4/6HkLIIRw91n15vAuP9POgQRnbi3DunXAWqw7Gf6RA2oyTa80FOiPp7vdpBNgSC57+ieFUaBHk=
X-Received: by 2002:a5d:6989:: with SMTP id g9mr3049267wru.12.1639757460078;
 Fri, 17 Dec 2021 08:11:00 -0800 (PST)
MIME-Version: 1.0
References: <20211217154921.cagzppcensxx6wm4@pension> <20211217160007.etfr5urg76j2n5sf@reissue>
In-Reply-To: <20211217160007.etfr5urg76j2n5sf@reissue>
From: Arnd Bergmann <arnd@arndb.de>
Date: Fri, 17 Dec 2021 17:10:44 +0100
X-Gmail-Original-Message-ID: <CAK8P3a0nPN=e1QaLPaf5TLJgj19SE5OQ2D3YWM2KepM6r+oh7Q@mail.gmail.com>
Message-ID: <CAK8P3a0nPN=e1QaLPaf5TLJgj19SE5OQ2D3YWM2KepM6r+oh7Q@mail.gmail.com>
Subject: Re: [GIT PULL] soc: Keystone driver update for v5.17
To: Nishanth Menon <nm@ti.com>
List-Id: <soc.lore.kernel.org>
Cc: Arnd <arnd@arndb.de>, Olof <olof@lixom.net>, SoC <soc@kernel.org>, 
	arm-soc <arm@kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Santosh Shilimkar <ssantosh@kernel.org>, 
	Tony Lindgren <tony@atomide.com>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:kqNwRq2iEMO/L3TOM2UkRKW7kvcTqcv+Yysb2+6uSZNvwZGu8RY
 qZW9XAL4DWtehLyvV5T3d1Ud1F3S3U5RS/qwpHsJd4TGxYNQsKG6XlsmZeO7EHCZxHwo292
 ouytsb0KJNM6I7+gok9l1TgpnY6c8y1OzSKkZnOMi+vWJb7rSWtYLotwMuCtvLRe12MLn6G
 hEVbP+zaBU69yWE6aGPGA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:uUXLDTzpJuk=:XPrE69+HUtk8at0Mg2m4WP
 zYDIfawlXff1wCUrACvsOViUbDM7QS8+9oMK02WnCo3EmvNE1jwyJ8oLcbijrGiERDIcyXmjx
 s60gtc/dVlPZ6LqUtreXpwCYbWRbHxq4AUxDIdcCm6/G2mdVy0IAcVgme6ESivn6bT2Ka2pBB
 xVeeHKPhYfyAnzaRAgx3cqofN1fd8mTzigT+lCDTB0Usi9XhxZgzkrMrlhaop0kPXq/g0cvun
 TOUMMP4FROs137um3vjkAVMTmBy+azfe8QPOhwcA5rT70awkSC7NA96yAqcNl392ErltxnegR
 yEtXth6xrfW7eopAiwPSHn5XYwfewBbHYz3VtU5kPuV1gfQw2fXCWT82WUlhrYw1ov4CnDKEO
 fVggx0opDtbIWrQOZID5RZA068SSCjQ/VC5wH5vqs1wXZIJSQJ1k9d9SbUEcY9fMNHA7YDpYt
 6IUTcKLj/BwlQS/V9GtjVmOU0voy8jnyIlmaI26WezM3PYfhTuWjSl8kfKME8tp2p4V37QiDp
 /7kdrrJH/sLJ2h/DGUZDxPMp1sCUvx3NszGWMeuVD0oYx/gulbmp8mfs/IRXlK7R4v0rmcy6P
 9nUYcUBL7drelP9r1SWF4ccAMcHT/HxF+26nGOg/tvPypLB8hsZXjFOQyprqdviPJUJO/CkmE
 qVdWOYZKvU1HL1gur5278TTThz28pnl+zTHFq96wQOMEjV5hFN+l73654MmNJ1F7zhlLd6gyH
 VyCJ0ONpMdIAucWJLvYELznnpsIS2SOSHrwmRkYT/H/E+v03QHwjJmEzHQVPgF9sxuRSABOEh
 xtGhVxDSK7mHzljqTFGftGsdJByCUEdMYMvtwn+bSlOI0IyW0Q=

On Fri, Dec 17, 2021 at 5:00 PM Nishanth Menon <nm@ti.com> wrote:
>
> On 09:49-20211217, Nishanth Menon wrote:
> > The following changes since commit fa55b7dcdc43c1aa1ba12bca9d2dd4318c2a0dbf:
> >
> >   Linux 5.16-rc1 (2021-11-14 13:56:52 -0800)
> >
> > are available in the Git repository at:
> >
> >   git://git.kernel.org/pub/scm/linux/kernel/git/ti/linux.git tags/ti-driver-soc-fixes-for-v5.17
>
>
> uggh.. Could have been tags/ti-driver-soc-for-v5.17 mostly fixes threw
> my thought off a bit there.. - Do let me know if you folks prefer it
> as ti-driver-soc-for-v5.17 instead of ti-driver-soc-fixes-for-v5.17
> and I can retag and respin the PR..

I don't care about the tag name. However, if any of the patches qualify
as bugfixes that make sense in 5.16, please split up the branch into fixes
and new work and send them separately.

       Arnd
