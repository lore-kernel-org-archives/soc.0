Return-Path: <SRS0=5jFp=JJ=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 163CBC433ED
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Apr 2021 13:16:10 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A4D2B611CE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Apr 2021 13:16:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A4D2B611CE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=TOOkSj/UFkUGCR3sFoVmP2/7ha2XnnvinbHUKktb8sY=; b=UfPvp+WnqHRiZCZ/+i+wuCnIG
	injOjixnTc48rqojgwNjNdv/UrDGoZVh0TN76v3B6YEuFaoGBI8VqgKLUURDAvo6ZTscBf3uySjYF
	BSFZE7KR1W39HOS46MAmwZGeH/8AIZA6/q4WNM+hghhb0Vedea4k4hU3LOLXkxqDdWcS1p2sNZMMb
	PqJMbiUxzbADn6j961yNP3lIjXXQeX/4ck3zWhC/7hjEnyTEx8MlHiMVeviy2xjmEod3AwDYosC0Q
	t38p6dvl0ljiBIorkM6pZjFNe/N9Z8XvAz0kuBH9u5OVMwm7Py0w/wh+qJ6WCKZ61+JNIfPRwK6jQ
	SX8IUs1mw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lVwOn-006ngR-7A; Mon, 12 Apr 2021 13:14:41 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lVwOj-006ng1-T5
 for linux-arm-kernel@desiato.infradead.org; Mon, 12 Apr 2021 13:14:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:Cc:List-Id:To:Subject:
 Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=VXjATso1knuDTDyk1tovlsglomcAvrYGOpdUcMruxH0=; b=VmB8ngXiF8u6sxw0gNJTKCw7ba
 c/LbHRmX1hy0MlFNeMSDvF327GfyjYj3mQq27ti1XH2fduQP5ynGEuBwV6DhVkXnz4dr+C9Ma84tZ
 i9cvFinAS4kSegay48PJgHyaol02OPuqLdHJpjdMyB+d25GMrkAl4PNb/Lhs2CgbqiKGPOXS1qVpj
 ER8z+4PbPGFG+UNK0QYGjzMrBWE4cWr6gZCJ6335YNfyl+xLmZgdXA6C3A/2/5YQ4/GL6KKellXl8
 8XzMamr7mhMxUArsIOzMFP0LHrMnSsUukMmuCJ5LKFUtOCc5CnHEfSwly/QL+TYzznkb/u5n+wtpk
 xLYVxb0w==;
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lVwOf-006Fwi-3r
 for linux-arm-kernel@lists.infradead.org; Mon, 12 Apr 2021 13:14:36 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 404CD61352
 for <linux-arm-kernel@lists.infradead.org>;
 Mon, 12 Apr 2021 13:14:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1618233272;
 bh=HluCuZer1wtOQ7yKaD3BOmoFclNAYXr1PfGHYNVB/bA=;
 h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
 b=SUBPbOVkl6FAG7SkAML9yDX5OmGri2iOWnL/7Ro3W3KKwQ3KlkcDun8y77dFZCkO4
 z/Bd7g4G14i3hilZ9K9qdwTezrWUnq4gB05ToR5Az2+dCu4GVhkpcTXUN7oxKZGz9I
 rGwCHiJKlUL1GN6FaUJedHh2L7utwVXMsAxKqhtXjJHGZiC7OPvROEV7yabzFl5Iel
 6BSZ8Sb0ikmOTUb5BMS6w2VnTpUPEQfeep6rTKrmY4TYBExIQg5WT0cpp7YqpjLyoF
 fRLGbTNBMoS8qjb1t6EI3r+va476hH4dZq76tdIFsbYUeKy21fNH/wuxmvDBKmvnJx
 12S9QXd2qmzxw==
Received: by mail-wr1-f46.google.com with SMTP id 12so12905092wrz.7
 for <linux-arm-kernel@lists.infradead.org>;
 Mon, 12 Apr 2021 06:14:32 -0700 (PDT)
X-Gm-Message-State: AOAM5304y7mbpDrQO7n8f/0lyvVSsG1OWS/dCHjGAGkx26pJlJqDpi4j
 nWvwQ0f9Qv3/1BGwmGAz80/nSN6dgguGPr/6Vzo=
X-Google-Smtp-Source: ABdhPJw/vFv/9BLF3d72KloeteQhapgsTZaQc+JcJdx2qTh3Sa54/Kh2Nj9F4fjgwuvsqXqIynxFLzTMYPIaG6v7918=
X-Received: by 2002:adf:e483:: with SMTP id i3mr4156187wrm.286.1618233270813; 
 Mon, 12 Apr 2021 06:14:30 -0700 (PDT)
MIME-Version: 1.0
References: <CAK8P3a1L8rWpR5b66v6Su8-m7-scA0wZQr_g_4KnV4dnrky6ZA@mail.gmail.com>
 <CAMuHMdWY0aGoAw6QfF5PQRFNFwAzNP9cmFCjbKnsSbHsMz45fQ@mail.gmail.com>
In-Reply-To: <CAMuHMdWY0aGoAw6QfF5PQRFNFwAzNP9cmFCjbKnsSbHsMz45fQ@mail.gmail.com>
From: Arnd Bergmann <arnd@kernel.org>
Date: Mon, 12 Apr 2021 15:14:14 +0200
X-Gmail-Original-Message-ID: <CAK8P3a3EaaTGvAYvffbf7AF-iaC05yMShdnTc2QMcKQGZv7N8Q@mail.gmail.com>
Message-ID: <CAK8P3a3EaaTGvAYvffbf7AF-iaC05yMShdnTc2QMcKQGZv7N8Q@mail.gmail.com>
Subject: Re: New 'make dtbs_check W=1' warnings
To: Geert Uytterhoeven <geert@linux-m68k.org>
List-Id: <soc.lore.kernel.org>
Cc: DTML <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, 
 Linus Walleij <linusw@kernel.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Alexandre Torgue <alexandre.torgue@st.com>, Kevin Hilman <khilman@baylibre.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Tony Lindgren <tony@atomide.com>, 
 Shawn Guo <shawnguo@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
 Bjorn Andersson <bjorn.andersson@linaro.org>, Nishanth Menon <nm@ti.com>,
 Tero Kristo <kristo@kernel.org>, 
 SoC Team <soc@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Gregory Clement <gregory.clement@bootlin.com>,
 Florian Fainelli <f.fainelli@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210412_061433_241345_FFE3349B 
X-CRM114-Status: GOOD (  24.12  )
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
Message-ID: <20210412131414.xzyLs0-DeCzHeykC-RizOI3O6bj5R1QdqZ1pDNe9Z1g@z>

On Mon, Apr 12, 2021 at 1:32 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> On Thu, Apr 8, 2021 at 5:08 PM Arnd Bergmann <arnd@kernel.org> wrote:

> >
> > For this merge window, I don't think any of them are show-stoppers (Rob, let me
> > know if you disagree), but in the long run we may want to gradually enforce
> > a rule about not merging changes that introduce any new warnings, in order to
> > have a chance of cleaning up the existing ones.
>
> This may not be as simple as it sounds, as DT binding updates typically
> follow a different path than DTS(i) updates.  DT bindings updates may be
> picked up by a subsystem maintainer, by Rob, or by the platform
> maintainer.

I checked out the bindings from linux-next, which seems to have covered
most of these. Sometimes it pays off to be lazy and merge them after
everyone else.

> For trivial updates (e.g. adding a compatible value, and sometimes
> extending a limit), a DTS(i) update may be accepted by the platform
> maintainer before the corresponding DT binding update.  The latter may
> even be merged one or more kernel revisions later, especially when
> involving subsystems that are not traditionally rooted into platforms
> using DT.
>
> Of course we could mention any expected warning regressions in our pull
> requests for soc.

Right, that would certainly help. Some maintainers send all binding
updates both to the driver maintainers and to the soc tree, along
with the other changes that only go into one tree. That is of course
also more work on your side, but it solves the problem entirely.

> > renesas/r8a774a1-beacon-rzg2m-kit.dt.yaml: csi2@feaa0000: ports:
> > 'port@0' is a required property
>
> [...]
>
> I've replied to these as a response to your PR reply, see
> https://lore.kernel.org/linux-renesas-soc/CAMuHMdWHLnXgBSjP7VKUdx-YNr9rSKFkE5Ge5q_tarU6HP9Lhw@mail.gmail.com/

Ok, thanks.

      Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
