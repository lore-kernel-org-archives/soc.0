Return-Path: <SRS0=e2N/=YB=marek.ca=jonathan@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03039C04A68
	for <soc@archiver.kernel.org>; Thu, 28 Jul 2022 11:59:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id C62D5C433B5; Thu, 28 Jul 2022 11:59:22 +0000 (UTC)
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id CF71BC433D7
	for <soc@kernel.org>; Thu, 28 Jul 2022 11:59:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org CF71BC433D7
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=marek.ca
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=marek.ca
Received: by mail-qk1-f178.google.com with SMTP id v28so1211828qkg.13
        for <soc@kernel.org>; Thu, 28 Jul 2022 04:59:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=marek-ca.20210112.gappssmtp.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=29OwqlQHILsVaDC4GK1f4lUMX8zl+6SGmVC3rD0Xxb8=;
        b=GGQ014kMSRqc0Es0etwHrSuCvnVUOZxZY3BdRaKIgbkKs5U/5NHk2ts5RJra66dDHO
         hjtbFrHsDLt/AqSnSFrUUOy+YisggHDWvIWBs58AC3J2MstDXhlXwYSAbfAqdrPa1btE
         QdzEiqtKQ0fd67X9tbCcEBNhQPfIQqQJpQLsjvmbkQJx28YlgGwcVMxiaNBvtTFRwysg
         5N1tAZtkM3lqMxscxNnVBkSXIP5ouu2Gz0LY68NdeVSaDlgGh/cMVitRb4CqVc4AAiQ8
         y7YNzGNI132HGWC63AlsBU9Knx/O54e6YpP/dAFm662cFmDMjW4GgaxHQ1h/aFK4J2Lo
         N+Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=29OwqlQHILsVaDC4GK1f4lUMX8zl+6SGmVC3rD0Xxb8=;
        b=dBWG+llD6TmD+kIjFYUiEQn6ruiBZVb+KY3wuqPXWrIqWo3iFA391KajA5HEvLY4H3
         2fsEycUuk+s+MFZVBjTq1aFt/aKHUmehffXcauf7koQz27lXPpouWJ0Z3rrBX6IghncN
         gXJaFQT22R7DM/hVCOv/1HLuTQ0Et8ZazaprSIsi1SG6y5pLtKnb8itCjXfjGlLzPy2q
         N++RATlsLfZJQVwx0N+/6cjRwex1jMPIYYuOgKbSbJMA7byAnP52X7OfI0OiAkMQ75/B
         REZ7p5ShJNaO4grAOYAUdeUUVPyYABtqoFsA1mPjhUngxls9WTXUYvLVP/iDzBWwdaF4
         g8mg==
X-Gm-Message-State: AJIora802ktNTL5eUu59/0pYLKT3ACSdQX6ldXcP8hVQAOmJr8YlCXuq
	3UR+yEUE0QlXJXbcVsNW5/ROzA==
X-Google-Smtp-Source: AGRyM1vdHV0E3hl+iNCdeR4ZM2G7OdOtimqFrnDhOaVn1NiRef9VbKCb9IEIbt8EHTJN0uhyMaLmLg==
X-Received: by 2002:a05:620a:4046:b0:6b5:f68a:bb7f with SMTP id i6-20020a05620a404600b006b5f68abb7fmr20339680qko.62.1659009559657;
        Thu, 28 Jul 2022 04:59:19 -0700 (PDT)
Received: from [192.168.0.189] (modemcable134.222-177-173.mc.videotron.ca. [173.177.222.134])
        by smtp.gmail.com with ESMTPSA id x10-20020a05620a448a00b006b618e006ffsm422398qkp.2.2022.07.28.04.59.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Jul 2022 04:59:18 -0700 (PDT)
Subject: Re: [PATCH 0/2] arm64 defconfig: Get faddr2line working
To: Arnd Bergmann <arnd@arndb.de>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: John Garry <john.garry@huawei.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Olof Johansson <olof@lixom.net>, SoC Team <soc@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Vinod Koul <vkoul@kernel.org>
References: <1658681004-132191-1-git-send-email-john.garry@huawei.com>
 <CAK8P3a0umWWic6LAzxXJ7BACYVE--m-wbynh7Z8F+pGoUBxGTA@mail.gmail.com>
 <25237c44-ebc4-fc9a-7c6f-3e990f968038@huawei.com>
 <CAK8P3a2+0EwSJ=fRBL2JCGypJRL-qE4rEiXYnJbqhZ=weethdQ@mail.gmail.com>
 <b39bf8c4-c702-8f49-12aa-d3ac05889b80@huawei.com>
 <CAK8P3a0w+_MLOjJAKMENe6MYvBcXWXSir47Hz34WbtdEeAmaBw@mail.gmail.com>
 <4d010f40-6c4c-32c7-2772-1bbfa02c03b7@linaro.org>
 <CAK8P3a38uGGGLA4b2bi=v8cV6-dH5yEcvBYcwr5ChzkwMTX9_Q@mail.gmail.com>
From: Jonathan Marek <jonathan@marek.ca>
Message-ID: <966a62da-52b6-1789-13d6-5fe06b62c7fe@marek.ca>
Date: Thu, 28 Jul 2022 07:57:33 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <CAK8P3a38uGGGLA4b2bi=v8cV6-dH5yEcvBYcwr5ChzkwMTX9_Q@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 7/28/22 5:09 AM, Arnd Bergmann wrote:

...

> diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
> index 22b706350ead..f65c7737c2db 100644
> --- a/drivers/soundwire/qcom.c
> +++ b/drivers/soundwire/qcom.c
> @@ -1289,11 +1289,7 @@ static int qcom_swrm_probe(struct platform_device *pdev)
>          data = of_device_get_match_data(dev);
>          ctrl->rows_index = sdw_find_row_index(data->default_rows);
>          ctrl->cols_index = sdw_find_col_index(data->default_cols);
> -#if IS_REACHABLE(CONFIG_SLIMBUS)
> -       if (dev->parent->bus == &slimbus_bus) {
> -#else
> -       if (false) {
> -#endif
> +       if (IS_ENABLED(CONFIG_SLIMBUS) && dev->parent->bus == &slimbus_bus) {
>                  ctrl->reg_read = qcom_swrm_ahb_reg_read;
>                  ctrl->reg_write = qcom_swrm_ahb_reg_write;
>                  ctrl->regmap = dev_get_regmap(dev->parent, NULL);
> 

This relies on the compiler optimizing out the reference to slimbus_bus, 
which doesn't exist in the CONFIG_SLIMBUS=n case (not tested, but I 
think this means an O0 build will fail?).
