Return-Path: <SRS0=bijT=UR=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9A52C433EF
	for <soc@archiver.kernel.org>; Thu,  7 Apr 2022 08:16:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 95A1BC385A4; Thu,  7 Apr 2022 08:16:18 +0000 (UTC)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 79153C385A8
	for <soc@kernel.org>; Thu,  7 Apr 2022 08:16:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 79153C385A8
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f44.google.com with SMTP id x24so505846edl.2
        for <soc@kernel.org>; Thu, 07 Apr 2022 01:16:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=xUYWxyJEg6leDM0Xoa+hYl6e09Zj0klrd/06rKmbpmY=;
        b=VDt+MTz290lEtYWH2rYjozi9VS/wDkTwYnmZ1LHSDAEKP9qIm5ptabMoOVy2BND0Jd
         0L/LUQaem3vZwxfUuvDjdbtMswNl1eX0QWzsSivBnM1zpfkIFZ4hXbyDzByJBJkrf2yo
         llVHCnqcLTsm62tnuOi5v/6b71TBZCDJNbHwM/PM0+G57hSSWjRQi+4dEon9BUSW8EIA
         hozevSwzAYq/hABD6Yre/N7t1Spx9rVku5XMnFRlg8vFRtQ5gD5N0lyqR4Vr1D/G7s7d
         WDjA5Dm7s8ar9mDYFoj7tTOBGU+uGdcq4XJBDLpdni7lwiaorQQeU5BNNHm43b2JjE+I
         qywQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=xUYWxyJEg6leDM0Xoa+hYl6e09Zj0klrd/06rKmbpmY=;
        b=BNWTYa2/c3hJdvUeAM3reSA0YLaAtR/9NikbaRiCo9P3eQoFwIpqnYzgXPh39xr0Wd
         iBrEfuN698sRH56N/9lKARHC/HNoPW3O5uL923LC6pRgRSqTE93U7G2ZEiNUSZi1ocpv
         F/MM3dKPR0ae/zkLW2SFmnkeG3kuGxW12wu6ik91pOYYRvQOe/gwqHcffZnImroU8kCd
         JJC4emxbKtTGvJxaW4m2jopOUwT3og1+LD2Uq+T1QXMTtUmaXgY1ih6FOD+qXv+/djyy
         qJ0s64gn8sf5QhJZPmNZl+mntRw0O35NNL5m+QYlNMyDEqcPV/KRwW1D1SrfI00SkZdB
         p0dg==
X-Gm-Message-State: AOAM532AtuqU7sjllqe00n65V4nSw9NE+oeEa+U49tYpi3bqheX65JlX
	3DSwA95YLQwP5XTz9xjxbMC98g==
X-Google-Smtp-Source: ABdhPJy/ERLqCYKh9BpiL5bF6j78reR9LcaBuPraPoj6GLaivpbUlPeSk3kUE3ntnN95zAfa0g/A9w==
X-Received: by 2002:aa7:cc96:0:b0:410:b9ac:241 with SMTP id p22-20020aa7cc96000000b00410b9ac0241mr13117970edt.246.1649319375803;
        Thu, 07 Apr 2022 01:16:15 -0700 (PDT)
Received: from [192.168.0.185] (xdsl-188-155-201-27.adslplus.ch. [188.155.201.27])
        by smtp.gmail.com with ESMTPSA id g10-20020a056402090a00b004196250baeasm8923523edz.95.2022.04.07.01.16.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 Apr 2022 01:16:15 -0700 (PDT)
Message-ID: <c46aa011-1292-0dfb-2f10-a4d9f9a4fdaa@linaro.org>
Date: Thu, 7 Apr 2022 10:16:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [GIT PULL] ARM: samsung: Fixes for v5.18 (current cycle)
Content-Language: en-US
List-Id: <soc.lore.kernel.org>
To: Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>,
 arm@kernel.org, soc@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Alim Akhtar <alim.akhtar@samsung.com>,
 Krzysztof Kozlowski <krzk@kernel.org>
References: <20220407080545.112290-1-krzysztof.kozlowski@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220407080545.112290-1-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 07/04/2022 10:05, Krzysztof Kozlowski wrote:
> From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> 
> Hi,
> 
> For the v5.18, please.

Argh, I need to update my email in my scripts as well. The tag is done
with correct identity.


Best regards,
Krzysztof
