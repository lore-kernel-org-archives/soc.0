Return-Path: <SRS0=0I20=2N=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA943C433FE
	for <soc@archiver.kernel.org>; Wed, 12 Oct 2022 13:11:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id B015BC433D6; Wed, 12 Oct 2022 13:11:05 +0000 (UTC)
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id B4BEEC433C1
	for <soc@kernel.org>; Wed, 12 Oct 2022 13:11:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org B4BEEC433C1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-qt1-f180.google.com with SMTP id r19so1890198qtx.6
        for <soc@kernel.org>; Wed, 12 Oct 2022 06:11:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UqyKv0XYLPEVdA5JJtsH2C4lrk87Khcgzczr+S4ad18=;
        b=MqaobulmgicuadCCH89dsRp8x/x4N6tzQugx5DMzikid18PoYnadVJtRbEBLfCHQiI
         5q+YNh97Jl0AMjtR+qF+0/0MmDwIbxcx1S/6I+1GpsBeZHziTyVpa+jCosnto1B/ZzaW
         RFoGKMS96CNXAwFQiCMez3Qpfy54SL88JGWTHka3+pwu31uXlsyZazC3JBVQduXYWny0
         +cd8wdxYySw2thR0pRlI0Q01XqY6a11wR9NiLT56MULAkxoPjvwS+RvdVsNEjWC2z9cp
         VmOyZQ40hL7RToidel5+andZTNlrzWXP4ayK/4922wBQN8SABAYOAx9RC8Kw/lf0vHd3
         DyBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UqyKv0XYLPEVdA5JJtsH2C4lrk87Khcgzczr+S4ad18=;
        b=K0wHowkrqfrEYz0hKr8aFtLb4kEAYK9vvVbZ1p1Unxo52IrOS9StdTIoehG71mMjv3
         0GzOF0CMdZ9oM2sl1oMxLOv1JxFUlkqTdFpRyGtcFjK8NR4gnBi7BoEn1IHIVWW8GI3d
         hx14X3SlQWIcGb0dbW+MX6lz3NsCTiqSkYN3yGtl6kbJia+PfkH27unDaMkGFqgM302J
         wIG0yNmpG6oXbltkMEfZD95w6zjxKTsiLAdF9QYHlv40OjHTLG6IHhagZe0NLPC/S/NW
         Oe7f5PRzgLOXjeOv2rWlIVsgwj64Xos5We2TTk+bOzd9R5aV31P2NlJLpOijXi4bdeto
         8t9A==
X-Gm-Message-State: ACrzQf35Rx+odQ2J2XVzb7C57/ccONP94wbE3eH/bu3LyJmwn9wFF4sJ
	ZhYAtlwTp2R3hCfHqrETAJzTKQ==
X-Google-Smtp-Source: AMsMyM4tx+xcp7HZkRDiMRLGc4Qh39k6W10pp8XbW0JoxyTNqsJPbm86beuyuM1vWEooI9gyiiMTZw==
X-Received: by 2002:a05:622a:2d0:b0:395:e96a:8eeb with SMTP id a16-20020a05622a02d000b00395e96a8eebmr21894460qtx.176.1665580263754;
        Wed, 12 Oct 2022 06:11:03 -0700 (PDT)
Received: from [192.168.1.57] (cpe-72-225-192-120.nyc.res.rr.com. [72.225.192.120])
        by smtp.gmail.com with ESMTPSA id m8-20020ac84448000000b0039a1146e0e1sm6826054qtn.33.2022.10.12.06.11.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Oct 2022 06:11:02 -0700 (PDT)
Message-ID: <cdbcf5a3-3bb0-4270-1211-a45a0596224f@linaro.org>
Date: Wed, 12 Oct 2022 09:08:49 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.2
Subject: Re: [PATCH v2 08/10] dt-bindings: vendor-prefixes: add Source Parts
Content-Language: en-US
To: Icenowy Zheng <uwu@icenowy.me>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Andre Przywara <andre.przywara@arm.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-phy@lists.infradead.org, linux-usb@vger.kernel.org
References: <20221012055602.1544944-1-uwu@icenowy.me>
 <20221012055602.1544944-9-uwu@icenowy.me>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221012055602.1544944-9-uwu@icenowy.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12/10/2022 01:56, Icenowy Zheng wrote:
> Source Parts Inc. [1] is a company that makes a series of SBCs, SoMs,
> etc under a brand called Popcorn Computer [2].
> 
> Add it to the vendor prefixes list.


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

