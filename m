Return-Path: <SRS0=xFaO=CI=gmail.com=ychuang570808@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4468EB64D8
	for <soc@archiver.kernel.org>; Tue, 20 Jun 2023 06:36:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 96DFFC433C9; Tue, 20 Jun 2023 06:36:41 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id B458CC433C8;
	Tue, 20 Jun 2023 06:36:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org B458CC433C8
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-1b5452b77b4so25330125ad.3;
        Mon, 19 Jun 2023 23:36:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687243000; x=1689835000;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZGEmrwD87vPFZUFP2nZhIGYTM3YLut9ycTQ9fNJPTvM=;
        b=nBYjkIB7Fl5l9oZIti5KfGcFEFHV7nBN3fW7O1ANniaQgyfDO+/hk7i8PTgRYQ7kdP
         sP8SoY8l5R5nxBFMt9nhD7Q7MfYoKaz/AOF/rnS4ZEdMb59NA39JwadA511mdG4rBaD6
         N9rZDoet1bKBS30VQZNfqi9oBdB9nlGydX2WybtUCwsdvR3GpzljdgwQXgfDBBWuS7rt
         evvZ/+rnb8V99NrOrlTU1FZkIdO29Of+VAi2iuIhaVO+ZeVxm/T+PvTak+QU9JLtSLch
         VIrmItN/GxQXiuyXOetquNt3Wp51mEw7EL+FDjhCnJ/K1mofwiTN2X00MsWpRNpyq1v0
         Ibhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687243000; x=1689835000;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZGEmrwD87vPFZUFP2nZhIGYTM3YLut9ycTQ9fNJPTvM=;
        b=Pw7sr2E/zm8Flq+u0QtwjR0CiiK9K/+BElA/jZxhRlVtIdXX7Ed0xdONOAP08XKzGI
         y8d3oltr6QNqIxyw2MBWGtCGTe0FxMlsbNVfTwmsq2F/qj2zeQG5A7uRf1RmC10V2GEM
         XaJZREYqV/dFX82SHdAuUun3S4SHHJzvN/jfRaxx7dIqzFFeYO8St+WWeCSc+YWsjraF
         7Z3Jv1XQAcPAZ9fgLl8q5b0cmD9G80agIhibC2f9FDNCb8jNT4WPBKVAOlNhXQZPjaEt
         k36NCllBZlNZfqPPPDLBbgun0JYtTi87bLb04ZJ30m9Awf8jGwIlbt1qxbbogvLCiLFu
         W/wg==
X-Gm-Message-State: AC+VfDzDqUqg0FRkvByRvjHTz7DQf/f/YSxBEqU1F768dh31nbD3P0CZ
	j+xKtddf1CSclQvPyDsg0zQ=
X-Google-Smtp-Source: ACHHUZ4/AFBPIzSfplimyzKmDs1iXEkO4b1qEdNgAdAIuPilnx/NFiqQYyVkMBt5HwtM38RTfL8b5A==
X-Received: by 2002:a17:903:2284:b0:1b6:66f1:358f with SMTP id b4-20020a170903228400b001b666f1358fmr4576736plh.24.1687242999526;
        Mon, 19 Jun 2023 23:36:39 -0700 (PDT)
Received: from [172.19.1.47] (60-250-192-107.hinet-ip.hinet.net. [60.250.192.107])
        by smtp.gmail.com with ESMTPSA id q21-20020a170902b11500b001b414fae374sm787522plr.291.2023.06.19.23.36.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Jun 2023 23:36:39 -0700 (PDT)
Message-ID: <c229876f-5a0f-fab9-c006-adf42bfd892d@gmail.com>
Date: Tue, 20 Jun 2023 14:36:34 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v16 1/1] clk: nuvoton: Use clk_parent_data instead and add
 a header file
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, lee@kernel.org, mturquette@baylibre.com,
 sboyd@kernel.org, p.zabel@pengutronix.de, gregkh@linuxfoundation.org,
 jirislaby@kernel.org, tmaimon77@gmail.com, catalin.marinas@arm.com,
 will@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-serial@vger.kernel.org, arnd@arndb.de, soc@kernel.org,
 schung@nuvoton.com, mjchen@nuvoton.com, Jacky Huang <ychuang3@nuvoton.com>
References: <20230620015120.234041-1-ychuang570808@gmail.com>
 <20230620015120.234041-2-ychuang570808@gmail.com>
 <e847c114-224b-fb69-e2b1-7881b8f8ec90@linaro.org>
Content-Language: en-US
From: Jacky Huang <ychuang570808@gmail.com>
In-Reply-To: <e847c114-224b-fb69-e2b1-7881b8f8ec90@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 2023/6/20 下午 02:22, Krzysztof Kozlowski wrote:
> On 20/06/2023 03:51, Jacky Huang wrote:
>> From: Jacky Huang <ychuang3@nuvoton.com>
>>
>> 1. Update all parent clock string arrays with clk_parent_data structure,
>>     and replace the usage of clk_hw_register_mux() with
>>     clk_hw_register_mux_parent_data().
>> 2. Introduce the header file clk-ma35d1.h to include shared external
>>     functions.
> These are two things thus commits.
>
> This is not v16. It's your first version of this patch.
>
> Best regards,
> Krzysztof
>
Dear Krzysztof,

Thanks for your advice.
Okay, this is the first version, and I will split it into two separate
commits and resubmit it as v2.


Best Regards,
Jacky Huang
