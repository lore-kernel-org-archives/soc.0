Return-Path: <SRS0=DfUx=DV=linaro.org=neil.armstrong@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0A5BC04A94
	for <soc@archiver.kernel.org>; Fri,  4 Aug 2023 13:16:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 8E29BC433CB; Fri,  4 Aug 2023 13:16:08 +0000 (UTC)
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 8375FC433C8
	for <soc@kernel.org>; Fri,  4 Aug 2023 13:16:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 8375FC433C8
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-2b9cbaee7a9so34126701fa.0
        for <soc@kernel.org>; Fri, 04 Aug 2023 06:16:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691154965; x=1691759765;
        h=content-transfer-encoding:organization:content-language:cc:to
         :reply-to:subject:from:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BqwP0XPoCGxv1DyF+/pXW97MbtedeRPSq5uwRhfwuyA=;
        b=DPOlCivjwpo+wG0cRO+q5wXSanDAa8/WFp+I4t3iZr5lqzwLrt5g+1ofeHfS0RhyFl
         zceTXXe7Nozk8pSRtyytLs6oJkdJovaYHEXsa2+KYBeHlz8tD38PYur2jd0UHQ+JvLw1
         xebk8fScggz7RpdAYlR5lLFKix/oK8QM9rTo5VqjOjmbovcqLEAcIFvil46Eks54BInd
         EUaADo7dK96I/JTTMRL1Eb7MYyG5fPdd0tLjrGTag5n1X5r6c6J1hyHmeABkvWpcGwu9
         sn+WCQTzL3lgvlp6hYdWJ6Yezkiv4T3L6o8yB1kI9kxQ+113K9EPWPTuWnuek8aZSS06
         SENQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691154965; x=1691759765;
        h=content-transfer-encoding:organization:content-language:cc:to
         :reply-to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BqwP0XPoCGxv1DyF+/pXW97MbtedeRPSq5uwRhfwuyA=;
        b=KW2Sv5ZARmKG2hz6jO6z3WA1MijpbdihEC+auA7nuz3atzCnIIyp97g8elYpYvt3JJ
         9edI2+qpNBBtXAWFYzebhpAIB0J3gLAfziqTbgM2ZZI0NPpvyKRd5B4P09tbOSaWEL9s
         h1ycnFdGzxbCArJIig0K4nyANgHAhz6dIxbK3fAPTqHL7BhcSW8/jLCRFHSEqZpygufu
         5FaclRaMvJt9xQdZWwNScspQIqteqG24gHITCoFgCH6QXMLRkIV5VS5M+E02KZZRYFIk
         gUQyCCfFp+9MAtydo4X+hLANDTGnNZ2O7P8ZZyeJyYeLiiOjvyC0whQfE1JoAqdHqm94
         D2UQ==
X-Gm-Message-State: AOJu0Yy7YgvlCYyQRFDc0fb8PHjudyvcIu2kKbiFUx3HWHkjL4GHv2Ix
	ZozY+QxE8CXixmbSJxfb4e/bafd7LMZNnImkhE2pAQ==
X-Google-Smtp-Source: AGHT+IHPND3VJLO1sWp/nInpN8wScTigvcoXLwR2LA+1uQD5hq06OqA/ChaVNWrWXsVlsFDvCaW/GQ==
X-Received: by 2002:a2e:998c:0:b0:2b7:2ea:33c3 with SMTP id w12-20020a2e998c000000b002b702ea33c3mr1804912lji.22.1691154965276;
        Fri, 04 Aug 2023 06:16:05 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:62a2:ed99:fec9:25cc? ([2a01:e0a:982:cbb0:62a2:ed99:fec9:25cc])
        by smtp.gmail.com with ESMTPSA id l22-20020a7bc456000000b003fc06169ab3sm6671279wmi.20.2023.08.04.06.16.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Aug 2023 06:16:04 -0700 (PDT)
Message-ID: <bbdfc9d4-6e02-a1aa-7871-b24f9da3419b@linaro.org>
Date: Fri, 4 Aug 2023 15:16:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: [GIT PULL] amlogic ARM updates for v6.6
Reply-To: neil.armstrong@linaro.org
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org, arm@kernel.org
Cc: linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Language: en-US
Organization: Linaro Developer Services
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

Here's an Amlogic ARM change for v6.6, Drop unused DT includes in mach-meson.

Neil

The following changes since commit 06c2afb862f9da8dc5efa4b6076a0e48c3fbaaa5:

   Linux 6.5-rc1 (2023-07-09 13:53:13 -0700)

are available in the Git repository at:

   https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git tags/amlogic-arm-mach-for-v6.6

for you to fetch changes up to b5bd2ccac2d5b2830c1d59e759e5e35e50639b99:

   ARM: meson: Drop unused includes (2023-07-31 11:58:18 +0200)

----------------------------------------------------------------
Amlogic ARM mach-meson changes for v6.6:
- Drop unused DT includes in mach-meson

----------------------------------------------------------------
Rob Herring (1):
       ARM: meson: Drop unused includes

  arch/arm/mach-meson/meson.c | 1 -
  1 file changed, 1 deletion(-)

