Return-Path: <SRS0=5jFp=JJ=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A689C433ED
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Apr 2021 11:24:05 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2092761027
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Apr 2021 11:24:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2092761027
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=y2ka6UqicDKNaOvv5jk5wbhKJqgI8Q1y4l7V0/AMLKI=; b=g7/rPOO1wTwSLL0WIAM8cO+If
	hICsJHa5/10zaeCSw94HU+Rn4PLHS9sCUJYhcBxvqSl4WIRv7V/TR9I0YD/AeIVS3S2bJThFQGaFD
	05u1ayMGITb3n2ix4MhKf5u+HC+vEvcpIffO8hJ27A3mJy3miTFlpS3KbiVR01eRUTgEP6eKskf5J
	YkHjaGl6RhI3I/c6thV0Q0tMhaQ/OFYT5RcIyce1kALsKO65+cmHkyfIZCwtJqiOkskk63Ee6ttAO
	BtJ2PIadGb1tb30konRe4zBKbhpN47RVGhWnD2DerH+NGzu0l0qvpdi5oDVZv4KstwWE4/FGKgLfP
	vmLlvzzWw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lVueF-006XUr-S9; Mon, 12 Apr 2021 11:22:32 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lVueB-006XU4-H0
 for linux-arm-kernel@desiato.infradead.org; Mon, 12 Apr 2021 11:22:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-ID:Content-Description;
 bh=BOw8Zb9w4xHJ1taZse28RR3kjNLN3a7583crYWk8gl8=; b=AUbQrpqInDMI1CxyKdsNSZ1AQu
 rYTmSMMkZ3brS+BixRR/DUfGQPRvYfSdsRmCbKIkEbrK11J2RIdH+VtsYlyQPn3L9etNeZTO0bECs
 OEBhDPUwM7An71zgfrO/E6vGbGFnHhiAdbIgMNeSVOARBwEG7rdfkvcQZbp6AqAlLN5ZSUDynxu5X
 Xb9CXdvqDPJ4jpqybMyoR4brJEvrCCqMT7IdNTPrpEbR0R3ywGeqsYr2oR3aOahbg6puQnaCg/FHh
 sfkVMv8X0UULmRJzCo0/lguvCXZqYpfwyI9IhO4yhC6zXWVwWAQj9mxaYRZ1SkEftotKAWGYWi4dm
 OmC8Sqag==;
Received: from mail-ua1-f41.google.com ([209.85.222.41])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lVue8-006AXi-Jj
 for linux-arm-kernel@lists.infradead.org; Mon, 12 Apr 2021 11:22:26 +0000
Received: by mail-ua1-f41.google.com with SMTP id z23so2929315uan.8
 for <linux-arm-kernel@lists.infradead.org>;
 Mon, 12 Apr 2021 04:22:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=BOw8Zb9w4xHJ1taZse28RR3kjNLN3a7583crYWk8gl8=;
 b=fz+XKmzfpqpQ5nx8f30cja+Kh/t9m29UKjthPp1FhFi/Ab1TGn1VeRD6Elqc/BB3Pb
 eO6KfYCC13vSlck54eREZfzIOJxnl92OvXNv+v4x3/968omrZoxT13VaBr4Dnz3O9j6l
 YPhCMy22TeF2o3O9YFY8HaWsSlHqhM9ZgjM7/riyO7rFM4ig4yDxGfCxS6ZRQZWyhDgk
 UCCTxCCaV5DTHF/o3fssSRCzYLdPffHWpMJZCNoDOBeC5mn7/wd3uIgI3mkPemlIGftD
 at2GDps/kWwMwkzJxxbju7l4k3lpDnb9EXrMnHSnXqulZPNjPoLEn9x2aDWmjAvWhgRS
 jTWQ==
X-Gm-Message-State: AOAM5307bZW9XmyG70t25tKTOYGet0tVGwK1gYAgLG6J8LXRGdvBILzh
 xeQaRxf+JTMlDUXCWYan1ZE7hgT0D4WSLW0CeLI=
X-Google-Smtp-Source: ABdhPJzwN/8I7ekYFgRmXOMQCCikWGGErXYZWEqFSkw6dmIHbUWE7b+UrKtmzgjr8PMBQmvA10PER2FVIpwY9UFT5+E=
X-Received: by 2002:a9f:3852:: with SMTP id q18mr9655708uad.58.1618226543535; 
 Mon, 12 Apr 2021 04:22:23 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1617359678.git.geert+renesas@glider.be>
 <161789462010.1629934.8245364544434971043.b4-ty@arndb.de>
In-Reply-To: <161789462010.1629934.8245364544434971043.b4-ty@arndb.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 12 Apr 2021 13:22:12 +0200
Message-ID: <CAMuHMdWHLnXgBSjP7VKUdx-YNr9rSKFkE5Ge5q_tarU6HP9Lhw@mail.gmail.com>
Subject: Re: [GIT PULL] Renesas ARM DT updates for v5.13 (take two)
To: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: arm-soc <arm@kernel.org>, arm-soc <soc@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Magnus Damm <magnus.damm@gmail.com>, 
 =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>, 
 Wolfram Sang <wsa+renesas@sang-engineering.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210412_042224_667191_61EF056F 
X-CRM114-Status: GOOD (  19.28  )
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
Message-ID: <20210412112212.Owik0p7vdTFzhVY0PshGgufLJC4cViUh7OIXeBtw4Gg@z>

Hi Arnd,

On Thu, Apr 8, 2021 at 5:24 PM Arnd Bergmann <arnd@kernel.org> wrote:
> On Fri, 2 Apr 2021 12:37:15 +0200, Geert Uytterhoeven wrote:
> > The following changes since commit c8aebc1346522d3569690867ce3996642ad52e01:
> >
> >   arm64: dts: renesas: r8a77980: Fix vin4-7 endpoint binding (2021-03-16 09:58:00 +0100)
> >
> > are available in the Git repository at:
> >
> > [...]
>
> Merged into arm/dt, thanks!

Thank you!

> There were a couple of added warnings from 'make dtbs_check W=1':
>
> renesas/r8a774a1-beacon-rzg2m-kit.dt.yaml: csi2@feaa0000: ports: 'port@0' is a required property

The same issue is present in several other pre-existing DTS files, too.
Commit 066a94e28a23e04c ("media: dt-bindings: media: Use graph and
video-interfaces schemas") in v5.12-rc1 made port@0 mandatory, but that
port is not present on boards were the interface isn't used (yet).
Probably we should add placeholder port@0 nodes to all SoC .dtsi files,
like we already have in display, audio, hdmi, and lvds nodes.

> renesas/r8a779a0-falcon.dt.yaml: thermal-zones: 'sensor-thermal1', 'sensor-thermal2', 'sensor-thermal3', 'sensor-thermal4', 'sensor-thermal5' do not match any of the regexes: '^[a-zA-Z][a-zA-Z0-9\\-]{1,12}-thermal$', 'pinctrl-[0-9]+'

I don't see that one with the latest bindings in linux-next (i.e. commit
9468e7b031876935 ("dt-bindings: thermal: rcar-gen3-thermal: Support five
TSC nodes on r8a779a0")).

> renesas/r8a779a0-falcon.dt.yaml: timer@e61e0000: compatible:0: 'renesas,tmu-r8a779a0' is not one of ['renesas,tmu-r8a7740', 'renesas,tmu-r8a774a1', 'renesas,tmu-r8a774b1', 'renesas,tmu-r8a774c0', 'renesas,tmu-r8a774e1', 'renesas,tmu-r8a7778', 'renesas,tmu-r8a7779', 'renesas,tmu-r8a7795', 'renesas,tmu-r8a7796', 'renesas,tmu-r8a77961', 'renesas,tmu-r8a77965', 'renesas,tmu-r8a77970', 'renesas,tmu-r8a77980', 'renesas,tmu-r8a77990', 'renesas,tmu-r8a77995']

Trivial DT binding update posted (but not CCed to devicetree) in
https://lore.kernel.org/r/20210331124555.2150-1-wsa@kernel.org/

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
