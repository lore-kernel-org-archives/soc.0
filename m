Return-Path: <SRS0=Q2eW=JF=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82F65C43461
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Apr 2021 15:28:25 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 28BD761107
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Apr 2021 15:28:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 28BD761107
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=6xhg9ZtrS9g0RNBlHPtq16vuFJf2iCtD5/AHAh6ykw0=; b=JWGo0V5XEgxCoqAmdjfzAutjI
	+dYRIPKqF9csGU/axaUdv9pSf7bYbGfG7mwUwp5QBf96VtAnxJ7gYFqd/s40k+qIu/7SJB7v6/ZLP
	0JAAL6ehLLm/QR+W1A1MtgAwhqB2bIZm3Cz1NTlI1sKdyGiYurrHh8AeoTCwKwTRhHr5SQjuL52Ui
	k7AOjGfqoxDliMShBHtT7FhhyXhIrGevV9FMiseZR+x88648z/BEKSVU4RbaIXqf1nk3ex5kQFia3
	QTQSMmpkbDqCOpvjxFJqtTg4p4/waCSOcEGt2kYmu4+MZUqNb3r+7+ujjTKVHkQ5h8/guBRJUdhnn
	bLhsODaeg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lUWYM-008O4w-4R; Thu, 08 Apr 2021 15:26:43 +0000
Received: from relay7-d.mail.gandi.net ([217.70.183.200])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lUWXE-008NYB-RB
 for linux-arm-kernel@lists.infradead.org; Thu, 08 Apr 2021 15:25:36 +0000
X-Originating-IP: 90.65.108.55
Received: from localhost (lfbn-lyo-1-1676-55.w90-65.abo.wanadoo.fr
 [90.65.108.55]) (Authenticated sender: alexandre.belloni@bootlin.com)
 by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 164BD2000F;
 Thu,  8 Apr 2021 15:25:28 +0000 (UTC)
Date: Thu, 8 Apr 2021 17:25:28 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: DTML <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Linus Walleij <linusw@kernel.org>,
 Alexandre Torgue <alexandre.torgue@st.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Tony Lindgren <tony@atomide.com>, Shawn Guo <shawnguo@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Nishanth Menon <nm@ti.com>, Tero Kristo <kristo@kernel.org>,
 SoC Team <soc@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Gregory Clement <gregory.clement@bootlin.com>,
 Florian Fainelli <f.fainelli@gmail.com>
Subject: Re: New 'make dtbs_check W=1' warnings
Message-ID: <YG8gaHqlJ+oCfkTt@piout.net>
References: <CAK8P3a1L8rWpR5b66v6Su8-m7-scA0wZQr_g_4KnV4dnrky6ZA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAK8P3a1L8rWpR5b66v6Su8-m7-scA0wZQr_g_4KnV4dnrky6ZA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210408_162534_162772_6FBB4D95 
X-CRM114-Status: UNSURE (   9.02  )
X-CRM114-Notice: Please train this message.
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
Message-ID: <20210408152528.j4ZzYf2MHPfINDTOW0T5In3YkXGRFeRx6-5WPIa9iY8@z>

Hi,

On 08/04/2021 17:08:26+0200, Arnd Bergmann wrote:
> arch/arm/boot/dts/at91-sama5d2_ptc_ek.dt.yaml: /: 'etm@73C000' does
> not match any of the regexes: '@(0|[1-9a-f][0-9a-f]*)$', '^[^@]+$',
> 'pinctrl-[0-9]+'
> arch/arm/boot/dts/at91-kizbox3-hs.dt.yaml: /: 'etm@73C000' does not
> match any of the regexes: '@(0|[1-9a-f][0-9a-f]*)$', '^[^@]+$',
> 'pinctrl-[0-9]+'
> 

This was introduced by 4d930c421e3b ("ARM: dts: at91: sama5d2: add ETB
and ETM unit name"), trying to fix another warning.

I guess this is because
Documentation/devicetree/bindings/arm/coresight.txt is not yaml yet.

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
