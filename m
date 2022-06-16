Return-Path: <SRS0=sX7s=WX=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC04AC43334
	for <soc@archiver.kernel.org>; Thu, 16 Jun 2022 20:37:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 7E588C3411B; Thu, 16 Jun 2022 20:37:01 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id BACCEC34114
	for <soc@kernel.org>; Thu, 16 Jun 2022 20:37:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org BACCEC34114
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f169.google.com with SMTP id y6so2196770plg.0
        for <soc@kernel.org>; Thu, 16 Jun 2022 13:37:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:cc:from:in-reply-to:content-transfer-encoding;
        bh=E51hIQZ40f3QqFw80DRIhYWi7mhUqOpvxoosSE7qNkI=;
        b=IinKuwvDnNLEWJeDOevtyk/lAqJZP57Akm4dK66P3cKbLGyAYWVlcfTjjv05ChSMXT
         THEGoWaxHQ6So2p4Gi39Mb1+B/CdqUdF/CHO+ZstUngWxRe4ezHQE1keZjmrlsnHhOE1
         d2b7a25kzArhAAR0B5xiWwB8xcXrg6yuKQ7Bg/tQwayP5wod3OI5cPwdc59N7SsHh8oj
         xIUvhh0S5WDLASHWRYMixF4FY96hB2Spma7LzykNaoKVhLeA6xfEfRwLglwKCHsN+Q3H
         b6J3fY2Q/Ex4W4akScU/N9U/XcP3L8It1v3vaoICm8ThjuFDrPflSEisVvvxktcfzXGm
         g+GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:cc:from:in-reply-to
         :content-transfer-encoding;
        bh=E51hIQZ40f3QqFw80DRIhYWi7mhUqOpvxoosSE7qNkI=;
        b=aITWbwy0CE1a+tE5Vc+9BNDgimHLPs244y5d+y7wNHt93RT9u+7MqPx32o8FC0wV/7
         7RJRnBDAQusOJbviGhOladdVXETeZcrGBnRMRYSRFb6HHgOcuVJy6/KBZhZY1aFzx4It
         Bpt01z0amZafv5QLA3agSw61q+efqZTG40p0vU4DXrVBvrr+Ec78CB54FTw3+yz6VcrN
         l0PD9jRGMWEUp3ko+1LwoJaFkXV8nsXd10PA0+TdLWZ7NKxOyzuYlTasVmOKPdB3ZxZ+
         p5ISyn5zgpUNzQvGVvoF/3mGDMDQ109wc80BXZCiiiYOjwYMroIKwi39A5iipoXi1aII
         EN9g==
X-Gm-Message-State: AJIora8r+yiglgVDNWdhDCilpfIoATZv0QZjmKi8hGX6ACd3FAGirMXP
	OB2LjGXfexLBSLr3rt3W4E2dUA==
X-Google-Smtp-Source: AGRyM1uopfEHYuWzZ4pnBMx1dSiZUpXEVR6mXp6GjuuUjON84+lsG4j8diSn65znvoiZn7uZt+qbyg==
X-Received: by 2002:a17:90a:384f:b0:1ea:fa0b:3132 with SMTP id l15-20020a17090a384f00b001eafa0b3132mr3265817pjf.5.1655411820137;
        Thu, 16 Jun 2022 13:37:00 -0700 (PDT)
Received: from [172.22.33.138] ([192.77.111.2])
        by smtp.gmail.com with ESMTPSA id m70-20020a633f49000000b00408b966228csm2225798pga.49.2022.06.16.13.36.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Jun 2022 13:36:59 -0700 (PDT)
Message-ID: <1338cf79-d57d-d13b-896b-abc0c726a238@linaro.org>
Date: Thu, 16 Jun 2022 13:36:58 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 1/2] arm64: dts: mediatek: adjust whitespace around '='
Content-Language: en-US
To: Matthias Brugger <matthias.bgg@gmail.com>
References: <20220526204402.832393-1-krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-arm-kernel@lists.infradead.org, Arnd Bergmann <arnd@arndb.de>,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 soc@kernel.org, Rob Herring <robh+dt@kernel.org>,
 Olof Johansson <olof@lixom.net>, arm@kernel.org
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220526204402.832393-1-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 26/05/2022 13:44, Krzysztof Kozlowski wrote:
> Fix whitespace coding style: use single space instead of tabs or
> multiple spaces around '=' sign in property assignment.  No functional
> changes (same DTB).
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---
> 
> Output compared with dtx_diff and fdtdump.

Matthias,

Are you ok with the patches? Any comments?


Best regards,
Krzysztof
