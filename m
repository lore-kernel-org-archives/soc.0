Return-Path: <SRS0=xDNJ=HL=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9D68C433DB
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Feb 2021 02:06:57 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 315DE64E42
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Feb 2021 02:06:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 315DE64E42
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=UGKpwu+xMn4hehx7ns/FWp2jRcNlcuUzgRx8ka7Rt28=; b=vCVvDHRmXzENXK7rUEqvQxpqw
	sZs7p/1pG6QMQq04Q1IfY8XIBLbwx+zZNTdq5lrmYyGK5mDTuCSE0GlJ1Ux/DERYlhRi51B3YsCrY
	KvfUqL/yuSQ6Dyt/new1HzIvZU11i3eBl+aQIHAo1b/Rbr3WCCCOHoo7qsDKDWUZqeMpe2+qwsOVr
	Sd3lSXxSf5lI8cRhg9wDOt3HhLF72mjHX41CqEX6+l51MLUa1qqbYzhwFOZMFRzvqXiZaLtXGeL8u
	b9v3pY/N67BSvqWfALT5bvOx73Ji2HXy0rDKh7FsTBQykIknbkFTKGChkVgg2m0B7C3aEYqupwBAX
	t7/y3lFBA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l9IPR-0008Gd-GQ; Tue, 09 Feb 2021 02:05:45 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l9IPO-0008G5-7b
 for linux-arm-kernel@lists.infradead.org; Tue, 09 Feb 2021 02:05:43 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id A57B264EBC
 for <linux-arm-kernel@lists.infradead.org>;
 Tue,  9 Feb 2021 02:05:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1612836340;
 bh=De6jaXpyyCHqlCZls+PmENTom8r8tBBlK8ArkHjZn0A=;
 h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
 b=uw4N2Uhy258F99XmRinrbQ+U/AaVnbNzL/DGihJTUq2D7XyCQXtUXvbqxO8cAhBg/
 HPqRp0npvO6F8T9XRCUGTCK5K9ppMzEHnKMDpWDTpAivR2jrwiOLm4/yLsNC5l7/5p
 2Erl5K61QioNWEnj+wzWPtdMmaf5b9Cx4/YrkhQcGNj7cZXsROcuxSh31rRQdh0LXA
 WxfH7vPcuD9aUWXymsH30x/oe4c1qeFz8W2JBPty+K0ZS3lOFnyEqE9Uf9HY4aDvbO
 045f9e5H3nqLXdPCKScvb1eQ3GcJi4K7jfUx0WERqD04AcknhK9FYJMWO/qezZ1NwY
 93BSs8EO2cAyA==
Received: by mail-ej1-f47.google.com with SMTP id bl23so28857540ejb.5
 for <linux-arm-kernel@lists.infradead.org>;
 Mon, 08 Feb 2021 18:05:40 -0800 (PST)
X-Gm-Message-State: AOAM533HebJbIyzny97bkXUEcqxOVT1ROqeEVXOP1adeuQVU11/lHkJy
 /DUdKlYmNo7xQbf4bUrLNjezclqAVP0pCRMRlw==
X-Google-Smtp-Source: ABdhPJyzUmEfXIMIL3Rls2y3K9U5Nr0w6OkPRTHSDeDshFBAbZY0V7hZ7AbPGzat3tMj/AhI43ofZOx4VbGcYIu0bVc=
X-Received: by 2002:a17:907:262b:: with SMTP id
 aq11mr13924998ejc.360.1612836339183; 
 Mon, 08 Feb 2021 18:05:39 -0800 (PST)
MIME-Version: 1.0
References: <20210204203951.52105-1-marcan@marcan.st>
 <20210204203951.52105-19-marcan@marcan.st>
 <20210208110441.25qc6yken4effd6c@kozik-lap>
 <cd67b2ce-9676-31b4-85f7-de1ec9b2bf72@marcan.st>
 <20210208191447.GA1677483@robh.at.kernel.org>
 <d8454963-3242-699b-4c20-e85d26b19796@marcan.st>
In-Reply-To: <d8454963-3242-699b-4c20-e85d26b19796@marcan.st>
From: Rob Herring <robh@kernel.org>
Date: Mon, 8 Feb 2021 20:05:26 -0600
X-Gmail-Original-Message-ID: <CAL_JsqK9RJPbD4BqhyYsQS2jsOXDAju9qEtTiEzbzay6v2U_iQ@mail.gmail.com>
Message-ID: <CAL_JsqK9RJPbD4BqhyYsQS2jsOXDAju9qEtTiEzbzay6v2U_iQ@mail.gmail.com>
Subject: Re: [PATCH 18/18] arm64: apple: Add initial Mac Mini 2020 (M1)
 devicetree
To: Hector Martin <marcan@marcan.st>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210208_210542_433689_44A22916 
X-CRM114-Status: GOOD (  32.52  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
List-Id: <soc.lore.kernel.org>
Cc: Arnd Bergmann <arnd@kernel.org>, devicetree@vger.kernel.org,
 Marc Zyngier <maz@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, SoC Team <soc@kernel.org>,
 Olof Johansson <olof@lixom.net>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210209020526.RGDMWzqjKgfbWn7_p5s17cIrIp1XxrdR5tU2OzBR4WM@z>

On Mon, Feb 8, 2021 at 6:49 PM Hector Martin <marcan@marcan.st> wrote:
>
> On 09/02/2021 04.14, Rob Herring wrote:
> > Does there need to be a legal entity behind 'The Asahi Linux
> > Contributors' to be valid?
>
> I don't think so, this seems to be common practice in other open source
> projects, and recommended these days.
>
> Some recent discussion on the subject from the Linux Foundation:
>
> https://www.linuxfoundation.org/en/blog/copyright-notices-in-open-source-software-projects/

Okay, that's good to know. I'd primarily seen this for Chromium which
obviously has a company (and lawyers) behind it.

> >  From a more practical standpoint, if we want to relicense something in
> > say 5 years from now, who do we ask for an okay?
>
> I thought that's what Git history was for; certainly we aren't keeping
> file headers up to date every time someone touches a file (which for
> anything other than trivial changes gives them a copyright interest in a
> portion of the file).

Yes, for sure. Especially since copyrights tend to be stale as the
blog talks about.

> Asahi Linux's policy for bespoke projects is to use "The Asahi Linux
> Contributors" for this reason, acknowledging that the copyright headers
> aren't up to date anyway (also the years...), and implicitly directing
> people to the orignal project (which is where Git history is kept and
> contains the true record of copyright owneship).
>
> I'm not trying to shake up how we handle copyright lines in the kernel
> here, of course; if you prefer some nominal copyright line from "whoever
> first wrote the file or most of it" I can do that. But it certainly
> won't be the only person you have to ask if you want to relicense, if
> anyone else touched the file in a nontrivial way :)

No, it's fine as is.

> There are a few examples of this style in the tree, mostly pulled from
> other projects:
>
> arch/arm/oprofile/common.c
> drivers/gpu/drm/vgem/vgem_drv.[ch]
> drivers/md/dm-verity-target.c
> drivers/md/dm-verity.h
>
> >>> I guess Rob will comment on the dt-bindings more... but for me a generic
> >>> "arm-platform" is too generic. What's the point of it? I didn't see any
> >>> of such generic compatibles in other platforms.
> >>
> >> This is a hack for patches #11/#12 to use, and I expect it will go away once
> >> we figure out how to properly handle that problem (which needs further
> >> discussion). Sorry for the noise, this should not be there in the final
> >> version.
> >
> > I was going to ask on this. If you have a user of it, I'm okay with it.
> > Generally though, 3 or 4 levels of compatible don't really have users.
>
> The pattern here was board, soc, "arm-platform"; the first two seem to
> be a common (and useful) pattern, and I hope I can get rid of the third
> once we solve #11/#12 in a saner way.
>
> > It's a WIP to be more consistent around node names. For actual
> > clock controllers we have 'clock-controller(@.*)?'. There's not really
> > something established for 'fixed-clock'. We probably should define
> > something, but that goes in the schema first.
>
> What do you suggest for this series?

Fine as-is unless someone wants to define the pattern and add it to
the fixed-clock schema before this is merged.

Rob

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
