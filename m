Return-Path: <SRS0=qwHo=WQ=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76099CCA47F
	for <soc@archiver.kernel.org>; Thu,  9 Jun 2022 11:39:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 5E31DC3411F; Thu,  9 Jun 2022 11:39:53 +0000 (UTC)
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 48D84C3411D
	for <soc@kernel.org>; Thu,  9 Jun 2022 11:39:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 48D84C3411D
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f45.google.com with SMTP id h19so30848351edj.0
        for <soc@kernel.org>; Thu, 09 Jun 2022 04:39:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=hk45y8qg0TijcVloTKD2QUlJ8SLct5jsD0wtYz0wctM=;
        b=dCysHo+wV3b6rhcbXJ02dDqextk07Ftyf3ShUOtoADi710qB7HdXXJlt5Eql7OhVGv
         VdoMSrWX53MJfnf0PFpHgmT0YAT0QazGH1uN1IXV41ZP/w/lzcQ1dHDKtzTDQpPl3MlH
         59/+9NEaTKXW96KT30hLGn1vZCmqWOgP6UhyoKMx07ZFOdJXVlbGH4O37bIl2JoqYQpd
         lKR3PXjIib1S2zobCJ/R79Voyf0vFMRF3ZiPsr3AQW7AQqX63tYjxY+6Z0Ypuoix7yje
         ZQx+pWI8pOgLVo8BVxvRpDUowFEHfGEYidnYqv+FInDXAhTskHS4Egijo9MYQhdx24Sn
         pDIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=hk45y8qg0TijcVloTKD2QUlJ8SLct5jsD0wtYz0wctM=;
        b=csyl3Jrj3y3xP/eXeP15pz8UpJtcqXenakbxpTp+XKrrhc/AIKSHOw63I9wnyho/7e
         1ZRX/WxfAmv5uJWjwjKJz93PWCaogXjRkxpeHwacSYFon44c55L34u6GkBY6MJTULYxZ
         TugALmybxvzxll5GTtNQThvTquSPeS1WsH3PS+IQBAtBrW8BxnvqH1e1gzba8hikkrNg
         Gp/64AFnEOKoASwbcuiEC57N/EskRw3aB+BL5SkUQVg+pG5rudIPAPW/WqUxQ2vEGrPT
         68cZo9C4qZZm7ssTNtiTb3wYTe7Aucizh2u/ZW0bTAHp8+NT6yD3arSv1h+/YXy5u9PP
         kSYQ==
X-Gm-Message-State: AOAM530EuYTIUwDAUnK+2AIaGx8ny2y03u4q247ri2HI5TOQUOM+miGo
	1i2GtuJFJ5T/4+pyhMvC7FZQRA==
X-Google-Smtp-Source: ABdhPJz1DPyaMSlaZrobu0Ns2R2wkkgKs5hcB09Ys87/bOBT+HrZRhThi35KhfVZt40jyOCKf2gWmw==
X-Received: by 2002:a05:6402:11d2:b0:42d:e68a:eae0 with SMTP id j18-20020a05640211d200b0042de68aeae0mr44342368edw.111.1654774791883;
        Thu, 09 Jun 2022 04:39:51 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id c10-20020a170906528a00b0070a80f03a44sm9460415ejm.119.2022.06.09.04.39.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jun 2022 04:39:51 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>,
	arm@kernel.org,
	soc@kernel.org,
	Wei Xu <xuwei5@hisilicon.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 16/48] arm64: dts: hisilicon: correct gpio-keys properties
Date: Thu,  9 Jun 2022 13:39:35 +0200
Message-Id: <20220609113938.380466-7-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220609113721.379932-1-krzysztof.kozlowski@linaro.org>
References: <20220609113721.379932-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

gpio-keys children do not use unit addresses.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/hisilicon/hip05-d02.dts | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm64/boot/dts/hisilicon/hip05-d02.dts b/arch/arm64/boot/dts/hisilicon/hip05-d02.dts
index ad53066ac495..c4eaebbb448f 100644
--- a/arch/arm64/boot/dts/hisilicon/hip05-d02.dts
+++ b/arch/arm64/boot/dts/hisilicon/hip05-d02.dts
@@ -29,8 +29,6 @@ chosen {
 
 	gpio-keys {
 		compatible = "gpio-keys";
-		#address-cells = <1>;
-		#size-cells = <0>;
 
 		pwr-button {
 			label = "Power Button";
-- 
2.34.1

