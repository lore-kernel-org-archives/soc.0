Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36F80C433E0
	for <soc@archiver.kernel.org>; Tue,  2 Feb 2021 17:13:36 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 025BF64ECE; Tue,  2 Feb 2021 17:13:36 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id CCE4F64F50;
	Tue,  2 Feb 2021 17:13:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1612286015;
	bh=Yzgi/lqzGKBBv/XBXFstqgZQ204zzMmlRFOTXG/iEe8=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=lzC06x6PIqureLJaXjHhGr7yBlv7y950k3H1CLbYreoNwwdA+FZXuE4xF9Q3uKtzD
	 bA3zAvoEqP8knga2okNxcepYQk4DHsWmgcHFNncq3pYsKIWHP0+G4ESBYu9iiNoY3t
	 8pmeCQ3oWHf0zX6uqPxSAcHoqtJ5aWrkBZ4zPhPgiQByh+4s7TnoGMPSLlv5+Zglpo
	 xgetSRgE9fFKMbXt5JMbD1KdLF/m6hE4GdYA2oSClUiHgiFxxXwAyo6W9kVHW1hH2l
	 aKma24CE1FrjJDrdb+S7aWS8IXlncCyvGvEYElOrIemNIq227x9F+z9x5m6ODcb2Y/
	 aaqi9uF4HeTvA==
Received: by mail-oi1-f178.google.com with SMTP id x71so23493488oia.9;
        Tue, 02 Feb 2021 09:13:35 -0800 (PST)
X-Gm-Message-State: AOAM5304JllL9/kECg2mgLqnPG2nfY455JCnxY1CR6u2NS8765sT4xHY
	H2Bniu2n2JWt7nLNFCmMYN6BpKAk2vIEgaonm4Y=
X-Google-Smtp-Source: ABdhPJzsKtKC5cAyzOUnVPeZQ3CF4a9+qrldJJ6VTyNTkB1sIHubldU4c7t3nVtOYvnbMHskh/FSzDNODF1AK3N8jwY=
X-Received: by 2002:aca:e103:: with SMTP id y3mr3368110oig.11.1612286015070;
 Tue, 02 Feb 2021 09:13:35 -0800 (PST)
MIME-Version: 1.0
References: <20210121034130.1381872-1-lkundrak@v3.sk> <CAK8P3a2DYX3c-AMX9URSyrcQckY2UaRRTmnOwe=4q3P4cJ-t5A@mail.gmail.com>
 <CAK8P3a2Ub0w3v_H_0F84MPdQZ28vUgxdYNii7eVY0o9a_sg7DQ@mail.gmail.com>
In-Reply-To: <CAK8P3a2Ub0w3v_H_0F84MPdQZ28vUgxdYNii7eVY0o9a_sg7DQ@mail.gmail.com>
From: Arnd Bergmann <arnd@kernel.org>
Date: Tue, 2 Feb 2021 18:13:18 +0100
X-Gmail-Original-Message-ID: <CAK8P3a0h8r+K3cKKRJD6-rZ9H=F8ciKgkN6+XEF61scLbEqGOw@mail.gmail.com>
Message-ID: <CAK8P3a0h8r+K3cKKRJD6-rZ9H=F8ciKgkN6+XEF61scLbEqGOw@mail.gmail.com>
Subject: Re: ARM: dts: mmp devicetree updates
To: Lubomir Rintel <lkundrak@v3.sk>
List-Id: <soc.lore.kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, Rob Herring <robh+dt@kernel.org>, 
	SoC Team <soc@kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	DTML <devicetree@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, Feb 2, 2021 at 5:41 PM Arnd Bergmann <arnd@kernel.org> wrote:
>
> On Fri, Jan 22, 2021 at 3:09 PM Arnd Bergmann <arnd@kernel.org> wrote:
> > On Thu, Jan 21, 2021 at 4:41 AM Lubomir Rintel <lkundrak@v3.sk> wrote:
> > >
> > > chained to this message is a handful of patches related to MMP device
> > > trees and bindings. Please take a look and consider queueing them for
> > > for 5.12.
> >
> > These all look good to me, but I notice that a lot of them seem to be
> > bugfixes, so please have another look and decide if any of them should
> > go into v5.11 and perhaps backported to stable kernels as well.
>
> Hi Lubomir,
>
> not sure if you missed my earlier mail. To clarify, I have not applied
> any of the patches so far. Can you recheck if some of them should be
> part of the v5.11 release so I know which tree to apply them to?

Nevermind, I just found your earlier reply in my spam folder. Applying
the patches now.

         Arnd
