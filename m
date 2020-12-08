Return-Path: <SRS0=ZKTK=FM=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69FD0C4361B
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Dec 2020 21:05:57 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2C08323AFE
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Dec 2020 21:05:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2C08323AFE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=7TuD7Zih+3J5X/FtvjOUXjLH+UTaRj1tqkZWPu0oqQQ=; b=dPTkIJW9517uUzYcT5RFLaAyO
	HJRd0FlGX1lf8IekTve6YHcpK+eaMUBYfscwXuCG21WDQz9VdM6mV8pOZmqbkYf+3VY1g1o+qXZ+8
	g+tYjhJ2kbICAq3JT14i8wQl4KNRzSkFwzdGOWXYkeM5Dufqhaj5Kv3cyAWkWXHBSZ0+KScYqataB
	3UWE+EvvIW5KmSGtkZmYDdlZCwKebN1wSRSsqwvF9r+4Sy8Merut+OlQdMEJNs/ucIRQyR8RNIOqr
	X+y7vUAUJvoqtrqAue92WS0d0Scbs+PdOoUGbxUX0y0utK2mT3iJQnM7EdF1kwJ499VfxTDmNJZcs
	Nq/8fKfQg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kmk9v-0005nN-Ug; Tue, 08 Dec 2020 21:04:31 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kmk9t-0005my-SR
 for linux-arm-kernel@lists.infradead.org; Tue, 08 Dec 2020 21:04:30 +0000
X-Gm-Message-State: AOAM531G3FaU0zFJXoHviu4F7v8ZUP8ErEJx7GCmOmkwx4tTYvS0wZrm
 RpscWHZgDWmEnidd9PzK2j4Ii7GNREXPZddDyNg=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1607461468;
 bh=pC5uMEwfR8I7zJOufVHiMnxXyaaTii8pTwxwwzk6hbI=;
 h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
 b=LqSXf0rLtaFg7OiJDPLvxyLr8icmHXe4yuXKIY4h+YZ2yI6o6C2+Cp6lzzcE53RP+
 qbcZNzsrzFDyKkmxH3At8U+KCXIslXO6P2j3/s4ufeGSW+N6hWr0seQipFRcNAoQlr
 P56APB2iQc/CsazNMHtgUJ/hy0/Vvnj2uonhwn+o3qqEHAyMe9/B2iYWYdcNoLgUe3
 eq6fJk9hg8VV7KU6RH6T6+JjtBp5PZIG3B5ZYJ0ym7XHZgQXOxkudvrnnTb9lAaTfq
 4sFfjCrSGex3bf8XGqRI1E4MbgGXDOjkxmUmRa31TG8dWM//mTEfBnw+5clvucs/s2
 gDg3LXbFQcKHw==
X-Google-Smtp-Source: ABdhPJz24xLDQ1sYVHXzKiGgnnVEI0nBoYMIK+EbZwUc+kqiRM7M10D2HVBVPIdLAc7qYdhjqVmYniHI185FcY2oAeo=
X-Received: by 2002:aca:44d:: with SMTP id 74mr1652369oie.4.1607461467934;
 Tue, 08 Dec 2020 13:04:27 -0800 (PST)
MIME-Version: 1.0
References: <20201201222922.3183-1-andrey.zhizhikin@leica-geosystems.com>
 <160744514229.359082.11487352663734358657.b4-ty@arndb.de>
 <20201208170021.GA6168@alpha.franken.de>
In-Reply-To: <20201208170021.GA6168@alpha.franken.de>
From: Arnd Bergmann <arnd@kernel.org>
Date: Tue, 8 Dec 2020 22:04:10 +0100
X-Gmail-Original-Message-ID: <CAK8P3a2FyP7TOc-fm=YQE9FX_tOiAk9_k2bn3XK5MW19D++Ymw@mail.gmail.com>
Message-ID: <CAK8P3a2FyP7TOc-fm=YQE9FX_tOiAk9_k2bn3XK5MW19D++Ymw@mail.gmail.com>
Subject: Re: [PATCH v2 0/5] drop unused BACKLIGHT_GENERIC option
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201208_160429_995312_A4BA8927 
X-CRM114-Status: GOOD (  11.52  )
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
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Sam Ravnborg <sam@ravnborg.org>, Tony Lindgren <tony@atomide.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 James Bottomley <James.Bottomley@hansenpartnership.com>,
 Chen-Yu Tsai <wens@csie.org>, Thierry Reding <thierry.reding@gmail.com>,
 Paul Mackerras <paulus@samba.org>, Will Deacon <will@kernel.org>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Michael Ellerman <mpe@ellerman.id.au>, Helge Deller <deller@gmx.de>,
 Russell King - ARM Linux <linux@armlinux.org.uk>,
 Krzysztof Kozlowski <krzk@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, Maxime Ripard <mripard@kernel.org>,
 Andrey Zhizhikin <andrey.zhizhikin@leica-geosystems.com>,
 SoC Team <soc@kernel.org>,
 "open list:TEGRA ARCHITECTURE SUPPORT" <linux-tegra@vger.kernel.org>,
 Lee Jones <lee.jones@linaro.org>, linux-omap <linux-omap@vger.kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Jernej Skrabec <jernej.skrabec@siol.net>,
 Parisc List <linux-parisc@vger.kernel.org>,
 Emil Velikov <emil.l.velikov@gmail.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20201208210410.BgOwsqzlF3GcONXqdKQSSW5KYu7CmSd2AN2qrVlcLlk@z>

On Tue, Dec 8, 2020 at 6:00 PM Thomas Bogendoerfer
<tsbogend@alpha.franken.de> wrote:
> On Tue, Dec 08, 2020 at 05:34:46PM +0100, Arnd Bergmann wrote:
> > [3/5] MIPS: configs: drop unused BACKLIGHT_GENERIC option
> >       commit: 2257682282531de45929c6006152f6e2ee881b42
>
> this one is already in mips-next.

Ok, dropped from my tree,

       Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
