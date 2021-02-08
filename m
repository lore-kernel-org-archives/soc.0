Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7EB8DC433DB
	for <soc@archiver.kernel.org>; Mon,  8 Feb 2021 19:59:37 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 3F4BC64E6C; Mon,  8 Feb 2021 19:59:37 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 131A464E8A;
	Mon,  8 Feb 2021 19:59:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1612814377;
	bh=UZ7Jxx+hBsoQWe10w0w1QtFUOg9IlasrOuB4MqOEouI=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=A6apJkMgo+ct22yD4CMtuRDGBFNtHAqaSVT1kKEX0PuCWXgSOm6ILIFuR6lgsdFHp
	 pyMlsnaH/SytyN1rfPEm+Wd1HNRI4ula0ieJU3EJxgl7XFqbDeULevv8YDEz8fv3n3
	 uH54LEPf73AuXSi3Ep9c0FM7If2eMrWPsFij0qOA2af3zRBVHjeOemHa8o/C5nCL7W
	 bvk7WHvrLkfTeDkVr/P3iXCFmT75AMoUuUZvG17lnGZ4WpW0TwvesYv/84HaEVR7R1
	 JAGbFGlUJ6zO5FIpunWk5bkDtNaeEi21kU/l1/B8nWPS0UFyG4sZ5Xia1aAIhzJOMA
	 L1qkgys/hRPSQ==
Received: by mail-ot1-f49.google.com with SMTP id 100so8658295otg.3;
        Mon, 08 Feb 2021 11:59:37 -0800 (PST)
X-Gm-Message-State: AOAM5331UBYOri7yfj9OetQ/zFberSBF+D7I6ZHRQdCFphhNMmbjtFxM
	gQZp8SptouQp2Of81+Y2d6xRcEyQZj/bnR6zmZU=
X-Google-Smtp-Source: ABdhPJwAMrdHKJ0MLMdJRxSWqWb1nlzDx6mJi5rwrRPdTvyEyOeN/THXaG3RuTKAjl6fj4J4/sUkveTx3pwWxUzZKho=
X-Received: by 2002:a05:6830:18e6:: with SMTP id d6mr9047149otf.251.1612814376197;
 Mon, 08 Feb 2021 11:59:36 -0800 (PST)
MIME-Version: 1.0
References: <20210204203951.52105-1-marcan@marcan.st> <20210204203951.52105-2-marcan@marcan.st>
 <20210208102730.p4nhsl35oowsklv2@kozik-lap> <20210208173215.GA1567700@robh.at.kernel.org>
 <20210208181248.tbgffdwghlseawic@kozik-lap>
In-Reply-To: <20210208181248.tbgffdwghlseawic@kozik-lap>
From: Arnd Bergmann <arnd@kernel.org>
Date: Mon, 8 Feb 2021 20:59:20 +0100
X-Gmail-Original-Message-ID: <CAK8P3a1H6FffE37bEaNK5rxBnbw_0WEFU13=T3cT4xr7taLc4w@mail.gmail.com>
Message-ID: <CAK8P3a1H6FffE37bEaNK5rxBnbw_0WEFU13=T3cT4xr7taLc4w@mail.gmail.com>
Subject: Re: [PATCH 01/18] dt-bindings: vendor-prefixes: add AAPL prefix
To: Krzysztof Kozlowski <krzk@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: Rob Herring <robh@kernel.org>, Hector Martin <marcan@marcan.st>, DTML <devicetree@vger.kernel.org>, 
	Marc Zyngier <maz@kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, SoC Team <soc@kernel.org>, 
	Olof Johansson <olof@lixom.net>, Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, Feb 8, 2021 at 7:12 PM Krzysztof Kozlowski <krzk@kernel.org> wrote:
 On Mon, Feb 08, 2021 at 11:32:15AM -0600, Rob Herring wrote:
> > On Mon, Feb 08, 2021 at 11:27:30AM +0100, Krzysztof Kozlowski wrote:
> so hardly an argument for backwards consistency, within the kernel.
>
> On the other hand, some DTs for iPhones mention "apple", not APPL:
> https://www.theiphonewiki.com/wiki/D211AP/Device_Tree
> https://www.theiphonewiki.com/wiki/D331AP/Device_Tree
> https://gist.github.com/bazad/1faef1a6fe396b820a43170b43e38be1
>
> Although I am not sure how reliable are the sources.

For reference, these are the examples I see in the device tree dump for the
mac mini:

      AAPL,unit-string = "00000000";
      AAPL,slot-name = "Slot- 1";
      device_type = "AAPL,display-crossbar";
      device_type = "AAPL,atc-dpxbar";
      device_type = "AAPL,atc-dpphy";
      device_type = "AAPL,atc-dpin";

In addition, every node has a AAPL,phandle property (corresponding to
linux,phandle), and some have a AAPL,unit-string.

As in the iphones, only the cpu nodes do use "apple,".

       Arnd
