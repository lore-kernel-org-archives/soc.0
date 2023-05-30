Return-Path: <SRS0=jKnc=BT=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A9C4C77B73
	for <soc@archiver.kernel.org>; Tue, 30 May 2023 13:22:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 45EAFC433A8; Tue, 30 May 2023 13:22:07 +0000 (UTC)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 62FA0C433D2
	for <soc@kernel.org>; Tue, 30 May 2023 13:22:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 62FA0C433D2
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-96f53c06babso790844966b.3
        for <soc@kernel.org>; Tue, 30 May 2023 06:22:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685452924; x=1688044924;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4rcd/m8WcNQQtUZ5t+JPMtS7xHuDS2RmOZsx2AqUrBI=;
        b=AS8lKWQsAFEX70mEx4xEjeYR+oPg2B0T7AP0fFII9tibVdLUUJKgWAzt7OkW4rnTHY
         iT0NJS5a/KOM2+PPGHp+NRkEDecy+5fIXXzqBmw6270DUgBj63WrYRJD8ZQs/AswAb16
         4PVHxgOyliC9OFowe6c7YMsU7N4GuJ7TTt5GQ16/+35RWyMbjq5ict4nS+kkeRICbDh4
         b4B6w0s12yQ+EGL/08WVAtg12e6iJVvZhSwY5va4NwnILA9qlRKnTmv+sH7/awJxtRtx
         eDfLk9dfMcC9uHvi3avCG3Ae7i/s56WmzBb/Id1DWHjnqnEYpk3J6m4/Jy7Io0ArIsuu
         iueA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685452924; x=1688044924;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4rcd/m8WcNQQtUZ5t+JPMtS7xHuDS2RmOZsx2AqUrBI=;
        b=UKeB/zuWwTVMYEq68L3sJD5cWUh9JYYVJLV51ruDQqMB6D4WMxp5Sd/tmDesRZzVBA
         +Yyk7hltURZkUWLty69PgDvk+mb0BJpWRuxSvRRrvaDPo1E++D1w72LWwMkskax6lIHM
         lgqXMmrW/fEZy7WiwhfC+98Nv/tjhZSDNCbhsS6UqghPVqWf+SzHG59EBfJdFL8TgQ1r
         YnFSnaGPMERdD11KSU3iSHQ3uzs7s+Yu6uqWWuw8wqqUlFGSBqqRoGPW7E3vBBs8Cfri
         qGoBSTVBbFRMuprtnswAioiXstb0+l+W3ECMW035F8ZrmRwfAM6XG2BpATzAxWx3ylIB
         ItoQ==
X-Gm-Message-State: AC+VfDybEylkI6haA6iq2qQxlCl4Ritd/udV5dBgrUbrKBaisV9kgxtQ
	nIrOEJQ4vpn9wfi6YDpb6Sc0PQ==
X-Google-Smtp-Source: ACHHUZ5swZnIqt/3wRBv6QMXu4VLN/2oWK3Mm/fnIbsjpD9wHV2n0FuXPUqTpTyuZ4aBVdIFouM5qA==
X-Received: by 2002:a17:907:3e8f:b0:96f:181b:87d3 with SMTP id hs15-20020a1709073e8f00b0096f181b87d3mr2782421ejc.37.1685452924691;
        Tue, 30 May 2023 06:22:04 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.199.204])
        by smtp.gmail.com with ESMTPSA id l17-20020a1709067d5100b0096f72424e00sm7337450ejp.131.2023.05.30.06.22.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 May 2023 06:22:04 -0700 (PDT)
Message-ID: <fb65244e-ab3b-c473-57b9-2da80e67be4a@linaro.org>
Date: Tue, 30 May 2023 15:22:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2 2/4] dt-bindings: Add qcom,usb-hs-phy-msm8960
Content-Language: en-US
List-Id: <soc.lore.kernel.org>
To: Rudraksha Gupta <guptarud@gmail.com>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Olof Johansson <olof@lixom.net>, soc@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
References: <20230527040905.stmnoshkdqgiaex6@ripper>
 <20230528001010.47868-3-guptarud@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230528001010.47868-3-guptarud@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 28/05/2023 02:10, Rudraksha Gupta wrote:
> Adds qcom,usb-hs-phy-msm8960 compatible
> 

Please use subject prefixes matching the subsystem. You can get them for
example with `git log --oneline -- DIRECTORY_OR_FILE` on the directory
your patch is touching.

Best regards,
Krzysztof

