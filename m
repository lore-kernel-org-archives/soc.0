Return-Path: <SRS0=jKnc=BT=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F8E4C7EE23
	for <soc@archiver.kernel.org>; Tue, 30 May 2023 12:57:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 66BD0C433A7; Tue, 30 May 2023 12:57:51 +0000 (UTC)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 9E122C4339E
	for <soc@kernel.org>; Tue, 30 May 2023 12:57:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 9E122C4339E
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-96fe88cd2fcso787701666b.1
        for <soc@kernel.org>; Tue, 30 May 2023 05:57:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685451468; x=1688043468;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=y8nrvZCnLeNA9XqFVfQliG+UkeK7H3UuAJ/vrhzt5N8=;
        b=tOpBR2qHhz8Y5+8fGdIJtDXKTjoub3qdMnSVZt2FlFEFqMzdw3FLNNLEyU6Y+aAS+6
         OmP1ldAmCV1TAaS9kBNfhIpf9HQ0U8TNMKH224Uvnl9qIp9n1ovIIH4gAtjaoGllpVTQ
         NNEtg57i05eYsAAHFyXsqlOn4Svajc5hOJFexlN8DfXKOiv9osAuo1K4PuumIM3MLXVs
         T/M2gYN+Cq/qelGP+82YMQVcCPrEXnZxYHJElcA9KfwxfMjqPTdiyrML4Jq/ytCBRcUP
         VAWggMynia9vDGG2SU9GvsJcxsVjadHciSLeeJLyhD1cQ0JKQmX6whGOf6znelmXeXC9
         5uYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685451468; x=1688043468;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y8nrvZCnLeNA9XqFVfQliG+UkeK7H3UuAJ/vrhzt5N8=;
        b=jaN7kEMmkJT68rXXmrwpEKfw7FzXAnxjOrLR3jivKE1YnIF/jlwOo7tHCftW30E/fV
         ficVKAXle4JuBLaEuN8cp5PpQC3xZayCeKZwlnzAv92lQw1QpTDlXo6XnPhkMganD/cU
         K84K694mPJXof1zy41sfaCcvSzpZjWTbULjgwveBkU4mkle8MYKFTkaRG7JtxtBEH9MD
         THkMlqmwoSoxy4darqwwduYnHDrlKj3DbzkVinCbZ/bVlwcwt0HG32zuyHwP+Cpk9pAb
         JUapgMvTOFvpjSGlxjnVjA4bXXOO8HyDKsnsjvxGgczEV1UEwHkaOnl1M7qvXVrWg3WD
         ax8A==
X-Gm-Message-State: AC+VfDzCBf9niElP6nk8RGBU/02Pc3R0koDYq+aG9h7vUv+7xRXOBmQY
	QDIUSymuLNUso9oPPIx7m/SIAg==
X-Google-Smtp-Source: ACHHUZ5j75si6JaQVxIJyh5Z6yqFoPGjctiJLF48SPBx/H0MmZO8dD3x07xHbqxD5hv4du4ojdh+MA==
X-Received: by 2002:a17:907:d16:b0:960:ddba:e5c3 with SMTP id gn22-20020a1709070d1600b00960ddbae5c3mr2428277ejc.32.1685451467865;
        Tue, 30 May 2023 05:57:47 -0700 (PDT)
Received: from krzk-bin ([178.197.199.204])
        by smtp.gmail.com with ESMTPSA id m13-20020a170906160d00b0095342bfb701sm7488806ejd.16.2023.05.30.05.57.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 May 2023 05:57:47 -0700 (PDT)
Date: Tue, 30 May 2023 14:57:44 +0200
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rudraksha Gupta <guptarud@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Vinod Koul <vkoul@kernel.org>, soc@kernel.org,
	Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-phy@lists.infradead.org,
	Olof Johansson <olof@lixom.net>,
	Bjorn Andersson <andersson@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	Andy Gross <agross@kernel.org>, Rob Herring <robh+dt@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: Re: [PATCH v2 1/4] dt-bindings: arm: qcom: Add Samsung Galaxy Express
Message-ID: <20230530125744.n2pxo6jhsgeq3xgn@krzk-bin>
References: <20230527040905.stmnoshkdqgiaex6@ripper>
 <20230528001010.47868-2-guptarud@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230528001010.47868-2-guptarud@gmail.com>

On Sat, 27 May 2023 20:10:06 -0400, Rudraksha Gupta wrote:
> Add a compatible for Samsung Galaxy Express SGH-I437.
> 
> Signed-off-by: Rudraksha Gupta <guptarud@gmail.com>
> ---
>  Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Running 'make dtbs_check' with the schema in this patch gives the
following warnings. Consider if they are expected or the schema is
incorrect. These may not be new warnings.

Note that it is not yet a requirement to have 0 warnings for dtbs_check.
This will change in the future.

Full log is available here: https://patchwork.ozlabs.org/patch/1786779


/: qcom,board-id: False schema does not allow [[8, 0]]
	arch/arm/boot/dts/qcom-msm8974pro-oneplus-bacon.dtb

/: qcom,msm-id: False schema does not allow [[194, 65536]]
	arch/arm/boot/dts/qcom-msm8974pro-oneplus-bacon.dtb
