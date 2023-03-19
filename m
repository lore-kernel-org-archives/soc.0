Return-Path: <SRS0=S7z/=7L=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7780C7618A
	for <soc@archiver.kernel.org>; Sun, 19 Mar 2023 12:41:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 9BFDAC4339E; Sun, 19 Mar 2023 12:41:08 +0000 (UTC)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id BB4B3C433EF
	for <soc@kernel.org>; Sun, 19 Mar 2023 12:41:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org BB4B3C433EF
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f42.google.com with SMTP id eh3so36890763edb.11
        for <soc@kernel.org>; Sun, 19 Mar 2023 05:41:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679229666;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Jqs9wvtDvbHEpBmEh+6ID4c/WMp9hQY/Vc+/3YrKVW8=;
        b=EEXtIUtYk/UlCsE04yZ0kG3xgBkjDtMWHULIdjIKeRfEZPl2dFg/xl5X9fcI3E3ORf
         qNEkg4jymYdVQYDXgGcaRcO37xbUrUwy/+8eoYeoRDCPYwT79iTcO5MBCYGBiHY5Rfbu
         ZV1vW7oh6y7t+qsYDFFnt45Sj5qNK7RJSsgzHU+bC1CW2GFFBIFXx4L1ITkDHT9ZBlF0
         oThLibnsO6M0sVKCzbgSsKcGT81hHiZCVDrLuY9j2DpgkCNsNO2CdsyIqEyKiVh9hx7n
         8sbXPuoe1HjM4g1fJNxDaMEJQ6BtkFzQVS8la+KGAzQWBTxbbDzuLz30G2b4q4HMOkG+
         e29A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679229666;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Jqs9wvtDvbHEpBmEh+6ID4c/WMp9hQY/Vc+/3YrKVW8=;
        b=JgQsIEWifwdFCcZWK8jeGkh1eb2+uB2AS3c0WWm5IORcWHu0KRq0mhG1720r/yT8N1
         Z7KGHMxJGH4XBMKy/2ax1nPcPhFlLRZBmr9so2O8rQe3V/a7IDKurmbPCBHStlqhhigD
         GhRYOdtmVuQHkXt0P1UOb2+k2jLCcypuuJ1XsKAR/DsUQSIEfaIPLD8xkgPSzhUynB0x
         jlNHC6AwhL8/Pr1uNKNppRDIuw8rPZd/m4SiicIjAfqeg8lHEJF2YYTISPylI0bmthqe
         rRya3x4Wu4Fr79JVludivSyrTEx2eDtg7Gm2+W0yLkRxMBkLpMdwSBuqSVhGfzsF6zWG
         eCPg==
X-Gm-Message-State: AO0yUKUDIAXy7wIT71fuU9LHx3vLGoF2cts9k3AicXVOikCXvdKRQWOl
	c6np1H9Op8NqhIQIIItdRkvUwA==
X-Google-Smtp-Source: AK7set+kvB3MshHjOpOxDFSVnKv6QPWuREn+wILV8eXtj/vPSwzFXi4QLPy5rSNWgVa0rjMDWaD7vA==
X-Received: by 2002:a17:906:278e:b0:930:bc07:3bf7 with SMTP id j14-20020a170906278e00b00930bc073bf7mr5817723ejc.5.1679229665964;
        Sun, 19 Mar 2023 05:41:05 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:5b5f:f22b:a0b:559d? ([2a02:810d:15c0:828:5b5f:f22b:a0b:559d])
        by smtp.gmail.com with ESMTPSA id z10-20020a1709060f0a00b009324e7e8b0asm2642815eji.154.2023.03.19.05.41.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 19 Mar 2023 05:41:05 -0700 (PDT)
Message-ID: <ce36769a-d9d3-c332-dc87-05e0672d39f6@linaro.org>
Date: Sun, 19 Mar 2023 13:41:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH V2 6/8] dt-bindings: ARM: fsl: Add chargebyte Tarragon
Content-Language: en-US
To: Stefan Wahren <stefan.wahren@chargebyte.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>,
 Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
 Evgeniy Polyakov <zbr@ioremap.net>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: linux-imx@nxp.com, Li Yang <leoyang.li@nxp.com>,
 Denis Ciocca <denis.ciocca@st.com>, soc@kernel.org,
 linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, stefan.wahren@i2se.com
References: <20230317103323.7741-1-stefan.wahren@chargebyte.com>
 <20230317103323.7741-7-stefan.wahren@chargebyte.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230317103323.7741-7-stefan.wahren@chargebyte.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 17/03/2023 11:33, Stefan Wahren wrote:
> This adds the compatibles for the chargebyte Tarragon boards.
> 
> Signed-off-by: Stefan Wahren <stefan.wahren@chargebyte.com>
> ---

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

