Return-Path: <SRS0=jKnc=BT=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FA94C77B7A
	for <soc@archiver.kernel.org>; Tue, 30 May 2023 13:21:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 6CAA9C4339B; Tue, 30 May 2023 13:21:09 +0000 (UTC)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id E4D13C433A7
	for <soc@kernel.org>; Tue, 30 May 2023 13:21:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org E4D13C433A7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-5149e65c244so3066071a12.3
        for <soc@kernel.org>; Tue, 30 May 2023 06:21:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685452866; x=1688044866;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=E+eOOtFzZaMUgzpRXCTOhauCZvZ2ynFbGFE/iL/+7bs=;
        b=FYCaGVlW5w5LKnkaLbT/K7xC4sgxPR9LtKj7+k4YLieH0eGiQwzMy+hgpJbbRrj9MC
         5y1WhbO6jFitH0xRstz2DVx118ojkGzHVGlmIVywkanTiNLlzAwmMkkZmVvKf3W/k3Ts
         XcK5GVJT5x0S3qBuuYtYTLqh1JScJsTfJxvv49HT2qyr+IvgZpnz7dHO/VAFgh3Br7vM
         T3vXJ236PEesrfuIxqpCIJh1EP4+g6X0Ck2ptZKBWOkRO6QL4DHgyFGSy0SnymRd4pWj
         W0swycRrswpcYUvK1i5IROG7IuIbAFZnIpfGK7NbheBjBSopHyYIVc+cdHwyqbJPEPBH
         w27w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685452866; x=1688044866;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=E+eOOtFzZaMUgzpRXCTOhauCZvZ2ynFbGFE/iL/+7bs=;
        b=avSiNEw5k+qiAarVnktFx5yI+3Njq3YflZZ72MztaV0uGflOmA33iCFuyhZ+XkdC7A
         cNko70dZTMvEF7/GNu04DkVFvKCzpA810UuMC1ddnAurVTSuiKKo5j8jJpAJtKgqd777
         bhEAeXg+LPhruJPKfQq9+4Y3l5X/A4kRPPV5jPMaqah74YPkyUEW4ynKHBreVVFnJiFM
         Vo7EBKgtHXYIIqAZuqU6QNEn25DzKf4e89QNXyr/dZz7OSFOJDk6IrnHdTCZDk51M5Q/
         l3Rl/QuNpx/aLcvJDqKgDy3qTHhCHdAbIm/+ixnmQh+NVZUAOehCvsZH3/kd3kvnBLLw
         PSGg==
X-Gm-Message-State: AC+VfDycVGrfODVHUihpR68ik46UE5pZW9UfIzFpDUJexM951aDv8Q6q
	iragXzEQqfWWXs88J1h3L0ejJw==
X-Google-Smtp-Source: ACHHUZ5g3cfwTuUld8iB6zign2Xojoa+5qld/dJybIZhplIUr7yPUPRkQLMzEu0iOZGJjcIMDnWldg==
X-Received: by 2002:a17:906:db0e:b0:970:e80:e29a with SMTP id xj14-20020a170906db0e00b009700e80e29amr2500203ejb.68.1685452865904;
        Tue, 30 May 2023 06:21:05 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.199.204])
        by smtp.gmail.com with ESMTPSA id pg27-20020a170907205b00b009662d0e637esm7252694ejb.155.2023.05.30.06.21.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 May 2023 06:21:05 -0700 (PDT)
Message-ID: <6cea59fe-3192-0a0f-9633-7c2d83d5a87f@linaro.org>
Date: Tue, 30 May 2023 15:21:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2 0/4] Samsung Galaxy Express SGH-I437 Support
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
 <20230528001010.47868-1-guptarud@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230528001010.47868-1-guptarud@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 28/05/2023 02:10, Rudraksha Gupta wrote:
> This patch series adds support for the Samsung Galaxy Express SGH-I437.
> Currently the following things work on this phone: UART, eMMC, SD Card, and USB.
> 
> version 2:
> - Combined patch 1 into patch 4, as the sleep_clk label is specifically needed for the USB node.
> - Reformatted the commit messages to align with the style used in other commit messages that modify the same files.
> - Included a cover letter to provide an overview of the patch series.
> - Slight refactoring of the device tree source (DTS) file.
> 

Do not attach (thread) your patchsets to some other threads (unrelated
or older versions). This buries them deep in the mailbox and might
interfere with applying entire sets.

Best regards,
Krzysztof

