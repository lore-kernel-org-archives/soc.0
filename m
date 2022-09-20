Return-Path: <SRS0=4tTZ=ZX=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E070CECAAD8
	for <soc@archiver.kernel.org>; Tue, 20 Sep 2022 08:27:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id A8B45C433C1; Tue, 20 Sep 2022 08:27:19 +0000 (UTC)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 9D7B0C433D6
	for <soc@kernel.org>; Tue, 20 Sep 2022 08:27:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 9D7B0C433D6
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f48.google.com with SMTP id o2so2498696lfc.10
        for <soc@kernel.org>; Tue, 20 Sep 2022 01:27:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=rkPuKjWB8t4FYJYHNtyFAmh2TFPD2Tl5mYJFMngelcQ=;
        b=dQ/DjRpyzJOPnWU9+cHPp5K1+NyJCZhOur3fr22c9+x8TZvCIw3Wcm0Ssp0uyu0tu3
         yDDjrQf/390dPv2OjCBN9ar+Yslw5Vh0fVAQX8AlXvaY25n5382qD7bJM1e0241bf31K
         t/RWa92e+NIVi73NA2XJEQ9gC5SHHY6OG3PNjNkBoaEQRWlqWeS2vfA0PLbAB5wMazJB
         fHSWi3l/1HDzrc2oNVcqu+Sm13Pe3GWuxmuoytOGa0ws99C836uILRrzbUixZuOvSv/r
         ls+HmEav2ZSNabJ8ZLCTc+r9snw3TKsTKsXXK3TDBlrt0paJ/WLA95C0Sj8dn6pC7OFx
         a2uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=rkPuKjWB8t4FYJYHNtyFAmh2TFPD2Tl5mYJFMngelcQ=;
        b=0gJjm8jRI76p47rP2QOM5bEZy9qWckgj3e0xifMUeCezXriwlHULZzzGsGepnE9fEM
         64sXmWs1GgPsOtE7vKsOqXWS2s4zeX4//X4PBFMUPB2YafQGGjCPz70ZMu1140ImHuwL
         fwi3SLpZeVWJiPGvuKyvEmNPblUTv8RGgSARxfAKi8q/hahnhnJa4Yml2mSAry6EKiNs
         Ef1jfs9KRYuMnSng6GQMwL/R+R4g1Thvka8LcSqsrhUHS7UsAfmgVrUlibnGrt9LVIlZ
         KW/0LBAsrZKqNkr0g+DjefijNI7et5xHvNKe4f4/Pl1DWVH+oII+1YOgzzgsYrqvVjTo
         OjEw==
X-Gm-Message-State: ACrzQf3ebZsO4yMqxsKJfBwDJrwyU2FDgL9t7ZmIvWBmarHx2PKZKgxW
	Wb1I5GWAN9aa/NbFKoE8xKC8KA==
X-Google-Smtp-Source: AMsMyM4BFghKOOucFsHQ4S+QvuMdbzcePIG13Xz2ThhzLq10ft0xMOyHNHZhr6ZzPzppj24LyC566A==
X-Received: by 2002:a05:6512:261e:b0:49e:e7dd:8912 with SMTP id bt30-20020a056512261e00b0049ee7dd8912mr7259070lfb.360.1663662436750;
        Tue, 20 Sep 2022 01:27:16 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id n22-20020a05651203f600b004978e51b691sm190279lfq.266.2022.09.20.01.27.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Sep 2022 01:27:15 -0700 (PDT)
Message-ID: <9d702646-3517-be57-dbdd-c5e5d803dd4a@linaro.org>
Date: Tue, 20 Sep 2022 10:27:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH] ARM: dts: aspeed: greatlakes: Add Facebook greatlakes
 (AST2600) BMC
Content-Language: en-US
To: Bonnie Lo/WYHQ/Wiwynn <Bonnie_Lo@wiwynn.com>
List-Id: <soc.lore.kernel.org>
Cc: "patrick@stwcx.xyz" <patrick@stwcx.xyz>,
 "garnermic@fb.com" <garnermic@fb.com>,
 Delphine Chiu/WYHQ/Wiwynn <DELPHINE_CHIU@wiwynn.com>,
 Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
 "soc@kernel.org" <soc@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>
References: <20220920023042.19244-1-Bonnie_Lo@Wiwynn.com>
 <1b03d24e-7bd3-f912-b59b-f2199770e9d8@linaro.org>
 <HK0PR04MB3105362597B1E8CBF897D0E3F84C9@HK0PR04MB3105.apcprd04.prod.outlook.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <HK0PR04MB3105362597B1E8CBF897D0E3F84C9@HK0PR04MB3105.apcprd04.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 20/09/2022 09:28, Bonnie Lo/WYHQ/Wiwynn wrote:
> Hi Krzysztof,
> 
> I am sorry.
> I have revise the DTS according to your comment and revise the subject.

You send again the same patch. If you intended to send a version 2,
please indicate it. Git format-patch can help you. Our process also
explains it.

https://elixir.bootlin.com/linux/v5.17.1/source/Documentation/process/submitting-patches.rst

> I would like to update the patch to you, so I use "git send email" again.
> It seems like it doesn't reply the original mail but resubmit the patch.
> Could you guide me how I can reply the original mail thread and update the patch but resubmit it.

Resubmit same patch is not correct. You just did it. I expect new
versions of your patch. Each new version should be appropriately marked
with version number and changelog. Just take a look at other patches in
the list.

https://elixir.bootlin.com/linux/v5.17.1/source/Documentation/process/submitting-patches.rst

> 
> Thanks,
> Bonnie

Do not top post.


> This email (and any attachments) contains proprietary or confidential information and is for the sole use of its intended recipient. Any unauthorized review, use, copying or distribution of this email or the content of this email is strictly prohibited. If you are not the intended recipient, please notify the sender and delete this email immediately.

I notify you that I am going to remove the email immediately.

Best regards,
Krzysztof
