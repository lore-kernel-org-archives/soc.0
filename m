Return-Path: <SRS0=DEnQ=TZ=linaro.org=viresh.kumar@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14426C433EF
	for <soc@archiver.kernel.org>; Mon, 14 Mar 2022 07:31:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id D323BC340F5; Mon, 14 Mar 2022 07:31:05 +0000 (UTC)
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 20D51C340EE
	for <soc@kernel.org>; Mon, 14 Mar 2022 07:31:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 20D51C340EE
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pj1-f45.google.com with SMTP id m22so13724711pja.0
        for <soc@kernel.org>; Mon, 14 Mar 2022 00:31:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=Q5n8AXnZfltOT5Bvwt1oR4JiidhsA4iMmBDcmk5blOk=;
        b=BNmras69oEahfMYAfHS+4hbDM1m2IdbOCUf2fW/KLZ0ss3elgkTBOCQfnvY1iE3cYJ
         QhGkk4fsbLKH3w+Krr7lXKFuiAHtTAUSkGKx0YegjwlT35loR2atITFnEPFsVxZrzGxp
         pQKMYgSSqRCCIB8hK4dZazGCbqnAgRGo80NQTc+zOazrAsf37YhosVPO4KXYeDoU+V+W
         AM3EkmgmN5zBK1gZBhuHvY2tgqwbmsc0TP404WOVKidb5y/WQPawcia7YE86vU3eXT3u
         64qzPCntmq3upuCyiAb0n+DMTDQ1yWb2MYfZoZRay736u1TLhkndU/twpaCJm8mIz/nl
         jgXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Q5n8AXnZfltOT5Bvwt1oR4JiidhsA4iMmBDcmk5blOk=;
        b=2hOw/kiPQWdfhWl7X0O6eBkuj/WOCwTRabAMWuCsh8waG0Kq8Fm+o4vnpGRClxeUs+
         GRVUQ8udsHcOw/7ByKdUdSs6sqw2lYd5YEsXDAwBTRIS8Tqy7Vogiw8u7aPcbnWQOJip
         JKIqg6HXWeTCIdnL2Nlkd1pL0f5S5akcEuR6+ccRdfT0G5NLh5lfONymPMC1PhJZtpVp
         pdUmSdUPJn/vlhf5LBp/SMtsC3Vh2K7fxBk/U2uCOtNeJziSXgqBXpsjOENk8DjZDTE6
         dPyVrUg4thPkP2mULt0+emm70xisnlP7/tpeGLz9QlDQnhJgr7t+IFDmhD/wZqZsR3GI
         LiOw==
X-Gm-Message-State: AOAM530pR0H2MSfCsydEWTziP6OtxiDkvL/sjaf4Ee+ME528H6SyWYEF
	C24/0myAfI4xhxS6Z/dWsGNfvw==
X-Google-Smtp-Source: ABdhPJwv59GhWaXVz6IUUrHHXJK/ATaqogV7YtD8o4pBbVTJcpNGBDbHMhAZJ70aza4yeLAFJWUnxQ==
X-Received: by 2002:a17:902:bc8c:b0:151:8278:d2bf with SMTP id bb12-20020a170902bc8c00b001518278d2bfmr22661394plb.114.1647243064633;
        Mon, 14 Mar 2022 00:31:04 -0700 (PDT)
Received: from localhost ([223.184.83.228])
        by smtp.gmail.com with ESMTPSA id i187-20020a62c1c4000000b004f78c98bc57sm11616227pfg.106.2022.03.14.00.31.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Mar 2022 00:31:03 -0700 (PDT)
Date: Mon, 14 Mar 2022 13:01:02 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Kuldeep Singh <singh.kuldeep87k@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org, Arnd Bergmann <arnd@arndb.de>,
	Viresh Kumar <vireshk@kernel.org>,
	Shiraz Hashim <shiraz.linux.kernel@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] ARM: dts: spear13xx: Update SPI dma properties
Message-ID: <20220314073102.l6vokyookzyo76hj@vireshk-i7>
References: <20220312180615.68929-1-singh.kuldeep87k@gmail.com>
 <20220312180615.68929-2-singh.kuldeep87k@gmail.com>
 <20220314035118.gbjbrwbsywxljjti@vireshk-i7>
 <20220314065434.GA43329@9a2d8922b8f1>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220314065434.GA43329@9a2d8922b8f1>
User-Agent: NeoMutt/20180716-391-311a52

On 14-03-22, 12:24, Kuldeep Singh wrote:
> Dma-names order matters here.
> As per pl022 binding, dma-names order specify rx,tx and all DTs which
> have tx,rx as order start raising dtbs_chek warning. Thus, need to
> reverse this order. Please note, no functional change in this patch
> apart from just fixing warning.
> 
> Warning:
> 'rx' was expected
> 'tx' was expected

Hmm. I see your point now.

  dma-names:
    description:
      There must be at least one channel named "tx" for transmit and named "rx"
      for receive.
    minItems: 2
    maxItems: 32
    additionalItems: true
    items:
      - const: rx
      - const: tx


I was expecting above to allow adding the items in any order, but
looks like the order is fixed with this.

-- 
viresh
