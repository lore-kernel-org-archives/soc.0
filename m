Return-Path: <SRS0=6Q0g=PJ=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E347C433EF
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Oct 2021 21:11:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1371761186
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Oct 2021 21:11:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1371761186
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AvsHBZ3bWvNKLWa5kYfsVJG9kp50KRATDD8TnGGtBlw=; b=bVyLjWLpM5fNWL
	dlMiLUCZ1QZnITCNm8JBG7cQvig/fXCxgKifMp7gb4EOYwEEsyn1Z1pTqXadhiE5b0yaxHg1ZoGFR
	gEexAVriAvLs4gYUWmgIPS27gf1cmcQq1bTKHm8wxjXAtC7pwclIW/m48OWAxBaypaktYi1DBWvLZ
	I6ZpeWjULeAO5z93ENXksBswQn6cgYEqUa9/b/ia0olGVM67KVLl5e5/a0GSLp4HPuI/2SecXHKjE
	nUBCZhngPjVanSxkcJ5zwWAHtdY4jzjgyMwRq0SBrwRM7hLmppsQTErVQEJ+WOjvbtciuOfVBaFci
	ZDorq0vvL/MMll6hSTIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mdfKQ-0099O9-Pa; Thu, 21 Oct 2021 21:10:22 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mdfKM-0099NS-Rk
 for linux-arm-kernel@lists.infradead.org; Thu, 21 Oct 2021 21:10:20 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id DEC5161130
 for <linux-arm-kernel@lists.infradead.org>;
 Thu, 21 Oct 2021 21:10:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1634850617;
 bh=9xbR+lTg9/ACwAiLuzWLsdOO//TC0WWXKlS1NvkC6Bw=;
 h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
 b=eQ7wxn5vAWz8ockTXRuiIFKoZe/64FVsIFuJtTB0gnCaRINSaqAFwh/6S5SDSOiWo
 /HmiMKaZbrLdqj5cbg9odFnWPik0/fY7S35A0NwU8WI+ZMpQlCaQxa7xzXMEv9D7jf
 H/fXwK/gvcbyOujzx+liS/neOhoYNxNoytAFdm2dXMy4zTF+Ys3Ec3cZFUxryv9NmK
 9asroTRj27UPlPCm8eTSrRtlfT0PsBLeESSCXmPLE6n5hBJ3H7lMqL95kFPsFYnUba
 wlpYlL4nuzvx0A6Ji4W/gQ5Tb+Qy38+jpn1vsV17Th5ZMCTJDzCQEMRdki4TIgwPWG
 haTybfY4Mx/kg==
Received: by mail-ed1-f45.google.com with SMTP id e19so1913095edy.0
 for <linux-arm-kernel@lists.infradead.org>;
 Thu, 21 Oct 2021 14:10:17 -0700 (PDT)
X-Gm-Message-State: AOAM530APx5gSdEEDDnJroVh3KKB2aR29doCXIf6HmXhuteQc3vOqUvD
 XARWLV2RM1qT26heZrtP6W6ZUh+lXbwSS8prLA==
X-Google-Smtp-Source: ABdhPJz7QQpBAGn9kOpB12au2zkwBeIeFcdQTZ975j6S/RSx0DB73w93aSWmxN45JNAofo+mklz65G3wjvl9O72FpZ4=
X-Received: by 2002:a17:906:6a1d:: with SMTP id
 qw29mr10076859ejc.147.1634850616364; 
 Thu, 21 Oct 2021 14:10:16 -0700 (PDT)
MIME-Version: 1.0
References: <20211013143810.2101838-1-arnd@kernel.org>
 <CAL_Jsq+WqboHoqHN-c5KAWPzMZm3dgExWr8RT7+-5bzwSA5BUQ@mail.gmail.com>
 <CAK8P3a1SreOdJ=jMvRYhwyWhTdEOBMzW+AFX2bRztRStrDWVLw@mail.gmail.com>
In-Reply-To: <CAK8P3a1SreOdJ=jMvRYhwyWhTdEOBMzW+AFX2bRztRStrDWVLw@mail.gmail.com>
From: Rob Herring <robh@kernel.org>
Date: Thu, 21 Oct 2021 16:10:04 -0500
X-Gmail-Original-Message-ID: <CAL_JsqLyLOK=1HwirRmA+FwyfZckzodqT08Qy_KZz3-WPN6Zsw@mail.gmail.com>
Message-ID: <CAL_JsqLyLOK=1HwirRmA+FwyfZckzodqT08Qy_KZz3-WPN6Zsw@mail.gmail.com>
Subject: Re: [PATCH 1/2] ARM: versatile: remove leading 0 on unit address
To: Arnd Bergmann <arnd@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
 Viresh Kumar <viresh.kumar@linaro.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Liviu Dudau <liviu.dudau@arm.com>,
 SoC Team <soc@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Rui Miguel Silva <rui.silva@linaro.org>, 
 Sudeep Holla <sudeep.holla@arm.com>, 
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 DTML <devicetree@vger.kernel.org>, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211021_141018_944573_14EC7D9B 
X-CRM114-Status: GOOD (  16.20  )
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
Message-ID: <20211021211004.wP1o7zdyIvIE3X76UQXa8GFk6IZ7azD5gq_uhs0Sg8M@z>

On Thu, Oct 21, 2021 at 3:49 PM Arnd Bergmann <arnd@kernel.org> wrote:
>
> On Thu, Oct 14, 2021 at 2:53 AM Rob Herring <robh+dt@kernel.org> wrote:
> > On Wed, Oct 13, 2021 at 9:38 AM Arnd Bergmann <arnd@kernel.org> wrote:
> >
> > Please apply these instead:
> > https://lore.kernel.org/all/20210913192816.1225025-7-robh@kernel.org/
> > https://lore.kernel.org/all/20210913192816.1225025-8-robh@kernel.org/

Linus?

> >
> > There's also also these fixes that I sent:
> > https://lore.kernel.org/all/20210928192143.1841497-1-robh@kernel.org/

Viresh?

> > https://lore.kernel.org/all/20210928192210.1842377-1-robh@kernel.org/

Bjorn?

> > https://lore.kernel.org/all/20210928192123.1840842-1-robh@kernel.org/
> > https://lore.kernel.org/all/20210928191759.1835325-1-robh@kernel.org/

These 2 are the only ones in next.

> Is this list still up to date? It looks like some of these are already
> in linux-next
> by now, so I'm not sure which ones to apply. Could you send the ones that
> you want me to take to soc@kernel.org?

Splitting up dts fixes by sub-arch only to have them ignored and have
to chase down the status or resend really doesn't motivate me to fix
anything.

Rob

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
