Return-Path: <SRS0=5jFp=JJ=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 405D9C43461
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Apr 2021 18:54:47 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D43FE61249
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Apr 2021 18:54:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D43FE61249
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=6COw33sUZ2Ngqu+Qh4esD3L+AJ/PzgGOiONxHn2Yu/w=; b=pfBHxRwk1kcZw770U57sxtfQV
	ToDs2PhfkRlP+McCxLxtQKvd5gT66K15vplJ0oE6uY2Mq7AHjn+7pAViWYKet+g8OZq3TE115FCeS
	Bl5LIGvBqpwE/019v0Zd6sJILD6POL81DhovBZn7nLBnSFiHsWqnialCYwi2Lf14RVp7KQkLVf8fT
	2pbdBsxkRtQqGiG9DvOCbb3AB2nlh8E0Hy9yjtjLublLNaL6z/3BFVIT0ohLwOA16PXM2QQlTBiuC
	gniN/p1zj8A+KLtAgy/l4A3WqvT2xMedYS+pjhs6iXykeYA/TJHYUWQvDDs4k04Pk+e/HYz4Fy/xr
	rrha3XCYw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lW1gD-007UX9-Od; Mon, 12 Apr 2021 18:53:02 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lW1gB-007UX1-Gc
 for linux-arm-kernel@desiato.infradead.org; Mon, 12 Apr 2021 18:52:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:Cc:List-Id:To:Subject:
 Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=NyyHbttDPMvo9+ddSGfwBVRT19LcCM/sb/5hklJciOk=; b=EvIL3roFFrBTGHWXnaLpcaB3GL
 ciH+KXY2MPVvsSpR8JkwezjY60vtIzRB1XREzXN6W5uuSJK6W9ffCIKHvOIC3Qpd6RbOcaZzQer1t
 Q2++RCLSVU0G1dn6HwV4H4OXcFObD7i8L59LxTwoeqR5EGl7oYzuC+oC2Ffb8mxuIr/wzBLX8oA4D
 W6RpDJqvESiLVzxohaxDt2QOueo+/9FbftAm38tH0vzT0CbTavaXt0Lza09a75+kZK7FWR52o4Jm/
 CkVJ09+fceWevf69XehF1V/X5v6G+NVOlSpB0oAnetKcRHYyQHkZkV157qJmpLqruK5qbFzQv/I1S
 yyKMHqUw==;
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lW1g7-006Uhn-SP
 for linux-arm-kernel@lists.infradead.org; Mon, 12 Apr 2021 18:52:57 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3EB7E61359
 for <linux-arm-kernel@lists.infradead.org>;
 Mon, 12 Apr 2021 18:52:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1618253575;
 bh=vmh72/XeZ2EcVu0BkeFIMrOShLBZVwPfATYyjCSkxXY=;
 h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
 b=s6JZEqyuTxWJBYVkq1VRelW1EcwH3H4riAEFagpmQNkJ+t7Q7p7U9runvhYk2/ihH
 /W2RNm7PNMesKQTlmmQ8vpJpTYqvxXn5p7BLjDEZAV8WpeYH8J/0X9RqAOLVZ58Oxw
 OzOJDccSo59Z0mxfJb+TiRTZveM3xo16zma6dSZ/ki80/jGF6tR7QCoQ113bddi3bA
 gMUDBSUk1PWjjstE0Lsc6dTFFmJJPdFzk5vtf+IBkxS6BrbPcX+r3q9TKbaChYEPjv
 heOzncogUfVyli1Xb4tZ8yz9gkWBs9CdMKotu9WEP8T04nCbCta5h8ST6wgARtRdVs
 Hqx9nlPiGmIyQ==
Received: by mail-wm1-f52.google.com with SMTP id
 j4-20020a05600c4104b029010c62bc1e20so7465134wmi.3
 for <linux-arm-kernel@lists.infradead.org>;
 Mon, 12 Apr 2021 11:52:55 -0700 (PDT)
X-Gm-Message-State: AOAM531N0qosE+1h8e1h4nVvkjdvs9XYuvrJY6dBWjwfO7e81QE66JC/
 VXIVeFYcTnUyV8tROn1yJdpr3l9s/UpymgGFHsk=
X-Google-Smtp-Source: ABdhPJz83AM6Og1E/29eeE0tygPLaSuAZ4OdBuwM+e8QXLur9sHx4AIBZ4LhOaHNDEcvMz6VMMzQ3r0zqQT/YVry8o0=
X-Received: by 2002:a05:600c:19cf:: with SMTP id
 u15mr468118wmq.43.1618253573862; 
 Mon, 12 Apr 2021 11:52:53 -0700 (PDT)
MIME-Version: 1.0
References: <CAK8P3a1L8rWpR5b66v6Su8-m7-scA0wZQr_g_4KnV4dnrky6ZA@mail.gmail.com>
 <CAMuHMdWY0aGoAw6QfF5PQRFNFwAzNP9cmFCjbKnsSbHsMz45fQ@mail.gmail.com>
 <CAK8P3a3EaaTGvAYvffbf7AF-iaC05yMShdnTc2QMcKQGZv7N8Q@mail.gmail.com>
 <20210412160116.GA904837@yoga>
In-Reply-To: <20210412160116.GA904837@yoga>
From: Arnd Bergmann <arnd@kernel.org>
Date: Mon, 12 Apr 2021 20:52:37 +0200
X-Gmail-Original-Message-ID: <CAK8P3a1_YB944niA-ebk-nJx-JDBh1q7z6s-9mLGFjF2Nv9r9w@mail.gmail.com>
Message-ID: <CAK8P3a1_YB944niA-ebk-nJx-JDBh1q7z6s-9mLGFjF2Nv9r9w@mail.gmail.com>
Subject: Re: New 'make dtbs_check W=1' warnings
To: Bjorn Andersson <bjorn.andersson@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
 DTML <devicetree@vger.kernel.org>, 
 Rob Herring <robh+dt@kernel.org>, Linus Walleij <linusw@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Alexandre Torgue <alexandre.torgue@st.com>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Tony Lindgren <tony@atomide.com>, 
 Shawn Guo <shawnguo@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Nishanth Menon <nm@ti.com>, 
 Tero Kristo <kristo@kernel.org>, SoC Team <soc@kernel.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>,
 Gregory Clement <gregory.clement@bootlin.com>, 
 Florian Fainelli <f.fainelli@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210412_115255_980874_33B6ACF0 
X-CRM114-Status: GOOD (  19.34  )
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
Message-ID: <20210412185237.vaFxb6pl7ymxCcJWV1lvz1AY5wnWb8nHhHU5vC0miUE@z>

On Mon, Apr 12, 2021 at 6:01 PM Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:
> On Mon 12 Apr 08:14 CDT 2021, Arnd Bergmann wrote:
> > On Mon, Apr 12, 2021 at 1:32 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > > On Thu, Apr 8, 2021 at 5:08 PM Arnd Bergmann <arnd@kernel.org> wrote:
>
> So the same binding patch is picked up both in the driver and soc tree?
> I was expecting that to cause (harmless) conflicts when things arrive in
> Linus' merge queue?
>
> Or are you saying people go the length to create immutable branches for
> each binding?

I think it's usually one immutable branch for all the bindings of a given
merge window. This avoids the merge conflicts, and you can add further
bindings on the same branch before sending it off to the soc tree.

> I'm curious because it's fairly often that we introduce clocks,
> interconnects etc where the macros from the dt bindings includes aren't
> available for another release (so we use numerical constants and then go
> back and fix them up later).

Ah right, it is particularly bad for platforms that don't have a regular
layout in these blocks and need to define a new constant every time
another clock/reset/pin/... is discovered in the downstream sources.

I was mainly referring to the simpler problem of defining a binding
document for a device once, and then merging the nodes.

       Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
