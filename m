Return-Path: <SRS0=LPzF=ZY=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 542FCC32771
	for <soc@archiver.kernel.org>; Wed, 21 Sep 2022 07:00:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 22B4CC433D7; Wed, 21 Sep 2022 07:00:36 +0000 (UTC)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 486D8C433C1
	for <soc@kernel.org>; Wed, 21 Sep 2022 07:00:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 486D8C433C1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f46.google.com with SMTP id a3so7633707lfk.9
        for <soc@kernel.org>; Wed, 21 Sep 2022 00:00:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date;
        bh=N77a7ZWZLVSzuEs9PfFRQdKlqEhHQDfD8cUFuVw8P4g=;
        b=Xyx8LqSh3dS1UwjyAGKdGrxG3D5EFtUBqE++LL8PRxyFHtUTeucKdJFSNRUt/JZb3r
         Jl8cGDdEVjo+XRI9j3JGtmQGBBT8S9lHhiytA+XIP4Hp9Qm8884kEKjxgfEjFnpTfV1/
         lIu3VT7EAWLIbJWx2sHvkaXu045Touf9TBmWKzMb/Z6ydAaRTeBFV/+X4kac0UHXB6Xv
         mfpnxcn0xEPiqZJ3ysPiu9UKRMxADYsFk0MmX3IlP4zcqVD1YUDiASrMM3ROCEP1acks
         siFrsnE2va3zAWVJxKFJdYXcZilC39ZsJcXZVeijlaGh11OXkHXOZ70zhum1j0ceNrCX
         CbOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=N77a7ZWZLVSzuEs9PfFRQdKlqEhHQDfD8cUFuVw8P4g=;
        b=mWEel0SmSL8/NfKwZLcUhmQA9E5Xur2AilqKi6aO2xJuoN5ldm3Z18I52iBraaDEYJ
         Qnb3iYDwfKZ1v5c3Yz+QzP7OG8QYdsahJTcmFPV1Tqw+BL3185fneBNDQ44az8cJmFZN
         yZzEzAUGildGdCV8JHt+aOo2VKOy/SjIc5d1kn9UX5Ms+WHdys/uDkq5MjK74ZearaXJ
         vOj1FzDI2wWCJewoQAVRQyKb8rn1h4oLRanHQDWdu7rDYWi34zOQF0geeS0vscHr3UZr
         rfuwACWlc2acfh83CwZJyUHio3F0S26Go1+Z/kwsL+JXaIv9P0i62OP6Hmgpp81xNrgB
         mKoA==
X-Gm-Message-State: ACrzQf2fWBBNn2N87sLvMxciyxaeCXyH+qVqO1mY6IOT+/JmjEqx7mPJ
	MwrTlSniMYRzN1icS6maFOQoYA==
X-Google-Smtp-Source: AMsMyM6YXjbglb47123EEs+0O1+bBUj4UyJq6W40nB5nsY1TNa7SX9g/bDI5Ncskx5QFc2gfNOf8EQ==
X-Received: by 2002:a05:6512:1088:b0:49f:c019:a3ae with SMTP id j8-20020a056512108800b0049fc019a3aemr4120639lfg.332.1663743632337;
        Wed, 21 Sep 2022 00:00:32 -0700 (PDT)
Received: from krzk-bin (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id c11-20020a056512074b00b0049aa7a56715sm301294lfs.267.2022.09.21.00.00.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Sep 2022 00:00:31 -0700 (PDT)
Date: Wed, 21 Sep 2022 09:00:29 +0200
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Konstantin Aladyshev <aladyshev22@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@aj.id.au>, Rob Herring <robh+dt@kernel.org>,
	soc@kernel.org, Olof Johansson <olof@lixom.net>,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] ARM: dts: aspeed: Add AMD DaytonaX BMC
Message-ID: <20220921070029.a5beb5ug6jb2jex3@krzk-bin>
References: <20220920165404.14099-1-aladyshev22@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220920165404.14099-1-aladyshev22@gmail.com>

On Tue, 20 Sep 2022 19:54:02 +0300, Konstantin Aladyshev wrote:
> Add initial version of device tree for the BMC in the AMD DaytonaX
> platform.
> 
> AMD DaytonaX platform is a customer reference board (CRB) with an
> Aspeed ast2500 BMC manufactured by AMD.
> 
> Signed-off-by: Konstantin Aladyshev <aladyshev22@gmail.com>
> ---
>  .../bindings/arm/aspeed/aspeed.yaml           |   1 +
>  arch/arm/boot/dts/Makefile                    |   1 +
>  arch/arm/boot/dts/aspeed-bmc-amd-daytonax.dts | 319 ++++++++++++++++++
>  3 files changed, 321 insertions(+)
>  create mode 100644 arch/arm/boot/dts/aspeed-bmc-amd-daytonax.dts
> 

Running 'make dtbs_check' with the schema in this patch gives the
following warnings. Consider if they are expected or the schema is
incorrect. These may not be new warnings.

Note that it is not yet a requirement to have 0 warnings for dtbs_check.
This will change in the future.

Full log is available here: https://patchwork.ozlabs.org/patch/


/: compatible: 'oneOf' conditional failed, one must be fixed:
	arch/arm/boot/dts/aspeed-bmc-qcom-dc-scm-v1.dtb
