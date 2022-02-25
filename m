Return-Path: <SRS0=2Acm=TI=arndb.de=arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85392C433EF
	for <soc@archiver.kernel.org>; Fri, 25 Feb 2022 15:40:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 5740EC340F0; Fri, 25 Feb 2022 15:40:42 +0000 (UTC)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id B10D8C340E7
	for <soc@kernel.org>; Fri, 25 Feb 2022 15:40:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org B10D8C340E7
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=arndb.de
Received: from mail-wr1-f50.google.com ([209.85.221.50]) by
 mrelayeu.kundenserver.de (mreue108 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1N6svJ-1oIHmr36b9-018OPg for <soc@kernel.org>; Fri, 25 Feb 2022 16:40:38
 +0100
Received: by mail-wr1-f50.google.com with SMTP id s13so5112405wrb.6
        for <soc@kernel.org>; Fri, 25 Feb 2022 07:40:38 -0800 (PST)
X-Gm-Message-State: AOAM532zDl+ud9h8Jcon6kHx194AraQwRSYPc7gPdPwOc02lV9r4ofg2
	CaEZljyUiJ8xI3w3JqghkhPRWSngVUiDEKqF7pg=
X-Google-Smtp-Source: ABdhPJx1KEcCNxt3FKdT6ApHqxin3/C+mjgE79Fi8b5IRMXGnYh1Bw71e4DrmsRWju2tavx3lwUXsMaQG1cKr9aQ6kI=
X-Received: by 2002:adf:a446:0:b0:1ed:c41b:cf13 with SMTP id
 e6-20020adfa446000000b001edc41bcf13mr6990307wra.407.1645803638423; Fri, 25
 Feb 2022 07:40:38 -0800 (PST)
MIME-Version: 1.0
References: <20210726200158.3442800-1-u.kleine-koenig@pengutronix.de> <20220221121412.st63puug6tcpjq72@pengutronix.de>
In-Reply-To: <20220221121412.st63puug6tcpjq72@pengutronix.de>
From: Arnd Bergmann <arnd@arndb.de>
Date: Fri, 25 Feb 2022 16:40:22 +0100
X-Gmail-Original-Message-ID: <CAK8P3a0XZ46bGAHWb_1iNgsUcV9gFJeJwqzJcyw5_WA2tvYQAw@mail.gmail.com>
Message-ID: <CAK8P3a0XZ46bGAHWb_1iNgsUcV9gFJeJwqzJcyw5_WA2tvYQAw@mail.gmail.com>
Subject: Re: [PATCH] ARM: mmp: Fix failure to remove sram device
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
List-Id: <soc.lore.kernel.org>
Cc: Lubomir Rintel <lkundrak@v3.sk>, Russell King <linux@armlinux.org.uk>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, Sascha Hauer <kernel@pengutronix.de>, 
	SoC Team <soc@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:0WN/hzp5Du7XuAUKJjFDAtLv4EZXjRYp3SuVfM6zFOJnZpLjiiI
 4Kd86RNfuI2nUact6uBKtH+EmppsqXR4aPbTYn2KvwcD2kwFP9zIKVEvMgKmzeiMYTAOxT4
 ydJWP+zw4bJcJl/rPEUjam957fOpafvX87w4x18QT3MDN5DifIE9n7TGRtNQi5fud6LNfcL
 0NrnNGNtnB1bLuhGkJE6Q==
X-UI-Out-Filterresults: notjunk:1;V03:K0:dAUPyAq5GbI=:czYJeJah+W24Uqj52KkSil
 A9FCzkg2TU9wWPAAj4v3t3VPMzEbFYDEWLr2Bt41P+PFMhr1g4q76LYvdHev02Lo0PRm8FyaH
 oFww+mo/W1jjb0ocRdAlqx3MC6mu6Ky5wmxak/6FVZpVr8gdzZuJhczR3PN/pKHmFMDz3v1de
 3BAbt1XOnPJMSoRWdLZ2hd61qBQlHtR85C80dvHtumyufL+EnJw6KGxe0f9Hyp7BTksSYb1P6
 nKJ9k2BS4ms80WxRzPqHbgOggblf7r6bds8YuQcnqbfL+VXPMcdZMtk7ExAOHTAno709Ta5tB
 R1UDMbKYmZ0TO4gbV4rqlw6JTkKSlYyyUmS2n7Te16Nstn0eyY0qHU5/MqS+337qZpbJBn04t
 Bn2KRlVbo7v6XzmGv7wvZfbEZ9Y9LRQMuUL17hm2ZnF2IdNlht/y8UewFJbHSBAB68hd5qlA3
 PXLbwI+n87npANk3AHpEb5tOLTYiJH3JIR+8S9fkq6sEYCEiTxct+TzIceeClwwglh2TRDYIT
 pCvqo9Gz1R5FZe7J+f6vGR6fjRAcC2anqRaXHDUqz57rTBxTAnX6UrMaddDqvrBvj3+DcNs7j
 pGyFM/CslktxnqLFIZ69TjRgn7OVCQ+/AGWg9GdTqPwG7GQ1NjKsw/xy6C0c1RMXc6glU8IXe
 vMaSG5f6vbivlwRQ49ieVJALTpFKcgyNjKPhHnJMO9t6GU7HIydlW+T8SM+mNbl2JjUZ0ajwe
 5y40KRO0ZGojTKKHrNaPAUZDBoATyHwE4b/J9ejkq6FHifjxwOrK4oyvGkE+VfTok5RhZzxcl
 D6Ymju/FdE4MxfIFYrk58N6nIrLt8NbdVlCGjSJW4tzZXH8hXM=

On Mon, Feb 21, 2022 at 1:14 PM Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@pengutronix.de> wrote:
>
> [adding soc@kernel.org to Cc]
>
> On Mon, Jul 26, 2021 at 10:01:58PM +0200, Uwe Kleine-K=C3=B6nig wrote:
> > Make sure in .probe() to set driver data before the function is left to
> > make it possible in .remove() to undo the actions done.
> >
> > This fixes a potential memory leak and stops returning an error code in
> > .remove() that is ignored by the driver core anyhow.
> >
> > Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>
>
> This problem is still real and the patch not applied. Who feels
> responsible to pick this up?

I've picked it up manually now, thank you for looping us in.

Note that I almost missed it again though, if you really want my attention,
send the patch to:soc@kernel.org so it makes it into patchwork. At that
point, I'll have to either apply it or actively discard the patch from ther=
e.

       Arnd
