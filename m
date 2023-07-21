Return-Path: <SRS0=/aL8=DH=gmail.com=ychuang570808@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8268EB64DD
	for <soc@archiver.kernel.org>; Fri, 21 Jul 2023 07:53:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 9D2C8C433CB; Fri, 21 Jul 2023 07:53:17 +0000 (UTC)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 8E543C433C8;
	Fri, 21 Jul 2023 07:53:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 8E543C433C8
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-66f5faba829so1167213b3a.3;
        Fri, 21 Jul 2023 00:53:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689925996; x=1690530796;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SAHw9trszqEiKZzJ1aTuoJgaGILFPg2XoHAM0vKmy8M=;
        b=kBmwfFbnH66UKbd5uzguS4CJrw1s1qK1AjktCMo9CUthTXJuI7Vr/OhE4TreITotzx
         LLbysaxtPM9L5eJBoUdocdFNVLv2l4jyYA88nEKeuAicAyA6AHRLKiWo3hA8eygL8bKk
         mdbiFHQJaVt3owmyAmYyBvbhX2AiKRLiPist7/fya9f7+1uOnXVS1QDbqxPaw9UBc4P9
         MGHlAVMho38UKpmdowS965ODBf5Ak0L4jugH81R6j/7A1rdCXhlsufbQEZCx/92OkyJP
         1XcQ0yQRFpPHzZAEXwS8MoV9tLErPX1XeMAk1ViE9sb/G7/Bj4Oyy9D3ZNjurroFoHfU
         vmfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689925996; x=1690530796;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SAHw9trszqEiKZzJ1aTuoJgaGILFPg2XoHAM0vKmy8M=;
        b=LlNqyyXALxfzo1wT8FJWGyUdjKYrSKJFG6HoykIBotFpMpK3XCB24Aosoeo0g3BIjP
         3jJCsBFQ2F2RvLhzwEJpxO4manUFdYeGzV9rRNrSKc1Io+rgMqh2uSxo1LIbM6r70VzL
         DKdyLzd0MQrGZgCWygpfkSS81SUYuQO2VfRlQue5jpjdSW2zbNRTUbyj+IGWj3XSoeLt
         qgAEVzg9LlED2Uow+ItfY5p2Bpfu/MffR+zyZ1xPjuBxezsf2OaljhrKVTIiQHeHL85q
         Vdatgut9YRnS+LfXveAjDrl04yC2dTTsYdXmsRHxXYbd7zTLSSgokLsrLuIwJkKzgguL
         Znyg==
X-Gm-Message-State: ABy/qLZewA0EUG1oNk6fdsKZLvmn60QDM7kFTreJrbPEgYbU4HmBRmcN
	IlIjbDMbwLn/EEGd5YFRvDU=
X-Google-Smtp-Source: APBJJlEfR/yFfIFQP661HvXXfBIUUMAFvNviO7j1Uy75HhVCSGVVQArUTtUmi1UkY2Pr+Ei41bBizg==
X-Received: by 2002:a05:6a20:96c4:b0:136:fdee:11c7 with SMTP id hq4-20020a056a2096c400b00136fdee11c7mr878681pzc.15.1689925995672;
        Fri, 21 Jul 2023 00:53:15 -0700 (PDT)
Received: from [172.19.1.47] (60-250-192-107.hinet-ip.hinet.net. [60.250.192.107])
        by smtp.gmail.com with ESMTPSA id je7-20020a170903264700b001b8b0ac2258sm2755788plb.174.2023.07.21.00.53.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Jul 2023 00:53:15 -0700 (PDT)
Message-ID: <eeea4f10-16d7-d218-da55-c15ce6525b43@gmail.com>
Date: Fri, 21 Jul 2023 15:53:10 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 3/3] rtc: Add driver for nuvoton ma35d1 rtc controller
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 a.zummo@towertech.it, alexandre.belloni@bootlin.com, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 soc@kernel.org, mjchen@nuvoton.com, schung@nuvoton.com,
 Jacky Huang <ychuang3@nuvoton.com>
References: <20230720012826.430026-1-ychuang570808@gmail.com>
 <20230720012826.430026-4-ychuang570808@gmail.com>
 <5f867f68-4ad6-11c7-5c1f-f568889b0ddf@linaro.org>
Content-Language: en-US
From: Jacky Huang <ychuang570808@gmail.com>
In-Reply-To: <5f867f68-4ad6-11c7-5c1f-f568889b0ddf@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Dear Krzysztof,


On 2023/7/20 下午 02:14, Krzysztof Kozlowski wrote:
> On 20/07/2023 03:28, Jacky Huang wrote:
>> From: Jacky Huang <ychuang3@nuvoton.com>
>>
>> The ma35d1 rtc controller provides real-time and calendar messaging
>> capabilities. It supports programmable time tick and alarm match
>> interrupts. The time and calendar messages are expressed in BCD format.
>> This driver supports the built-in rtc controller of the ma35d1. It
>> enables setting and reading the rtc time and configuring and reading
>> the rtc alarm.
>>
> ...
>
>> +static int ma35d1_rtc_probe(struct platform_device *pdev)
>> +{
>> +	struct ma35_rtc *ma35_rtc;
>> +	struct clk *clk;
>> +	u32 regval;
>> +	int err;
>> +
>> +	ma35_rtc = devm_kzalloc(&pdev->dev, sizeof(struct ma35_rtc),
> sizeof(*)

I will modify this as
ma35_rtc = devm_kzalloc(&pdev->dev, sizeof(*ma35_rtc),

>> +								GFP_KERNEL);
>> +	if (!ma35_rtc)
>> +		return -ENOMEM;
>> +
>> +	ma35_rtc->rtc_reg = devm_platform_ioremap_resource(pdev, 0);
>> +	if (IS_ERR(ma35_rtc->rtc_reg))
>> +		return PTR_ERR(ma35_rtc->rtc_reg);
>> +
>> +	clk = of_clk_get(pdev->dev.of_node, 0);
>> +	if (IS_ERR(clk)) {
>> +		err = PTR_ERR(clk);
>> +		dev_err(&pdev->dev, "failed to get core clk: %d\n", err);
>> +		return -ENOENT;
> return dev_err_probe

I will replace these with

return dev_err_probe(&pdev->dev, PTR_ERR(clk), "failed to find rtc 
clock\n");

>
>> +	}
>> +	err = clk_prepare_enable(clk);
>> +	if (err)
>> +		return -ENOENT;
>> +
>> +	platform_set_drvdata(pdev, ma35_rtc);
>> +
>> +	ma35_rtc->rtcdev = devm_rtc_device_register(&pdev->dev, pdev->name,
>> +						    &ma35d1_rtc_ops, THIS_MODULE);
>> +	if (IS_ERR(ma35_rtc->rtcdev)) {
>> +		dev_err(&pdev->dev, "rtc device register failed\n");
>> +		return PTR_ERR(ma35_rtc->rtcdev);
>> +	}
>> +
>> +	err = ma35d1_rtc_init(ma35_rtc, RTC_INIT_TIMEOUT);
>> +	if (err)
>> +		return err;
>> +
>> +	regval = rtc_reg_read(ma35_rtc, MA35_REG_RTC_CLKFMT);
>> +	regval |= RTC_CLKFMT_24HEN;
>> +	rtc_reg_write(ma35_rtc, MA35_REG_RTC_CLKFMT, regval);
>> +
>> +	ma35_rtc->irq_num = platform_get_irq(pdev, 0);
>> +
>> +	if (devm_request_irq(&pdev->dev, ma35_rtc->irq_num, ma35d1_rtc_interrupt,
>> +			     IRQF_NO_SUSPEND, "ma35d1rtc", ma35_rtc)) {
>> +		dev_err(&pdev->dev, "ma35d1 RTC request irq failed\n");
>> +		return -EBUSY;
> return dev_err_probe
>
>> +	}
>> +
>> +	regval = rtc_reg_read(ma35_rtc, MA35_REG_RTC_INTEN);
>> +	regval |= RTC_INTEN_TICKIEN;
>> +	rtc_reg_write(ma35_rtc, MA35_REG_RTC_INTEN, regval);
>> +
>> +	device_init_wakeup(&pdev->dev, true);
>> +
>> +	return 0;
>> +}
>> +
>> +static int __exit ma35d1_rtc_remove(struct platform_device *pdev)
> It's not an exit.
>
>> +{
>> +	device_init_wakeup(&pdev->dev, false);
>> +
>> +	platform_set_drvdata(pdev, NULL);
> Just drop remove. You don't do anything useful here.

I will drop 'ma35d1_rtc_remove'.
>
>
>> +
>> +	return 0;
>> +}
>> +
>> +static int ma35d1_rtc_suspend(struct platform_device *pdev, pm_message_t state)
>> +{
>> +	struct ma35_rtc *ma35_rtc = platform_get_drvdata(pdev);
>> +	u32 regval;
>> +
>> +	if (device_may_wakeup(&pdev->dev))
>> +		enable_irq_wake(ma35_rtc->irq_num);
>> +
>> +	regval = rtc_reg_read(ma35_rtc, MA35_REG_RTC_INTEN);
>> +	regval &= ~RTC_INTEN_TICKIEN;
>> +	rtc_reg_write(ma35_rtc, MA35_REG_RTC_INTEN, regval);
>> +
>> +	return 0;
>> +}
>> +
>> +static int ma35d1_rtc_resume(struct platform_device *pdev)
>> +{
>> +	struct ma35_rtc *ma35_rtc = platform_get_drvdata(pdev);
>> +	u32 regval;
>> +
>> +	if (device_may_wakeup(&pdev->dev))
>> +		disable_irq_wake(ma35_rtc->irq_num);
>> +
>> +	regval = rtc_reg_read(ma35_rtc, MA35_REG_RTC_INTEN);
>> +	regval |= RTC_INTEN_TICKIEN;
>> +	rtc_reg_write(ma35_rtc, MA35_REG_RTC_INTEN, regval);
>> +
>> +	return 0;
>> +}
>> +
>> +static const struct of_device_id ma35d1_rtc_of_match[] = {
>> +	{ .compatible = "nuvoton,ma35d1-rtc", },
>> +	{},
>> +};
>> +MODULE_DEVICE_TABLE(of, ma35d1_rtc_of_match);
>> +
>> +static struct platform_driver ma35d1_rtc_driver = {
>> +	.remove     = __exit_p(ma35d1_rtc_remove),
>> +	.suspend    = ma35d1_rtc_suspend,
>> +	.resume     = ma35d1_rtc_resume,
>> +	.probe      = ma35d1_rtc_probe,
>> +	.driver		= {
>> +		.name	= "rtc-ma35d1",
>> +		.owner	= THIS_MODULE,
> ??? No.

I will drop this line.

>> +		.of_match_table = of_match_ptr(ma35d1_rtc_of_match),

I will modify it as

.of_match_table = ma35d1_rtc_of_match,



> Drop of_match_ptr. Didn't you get such comment before? Your other
> submission also had the same bug...
>
> Actually, most of these comments you already received for your other
> drivers, so it would be great if we did not have to repeat it for every
> new driver from you.
>
> Best regards,
> Krzysztof
>

I will be more careful in reviewing code to avoid making the
same mistakes again. Thank you for your guidance.,


Best Regards,
Jacky Huang

