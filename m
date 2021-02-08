Return-Path: <SRS0=U7wc=HK=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18311C433DB
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Feb 2021 20:00:59 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B919164E77
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Feb 2021 20:00:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B919164E77
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=k+AUjh7lovIjSBGYPEfOn1ajEP8pBmKgkH1XhljcYq8=; b=d/xYX318F9H5zXEjAyGsbcOsl
	d9FowJjw+ObxHQddq2sA9/gK2CIH2JNbHdABvu42hix2N/LT806b6g7QGWoraELNsA5/gie06Om2Z
	9k8a3lbpsWRELhpiutPYGbKcaU65LEXospHSjr6uVUcWJx0ByQBPbOmEHhd/GE5wJlRWxcBqW77L/
	xLf4dog9Yi/ZbyuCRX6yQlWCcRiwdIM5KtVqkr1Rwz20uJFMIKjsf/IIxesEurFDB082L0/hqmcz0
	hcPgtsAWbh2tx5gGLn3QvCxuMW7J3YBSkY02igdVWc4WowJMPikLZNhpGSUgz/fzgjBVmDkSPNmPK
	I3t72GGiw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l9ChB-0001cE-W8; Mon, 08 Feb 2021 19:59:42 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l9Ch8-0001bt-Ga
 for linux-arm-kernel@lists.infradead.org; Mon, 08 Feb 2021 19:59:39 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id EF47964E60
 for <linux-arm-kernel@lists.infradead.org>;
 Mon,  8 Feb 2021 19:59:36 +0000 (UTC)
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
Received: by mail-ot1-f42.google.com with SMTP id d7so13081719otq.6
 for <linux-arm-kernel@lists.infradead.org>;
 Mon, 08 Feb 2021 11:59:36 -0800 (PST)
X-Gm-Message-State: AOAM530xg72q9GzOHpiRdCP4trmDeX//gy0WhaWNls4fRz/H/wqi9utP
 ztXIUDDUaXSWsUmjAaW5b5W69KrrWbZe5jkGGh4=
X-Google-Smtp-Source: ABdhPJwAMrdHKJ0MLMdJRxSWqWb1nlzDx6mJi5rwrRPdTvyEyOeN/THXaG3RuTKAjl6fj4J4/sUkveTx3pwWxUzZKho=
X-Received: by 2002:a05:6830:18e6:: with SMTP id
 d6mr9047149otf.251.1612814376197; 
 Mon, 08 Feb 2021 11:59:36 -0800 (PST)
MIME-Version: 1.0
References: <20210204203951.52105-1-marcan@marcan.st>
 <20210204203951.52105-2-marcan@marcan.st>
 <20210208102730.p4nhsl35oowsklv2@kozik-lap>
 <20210208173215.GA1567700@robh.at.kernel.org>
 <20210208181248.tbgffdwghlseawic@kozik-lap>
In-Reply-To: <20210208181248.tbgffdwghlseawic@kozik-lap>
From: Arnd Bergmann <arnd@kernel.org>
Date: Mon, 8 Feb 2021 20:59:20 +0100
X-Gmail-Original-Message-ID: <CAK8P3a1H6FffE37bEaNK5rxBnbw_0WEFU13=T3cT4xr7taLc4w@mail.gmail.com>
Message-ID: <CAK8P3a1H6FffE37bEaNK5rxBnbw_0WEFU13=T3cT4xr7taLc4w@mail.gmail.com>
Subject: Re: [PATCH 01/18] dt-bindings: vendor-prefixes: add AAPL prefix
To: Krzysztof Kozlowski <krzk@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210208_145938_662268_216535B9 
X-CRM114-Status: GOOD (  12.10  )
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
Cc: Rob Herring <robh@kernel.org>, DTML <devicetree@vger.kernel.org>,
 Marc Zyngier <maz@kernel.org>, Hector Martin <marcan@marcan.st>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 SoC Team <soc@kernel.org>, Olof Johansson <olof@lixom.net>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210208195920.T3GBKmpHVsEtLktXsRE24CRKPbIlmWTB3slSFBhzmak@z>

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

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
