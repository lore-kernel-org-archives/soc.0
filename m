Return-Path: <SRS0=14BC=WJ=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B9BDC43334
	for <soc@archiver.kernel.org>; Thu,  2 Jun 2022 06:39:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 44AB1C34114; Thu,  2 Jun 2022 06:39:54 +0000 (UTC)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 37A50C3411D
	for <soc@kernel.org>; Thu,  2 Jun 2022 06:39:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 37A50C3411D
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f46.google.com with SMTP id q21so8086946ejm.1
        for <soc@kernel.org>; Wed, 01 Jun 2022 23:39:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=U8bY1VsTwSvJLtTCVpYS8zjnyhHWXCpb6DcsheBwwuU=;
        b=aFsFTJkzXTh8mdS1vzPOzd4HVSbWgDQCiIEcbUCBYDdU64ksferzdLYR+a7iYQnvAM
         vV7xw+pQ8Rk4FH8R1DPyR0B98gXnzxacpNXiguYr2ZMM2eis8EOiEHT4aIaFds8XVwbn
         XhCG5DB/W88+dedWZmL+nF1J5j0mRaGey6l1ulJkPNQqB2mokRn2A2F/E8LAcQsj0v/O
         J/RNZSRfJBOrl2TdQTvSAqG8i9nKE/RWBsg1tWvPl4aH+DKkB4wdXdbemST2f/Erlq3w
         pr4kn4K8XmYdTsp4kvzzXYGAPX5FlmPm5Tf4MOmd3SZW6GdQSlCMvYTHYxQqdD/uEB9N
         PNew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=U8bY1VsTwSvJLtTCVpYS8zjnyhHWXCpb6DcsheBwwuU=;
        b=sHTEf42QOv0/pMyrfPUJeNc5dgx8Km4ApAyd6p6haMvLIemxteY3djlD9ZiZsRjQGX
         YGTUBjbmHW0nBKl1gjsACDueutewXJl/MiZwMIru4mJTmLfUpagUz9NrnR5xhPd/G5at
         eRn+vKuN3YeDZ3XS2l7B3r8y/7GoIEXqwceLsJUmeh2pWD3XN90BhTmWZ2aU1+lLETT2
         +Qm+TC1o9/RaXeqoywjcOz04rcC0OZ6fidNCzbg9CGux1i71mbXidEqwSWfIS/gJrqbu
         sJhyIixk9EWg0WXNPVKhQEtd1BAeDKvINs9TzOng8ZqJLlPVn2TItK3ch//XN/w7Y/MU
         FwuQ==
X-Gm-Message-State: AOAM5331PUatR+LVcHdDYdRymn1sVjXATZEI+q4ONtNjFF8e0SqlpTjn
	1AVg0KugAHKOgXrYpkxxDNeZ9g==
X-Google-Smtp-Source: ABdhPJya2ipZqZVcNatkJIMO5YNBK1s99TBjluK9v6qBTZq6ehBFSCW6Nro/f9f3XMT87AzNmhygLQ==
X-Received: by 2002:a17:906:dc8a:b0:6f9:13e9:4c87 with SMTP id cs10-20020a170906dc8a00b006f913e94c87mr2713777ejc.729.1654151991533;
        Wed, 01 Jun 2022 23:39:51 -0700 (PDT)
Received: from [192.168.0.181] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id dc15-20020a170906c7cf00b006ff045d7c9bsm1428746ejb.173.2022.06.01.23.39.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Jun 2022 23:39:51 -0700 (PDT)
Message-ID: <5b0666fb-cd98-7128-95df-bd8b779aab14@linaro.org>
Date: Thu, 2 Jun 2022 08:39:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v2 2/5] ARM: dts: socfpga: Move sdmmc-ecc node to Arria 10
 dts
Content-Language: en-US
List-Id: <soc.lore.kernel.org>
To: =?UTF-8?Q?Pawe=c5=82_Anikiel?= <pan@semihalf.com>, soc@kernel.org,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: arnd@arndb.de, olof@lixom.net, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, dinguyen@kernel.org, amstan@chromium.org,
 upstream@semihalf.com
References: <20220601154647.80071-1-pan@semihalf.com>
 <20220601154647.80071-3-pan@semihalf.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220601154647.80071-3-pan@semihalf.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 01/06/2022 17:46, Paweł Anikiel wrote:
> The ecc manager is a part of the Arria 10 SoC, move it to the correct
> dts.
> 
> Signed-off-by: Paweł Anikiel <pan@semihalf.com>


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
