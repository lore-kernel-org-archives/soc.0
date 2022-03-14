Return-Path: <SRS0=DEnQ=TZ=linaro.org=viresh.kumar@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54B0FC433F5
	for <soc@archiver.kernel.org>; Mon, 14 Mar 2022 10:43:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 3C9A2C340ED; Mon, 14 Mar 2022 10:43:40 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id B67A9C340E9
	for <soc@kernel.org>; Mon, 14 Mar 2022 10:43:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org B67A9C340E9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pf1-f173.google.com with SMTP id g19so13949492pfc.9
        for <soc@kernel.org>; Mon, 14 Mar 2022 03:43:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=offBx8u5K9bH2yAbo6I5jJGdKaFPcNiQgtHBU/dwurU=;
        b=abaAC5ZVOSjYCB5GTI4jMzp/Cl/Q0BjriRREyaCyTUp1j4rom2RG1SEY7jugYfJ/EP
         mvas1maqJCucHjUM5DzwP+zSwpR3D4nPAmt6MI+ongS9Uh2fwmFYeEib3Z4Uy5TDXJSN
         pnMCu0WnVdNHr7LiEitsfmFUQPWzF1zEZydrUO3xrNkqdWZN/Tb1+QxhXQhxPq2+M+/Z
         rjQuEQW/radAtdYCXe/lJK/4QP7vj0eRCvSoDLhsbhq+eDmiof0juJ/bgL83/u2sKr+p
         Qcpi2fniHGCfwftvFpPh7F+wtPYXkjo1ZIBpObCCanSpmaEhCiQn6QNHaXLlKazRCJ1t
         a1aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=offBx8u5K9bH2yAbo6I5jJGdKaFPcNiQgtHBU/dwurU=;
        b=kcgAb99R4YyFFtFMcbxfyO098g+/GPRTwqNRkHKZlvPN2ysu/QyHJ11cscEo8eUQzI
         lwTGnkb6nfQlj0LV6jNbAR62R2iM340diSIFeU6oa7IyETiakKvsKG16Q3Zl3YfuZMIs
         l9WOzEe1TBQSzYYGfaomWu1ZHVyiZ1G92Usmg1WIynAGBjiT+JWxJUx/r4Y15ILspvyo
         dTMigJ2WNW11QJIIJZHLeq2ymD4QWITFajS+9dPyBt3S0dnksR1Geqc31HqZqiCEF4YH
         561Dcn77H2YpfKdsD6oIQy9SMoetB69PseE2bDdD9yK8TUYGjDCXnPNm8Fmc0uzEX//z
         fvPA==
X-Gm-Message-State: AOAM531BcG1rVbRJtv9SnEtyMAGs/qYbRV4x3L2DXKUl1qKkVf8eTFK3
	hI5wPrqu0cP9YPZT8ZOoM91v0g==
X-Google-Smtp-Source: ABdhPJzPuCIBqKGT2yR3Mt9Jycz4pRUYKogWOk7q1ldx2/KnEQ0XxCwD/43nSZpnKOQc0BoR4ieMdg==
X-Received: by 2002:a63:914a:0:b0:380:1b9a:5bee with SMTP id l71-20020a63914a000000b003801b9a5beemr19047917pge.39.1647254618131;
        Mon, 14 Mar 2022 03:43:38 -0700 (PDT)
Received: from localhost ([223.184.83.228])
        by smtp.gmail.com with ESMTPSA id y5-20020a056a00190500b004f104b5350fsm20537440pfi.93.2022.03.14.03.43.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Mar 2022 03:43:37 -0700 (PDT)
Date: Mon, 14 Mar 2022 16:13:36 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Arnd Bergmann <arnd@arndb.de>
List-Id: <soc.lore.kernel.org>
Cc: Kuldeep Singh <singh.kuldeep87k@gmail.com>, SoC Team <soc@kernel.org>,
	Viresh Kumar <vireshk@kernel.org>,
	Shiraz Hashim <shiraz.linux.kernel@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Linux ARM <linux-arm-kernel@lists.infradead.org>,
	DTML <devicetree@vger.kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/2] ARM: dts: spear13xx: Update SPI dma properties
Message-ID: <20220314104336.ojkkynvqldrnw2kb@vireshk-i7>
References: <20220312180615.68929-1-singh.kuldeep87k@gmail.com>
 <20220312180615.68929-2-singh.kuldeep87k@gmail.com>
 <20220314035118.gbjbrwbsywxljjti@vireshk-i7>
 <20220314065434.GA43329@9a2d8922b8f1>
 <20220314073102.l6vokyookzyo76hj@vireshk-i7>
 <CAK8P3a1Go8xiQG=BLBmqoQiVqwkcR+T8gi0WLijzVfa3A_WuKA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK8P3a1Go8xiQG=BLBmqoQiVqwkcR+T8gi0WLijzVfa3A_WuKA@mail.gmail.com>
User-Agent: NeoMutt/20180716-391-311a52

On 14-03-22, 11:27, Arnd Bergmann wrote:
> I don't think that it was meant to have a fixed order: unlike the other
> bindings that define xxx-names properties, dmas require giving
> names to allow the DT to specify more than one possible DMA
> specifier for a given name. This means that nothing may ever just
> rely on an index but has to use the name for lookup.

Is there a way to update the yaml or tooling in that case so it doesn't expect a
fixed order ?

> OTOH, while fixing the order in the binding does not add any
> value, it's also harmless as this should never be able to break
> anything that worked for any combination of old/new dtb and
> kernel, and it's probably easier to express in the binding.

I agree, but such a patch shouldn't be required at all, which caught my
attention. It is fine to merge it and won't break anything, but it shouldn't be
required as well.

-- 
viresh
