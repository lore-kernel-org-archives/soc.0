Return-Path: <SRS0=2glY=R5=gmail.com=robherring2@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8186C4332F
	for <soc@archiver.kernel.org>; Thu, 13 Jan 2022 23:33:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 9A4F9C36AED; Thu, 13 Jan 2022 23:33:58 +0000 (UTC)
Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com [209.85.167.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 88AD6C36AE3;
	Thu, 13 Jan 2022 23:33:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 88AD6C36AE3
Authentication-Results: smtp.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oi1-f182.google.com with SMTP id s9so9992456oib.11;
        Thu, 13 Jan 2022 15:33:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=nnDiZcTRb0Vq5tmUrkIdnau18hy40OrJF8krgzeHM4s=;
        b=ChnZOS5L6pD6CS5cYvKeU6PNw4/6hJE7fj9AjuZ0Zqq8D8rbnuwMflPcipm2rf2hpW
         qqoDWU8WXupC2XFRn4HyyOuIWPynS2CqoUKXEUfFTlzROjRlfAOIyyeBdgL2v8MjbKyQ
         S8O16cXO4QbX7tKs1oE2ySgU6VMjEE4ueVTqllqx4VbEQax7BeYBvIDO+g+v/u2FEmW4
         Y5RbCh05rEMglohs2NmMvpK7TNGJgoJ7m12Y7qw7c7VnbqJNK47psUFAg219c4Q89vce
         0CCl5mW6l3GnLa6cX4TS7clGWz/OkXk9ZnM7QfB+8lRWY2PXwiowQ4yD6e//VM6bMlAt
         kTTg==
X-Gm-Message-State: AOAM530Mx/v5jNJNV97tzz2ZwbDG4EKntC96Q+aUm9VVwYSPJ/gspNor
	1+EBuShIMtFjexR6+D74Ag==
X-Google-Smtp-Source: ABdhPJx0Y77Qvs2DmF3Cj72zTuxyrO8FZtkPJTHmtmi99ENq20DZ3v9GIO8BFW0+Lhurn8Yq7qzA/g==
X-Received: by 2002:a05:6808:15a0:: with SMTP id t32mr4881818oiw.60.1642116836724;
        Thu, 13 Jan 2022 15:33:56 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id j77sm1154569oih.35.2022.01.13.15.33.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Jan 2022 15:33:56 -0800 (PST)
Received: (nullmailer pid 374229 invoked by uid 1000);
	Thu, 13 Jan 2022 23:33:55 -0000
From: Rob Herring <robh@kernel.org>
To: Alim Akhtar <alim.akhtar@samsung.com>
List-Id: <soc.lore.kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, s.nawrocki@samsung.com, linus.walleij@linaro.org, soc@kernel.org, olof@lixom.net, pankaj.dubey@samsung.com, linux-fsd@tesla.com, robh+dt@kernel.org, krzysztof.kozlowski@canonical.com, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, catalin.marinas@arm.com
In-Reply-To: <20220113121143.22280-2-alim.akhtar@samsung.com>
References: <20220113121143.22280-1-alim.akhtar@samsung.com>        <CGME20220113122311epcas5p4b7c253b49dce3bd3580407fcf312e70e@epcas5p4.samsung.com> <20220113121143.22280-2-alim.akhtar@samsung.com>
Subject: Re: [PATCH 01/23] dt-bindings: clock: Document FSD CMU bindings
Date: Thu, 13 Jan 2022 17:33:55 -0600
Message-Id: <1642116835.548930.374228.nullmailer@robh.at.kernel.org>

On Thu, 13 Jan 2022 17:41:21 +0530, Alim Akhtar wrote:
> Add dt-schema documentation for Tesla FSD SoC clock controller.
> 
> Cc: linux-fsd@tesla.com
> Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>
> ---
>  .../bindings/clock/tesla,fsd-clock.yaml       | 212 ++++++++++++++++++
>  1 file changed, 212 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/tesla,fsd-clock.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/clock/tesla,fsd-clock.example.dts:19:18: fatal error: dt-bindings/clock/fsd-clk.h: No such file or directory
   19 |         #include <dt-bindings/clock/fsd-clk.h>
      |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
compilation terminated.
make[1]: *** [scripts/Makefile.lib:373: Documentation/devicetree/bindings/clock/tesla,fsd-clock.example.dt.yaml] Error 1
make[1]: *** Waiting for unfinished jobs....
make: *** [Makefile:1413: dt_binding_check] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1579595

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

