Return-Path: <SRS0=Xwgf=S5=arndb.de=arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99C2BC433F5
	for <soc@archiver.kernel.org>; Mon, 14 Feb 2022 16:23:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 6A177C340E9; Mon, 14 Feb 2022 16:23:07 +0000 (UTC)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.135])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id D1752C340EE
	for <soc@kernel.org>; Mon, 14 Feb 2022 16:23:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org D1752C340EE
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=arndb.de
Received: from mail-wr1-f43.google.com ([209.85.221.43]) by
 mrelayeu.kundenserver.de (mreue010 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1MtO06-1o8jqT3Jq2-00umyt for <soc@kernel.org>; Mon, 14 Feb 2022 17:23:03
 +0100
Received: by mail-wr1-f43.google.com with SMTP id q7so27645238wrc.13
        for <soc@kernel.org>; Mon, 14 Feb 2022 08:23:03 -0800 (PST)
X-Gm-Message-State: AOAM530HH8F9M8+p4UTQzbmz5upYJAAzTz5lf6CPPVBX1xKgp5QcOp7T
	Z7AUYC9gLI3vZKWNjzLY28Tm/rOsGh6I3GTnGBw=
X-Google-Smtp-Source: ABdhPJyG+jgpVi3VfDfCUUdvqz8L8f7kQFYsusxm0coFeTiylsS6SErvSFrlMbDk8neM8L62+ULjFBu3y9eBOV0ciJc=
X-Received: by 2002:adf:e5ce:: with SMTP id a14mr303823wrn.317.1644855783467;
 Mon, 14 Feb 2022 08:23:03 -0800 (PST)
MIME-Version: 1.0
References: <20220207184652.1218447-1-michael@walle.cc> <YgpkCyoSMg5RYfkO@google.com>
 <YgpkQMbhWAJG6oCh@google.com>
In-Reply-To: <YgpkQMbhWAJG6oCh@google.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Mon, 14 Feb 2022 17:22:47 +0100
X-Gmail-Original-Message-ID: <CAK8P3a0UWO=h6K4NpzCVC2vbOvThJH28GM5ddm9U1crr1Su7vQ@mail.gmail.com>
Message-ID: <CAK8P3a0UWO=h6K4NpzCVC2vbOvThJH28GM5ddm9U1crr1Su7vQ@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: add myself as a maintainer for the sl28cpld
To: Lee Jones <lee.jones@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: Michael Walle <michael@walle.cc>, SoC Team <soc@kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Olof Johansson <olof@lixom.net>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:vCOL9lSsRHn57mApfY/iBf6D8R6bMyjIHH54Sz0VmKQX/kg2YIa
 rAS1ZB5j7KU94VgXfiQ++ABi20zuDGF67Eg7/i/7w5004DNovCBxdj/rrMLSQoIPgMWZLuw
 pvfZ4cCu7tgOGNqqWqEcdqIhmXmuJvGfBI9+w1GAnjDfTGWzYCwignB0N1TPMcWtmYsZG0E
 ZvWTcUpAUesp2B0U12Blw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:xM44i3/Swiw=:Wbh/5e++iVxG3zsg+OurKH
 b8ZxiDKtui8XYfkqMncR6MsM90p7Urx9tqhXSfqBSIVWKI0LXqCOCB2lQgDKQ5Wha49wZbC4R
 njHpB/C3L8zxHwsHcFe4oFMeoe8WFSGkev92WNzrloHj9FZkap8htsPm7sOcACEuq0eT8Kqwz
 FTwrB7Xq+tiErsTBYongkO2JM0vBkyD2Da9oLV+mUvKA6gdA+Enplts5eAOf944+yYcJuIPjv
 7h7HPPRNxgLLWUseBKeRM4VVmlDhxSmF7e51bm5iGsHtnkzxkRlZAD5xHv9xLSmgcWC5PwpJN
 Pg9J4sJo5StT+EguOToy4K+29Z45oNSkWhUiLY64HHWe9JLU3w9D7ka3xZCfehvBBXYgTo0CN
 Vjwoy97zbOr+lafC2PSByJxgrYiSRodnD7PRWSEQvNBzOkXqxd+tRdLvu+wXZGwgt+v6GKHzv
 y1ztGkyYsK+YNuFCWea43IgsWjnupQMuCeS3b7qUQoKZNhra3WBjN4lt9PhOzH56KidRvNxTr
 LkKGELj/WIgFzCi6dZJAJebuYy/7ibqoidykWc/015ofQ+5+TyWRq02XvsP1KdLayr9p0gkZ8
 qrXPQxmkumnzyFB6I8fZWs+9WGD2rCBRnA4KaiIhI7AAcKbSG141BGHlWQPTWXznXmB1hQn8A
 gfh2H66BkDatLGI3BXIRKSOxV7RLxjalB9X1scATJQH3Uh2snuvmO0erGNApq4XvFtic=

On Mon, Feb 14, 2022 at 3:16 PM Lee Jones <lee.jones@linaro.org> wrote:
>
> On Mon, 14 Feb 2022, Lee Jones wrote:
>
> > On Mon, 07 Feb 2022, Michael Walle wrote:
> >
> > > The sl28cpld is a management controller found on the Kontron SMARC-sAL28
> > > board for now. Support for it was added by me quite a while ago, but I
> > > didn't add a MAINTAINERS entry. Add it now.
> > >
> > > Signed-off-by: Michael Walle <michael@walle.cc>
> > > ---
> > > Hi,
> > >
> > > since this affects so many subsystems, I'm not sure through which tree this
> > > should go. I'm sending this to the arm soc maintainers because it's an
> > > aarch64 board where this driver is used as well as Lee as the MFD
> > > maintainer.
> >
> > I'm happy to take this, if it pleases everyone.
>
> Hold on, you're not going to get many Acks if you don't send it to the
> other subsystem maintainers. :)

I've already applied this one through the soc tree.

         Arnd
