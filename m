Return-Path: <SRS0=QYxC=AN=gmail.com=aweber.kernel@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6088FC7618E
	for <soc@archiver.kernel.org>; Sat, 22 Apr 2023 13:50:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 2849BC433A8; Sat, 22 Apr 2023 13:50:07 +0000 (UTC)
Received: from mail-ed1-f66.google.com (mail-ed1-f66.google.com [209.85.208.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id DAC8AC433EF;
	Sat, 22 Apr 2023 13:50:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org DAC8AC433EF
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f66.google.com with SMTP id 4fb4d7f45d1cf-506b20efd4cso4543642a12.3;
        Sat, 22 Apr 2023 06:50:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682171404; x=1684763404;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=WFcPcfg308BxIs2D12U44N+18aoFFJxwabh2xPhsPSk=;
        b=ZRWs3JpD4Cp5/pHGbDd0vrTAVGX7MoGwPJIJGgfDW35EVVzY7pVHO1cr+CMew4W30p
         LssfreTk3/208zOZke8KMcbc5fRWXdHA1gLcffdeonmQ1cUm09zZdb7Qax14xXqktigh
         QxVFZlPxVn+VDM9CKTWGq2LYuxR3RzYjFrprgWqmNAwY/xi4H8xNsc+kt0VKUI+/YJis
         qEI1pzNybL5k5euRWSNV8a+Zk0eVTMAXFwkhC0Ved4lMSY7As7fGXewYKgf18p+dGQsc
         OWQWry1WTSwtalqKuUvjPaulrvkzhckKJWomjmsPu5aIEGm3MfwYgVjIgZ9AR3G3sIm1
         gFYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682171404; x=1684763404;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WFcPcfg308BxIs2D12U44N+18aoFFJxwabh2xPhsPSk=;
        b=Y1aA/bowtUDYiwvVvonMB57ULhnTu+8rTkaDlbGqkFMmric2Ja8bdaMp7YZjtqTg+t
         t2haLEPk9lklA0k4TPVP2SvZRTF45zlpT0IJbYTUyCg5wp2i+zdAV3/l1b3sYWPUb1g1
         92qrA1dvb2mJQUgLlwzy8AY05RuwAbTUYOPGemJ3GBlzKXrkppY5J895Wz91wUE9OgbZ
         +EedIGS7OkpllgS/ca4zObK8PNGpdH7ak7r+1RFcnpD9/uBmhYMhB64243sBxQI6nbvS
         LlC4+iAlKHJc9yAtgW5N30Qovig4skUMkGnQVzyHdyRW8ENr0KmhfiqJA55SU9QvGMmo
         kXIA==
X-Gm-Message-State: AAQBX9f2k2mDKVpa7lt6IsoE7ru1My6MVqTU2CkLbyTgZoVfO5F2CZbS
	UfXaVeh5tO+lQwcYYS3JYHk=
X-Google-Smtp-Source: AKy350agXYSrpjkbP6WbEUuG++nS8/psneQ03hXKL+jNOlMEImcYh4gHMeo5CK525yNYdOAzt8ZgwA==
X-Received: by 2002:aa7:da41:0:b0:506:8660:77a3 with SMTP id w1-20020aa7da41000000b00506866077a3mr8228114eds.37.1682171403662;
        Sat, 22 Apr 2023 06:50:03 -0700 (PDT)
Received: from [192.168.50.244] (83.11.224.11.ipv4.supernova.orange.pl. [83.11.224.11])
        by smtp.gmail.com with ESMTPSA id v2-20020aa7d802000000b004ad601533a3sm2846990edq.55.2023.04.22.06.50.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 22 Apr 2023 06:50:03 -0700 (PDT)
Message-ID: <5818b5be-f9cc-8009-e2a4-1049d84a944d@gmail.com>
Date: Sat, 22 Apr 2023 15:50:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
From: Artur Weber <aweber.kernel@gmail.com>
Subject: Re: [PATCH v2 12/12] ARM: dts: exynos: Add Samsung Galaxy Tab 3 8.0
 boards
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: Alim Akhtar <alim.akhtar@samsung.com>, Rob Herring <robh+dt@kernel.org>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Tomasz Figa <tomasz.figa@gmail.com>, Chanwoo Choi <cw00.choi@samsung.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Olof Johansson <olof@lixom.net>, soc@kernel.org,
 Russell King <linux@armlinux.org.uk>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, Kukjin Kim <kgene@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-media@vger.kernel.org, linux-phy@lists.infradead.org,
 ~postmarketos/upstreaming@lists.sr.ht
References: <20230416133422.1949-1-aweber.kernel@gmail.com>
 <20230416133422.1949-13-aweber.kernel@gmail.com>
 <9aba4c1d-93f3-7613-6fb5-0591a281ec0a@linaro.org>
Content-Language: en-US
In-Reply-To: <9aba4c1d-93f3-7613-6fb5-0591a281ec0a@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

thank you for the review.

On 16/04/2023 20:26, Krzysztof Kozlowski wrote:
> On 16/04/2023 15:34, Artur Weber wrote:
> [...]
>> +
>> +		backlight: backlight@2c {
>> +			compatible = "ti,lp8556";
> 
> You need to convert bindings to DT schema first. I don't accept any new
> usages of TXT bindings anymore, sorry.
> 

I'll be taking a look at the conversion (will likely submit it as a
separate patchset, since I've been looking into some minor driver-side
changes there as well...), although I have one question - who should I
list as the bindings maintainer ("maintainers" field in YAML format)? Is
this someone specific for that subsystem, or the author of the driver,
or someone else? (It's worth noting that there isn't a maintainer listed
for the lp855x driver in the MAINTAINERS file.)
Documentation/devicetree/bindings/writing-schema.rst doesn't really
mention anything about this.

>> +&bus_acp {
> 
> Order label/phandle overrides by name, so acp before dmc.
> 

Out of curiosity - should I order the children of the / node or the
pinctrl nodes by name as well?

Best regards
Artur Weber

