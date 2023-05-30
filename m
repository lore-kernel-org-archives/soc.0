Return-Path: <SRS0=jKnc=BT=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D272CC7EE23
	for <soc@archiver.kernel.org>; Tue, 30 May 2023 13:20:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id B5318C433EF; Tue, 30 May 2023 13:20:53 +0000 (UTC)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id E7226C4339C
	for <soc@kernel.org>; Tue, 30 May 2023 13:20:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org E7226C4339C
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-51496f57e59so3816845a12.2
        for <soc@kernel.org>; Tue, 30 May 2023 06:20:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685452850; x=1688044850;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ea2LdewWSYBlTGL1pC0uVnJLZZioO8cfJgJDEPtNoG8=;
        b=qvydoxNAZHcUiT+Wxla0aaBfxHooTFXK0IF/Trw7A2o/U95eS5pNGk7nya8DU3YaHN
         VqSVNL8jYNpuvaMHVgCheZfgdBYEivZuPcOXK2wo0noNfFepqoA8vw/wYg/dXBRkXiK5
         jbgKSMCokog2ZTK6X5VD4tK1bCoKDOk/JemiAimkGQ92Rqh711M8pa9yyEVMT0g034dW
         iK2w9byBhHkDClsxWReyXeebR0jD2fus3SA/TKkJMPYK5qKVTLxO0H8330wH2m5nL3Ac
         hsN891MLZjnN9/8xa7GMqvdRtdKOcxFyZCz0pEfO8uMWCW4QU2SbvHV5gDvhphB3dzBB
         SU7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685452850; x=1688044850;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ea2LdewWSYBlTGL1pC0uVnJLZZioO8cfJgJDEPtNoG8=;
        b=MDAL9KhqKDU8Sq7tM8qIaSu+mXM+CF/875XCFpJVTYi0HvkvpQl8mDngKLDa9N9w8v
         mQzR4KvE2iYy0URAG89DbL/ylFvxFeTl1P/vlT0GSmD6M5PazXhamwNV3YQIPS/UyXVU
         kR0lbfaYymNQ/DCs6aDEpNt38uch2c+8jfaZDCLrTO5o/UL44BRi4RPyfLdM5uAXzVcj
         UheZ2v405ToatdVFrZBt6UxSxIPXaWWa5qEN0Yrvy6uJC/A4p27lUoEch67ERxcCqNYb
         Gk3sUNu2t0uRy9+QJDIa6jhrJ7Sj91MwDHbev38yhFIKGHBazneTLvOCo2huaAIDMBgu
         9pvA==
X-Gm-Message-State: AC+VfDyGOqlIo3vapm2cnppZYGYE4lJmstqwDdzE8aWgknVkbSAp9PbE
	FGudX/cB6xrcIbEJgNWVMdxLdg==
X-Google-Smtp-Source: ACHHUZ5Ec8mS0WQOTPmfsRcm8kG86wAB7r6cdlwRv8fyLj+55BTyGZ0d5j3fIeUVp34EMJ4rhBObtg==
X-Received: by 2002:aa7:ce0c:0:b0:514:9422:37db with SMTP id d12-20020aa7ce0c000000b00514942237dbmr1488683edv.39.1685452850273;
        Tue, 30 May 2023 06:20:50 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.199.204])
        by smtp.gmail.com with ESMTPSA id i12-20020aa7dd0c000000b005149c3fa632sm2798999edv.13.2023.05.30.06.20.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 May 2023 06:20:49 -0700 (PDT)
Message-ID: <d2a69542-14e3-ea15-0c21-93d0df19fbf8@linaro.org>
Date: Tue, 30 May 2023 15:20:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 5/5] ARM: Add Samsung Galaxy Express support
Content-Language: en-US
List-Id: <soc.lore.kernel.org>
To: Rudraksha Gupta <guptarud@gmail.com>, Arnd Bergmann <arnd@arndb.de>,
 Olof Johansson <olof@lixom.net>, soc@kernel.org,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: david@ixit.cz, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org
References: <20230524230459.120681-1-guptarud@gmail.com>
 <20230524230459.120681-5-guptarud@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230524230459.120681-5-guptarud@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 25/05/2023 01:04, Rudraksha Gupta wrote:
> This adds a very basic device tree file for the Samsung Galaxy Express
> SGH-I437. Currently, the following things work: UART, eMMC, SD Card, and
> USB.
> 
> Signed-off-by: Rudraksha Gupta <guptarud@gmail.com>
> ---



> +
> +&usb_hs1_phy {
> +	v3p3-supply = <&pm8921_l3>;
> +	v1p8-supply = <&pm8921_l4>;
> +};
> +
> +&usb1 {
> +	status = "okay";
> +	dr_mode = "otg";
> +};
> +

except what was said - drop stray blank line.

Best regards,
Krzysztof

