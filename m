Return-Path: <SRS0=5jFp=JJ=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF455C433B4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Apr 2021 16:03:30 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BF3786124C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Apr 2021 16:03:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BF3786124C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=WIewluVLWfTs2L1uPfoke+idyBu/A/319uIe0G8K9jc=; b=d0aKmVhCGvt06aobmQB4yYlkE
	uHE0ecluoiqvr0j9MAtKdBFcuR1d93kfgvZsbKF37vdezw08fT1EtnWoJBqwg9mkAyRcDtIFvm9id
	N+aVH4V1d8qvgIeJbJ63ZQNe21I72gtPDIdKawRX5w08wnp3QIfQMCRzpdbbpKoHL0dEj74Q9AGdy
	YhxY2Zg6Q/KJLFPRpafwjZ826SrKKVZsE5LH/G5ykd7liWiAdDJuA5oAZ09qGv3mvRXuICzQQF0Nt
	S8Tkn3y33ab3SEzRNylXZptWWN3xTcKt2x/sAaK1OCiVww3EvsRBeU0UCSZUhYqmtlpzZ4Z/QpzTM
	+sn41o9GA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lVz0E-007BRB-NA; Mon, 12 Apr 2021 16:01:31 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lVz08-007BPk-9v
 for linux-arm-kernel@desiato.infradead.org; Mon, 12 Apr 2021 16:01:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=5CtEYzn7kIwgucylcxTz9N8ey3nUOdntfUbQ88bxuCE=; b=0d0xG1C7lAh1koAhIHI3Om/Cat
 87+y/wYAEA78haXUQUuByDxa2UkG/RpA8yN3CNjBmw9VPlghW8DqeHug8ELKdgQAGYj3ywBmEiKqd
 IEm+1IGAzLfyHb3qBXWGUKHpag3AOrgWSK/jAwu1Psb7BKmPKesCNO3Pp4IXZEIurZVERPt4lNp22
 e53qyo8nTLS7W4LJgtbmQlF2bQK7bv3Uru54piORmCXDXfe2kU18PG4fSpUTIwy38cuudiiGAhdU2
 QCyfEruaO+x5A9KUqfZxL69BOARZcMkkwi1lLuZeXYuZS3wrJgpbecj9xwLZv8z/13ZNHiGX4+U4Z
 D2KMK7QQ==;
Received: from mail-ot1-x336.google.com ([2607:f8b0:4864:20::336])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lVz05-006Mxr-Ae
 for linux-arm-kernel@lists.infradead.org; Mon, 12 Apr 2021 16:01:23 +0000
Received: by mail-ot1-x336.google.com with SMTP id
 s16-20020a0568301490b02901b83efc84a0so13209847otq.10
 for <linux-arm-kernel@lists.infradead.org>;
 Mon, 12 Apr 2021 09:01:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=5CtEYzn7kIwgucylcxTz9N8ey3nUOdntfUbQ88bxuCE=;
 b=f+N61ZZEKv3sMaFIhuG/mjI1//fMUJZYO6yOBVZ7MxDa5r9bneo8QNZeQfgypRXxbP
 wtlu0EOAlLpFfy/BCPC+mA4AqQCbsc6Y0Zl5kQi0SXblVNBu2tXIw2LnuHYj/aFeu1N3
 +ki+1g/DMJfJJuskmsATMHwApEASlmvK14N05xaldnD6YzT6nvcM3nOLWOKdy5dOVCgR
 weqmJs6fUcUh46L712+j+AjrwdAU4oEJ9bYTF0C/WKUN0nj4/nnL2qRASYugOlljNA7l
 3h1YcRSZ0eXcR0su+rxeWTFzIQzS84j17GFIidQvOCx6J6+QfVUKBBpsvf2XZ8/NvsNy
 ngXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=5CtEYzn7kIwgucylcxTz9N8ey3nUOdntfUbQ88bxuCE=;
 b=P5y7pII/bsokPCxNz/ROGL9U2vXvmyf+Yawhq8tYSyORCJjo4y2pfd/LFadU06d2Ch
 aMO2fdSFaDiilucXOJLduhmD0uUTeaicgbarh0R2DqJ5HQCP53FcnDdLpUwhSOouzQDt
 WRotLj+tt4RykXK+xWGsiv0fOjxy8qSNaON86bPNJP87ZwKd2k8GPuapdb4E4eNkDQtE
 8Vc3rcZi8GNR0QRIjDfhtpqLGNkGH0i61ptx0HZqS4BAa+PGuFyxfNXQSVmB8ihZFSEH
 j4Bn9Qfn039oWjpXaO74VlDdIGVztXMEGorB2OJDM5fBT6PNNcwLGKZjsDh7gYBhWDn/
 Nj6Q==
X-Gm-Message-State: AOAM532ssWRjVpN358/CFTYA4hFbtOLsg1B2SKFfSMNZThbkR886Luyc
 M9twJm9MZLRqgsLy5LajbM/q9P03z3uYVg==
X-Google-Smtp-Source: ABdhPJwS38KMUVg12cbP/tOlpohlU/ohYYS3v7TQUu9ZHOsy/jn9DdfMfY39UoC8kf+BB65AOqhl0A==
X-Received: by 2002:a9d:7003:: with SMTP id k3mr24903296otj.351.1618243278839; 
 Mon, 12 Apr 2021 09:01:18 -0700 (PDT)
Received: from yoga (104-57-184-186.lightspeed.austtx.sbcglobal.net.
 [104.57.184.186])
 by smtp.gmail.com with ESMTPSA id f8sm2730348otp.71.2021.04.12.09.01.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Apr 2021 09:01:18 -0700 (PDT)
Date: Mon, 12 Apr 2021 11:01:16 -0500
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
 DTML <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Linus Walleij <linusw@kernel.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Alexandre Torgue <alexandre.torgue@st.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Tony Lindgren <tony@atomide.com>, Shawn Guo <shawnguo@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Nishanth Menon <nm@ti.com>, Tero Kristo <kristo@kernel.org>,
 SoC Team <soc@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Gregory Clement <gregory.clement@bootlin.com>,
 Florian Fainelli <f.fainelli@gmail.com>
Subject: Re: New 'make dtbs_check W=1' warnings
Message-ID: <20210412160116.GA904837@yoga>
References: <CAK8P3a1L8rWpR5b66v6Su8-m7-scA0wZQr_g_4KnV4dnrky6ZA@mail.gmail.com>
 <CAMuHMdWY0aGoAw6QfF5PQRFNFwAzNP9cmFCjbKnsSbHsMz45fQ@mail.gmail.com>
 <CAK8P3a3EaaTGvAYvffbf7AF-iaC05yMShdnTc2QMcKQGZv7N8Q@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAK8P3a3EaaTGvAYvffbf7AF-iaC05yMShdnTc2QMcKQGZv7N8Q@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210412_090121_461355_85D98C9D 
X-CRM114-Status: GOOD (  31.47  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210412160116.b9511TAN10iRQDQ58LPZ0J94vmGqvwMz2xXWh8JYMLY@z>

On Mon 12 Apr 08:14 CDT 2021, Arnd Bergmann wrote:

> On Mon, Apr 12, 2021 at 1:32 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > On Thu, Apr 8, 2021 at 5:08 PM Arnd Bergmann <arnd@kernel.org> wrote:
> 
> > >
> > > For this merge window, I don't think any of them are show-stoppers (Rob, let me
> > > know if you disagree), but in the long run we may want to gradually enforce
> > > a rule about not merging changes that introduce any new warnings, in order to
> > > have a chance of cleaning up the existing ones.
> >
> > This may not be as simple as it sounds, as DT binding updates typically
> > follow a different path than DTS(i) updates.  DT bindings updates may be
> > picked up by a subsystem maintainer, by Rob, or by the platform
> > maintainer.
> 
> I checked out the bindings from linux-next, which seems to have covered
> most of these. Sometimes it pays off to be lazy and merge them after
> everyone else.
> 
> > For trivial updates (e.g. adding a compatible value, and sometimes
> > extending a limit), a DTS(i) update may be accepted by the platform
> > maintainer before the corresponding DT binding update.  The latter may
> > even be merged one or more kernel revisions later, especially when
> > involving subsystems that are not traditionally rooted into platforms
> > using DT.
> >
> > Of course we could mention any expected warning regressions in our pull
> > requests for soc.
> 
> Right, that would certainly help. Some maintainers send all binding
> updates both to the driver maintainers and to the soc tree, along
> with the other changes that only go into one tree. That is of course
> also more work on your side, but it solves the problem entirely.
> 

So the same binding patch is picked up both in the driver and soc tree?
I was expecting that to cause (harmless) conflicts when things arrive in
Linus' merge queue?

Or are you saying people go the length to create immutable branches for
each binding?


I'm curious because it's fairly often that we introduce clocks,
interconnects etc where the macros from the dt bindings includes aren't
available for another release (so we use numerical constants and then go
back and fix them up later).

Regards,
Bjorn

> > > renesas/r8a774a1-beacon-rzg2m-kit.dt.yaml: csi2@feaa0000: ports:
> > > 'port@0' is a required property
> >
> > [...]
> >
> > I've replied to these as a response to your PR reply, see
> > https://lore.kernel.org/linux-renesas-soc/CAMuHMdWHLnXgBSjP7VKUdx-YNr9rSKFkE5Ge5q_tarU6HP9Lhw@mail.gmail.com/
> 
> Ok, thanks.
> 
>       Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
