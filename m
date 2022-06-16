Return-Path: <SRS0=sX7s=WX=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79043C43334
	for <soc@archiver.kernel.org>; Thu, 16 Jun 2022 20:47:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 5AAACC34114; Thu, 16 Jun 2022 20:47:57 +0000 (UTC)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 1536BC341C0
	for <soc@kernel.org>; Thu, 16 Jun 2022 20:47:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 1536BC341C0
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pj1-f43.google.com with SMTP id t3-20020a17090a510300b001ea87ef9a3dso2476403pjh.4
        for <soc@kernel.org>; Thu, 16 Jun 2022 13:47:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=jnD99uencGMjTPpflykxZNYOUgUN3LUgOaJGkyuBq30=;
        b=pWd2gWMcVtb2dxWnVHPatHbAB2Xdpt96Ys9iB5jXphQh5KSnWbOKCf7wGVj3VIPjeL
         4gRZHPFC43xJmqWfyQHjLHWCncnzd5JqZ+Au/+PUJOh8jxcULCy/+l7wVIuK5r6KppnM
         yNwaGMX/YFZ8/+98md5wb9xZCHdN/v8z7ZSmjcCbQDzV+SQyE4BsrPVbzKT4G4pWxsGN
         2IrP1t5qdpac6hKOV/VtQ/S9l4yvVOTdMlDmPBRCoPnOuVOG1eWxMPgKMfRwfYYX6VOQ
         ZThqHRYkagUArmWKYbdvTb2tYuFUfzUjsBbFGIerC/l1G4wywVX5ew22gst8QM2wQ4mv
         CfNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=jnD99uencGMjTPpflykxZNYOUgUN3LUgOaJGkyuBq30=;
        b=zV8R8O9H7n0X2f7Zo45EsoVxWVIuYLNKm2irdw03hPDkHqP51MzbvvQZpGkBW9TZsX
         N58RDGprcsUMTZEB0/oJBN9anBvVjPzOhhQ8V8PWXJSDe4OfWLG7QW7XgPhVKEeUBh9v
         gMGqCBfN0hgv2JlPbWqXh7B1hsOfwMeIdtIURyp4UrmIwiqA1XT9bQkuByIK8cYCRsK8
         WPlWYqPHo1+/t4Zi7POcL1EA2uyrtd6GIs41HXeeKRNyYlzFiebisJnNMUjMLe0Y3LPY
         1DqFDi7TfqsSxQvOe7K66giE1tHcOI6HAps+NrN26AdRfKOmaXx10bm7sKfMqI53IlWj
         3BBA==
X-Gm-Message-State: AJIora/oCXiZgFcjYn7eX86eTtA8Ct/v/+v+eARBT1AYVbnFZyPG4AfK
	gSke2Ro0zlDZ66E9AlWzaWE3LA==
X-Google-Smtp-Source: AGRyM1srUf92ldxiVI8QIWyED6HakwtuZcKqfwr84IMozkgc4DIwT4ycq14eV6FtmSctJTFDsTwcog==
X-Received: by 2002:a17:902:ebcb:b0:168:e3ba:4b5a with SMTP id p11-20020a170902ebcb00b00168e3ba4b5amr6308144plg.11.1655412475720;
        Thu, 16 Jun 2022 13:47:55 -0700 (PDT)
Received: from krzk-bin.. ([192.77.111.2])
        by smtp.gmail.com with ESMTPSA id 203-20020a6218d4000000b0051ba0ee30cbsm2165453pfy.128.2022.06.16.13.47.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jun 2022 13:47:55 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
To: linux-aspeed@lists.ozlabs.org,
	soc@kernel.org,
	Olof Johansson <olof@lixom.net>,
	arm@kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Joel Stanley <joel@jms.id.au>,
	Arnd Bergmann <arnd@arndb.de>,
	Rob Herring <robh+dt@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Andrew Jeffery <andrew@aj.id.au>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	devicetree@vger.kernel.org
Subject: Re: [PATCH] ARM: dts: aspeed: adjust whitespace around '='
Date: Thu, 16 Jun 2022 13:47:16 -0700
Message-Id: <165541242280.9040.12820468454884340112.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220526204127.831853-1-krzysztof.kozlowski@linaro.org>
References: <20220526204127.831853-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Thu, 26 May 2022 22:41:27 +0200, Krzysztof Kozlowski wrote:
> Fix whitespace coding style: use single space instead of tabs or
> multiple spaces around '=' sign in property assignment.  No functional
> changes (same DTB).
> 
> 

Applied, thanks!

[1/1] ARM: dts: aspeed: adjust whitespace around '='
      https://git.kernel.org/krzk/linux/c/94d0a03297615cad2d40b0f02ceab902a7339062

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
