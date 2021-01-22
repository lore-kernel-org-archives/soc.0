Return-Path: <SRS0=HiIx=GZ=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95690C433E0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 Jan 2021 16:37:08 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 50D1D2246B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 Jan 2021 16:37:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 50D1D2246B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=kJSeLVooRHNeVvZhkK8CJftGyX+GrVQsoAk6DcVXKUc=; b=QEbDekR05No1Dyc3JaHt9mLt4
	2yw14brIPcBNpRfjX4TJI7fmQz1rustvwqq6sLpoVkM804eiJ/A/+1c4lzrGEeTpo9/zaHhQtXY3P
	kcDI3h3BYlNb/K1T+4NnlH5OVChPO2F6xQymHBq9xLYN3oljKhIPQW3gboBBg3q6Ikr+TnwVF47YU
	oc4Gdt1JnbpVzpnPz9gdUwk6ZJjGEBB6GCYSx5GcBEw6pskQAcpGN90znWr/9cdM2XedNF/fL7f1P
	+6sOOdBHkeUTpBbRplTOQhRuNjL/y+u4fPuEGVGBV/QxDGiMyg8j536LXaSmPUD5e0MFunKO1M4no
	uVOOAe4lQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l2zPE-0006he-Nx; Fri, 22 Jan 2021 16:35:28 +0000
Received: from relay2-d.mail.gandi.net ([217.70.183.194])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l2zPC-0006gD-8v
 for linux-arm-kernel@lists.infradead.org; Fri, 22 Jan 2021 16:35:27 +0000
X-Originating-IP: 86.202.109.140
Received: from localhost (lfbn-lyo-1-13-140.w86-202.abo.wanadoo.fr
 [86.202.109.140])
 (Authenticated sender: alexandre.belloni@bootlin.com)
 by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id 5E39340013;
 Fri, 22 Jan 2021 16:35:20 +0000 (UTC)
Date: Fri, 22 Jan 2021 17:35:20 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Arnd Bergmann <arnd@kernel.org>
Subject: Re: [GIT PULL] ARM: at91: soc for 5.12
Message-ID: <20210122163520.GG1196852@piout.net>
References: <20210122143536.168833-1-nicolas.ferre@microchip.com>
 <CAK8P3a0s5UPvCzQrcYmPPDYgT+YyZ3vc=fF0GEwpqROR+Zio-g@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAK8P3a0s5UPvCzQrcYmPPDYgT+YyZ3vc=fF0GEwpqROR+Zio-g@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210122_113526_416811_4006DBF7 
X-CRM114-Status: GOOD (  24.66  )
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
Cc: Arnd Bergmann <arnd@arndb.de>,
 Linux Kernel list <linux-kernel@vger.kernel.org>, SoC Team <soc@kernel.org>,
 arm-soc <arm@kernel.org>, Ludovic Desroches <ludovic.desroches@microchip.com>,
 Olof Johansson <olof@lixom.net>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210122163520._spDu1yq0K0p3CLdfQBJhKn2cpwQRHZKfHmexAalatc@z>

On 22/01/2021 16:25:47+0100, Arnd Bergmann wrote:
> On Fri, Jan 22, 2021 at 3:35 PM <nicolas.ferre@microchip.com> wrote:
> >
> > From: Nicolas Ferre <nicolas.ferre@microchip.com>
> >
> > Arnd, Olof,
> >
> > I'm taking back the lead on sending the pull-requests for AT91 and hope that I
> > didn't loose the knowledge in the meantime. Tell me if there's something I'm
> > missing. Thanks a lot to Alexandre who kept our flow steady and very
> > predictable during all those years!
> >
> > Here are the first SoC changes for 5.12 which contain a single patch for multi
> > platform kernels.
> >
> > I plan to send another pull-request for the SoC changes related to new sama7g5
> > that Claudiu sent to the mainling-list recently. I'll let it mature in
> > linux-next by the beginning of next week and will send another pull-request by
> > mid-next-week.
> > Tell me if you see a problem with this approach.
> 
> This all looks good to me, but I think I'd rather take the 'soc' pull request
> into the v5.11 bugfixes, as this may already affect users on other machines.
> 
> I would also suggest adding a 'Cc: stable@vger.kernel.org' tag. If you like,
> I can just cherry-pick that patch into the fixes branch and add it there.
> 

I wouldn't backport it as a fix, this is just a warning, in a
configuration that is very unlikely to be used (and honestly, I
wouldn't enable this driver on any platform).

If you take it as a fix, you'll have to also get
https://lore.kernel.org/linux-arm-kernel/1611318097-8970-5-git-send-email-claudiu.beznea@microchip.com/


-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
