Return-Path: <SRS0=f9YZ=BY=gmail.com=robherring2@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45E04C7EE2A
	for <soc@archiver.kernel.org>; Sun,  4 Jun 2023 07:23:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id D425AC433A0; Sun,  4 Jun 2023 07:23:30 +0000 (UTC)
Received: from mail-il1-f175.google.com (mail-il1-f175.google.com [209.85.166.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 975A3C433D2;
	Sun,  4 Jun 2023 07:23:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 975A3C433D2
Authentication-Results: smtp.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-il1-f175.google.com with SMTP id e9e14a558f8ab-33b4552e55cso12071385ab.0;
        Sun, 04 Jun 2023 00:23:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685863408; x=1688455408;
        h=date:subject:message-id:references:in-reply-to:cc:to:from
         :mime-version:content-transfer-encoding:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=zgPKCKVWGaVP4PRgO+7v9O84nNu7FFnZbyDG2O38/nk=;
        b=N3ZRb26qpaoSUro0+PzNG8yjWoRMMjylYzoF3NAHI8ML2pQTphPJNuPctl0bH8Yw9U
         sE+cdicWW1vUVLOTq2ELC8Tjwj65ijFb8kLVGv1AtrJMfSre0NVDnha+5viwrJ0LRrvv
         Vbg8CAjlU39aGmfD4KqUfCPUpz4Y3W14E1LcQXTKCDXYiMIp4kvXMsjpxAYL6JhR9Xkj
         sGoSz8B4ZS7dY0fXAVXOjitTJusaNTAyBh4t/0DnqRkhHvGUOxTxOt5C4eeHe+41EuHO
         a6nqwBYnUMOz9YNCM9jaY64PSf6MXbtdIIkG2BWx4RfTN7JplhIlvC5OvhNO25mL5VVT
         S2jg==
X-Gm-Message-State: AC+VfDzZQS/SK/V3AsmB/gpDgQK2ahJwY0HB9iXDJGhdHFbGdHhFYK/M
	tm+bCNh4UQSFWoFscbCQzQ==
X-Google-Smtp-Source: ACHHUZ5mPo1CZA0UQUsgNUIwwXRnjWLAemMxRkV8hskeXDFwOSorGRHi5TrEITG+gXvs83p52nltEA==
X-Received: by 2002:a92:2808:0:b0:331:acc9:b554 with SMTP id l8-20020a922808000000b00331acc9b554mr8701509ilf.14.1685863408372;
        Sun, 04 Jun 2023 00:23:28 -0700 (PDT)
Received: from robh_at_kernel.org ([64.188.179.250])
        by smtp.gmail.com with ESMTPSA id m13-20020a924b0d000000b003231580e8e2sm1529159ilg.6.2023.06.04.00.23.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Jun 2023 00:23:27 -0700 (PDT)
Received: (nullmailer pid 3052774 invoked by uid 1000);
	Sun, 04 Jun 2023 07:23:25 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: Rudraksha Gupta <guptarud@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: Kishon Vijay Abraham I <kishon@kernel.org>, linux-phy@lists.infradead.org, Olof Johansson <olof@lixom.net>, Vinod Koul <vkoul@kernel.org>, Arnd Bergmann <arnd@arndb.de>, soc@kernel.org, devicetree@vger.kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-arm-kernel@lists.infradead.org, Rob Herring <robh+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@linaro.org>, Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org
In-Reply-To: <20230604063032.365775-3-guptarud@gmail.com>
References: <20230604063032.365775-1-guptarud@gmail.com>
 <20230604063032.365775-3-guptarud@gmail.com>
Message-Id: <168586340547.3052749.2763112173580157119.robh@kernel.org>
Subject: Re: [PATCH v3 2/4] dt-bindings: phy: qcom,usb-hs-phy: Add
 compatible
Date: Sun, 04 Jun 2023 01:23:25 -0600


On Sun, 04 Jun 2023 02:30:19 -0400, Rudraksha Gupta wrote:
> Adds qcom,usb-hs-phy-msm8960 compatible
> 
> Signed-off-by: Rudraksha Gupta <guptarud@gmail.com>
> ---
>  Documentation/devicetree/bindings/phy/qcom,usb-hs-phy.yaml | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/phy/qcom,usb-hs-phy.example.dtb: phy: resets: [[4294967295, 10], [1, 0]] is too long
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/phy/qcom,usb-hs-phy.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/phy/qcom,usb-hs-phy.example.dtb: phy: reset-names:0: 'por' was expected
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/phy/qcom,usb-hs-phy.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/phy/qcom,usb-hs-phy.example.dtb: phy: reset-names: ['phy', 'por'] is too long
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/phy/qcom,usb-hs-phy.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20230604063032.365775-3-guptarud@gmail.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

