Return-Path: <SRS0=6Gkx=5U=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B976C54E94
	for <soc@archiver.kernel.org>; Mon, 23 Jan 2023 17:15:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 0E4D2C4339E; Mon, 23 Jan 2023 17:15:32 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 4432BC43446
	for <soc@kernel.org>; Mon, 23 Jan 2023 17:15:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 4432BC43446
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f46.google.com with SMTP id h12so7491198wrv.10
        for <soc@kernel.org>; Mon, 23 Jan 2023 09:15:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wGAaeFHRUbbcLchitvOo8c3uIrY8nrhrwfD9OzyUHHE=;
        b=j/3e0s3ZNLlg6zARvUYvUo+MRXgYBVxsoHwtK4slffkM3LJS57gKTVI/MsNRDuaipu
         uZ3T5Egu0VZ7a3N0mn/EebgB+NlsDgWVcPJzLWprU1ItMPE4eruY/smltPCXeIj1vfoY
         Xk73Lu3LA8MBMvhYG5p39J5hZj2Zcwl9CO8V9pQMzv5dxD2DvZcxB5jMQ4PzyEhdSTz5
         yqJ5rnH5u9ksn4uChRow+ntFfa4QttTJaKyr3wcLAZPiizl+s3Rr+RIw0nWSW0P5zGA6
         kVHcQj4EdFcVuT/jf9pBRX/zDWRRUR95n3B2wXjqNqmR3ZQucuYeVTcpO35KekFutNUQ
         lnRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wGAaeFHRUbbcLchitvOo8c3uIrY8nrhrwfD9OzyUHHE=;
        b=PqcMR7ubNVfmDHj5RO0W5BRCWJWE+jm1si5Eib9Llkz/A45q0Lk5rYYZZTGXTbzqL+
         MM5zmM0s+oXJ4sa1quJmMzl9XLx2eNCxPUYFK+GPevx5KRoVxvRcjsD5Sokw+Y5BFr4Z
         VGJEr0qJo3k4H1P9+TXsLh1DitrKtJUv/LPoV5jjKbhhgFw5fConvabR36n5hmNemzDu
         2f/aFTjcRVhJnPfACYH1S/Vd+iv4hMmFBCoZKWcecclzSOo35v93gf3GNdTbnAs13y8y
         fNdCSRc2FT+CgpQ+NH1tmIA9fnuD9VKNv89zUoaI/B+qtaiE4BeVxjwSema2XZYjrXm/
         O5UQ==
X-Gm-Message-State: AFqh2koBzm+Hafot4QB+gpCcfwXB2WC/69+YrBZe4UAlKb5EFnBsB4Z8
	DQzLk5gJEcV4/50EHbGYMu65a68Gij9idjC+
X-Google-Smtp-Source: AMrXdXuwX8R2g5rTyHK8O1HpVuy3t+r8vVzoPIZ0LTPfIDjn20xptFDKQ2VmDXw4q4jvVdhXPKBRbg==
X-Received: by 2002:adf:fd83:0:b0:2bd:dbd8:d41e with SMTP id d3-20020adffd83000000b002bddbd8d41emr21927689wrr.57.1674494128460;
        Mon, 23 Jan 2023 09:15:28 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id j14-20020adfb30e000000b002bbedd60a9asm827309wrd.77.2023.01.23.09.15.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Jan 2023 09:15:27 -0800 (PST)
Message-ID: <9464494f-765a-95fc-ebc0-f225b1c8f9a3@linaro.org>
Date: Mon, 23 Jan 2023 18:15:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: [PATCH 1/3] ARM: dts: qcom: samsung-matisse-common: Add initial
 common device tree
Content-Language: en-US
List-Id: <soc.lore.kernel.org>
To: Stefan Hansson <newbyte@postmarketos.org>, Andy Gross
 <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
 soc@kernel.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
 matti.lehtimaki@gmail.com
References: <20230122144749.87597-1-newbyte@postmarketos.org>
 <20230122144749.87597-2-newbyte@postmarketos.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230122144749.87597-2-newbyte@postmarketos.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 22/01/2023 15:47, Stefan Hansson wrote:
> According to the dts from the kernel source code released by Samsung,
> matissewifi and matisselte only have minor differences in hardware, so
> use a shared dtsi to reduce duplicated code. Additionally, this should
> make adding support for matisse3g easier should someone want to do that
> at a later point.
> 
> As such, add a common device tree for all matisse devices by Samsung
> based on the matissewifi dts. Support for matisselte will be introduced
> in a later patch in this series and will use the common dtsi as well.
> 
> Signed-off-by: Stefan Hansson <newbyte@postmarketos.org>
> ---

Decompiled DTB is the same, so:

Tested-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

(although not on a device...)

Best regards,
Krzysztof

