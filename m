Return-Path: <SRS0=0Aq4=CK=gmail.com=ychuang570808@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 135D7EB64D7
	for <soc@archiver.kernel.org>; Thu, 22 Jun 2023 01:46:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id B671FC433CA; Thu, 22 Jun 2023 01:46:26 +0000 (UTC)
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 93A22C433C8;
	Thu, 22 Jun 2023 01:46:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 93A22C433C8
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-54f85f8b961so4953903a12.3;
        Wed, 21 Jun 2023 18:46:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687398384; x=1689990384;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zPMiuxbS9NOOQ4+DNE9uNSqWe6GAo5kvJCb8pnY4nuU=;
        b=eEHocDbH9f9me9XpL+taH/BN1LFFZXMjMTqpcwslaXuz+vCBPROCyNBVK62b4fej4k
         3Gzm6TyXozGG1jzf/m9r8/IQaQjmMp5DSLthq/69nbB6wgrgg0YDptpZ20SSPmwyWETZ
         uKGHw1BgT6xsfR07WvbyYmithQtipKUUjF9g+ygIbS67/n9kzCl7BH07s10SVTUJAQy/
         7bRolrmyPG4r7iw9MVMkPLTLp6IAhGFOriLhEs60A+iR9X3EXSwnc+BoKQSIMUJLsVmr
         XCqdcAi4co7WohQ0sb0TVYQaR5ZuMEZUTQCoxLdFjWAOuLrfgp/MDTKRyhBPz5YxikGG
         YEkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687398384; x=1689990384;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zPMiuxbS9NOOQ4+DNE9uNSqWe6GAo5kvJCb8pnY4nuU=;
        b=YDY1U6ufflYZeISp9A5j7btZm84GJ8z7EgAuEcg7+nM5T5F8uYO4fPcBjdFmINNu2v
         iptW5M5qad3sEKbKAhY4amsb+06t7U7tqbadYgX3Yw4zM4TpZ3EEk9+t08KOlxRIca0R
         KfitHxrnBeV/hZW7IDJoUvVyTvCaUlih+9HU+GbBve2JDqmyWyyX1JYjOyeMxan+cXcR
         mxHMO3w67UbcsFY0irfxVt0N3z2ogWnPki2cLOm1Q1PdNUL5jcWKrH8ik0mFy0eNJdmF
         H6TWU2rlKGjd6JrGE23ETB3rFuxU2n4w47noqLnff0nQKyE1aMseRVSpBQGejxQGeUAH
         Emdg==
X-Gm-Message-State: AC+VfDwyATz0ZTn29QljV26qg71fyg5T3Nk5wzqYvRUw5J1T7mfX4aey
	Pln+oQHFncTN2AhGcQuZx8A=
X-Google-Smtp-Source: ACHHUZ76OXYU9TbS+0Z4NA+bFoq6TTgVUXYsp0Yq8bzgnHbGfhRcLhpb1I/4yXUI6fgY/i7Sgw4XcQ==
X-Received: by 2002:a05:6a20:3c92:b0:122:60e8:10e1 with SMTP id b18-20020a056a203c9200b0012260e810e1mr8627801pzj.31.1687398384117;
        Wed, 21 Jun 2023 18:46:24 -0700 (PDT)
Received: from [192.168.1.101] (1-160-168-200.dynamic-ip.hinet.net. [1.160.168.200])
        by smtp.gmail.com with ESMTPSA id r22-20020a62e416000000b0063b86aff031sm3461297pfh.108.2023.06.21.18.46.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Jun 2023 18:46:23 -0700 (PDT)
Message-ID: <8d87f85d-f239-bc8b-c48b-143ceac30082@gmail.com>
Date: Thu, 22 Jun 2023 09:46:21 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v2 2/2] clk: nuvoton: Use clk_parent_data instead of
 string for parent clock
Content-Language: en-US
To: Greg KH <gregkh@linuxfoundation.org>
List-Id: <soc.lore.kernel.org>
Cc: mturquette@baylibre.com, sboyd@kernel.org, arnd@arndb.de,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org, soc@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, schung@nuvoton.com,
 Jacky Huang <ychuang3@nuvoton.com>
References: <20230621031605.234149-1-ychuang570808@gmail.com>
 <20230621031605.234149-3-ychuang570808@gmail.com>
 <2023062103-obtuse-parasitic-e675@gregkh>
From: Jacky Huang <ychuang570808@gmail.com>
In-Reply-To: <2023062103-obtuse-parasitic-e675@gregkh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 2023/6/21 下午 08:51, Greg KH wrote:
> On Wed, Jun 21, 2023 at 03:16:05AM +0000, Jacky Huang wrote:
>>   
>> -	hws[AXICLK_MUX] = ma35d1_clk_mux(dev, "axiclk_mux", clk_base + REG_CLK_CLKDIV0,
>> -					 26, 1, axiclk_sel_clks,
>> -					 ARRAY_SIZE(axiclk_sel_clks));
>> -	hws[SYSCLK0_MUX] = ma35d1_clk_mux(dev, "sysclk0_mux", clk_base + REG_CLK_CLKSEL0,
>> -					  2, 1, sysclk0_sel_clks,
>> -					  ARRAY_SIZE(sysclk0_sel_clks));
>> -	hws[SYSCLK1_MUX] = ma35d1_clk_mux(dev, "sysclk1_mux", clk_base + REG_CLK_CLKSEL0,
>> -					  4, 1, sysclk1_sel_clks,
>> -					  ARRAY_SIZE(sysclk1_sel_clks));
>> +	hws[AXICLK_MUX] = ma35d1_clk_mux(dev, "axiclk_mux", clk_base + REG_CLK_CLKDIV0, 26, 1,
>> +					 axiclk_sel_clks, ARRAY_SIZE(axiclk_sel_clks));
>> +
>> +	hws[SYSCLK0_MUX] = ma35d1_clk_mux(dev, "sysclk0_mux",
>> +					  clk_base + REG_CLK_CLKSEL0, 2, 1,
>> +					  sysclk0_sel_clks, ARRAY_SIZE(sysclk0_sel_clks));
>> +
>> +	hws[SYSCLK1_MUX] = ma35d1_clk_mux(dev, "sysclk1_mux", clk_base + REG_CLK_CLKSEL0, 4, 1,
>> +					  sysclk1_sel_clks, ARRAY_SIZE(sysclk1_sel_clks));
>> +
> No need to reformat lines that are not actually changing anything, as
> this makes the patch harder to review for real changes in it :(
>
> thanks,
>
> greg k-h


Dear Greg.


Thanks for your advice.

I will modify the patch again to remove these irrelevant parts that have 
no practical effect.


Best Regards,

Jacky Huang

