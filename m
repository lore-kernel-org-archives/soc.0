Return-Path: <SRS0=YOi0=SC=canonical.com=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1418CC433EF
	for <soc@archiver.kernel.org>; Tue, 18 Jan 2022 18:47:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 0208AC340E6; Tue, 18 Jan 2022 18:47:20 +0000 (UTC)
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 5D611C340E5
	for <soc@kernel.org>; Tue, 18 Jan 2022 18:47:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 5D611C340E5
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=canonical.com
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com [209.85.208.69])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 8664D3F19C
	for <soc@kernel.org>; Tue, 18 Jan 2022 18:47:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1642531637;
	bh=m+xP6bN0zKQ33R8bBjTU3wo4FVKXSjHRB56Y8SB1Y2Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type;
	b=G6ZqhmKcgjOcF0JxRVmPtTJA4zDGludRX+wN4e2R6EzX0tF54Ev/H4Ztr8W7JQXYa
	 YmWbaCAWFFXFMksZ3qkMSfSgv9sN5DJ0tDdMeRPNM7tM3nJQZwnUSzHQjd7fQynCd2
	 MaRuWrZIjFEwjYMjtQRiI10nJeKMhAF8hszXiMGtiEBfuHQ7pr5pzZx/YjjtmzDH8s
	 bQh3xaLkz71Hqn9rcHVZIVcv7TsvxA2Bmwfqxpx2tOI6NeJMN2oMx+YmW8SE11Y16q
	 rAn9ker+npplrvrD0opegA4h4wxNJze7zFINkUPyQIpNS7nlFWMiqZuIIP/2k0cRYX
	 jg8IhZkJJsuhA==
Received: by mail-ed1-f69.google.com with SMTP id t11-20020aa7d70b000000b004017521782dso10274653edq.19
        for <soc@kernel.org>; Tue, 18 Jan 2022 10:47:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=m+xP6bN0zKQ33R8bBjTU3wo4FVKXSjHRB56Y8SB1Y2Q=;
        b=IVR8qCwm6xVAJQKr7JwJinhOz6/elgN++8AMq6xHJJrYDdyPkgO1mlvGne2eXLbwF/
         1V3pX226CLdSZcT3bkCKTvQqyQzEO6WBdiXsEUQOpq/V1f2uvYNzLpr6vvwzYHcG7tXE
         vzF+9LUuk7Tg4M7OIQSsKjY/UBPX5puZ/7FbSLHuTpp9rQkwFxXWdo5cSXzLGcU/vsKc
         +8twGMWV2C+O7Wwz/0zH2/5SKW9IaS/rpPayDSRQ+evjYPe8v7HulL+9TbA4TpPV2yCm
         yKpo/vdpMhAj93tH9mjac5/k4xfw98EkyQ45Wgwy95Hb5AQay1vzcUQjrVCh9Xg+yF4D
         wycw==
X-Gm-Message-State: AOAM5337zrk+d34+QsA9/wAQI+QCdfcSv/LQBWYjq2ElNkFkpRLG7AM1
	k5feaTWxqldCZUmSB7qU4hFlZbyw1m+aFBfiX0ZEZNYYsYrnHd3Xb9Z9jz5CEQhzGh8M4jWiDdc
	R2kxiqPFRp1fc5o7zDuGQC/Y=
X-Received: by 2002:a17:907:9810:: with SMTP id ji16mr21457478ejc.202.1642531637294;
        Tue, 18 Jan 2022 10:47:17 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwhhrWDVROJkHhOAFBu8GoY4CzXaN/5V1ROMx/f1ASWRjjDQzxbHDuWfmOIns530yDN2yadsw==
X-Received: by 2002:a17:907:9810:: with SMTP id ji16mr21457468ejc.202.1642531637135;
        Tue, 18 Jan 2022 10:47:17 -0800 (PST)
Received: from [192.168.0.42] (xdsl-188-155-168-84.adslplus.ch. [188.155.168.84])
        by smtp.gmail.com with ESMTPSA id nd10sm5603511ejc.214.2022.01.18.10.47.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Jan 2022 10:47:16 -0800 (PST)
Message-ID: <ed1f3bd3-b17c-8c6e-35c6-c996cf0facfa@canonical.com>
Date: Tue, 18 Jan 2022 19:47:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: [PATCH v2 16/16] arm64: defconfig: Enable Tesla FSD SoC
Content-Language: en-US
To: Alim Akhtar <alim.akhtar@samsung.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 olof@lixom.net, arnd@arndb.de, linus.walleij@linaro.org,
 catalin.marinas@arm.com, robh+dt@kernel.org, s.nawrocki@samsung.com,
 linux-samsung-soc@vger.kernel.org, pankaj.dubey@samsung.com,
 linux-fsd@tesla.com
References: <20220118144851.69537-1-alim.akhtar@samsung.com>
 <CGME20220118150116epcas5p415b4b658b3ca3fe5e52e11a33546b926@epcas5p4.samsung.com>
 <20220118144851.69537-17-alim.akhtar@samsung.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20220118144851.69537-17-alim.akhtar@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 18/01/2022 15:48, Alim Akhtar wrote:
> This patch enables the Tesla FSD SoC in arm64 defconfig.
> 
> Cc: linux-fsd@tesla.com
> Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>
> ---
>  arch/arm64/configs/defconfig | 1 +
>  1 file changed, 1 insertion(+)
> 

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>

Best regards,
Krzysztof
