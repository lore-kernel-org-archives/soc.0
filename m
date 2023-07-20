Return-Path: <SRS0=8xwM=DG=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03629EB64DA
	for <soc@archiver.kernel.org>; Thu, 20 Jul 2023 06:14:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id B314BC433CB; Thu, 20 Jul 2023 06:14:15 +0000 (UTC)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 81637C433C7
	for <soc@kernel.org>; Thu, 20 Jul 2023 06:14:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 81637C433C7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-4fdd31bf179so615155e87.2
        for <soc@kernel.org>; Wed, 19 Jul 2023 23:14:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689833652; x=1692425652;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Bn97h2kPeQxT2teRaIaG8kcjL4C15rmESxQkplgMClw=;
        b=iJjCCMAu3M3Y1cXnn/JZjkast6keMe+JztLfl7uNLYGkMnR9+kQq/d16CmMsim6LW3
         RbzgItDYJ2aOhPxhudZrEKSwS9MxQniVmWwC3jQTeQZN3pPg1XVqJtfNaBMHmvxz3Rf3
         K6L1PT6kH4S4dqrZLXs9n1Uk/La4L8hqgiZXCLNHYR6TdzEwO3+zrGaX9YYJR+9IWJS5
         TY3smnS0FdUHGkuIaEa3ztjGgG6sS5ZonPfnhxQrejgdy4iDNYMCeY2IdNUSHNx+Eghx
         +K6aPDSIg/TWybF1N3tPD7fvcFhNtvw/1fEMf4EonREJryaR1/QmMkxJjnoZWaoEmP+2
         Wk7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689833652; x=1692425652;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Bn97h2kPeQxT2teRaIaG8kcjL4C15rmESxQkplgMClw=;
        b=DTYPq3Xc4WHBKiiT71d+OnfeYobjY85QTmADkkfJp0jDxzl/9V2ylTC0GjfCVq5KV6
         5/jsWn0R2klDUqABZtxj/FUZmZuv6finBb1uYp/JyfmJVJvcia4WgpuCBjvFXC6L+kgC
         uJOOzTuV3haACaud2+wQbs/hkWpGPTdkh4r0+EGa3hg6jJrr31WeahRULCbMVa/avOlg
         BBYHOZPFqkeVgEBM0+jHX7Ws8wH9/wQeyEMP8r6/Fl89CDZ+qbnWHjbymazUJO1L+CCL
         6BtZfQ3AWEYATrhkBwq8b+N6H+XwhGgSs7YH5o95dOrFyaOSb7ybNkqIdHJjOmReONRG
         IjXQ==
X-Gm-Message-State: ABy/qLac2462usSTPabcJ1gicxcxNEII0q4oIaCw71/e5GdQks4R16UQ
	S6X+UaJZIz4uKZ9dPjOTUXqtGw==
X-Google-Smtp-Source: APBJJlFftkJ/9ysNAfpj91FCxFppSG3ujXVEDRddCe52HcrVa2MoP1OZryfU9E/eqZg4FlZX/zO3+w==
X-Received: by 2002:ac2:4bd2:0:b0:4fd:d0d5:8771 with SMTP id o18-20020ac24bd2000000b004fdd0d58771mr1823130lfq.18.1689833652341;
        Wed, 19 Jul 2023 23:14:12 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.104])
        by smtp.gmail.com with ESMTPSA id e19-20020a05600c219300b003fbe791a0e8sm388889wme.0.2023.07.19.23.14.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Jul 2023 23:14:11 -0700 (PDT)
Message-ID: <5f867f68-4ad6-11c7-5c1f-f568889b0ddf@linaro.org>
Date: Thu, 20 Jul 2023 08:14:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 3/3] rtc: Add driver for nuvoton ma35d1 rtc controller
Content-Language: en-US
To: Jacky Huang <ychuang570808@gmail.com>, a.zummo@towertech.it,
 alexandre.belloni@bootlin.com, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 soc@kernel.org, mjchen@nuvoton.com, schung@nuvoton.com,
 Jacky Huang <ychuang3@nuvoton.com>
References: <20230720012826.430026-1-ychuang570808@gmail.com>
 <20230720012826.430026-4-ychuang570808@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230720012826.430026-4-ychuang570808@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 20/07/2023 03:28, Jacky Huang wrote:
> From: Jacky Huang <ychuang3@nuvoton.com>
> 
> The ma35d1 rtc controller provides real-time and calendar messaging
> capabilities. It supports programmable time tick and alarm match
> interrupts. The time and calendar messages are expressed in BCD format.
> This driver supports the built-in rtc controller of the ma35d1. It
> enables setting and reading the rtc time and configuring and reading
> the rtc alarm.
> 

...

> +static int ma35d1_rtc_probe(struct platform_device *pdev)
> +{
> +	struct ma35_rtc *ma35_rtc;
> +	struct clk *clk;
> +	u32 regval;
> +	int err;
> +
> +	ma35_rtc = devm_kzalloc(&pdev->dev, sizeof(struct ma35_rtc),

sizeof(*)

> +								GFP_KERNEL);
> +	if (!ma35_rtc)
> +		return -ENOMEM;
> +
> +	ma35_rtc->rtc_reg = devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(ma35_rtc->rtc_reg))
> +		return PTR_ERR(ma35_rtc->rtc_reg);
> +
> +	clk = of_clk_get(pdev->dev.of_node, 0);
> +	if (IS_ERR(clk)) {
> +		err = PTR_ERR(clk);
> +		dev_err(&pdev->dev, "failed to get core clk: %d\n", err);
> +		return -ENOENT;

return dev_err_probe

> +	}
> +	err = clk_prepare_enable(clk);
> +	if (err)
> +		return -ENOENT;
> +
> +	platform_set_drvdata(pdev, ma35_rtc);
> +
> +	ma35_rtc->rtcdev = devm_rtc_device_register(&pdev->dev, pdev->name,
> +						    &ma35d1_rtc_ops, THIS_MODULE);
> +	if (IS_ERR(ma35_rtc->rtcdev)) {
> +		dev_err(&pdev->dev, "rtc device register failed\n");
> +		return PTR_ERR(ma35_rtc->rtcdev);
> +	}
> +
> +	err = ma35d1_rtc_init(ma35_rtc, RTC_INIT_TIMEOUT);
> +	if (err)
> +		return err;
> +
> +	regval = rtc_reg_read(ma35_rtc, MA35_REG_RTC_CLKFMT);
> +	regval |= RTC_CLKFMT_24HEN;
> +	rtc_reg_write(ma35_rtc, MA35_REG_RTC_CLKFMT, regval);
> +
> +	ma35_rtc->irq_num = platform_get_irq(pdev, 0);
> +
> +	if (devm_request_irq(&pdev->dev, ma35_rtc->irq_num, ma35d1_rtc_interrupt,
> +			     IRQF_NO_SUSPEND, "ma35d1rtc", ma35_rtc)) {
> +		dev_err(&pdev->dev, "ma35d1 RTC request irq failed\n");
> +		return -EBUSY;

return dev_err_probe

> +	}
> +
> +	regval = rtc_reg_read(ma35_rtc, MA35_REG_RTC_INTEN);
> +	regval |= RTC_INTEN_TICKIEN;
> +	rtc_reg_write(ma35_rtc, MA35_REG_RTC_INTEN, regval);
> +
> +	device_init_wakeup(&pdev->dev, true);
> +
> +	return 0;
> +}
> +
> +static int __exit ma35d1_rtc_remove(struct platform_device *pdev)

It's not an exit.

> +{
> +	device_init_wakeup(&pdev->dev, false);
> +
> +	platform_set_drvdata(pdev, NULL);

Just drop remove. You don't do anything useful here.


> +
> +	return 0;
> +}
> +
> +static int ma35d1_rtc_suspend(struct platform_device *pdev, pm_message_t state)
> +{
> +	struct ma35_rtc *ma35_rtc = platform_get_drvdata(pdev);
> +	u32 regval;
> +
> +	if (device_may_wakeup(&pdev->dev))
> +		enable_irq_wake(ma35_rtc->irq_num);
> +
> +	regval = rtc_reg_read(ma35_rtc, MA35_REG_RTC_INTEN);
> +	regval &= ~RTC_INTEN_TICKIEN;
> +	rtc_reg_write(ma35_rtc, MA35_REG_RTC_INTEN, regval);
> +
> +	return 0;
> +}
> +
> +static int ma35d1_rtc_resume(struct platform_device *pdev)
> +{
> +	struct ma35_rtc *ma35_rtc = platform_get_drvdata(pdev);
> +	u32 regval;
> +
> +	if (device_may_wakeup(&pdev->dev))
> +		disable_irq_wake(ma35_rtc->irq_num);
> +
> +	regval = rtc_reg_read(ma35_rtc, MA35_REG_RTC_INTEN);
> +	regval |= RTC_INTEN_TICKIEN;
> +	rtc_reg_write(ma35_rtc, MA35_REG_RTC_INTEN, regval);
> +
> +	return 0;
> +}
> +
> +static const struct of_device_id ma35d1_rtc_of_match[] = {
> +	{ .compatible = "nuvoton,ma35d1-rtc", },
> +	{},
> +};
> +MODULE_DEVICE_TABLE(of, ma35d1_rtc_of_match);
> +
> +static struct platform_driver ma35d1_rtc_driver = {
> +	.remove     = __exit_p(ma35d1_rtc_remove),
> +	.suspend    = ma35d1_rtc_suspend,
> +	.resume     = ma35d1_rtc_resume,
> +	.probe      = ma35d1_rtc_probe,
> +	.driver		= {
> +		.name	= "rtc-ma35d1",
> +		.owner	= THIS_MODULE,

??? No.

> +		.of_match_table = of_match_ptr(ma35d1_rtc_of_match),

Drop of_match_ptr. Didn't you get such comment before? Your other
submission also had the same bug...

Actually, most of these comments you already received for your other
drivers, so it would be great if we did not have to repeat it for every
new driver from you.

Best regards,
Krzysztof

