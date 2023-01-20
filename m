Return-Path: <SRS0=a+z/=5R=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C3B3C25B4E
	for <soc@archiver.kernel.org>; Fri, 20 Jan 2023 10:21:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 410A4C433AF; Fri, 20 Jan 2023 10:21:40 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 317A1C433EF
	for <soc@kernel.org>; Fri, 20 Jan 2023 10:21:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 317A1C433EF
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f42.google.com with SMTP id j17so3655578wms.0
        for <soc@kernel.org>; Fri, 20 Jan 2023 02:21:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=opTxvrNzoM90zf6iRlxw6xlAEQi0T3iaraiUbrs0+KI=;
        b=HlT9nOfUeMCu/pLD2N8cPd086rwZWAiDOILIZPoVbjDw1TKmGja6qR+xeZs355WtMF
         /stt66FXI8rKnyuUzuoWYXw6KNTare5tlw6cVaJM43FJvg7OUNZbe5ivc7cqRwkckg0s
         MLliU/Ve0LbKltbMN93BvgFPBZmdOupv0SGKWSlFY/AbbYyCRnaYknOLEh4poKKMAlCF
         Cj9dnGPEfdPltLA5dCxRkDceLvRTOFdxMW4FwF/ov7oZoHuATB938g9KeK1vL8zdjaeZ
         qSUDN137FE+vnffdKdOilVOTtjlZ05kV12RF1gPwQE0PM51M1pS/8nD/TzSeZGeBPeM6
         j78Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=opTxvrNzoM90zf6iRlxw6xlAEQi0T3iaraiUbrs0+KI=;
        b=cL7pBrbNoY0NtldmuhQspm/PMSNrTVUiRiHjEkbW1CKitfPCFru/UToenQiochvMkb
         bBlZkoBpfBD1s1kxDtyiP86Uwx2GvWrFIFC6gdtKvyhsnfVLnSytqrnVd+sdSpsqzgG+
         eptMImoJvrn2o6ux4jWSeh4JktTnLj4JyFmX/9Xw7TV3WNSR9ExRhJh4QarZM3EtC4w3
         W2eZk8dqqEA9If22w2bJ6L7ci0Nm1BsgD+Z+a25ywrkKPmERcl6rCXc2K964WhxjIgZH
         gKsM07xFdkLKEx+bCNCNoB10+GDQ9jC1aTiefrMgJnJKbbPMVYkrIiCGU7v8aRNV/oIp
         QSEA==
X-Gm-Message-State: AFqh2kqI+xKxJa4IfPQdRtZt1D6S9fiDywuyaNdDPy2fAxmnrAicyGME
	q6qH4LC6GVzUSH02KUgf2/CDmw==
X-Google-Smtp-Source: AMrXdXunXvSvbGCf6rhdGbv1vceov01lLIyxAajwlt4psjJxQ2qF62COX+4qgWFlTWOXGm0F12cUaQ==
X-Received: by 2002:a05:600c:1695:b0:3da:f502:83b5 with SMTP id k21-20020a05600c169500b003daf50283b5mr13679062wmn.2.1674210097517;
        Fri, 20 Jan 2023 02:21:37 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id p7-20020a05600c468700b003a3442f1229sm1914667wmo.29.2023.01.20.02.21.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Jan 2023 02:21:37 -0800 (PST)
Message-ID: <64c676cc-774c-0c6b-cbc6-9a6f1c58967f@linaro.org>
Date: Fri, 20 Jan 2023 11:21:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: [PATCH 2/9] ARM: dts: ls1021a: add TQ-Systems MBLS102xA device
 tree
Content-Language: en-US
To: Alexander Stein <alexander.stein@ew.tq-group.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
 Shawn Guo <shawnguo@kernel.org>, Li Yang <leoyang.li@nxp.com>,
 Russell King <linux@armlinux.org.uk>, Marek Vasut <marex@denx.de>,
 Marcel Ziswiler <marcel.ziswiler@toradex.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20230119144236.3541751-1-alexander.stein@ew.tq-group.com>
 <20230119144236.3541751-3-alexander.stein@ew.tq-group.com>
 <7cc4c0d4-d863-a62d-3867-ab03d7f7507a@linaro.org>
 <2902259.VdNmn5OnKV@steina-w>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <2902259.VdNmn5OnKV@steina-w>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 20/01/2023 11:08, Alexander Stein wrote:
> Thanks, will drop it.
> 
>>> +
>>> +		stmpe_gpio {
>>
>> No underscores in node names, generic node names, so "gpio". Does
>> anything depend on odd naming?
> 
> You are right, node names should have underscores, but in the end I was 
> following the bindings (Documentation/devicetree/bindings/input/touchscreen/
> stmpe.txt) naming 'stmpe_touchscreen' and 'stmpe_adc' in the example.

Example is not bindings.

> Each subdevice has it's own compatible, so there should be no issue.
> Using just 'gpio' and 'touchscreen' below I didn't notice any difference.

(...)

>>> +
>>> +&i2c0 {
>>> +	status = "okay";
>>> +
>>> +	mc34vr500: pmic@8 {
>>> +		reg = <0x08>;
>>
>> No compatible? What's this?
> 
> That's a DC/DC regulator on the module, currently without any driver support. 
> It's controlled by the PMC, see below.
> 
> We had an internal discussion as well whether to state clients without a 
> driver (and thus no compatible) on the i2c bus. What is the guidelines for DT?
> The benefit stating, even without compatible, is to show there is some device 
> on the bus.

Leave a comment, but not empty nodes.

Best regards,
Krzysztof

