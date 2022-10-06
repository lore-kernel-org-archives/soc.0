Return-Path: <SRS0=jc5J=2H=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A726FC433FE
	for <soc@archiver.kernel.org>; Thu,  6 Oct 2022 07:06:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 664D1C433B5; Thu,  6 Oct 2022 07:06:53 +0000 (UTC)
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 5BEC1C433D6
	for <soc@kernel.org>; Thu,  6 Oct 2022 07:06:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 5BEC1C433D6
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f180.google.com with SMTP id p5so1140634ljc.13
        for <soc@kernel.org>; Thu, 06 Oct 2022 00:06:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=9mXNHzVsTEVd4935gfs6itkkTtXeUwH+rKIsrH0IphA=;
        b=m3VBjRSHJ3vBNgKD1XqaNRXrJhDyLwgu4IYJoJdczIXENYvuMqanwMtuz0I+56aQW0
         VxD03n6CHVIEl8rU3Muj6ubWiI+eBy2borRnlLhWMzwWkQHN8NzJAdPpPRpFfzf3LorV
         XE4VsGCONaFzfjL1DvkVoDWLEv2DyVnvMmlIvh6IFOx3SWlSkBL/dC5ZXchmgK8ezV/b
         TydjWWDUGvXneDerdL58e6kXDtttURX9HKSxSPIjTjDbHBPK5Au0QFe5Qra+t0TWe3gA
         Fmahy8C7lQQZswkBv3GnXZMuLoIfo857LGraeEDnuzw5hnKeh7YTHv0gDLfTdV1jtBod
         0ecA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=9mXNHzVsTEVd4935gfs6itkkTtXeUwH+rKIsrH0IphA=;
        b=peX9pddDK9Jlsbv5btUFaAEnW0UJrBY8wWSh4hZ0h8PlW58VGxssBlJNZpf5+92RSQ
         Z9RWrikMB1CNlOwjB5mV+hu+JyZQTcP702S78Vc/kjBpX8s8Vh85TWAJuSnIvmV+x42V
         qNwMZNhqGxoMXVlMr9XG8Uml1WfMYBuAEWPHuwcPHRVzuOPzQcXUUzwFr+x8OJhXytaA
         a4czHS0lBC3wZy0HM2gh6BNaoae0bqDv4MK0TXLAUBqoVCqhqWaPcqkffv7KKGekx5vr
         DbaSF1tZbwO+yb5vqiNJvNH82UCyLvUe1SN34Sjq0mVxD2zlRZpx35xl25yt0bNj2VFM
         Pigg==
X-Gm-Message-State: ACrzQf3nKLxxU5ASnq+wkl+l5n8v7BAAIUCVsIQhZSkJ3P+6AcQZVMVV
	2rvSBsYXCASba9QhQWkvtC1OYw==
X-Google-Smtp-Source: AMsMyM6+yDM1ZMdH/zd3pXzG8dDRC6Zf7oHMK+3sqCskkXS5zdXqyvSMe5z/xvbwPsBETQMXnf9ulQ==
X-Received: by 2002:a2e:a370:0:b0:26d:d69f:5aff with SMTP id i16-20020a2ea370000000b0026dd69f5affmr1227102ljn.319.1665040010345;
        Thu, 06 Oct 2022 00:06:50 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id g22-20020a05651222d600b00485caa0f5dfsm2601158lfu.44.2022.10.06.00.06.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Oct 2022 00:06:49 -0700 (PDT)
Message-ID: <8d26031e-c595-5d4a-7874-4d3a14834755@linaro.org>
Date: Thu, 6 Oct 2022 09:06:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH v1 1/2] greatlakes: dts: Add Facebook greatlakes (AST2600)
 BMC
Content-Language: en-US
To: Delphine CC Chiu <Delphine_CC_Chiu@Wiwynn.com>,
 krzysztof.kozlowski@linaro.or
List-Id: <soc.lore.kernel.org>
Cc: patrick@stwcx.xyz, garnermic@fb.com, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
 soc@kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
References: <20221006063527.2007802-1-Delphine_CC_Chiu@Wiwynn.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221006063527.2007802-1-Delphine_CC_Chiu@Wiwynn.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 06/10/2022 08:35, Delphine CC Chiu wrote:
> Document the new compatibles used on Facebook Greatlakes
> 
> Signed-off-by: Delphine CC Chiu <Delphine_CC_Chiu@Wiwynn.com>
> ---

This is v2, not v1.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

