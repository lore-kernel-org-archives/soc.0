Return-Path: <SRS0=EBsN=CK=gmail.com=aweber.kernel@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DDBFEB64DA
	for <soc@archiver.kernel.org>; Thu, 22 Jun 2023 12:52:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 2959BC433C9; Thu, 22 Jun 2023 12:52:41 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 197A1C433C8;
	Thu, 22 Jun 2023 12:52:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 197A1C433C8
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3113306a595so6093661f8f.1;
        Thu, 22 Jun 2023 05:52:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687438358; x=1690030358;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3Gd2rN+LYgXaVXhDv5TDP/9OSYFS9BOQ/d4mluuIDQQ=;
        b=W1SASCkJJx2JO4wmg5Y6XkrTiXnrIUmpqlOoiFo3KS15TLJ6H/xk0vQ4Hm0HZkO68F
         GDlJbHZ7dKmp82vgwqfoPTjib2LdB9lTTD/5o8RWM3YvcTatPyqdhuOOhQindOKs5EGr
         K4wZgoIMzmQywDiTJhxSJ4yHq8rCaNFppDdMrqRXs1DsEDzETwMgpd5i1M3rFyjrHch7
         F5jFUvcWPTGXsPdoH7lmjFhSHFNs5cqtfyShsm84McHFcCsMYwCkGCyFboY44d8iO8QB
         OdX8UgmKwO0u3cGc5ulLlNWdMonv+t7d5Eu1ytR7gpP7IOceNDZX69hdNYHkQyCmukPc
         8eIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687438358; x=1690030358;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3Gd2rN+LYgXaVXhDv5TDP/9OSYFS9BOQ/d4mluuIDQQ=;
        b=BWLPNwagiLyUSKTVzCpgefHZhr2uDntGDmUGr2vcQ4+USYD3Rd8MBKcms7ifvLDx7S
         etshQ16378b9suhNIQ0kFoXN/ncFJuxlDVDkknNiJbbXAxd7bv/eXxIWM3Mo0Zn7ed7f
         rLXK96YUwyh2ddZxMMuoIdrZn7I8Q/8E0EFgy0cnWPx+/om8dMR+0gv3SX7QeIVWE7n/
         ZNW/2MsLMi+dPygqZW7WlDlIB9JW2V8PXMaz6iECX3hj+QW+BHaldjJPbDWon/Tv+H9h
         kuzOUuDRbVYnA48F5OyGs8p74Yveb8hUc5vUQ0iL/oOyeyjotnic4EG0GmaRkudbBiQe
         DLrw==
X-Gm-Message-State: AC+VfDwpBlS1EjlZJbd9/rSWNfQOhb8uyaWdFyEokFnR9fEKD0doU5uW
	2EMrpmopmdVR2V6bM3K8f1Q=
X-Google-Smtp-Source: ACHHUZ7ZYlmGLpIp0K2LCIOaOUR7YxW9hjMU9sBUEZ4cRW5uMjQdIBs4ZoVUvmJM6BFMi/rCW1clng==
X-Received: by 2002:a05:6000:1191:b0:30a:b147:69db with SMTP id g17-20020a056000119100b0030ab14769dbmr17036899wrx.24.1687438357849;
        Thu, 22 Jun 2023 05:52:37 -0700 (PDT)
Received: from [192.168.50.244] (83.8.116.77.ipv4.supernova.orange.pl. [83.8.116.77])
        by smtp.gmail.com with ESMTPSA id g3-20020adff3c3000000b0030e52d4c1bcsm7017073wrp.71.2023.06.22.05.52.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Jun 2023 05:52:37 -0700 (PDT)
Message-ID: <72af054e-e82b-917c-1f9b-fe231dcfa5bf@gmail.com>
Date: Thu, 22 Jun 2023 14:52:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
From: Artur Weber <aweber.kernel@gmail.com>
Subject: Re: [PATCH v4] ARM: dts: exynos: Add Samsung Galaxy Tab 3 8.0 boards
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Olof Johansson <olof@lixom.net>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, soc@kernel.org,
 Rob Herring <robh+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Alim Akhtar <alim.akhtar@samsung.com>, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
References: <20230604165627.16963-1-aweber.kernel@gmail.com>
 <aae10e8f-b4f2-7417-ab08-41d6ec9ab8fc@linaro.org>
Content-Language: en-US
In-Reply-To: <aae10e8f-b4f2-7417-ab08-41d6ec9ab8fc@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 04/06/2023 21:15, Krzysztof Kozlowski wrote:
> On 04/06/2023 18:56, Artur Weber wrote:
>> +/*
>> + * This device does not use the built-in RTC; instead, the RTC in the
>> + * S5M8786 PMIC is used instead. Remove the unused node to avoid DTB check
>> + * warnings.
>> + */
>> +/delete-node/ &rtc;
> 
> This is not the solution. The S3C RTC is there. Just like all other
> boards we have two RTCs and DTS should be complete. Definitely you
> should not remove something just because there were warnings. Instead
> warnings should be fixed.

The problem is that the built-in RTC does not seem to work on this
device. I attempted to add it, using the same clocks as other devices
in mainline using the S5M8676 PMIC:

&rtc {
	status = "okay";
	clocks = <&clock CLK_RTC>, <&s5m8767_osc S2MPS11_CLK_AP>;
	clock-names = "rtc", "rtc_src";
};

However, it just prints the following on startup:

 s3c-rtc 10070000.rtc: rtc disabled, re-enabling
 s3c-rtc 10070000.rtc: registered as rtc0
 s3c-rtc 10070000.rtc: hctosys: unable to read the hardware clock

Since the internal RTC gets registered as rtc0, it's used as the default
by the OS, whereas the working RTC from the PMIC is registered as rtc1.
Writing to the internal RTC succeeds but the settings are not kept after
a reboot. The PMIC's RTC works fine.

This isn't a mainline-only issue; the internal RTC does not work in the
downstream kernel on this device either.

Not adding the RTC node results in a warning about missing clocks
(exynos4.dtsi only provides 1 clock, whereas bindings require 2):

arch/arm/boot/dts/exynos4212-tab3-3g8.dtb: rtc@10070000: clocks: [[5, 346]] is too short
	From schema: /mnt/linux/Documentation/devicetree/bindings/rtc/s3c-rtc.yaml
arch/arm/boot/dts/exynos4212-tab3-3g8.dtb: rtc@10070000: clock-names: ['rtc'] is too short
	From schema: /mnt/linux/Documentation/devicetree/bindings/rtc/s3c-rtc.yaml

...which makes sense, since we don't want to add clocks given that we're
not going to be using this RTC. I suppose deleting the node with
delete-node is a bit too destructive though.

I guess a good solution would be to set up the &rtc node as seen in
the snippet I sent earlier, but keep it disabled + add a note explaining
why it's done.

In your opinion, what would be the best solution?

Best regards
Artur
