Return-Path: <SRS0=5Cdg=W3=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E054C433EF
	for <soc@archiver.kernel.org>; Mon, 20 Jun 2022 11:14:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 4840FC341C8; Mon, 20 Jun 2022 11:14:48 +0000 (UTC)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 1E50CC341C6
	for <soc@kernel.org>; Mon, 20 Jun 2022 11:14:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 1E50CC341C6
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f41.google.com with SMTP id o7so20420033eja.1
        for <soc@kernel.org>; Mon, 20 Jun 2022 04:14:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=3YSnqTYqRuc0HngtFWPh5+kNVV+S5mddHDRCwdOnK0Q=;
        b=sHfqVD9QVh6BFE86b+wXb3sr+EcPv8EmCTq887SRnIWvpaBi2tnrvqH3pfdrb9C72k
         UVSz7dQylpwxlc/9Q3nx7I3S9URKtp5lwVgnAQNKpqbvQzMn95Ay2BDX8YDdGZzNLzoS
         mVQyJIfBVpyQeBm3O1smpb5rG6XxDGm6AMwcgeWrEnEAvjxgCmxOoYKF1brDSObo1luK
         Hi93uucIiYVsCIwEFRMLkc5t8Un37ivWtKKKHlwFillSc5tJjqTkC4buXrcrnZufCRvF
         tOcpCE0p7fn3JEF7/eDX1L4D0RSnAuI0Bu1+fZRcwMxNds4oe3UVmrYyEPxp2odLL4EK
         HtDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=3YSnqTYqRuc0HngtFWPh5+kNVV+S5mddHDRCwdOnK0Q=;
        b=6njNWfWNk+zmlE8vSp9lCZgZYX8roCa5MFAffHohRW91cUQELqLaRUpdt7KhSk9SrK
         gXsd/BYRJXnQrTSyNjx4L5n3BBeWZqwREv1nftFDAyAuGvHmF75oJQ7xnUYdmnQR4lh7
         gBgdYXAXM4oqLATCb62kc/GlVLWU4HwoXt+mjf22HMHLjj5YlGZEhGvrA1qdXYBxGZJg
         61jQz3Vd/9wdQN4P6K93otqfI0JqV6zFZZ9QwIKui68vexxGCVG7PnHIHcVLbmycOeuU
         PaZbpSbT5NS5DQJwRDqApBZmLEoY8mh9AfUAsK6JaTcHVZ25+tTwl9HhH1R+ccE7R+I9
         xoOw==
X-Gm-Message-State: AJIora9N6Da7FPNv2tu/xcG09XjxVKQPxlRZrSe0RVV7LwOKp6zuOUuw
	HcYuCFAO4XMeiKHiG+J5dacgUQ==
X-Google-Smtp-Source: AGRyM1t0aGHuhS4the+spmM02P4NTAGwl1TwS0neV2qA6YlGz1BJWmh9mn5i1N2POVtWv9Fhp0eZOg==
X-Received: by 2002:a17:906:74d1:b0:712:2293:8f41 with SMTP id z17-20020a17090674d100b0071222938f41mr20109070ejl.495.1655723686682;
        Mon, 20 Jun 2022 04:14:46 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id c26-20020a170906171a00b006fed9a0eb17sm5699969eje.187.2022.06.20.04.14.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jun 2022 04:14:45 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Olof Johansson <olof@lixom.net>,
	Rob Herring <robh+dt@kernel.org>,
	linux-kernel@vger.kernel.org,
	soc@kernel.org
Subject: Re: (subset) [PATCH v3 35/40] ARM: dts: animeo: correct gpio-keys properties
Date: Mon, 20 Jun 2022 13:14:35 +0200
Message-Id: <165572367263.35195.8304905583649336155.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220616005333.18491-35-krzysztof.kozlowski@linaro.org>
References: <20220616005224.18391-1-krzysztof.kozlowski@linaro.org> <20220616005333.18491-35-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Wed, 15 Jun 2022 17:53:28 -0700, Krzysztof Kozlowski wrote:
> gpio-keys children do not use unit addresses.
> 
> 

Applied, thanks!

[35/40] ARM: dts: animeo: correct gpio-keys properties
        https://git.kernel.org/krzk/linux/c/91503e5a3b5aee6ac7240d1f03abe69253c14de9

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
