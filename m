Return-Path: <SRS0=Q2eW=JF=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2EB9BC433B4
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Apr 2021 22:16:36 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B68FA61107
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Apr 2021 22:16:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B68FA61107
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=QmHxmKIRfo+H/kPM0Rwfgj+jETvYFnDdPed1b6I2uTc=; b=h7UKTjKTxi0gPAvngKMb+jZ7b
	AKrMO7akS3cNlegqfEMxxRFmakR0KYvhAeZ027O4xyWCZ77QHAEtkAXCCjBT0xAiP4I1CyIxZFYY0
	vgyeF8C+/+Rh04PYdNUlLRRcWzPdIgN/1gAuYY9Ac1GHSHXjMZrGusBVhlleYRcS/E5snhqlVEQFX
	Y3OJJtCVbjOD87Y/XdZII0NvHsUmak8Zek/c0qctHbnAp2I0cvpPHRh34MQs7JezEgBH+QqilAgsz
	w9HMiQq9o5HmttVKQKDGvqF5JMmt7yMVX6UjnZtdLFrqzZc28nheUuvI6Vjo+beaxBmULI6fEf/zT
	H7uSVkkMw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lUcvC-009MHZ-Lk; Thu, 08 Apr 2021 22:14:44 +0000
Received: from mail-lj1-x22e.google.com ([2a00:1450:4864:20::22e])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lUcv8-009MH6-50
 for linux-arm-kernel@lists.infradead.org; Thu, 08 Apr 2021 22:14:40 +0000
Received: by mail-lj1-x22e.google.com with SMTP id s17so4111814ljc.5
 for <linux-arm-kernel@lists.infradead.org>;
 Thu, 08 Apr 2021 15:14:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=UZYFt0LVceFfcAprXRqy7FjMz5TZMkhneNJXsWawHjA=;
 b=jh/m8+mpPAxdKJ0faiWMDsB8ThJ/bVJJ9pnV2DdOmRS9/0Oups3cMyWdWzW18R9i8j
 gbunTrdTzXj61KzAnIHGuLvJ9nkft7x+MraDzr7gFF1yaBGUjtjTTdMiYQ+PunQrg6Mq
 AHGDRg72C/ydMvv4dEfdxZRPqzyRfYLL/pSvqU735sU8zij4s5RgqNN1PZ4wS+Wdi6Ka
 AZRfpoyBNCCwQ3y+fFkFyztWzGjIj4Wpf0KA1axvxXHsmaTEVk+z8NE0++4kRHkHMHFm
 aPIVCbs0pKTV4iffO/p2kmB53EhxBPUETOwOLcv2vlxxWltOmJLjG8b2F2EkOAbgrmI2
 7blw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UZYFt0LVceFfcAprXRqy7FjMz5TZMkhneNJXsWawHjA=;
 b=Dy77OWwgbhaPGpp8rnUZhCqmcB0EtfxpkWZUXqTqo7nx1hEhmQKCuf7UKn6Z6ag6uT
 W79cquoH7zSrZLUmf6vouB6G2oYE+kzXGKCJg3xerS6niPa5qu28MErxfACrgMhYeQ+J
 ibe+S8VF82aBKYgVE+XtaGt/kF8aV8MzxCi7L5OlKNrJTEekzHDvvMR7qAw8ZoFT5SXZ
 ywO0bYd/T1FBE0ohtjkoD7drJsX2t6fuXHvJ1ECt0JJ33HoVOghXtoQuijNUBKPYa6QJ
 EZgvnr4EDNmE+PFIYnXLev9+fHDqMyA3uZSlpBijyBC87mgkyNSw8FdMLkp1TcBsE4ob
 F6gQ==
X-Gm-Message-State: AOAM533a9/1cK0WdcOaMbBtbbvZ3eZVL7o0gVTVcN1JoKoyKZ4Fi2hlg
 RkeSbPed/vFKkNt97FV3Tc5Kh31VME9GZfcx8Im4eg==
X-Google-Smtp-Source: ABdhPJzWty7OkE/zjpcMz5z53ansy9SUNQ01JxDM7F1AxOx5za4NUdfe6x0onlsn7zmcaLaN2CQvWeG2UAY2qDU8U9A=
X-Received: by 2002:a2e:864a:: with SMTP id i10mr7305898ljj.467.1617920077290; 
 Thu, 08 Apr 2021 15:14:37 -0700 (PDT)
MIME-Version: 1.0
References: <bdb18e9f-fcd7-1e31-2224-19c0e5090706@marcan.st>
In-Reply-To: <bdb18e9f-fcd7-1e31-2224-19c0e5090706@marcan.st>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 9 Apr 2021 00:14:26 +0200
Message-ID: <CACRpkdaijbDoV2rSQsgO3XKnj_Hde8CU9JQ+V9gGePYjvCWJhA@mail.gmail.com>
Subject: Re: [GIT PULL] Apple M1 SoC platform bring-up for 5.13
To: Hector Martin <marcan@marcan.st>
List-Id: <soc.lore.kernel.org>
Cc: SoC Team <soc@kernel.org>, Marc Zyngier <maz@kernel.org>,
 Rob Herring <robh@kernel.org>, 
 Arnd Bergmann <arnd@kernel.org>, Olof Johansson <olof@lixom.net>,
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Mark Kettenis <mark.kettenis@xs4all.nl>, Tony Lindgren <tony@atomide.com>, 
 Mohamed Mediouni <mohamed.mediouni@caramail.com>,
 Stan Skowronek <stan@corellium.com>, 
 Alexander Graf <graf@amazon.com>, Will Deacon <will@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, 
 Andy Shevchenko <andy.shevchenko@gmail.com>, Jonathan Corbet <corbet@lwn.net>, 
 Catalin Marinas <catalin.marinas@arm.com>,
 Christoph Hellwig <hch@infradead.org>, 
 "David S. Miller" <davem@davemloft.net>,
 Konrad Dybcio <konrad.dybcio@somainline.org>, 
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, 
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 Linux-Arch <linux-arch@vger.kernel.org>, 
 linux-kernel <linux-kernel@vger.kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210408_231438_411172_9FDF62DB 
X-CRM114-Status: GOOD (  11.37  )
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
Message-ID: <20210408221426.DsQVu1-7CHWDz54sfo2ZL3QVXjyjI5-ml7z4rRjhX3A@z>

On Thu, Apr 8, 2021 at 5:55 PM Hector Martin <marcan@marcan.st> wrote:

> Hi Arnd and all,
>
> Here's the final version of the M1 SoC bring-up series, based on
> v4 which was reviewed here:
>
> https://lore.kernel.org/linux-arm-kernel/20210402090542.131194-1-marcan@marcan.st/T/#u

Excellent work on this series Hector, thanks for working so hard on this!

Yours,
Linus Walleij

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
