Return-Path: <SRS0=Xwgf=S5=arndb.de=arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73F81C433F5
	for <soc@archiver.kernel.org>; Mon, 14 Feb 2022 19:13:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 43ED6C340EE; Mon, 14 Feb 2022 19:13:33 +0000 (UTC)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id ACCA7C340EB
	for <soc@kernel.org>; Mon, 14 Feb 2022 19:13:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org ACCA7C340EB
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=arndb.de
Received: from mail-wm1-f53.google.com ([209.85.128.53]) by
 mrelayeu.kundenserver.de (mreue009 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1Ma1wa-1npduf2kBY-00W1hD for <soc@kernel.org>; Mon, 14 Feb 2022 20:13:29
 +0100
Received: by mail-wm1-f53.google.com with SMTP id x3-20020a05600c21c300b0037c01ad715bso57098wmj.2
        for <soc@kernel.org>; Mon, 14 Feb 2022 11:13:29 -0800 (PST)
X-Gm-Message-State: AOAM531GA7VWHAH3mI5vN8JrsDy+DByMArMVwFR+kCv4+DEGIYtEXOK8
	+Qk14p7xt6a5EyvJ83+WZAHyTHetdNFkxSpsX2I=
X-Google-Smtp-Source: ABdhPJyJlY94tBVkGpgY9F9Fep611CS7TPV4PO1eAfR5mWbxDC/4GiIdtTlhmZnlrcELAnMXaJ51at1SiHDsXIIGmao=
X-Received: by 2002:a05:600c:2108:b0:34e:870:966e with SMTP id
 u8-20020a05600c210800b0034e0870966emr84692wml.173.1644866009298; Mon, 14 Feb
 2022 11:13:29 -0800 (PST)
MIME-Version: 1.0
References: <20220207184652.1218447-1-michael@walle.cc> <YgpkCyoSMg5RYfkO@google.com>
 <YgpkQMbhWAJG6oCh@google.com> <CAK8P3a0UWO=h6K4NpzCVC2vbOvThJH28GM5ddm9U1crr1Su7vQ@mail.gmail.com>
 <YgqE/OvNDco5wEY3@google.com>
In-Reply-To: <YgqE/OvNDco5wEY3@google.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Mon, 14 Feb 2022 20:13:13 +0100
X-Gmail-Original-Message-ID: <CAK8P3a1aqcsD-fGBgAmsi0qf9Td_y3Ry+o32Z1fU8H3qmEn0GA@mail.gmail.com>
Message-ID: <CAK8P3a1aqcsD-fGBgAmsi0qf9Td_y3Ry+o32Z1fU8H3qmEn0GA@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: add myself as a maintainer for the sl28cpld
To: Lee Jones <lee.jones@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Michael Walle <michael@walle.cc>, SoC Team <soc@kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Olof Johansson <olof@lixom.net>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:94Bn+9VxOkxTnwLBH6AtKA6wOWV7qSZWUE4FVpEvHsM46ZzU76r
 m6OGGJVRmEhp7aZCW14ykoJAmHA3Qs3PvHXH/venbymQXW5S5vtbX4PUeADBQWb4WziZyYL
 6RM88hw+EBK7bNmYUm6lzjSKO9g09px8HwFhaoHbeK3AdpCxzXaxHG4qv4lrwcy4Af9lH4x
 gCgUcbUTy9fbGO29MHG6w==
X-UI-Out-Filterresults: notjunk:1;V03:K0:O7KiXJGlS04=:Rsdyh+ofMy/TwKD4rPA+GM
 CaUR6Y2UDr6UHklE6woKF8oAYq0chXG9jLw0ErSNa58wEqRWmD0mxNpsAxgRftP+EKrEef2jv
 iGLPJ0QDAv6pr0nPbkNlM+qIrFYEglbJ7AObox+/94ExSbNpmcgZCa+nlPBw1tpiuIE3CdBDz
 CoCMjKb/o+gL3XceQ8knOa4bj9X8fY+rAfOERNnzDi89mcuPJrB3uGWjzpxU9SYLiItpNXs7z
 a82TfzT6oF+zqiTRib3AQtoPox24avm16nqX9et/8cFOz/jVQor1q/OPCwZLZ9Wt3/TM+8T6P
 vFGo0bOEKmz/z+KGZMMRX9yAH/jTEVoP6hdUZLWxnaiTluMayYd+Cc4z7h/q1BK5yBgqh8q9y
 qrsCeshwhWuaA4esvnGR2Tgnd0etTxmOANZWKmJvrD/WXM9YYFRjLYey9WZs+huUyzOOp+yy/
 equm7NpvJbuRL9YeyOgADojiG4XDKGzjclMH6H/yC0yM7JoMCkHi/GVA5KmU8P7pL0SVacVk4
 JwbEnjESyKCIAi1dZzYZJhA7YGIqAgL0bmnpyA2gJ5a2umVWqypCbbyRUcSVdfaEmiaoKh0Pc
 cMC8d5RyD6Q+ITH4cnkOwze7I1flRqanuQDtl3kJDd8vA9NQlijC2yCx6gurSUGekdqpPTEuA
 16HBEIAg325dnusdL277d2IwlbAZAsITxiQbb0IkjN4JTrZPsFLs3ftfzjxJGKLRn4cKgp8ya
 h5rNPNLWFtoqkR6IJzu9xJFnzoocosB7Jha+MbfG5ONqyvKlqjC8hj1y/yCwDLYh7DqFBmeNv
 n910fk6+y5pOpAN0Y1BLOuWOTNgpe5Tq181Ugpl1GZmuJmXHuA=

On Mon, Feb 14, 2022 at 5:36 PM Lee Jones <lee.jones@linaro.org> wrote:
> On Mon, 14 Feb 2022, Arnd Bergmann wrote:
> > On Mon, Feb 14, 2022 at 3:16 PM Lee Jones <lee.jones@linaro.org> wrote:
> > >
> > > Hold on, you're not going to get many Acks if you don't send it to the
> > > other subsystem maintainers. :)
> >
> > I've already applied this one through the soc tree.
>
> You did?  I missed the acceptance email.

I see now that the automated mails only get sent the submitter and
the list that is owned by patchwork. I completely missed how this
was sent to multiple maintainers and just grabbed it from patchwork
along with some other maintainer changes I picked up.

> It would have been nice to give the other maintainers a chance to look
> at it first, but I guess it's not a big deal in the great scheme.

Right, I need to find a better process to look at the actual emails
when going through patchwork. Sorry about that.

         Arnd
