Return-Path: <SRS0=17+H=XC=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B277CCA47F
	for <soc@archiver.kernel.org>; Mon, 27 Jun 2022 09:16:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 05B41C341CD; Mon, 27 Jun 2022 09:16:17 +0000 (UTC)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 6D9BEC36AE5
	for <soc@kernel.org>; Mon, 27 Jun 2022 09:16:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 6D9BEC36AE5
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f53.google.com with SMTP id h23so17709328ejj.12
        for <soc@kernel.org>; Mon, 27 Jun 2022 02:16:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=AJB4XMjx8N7mxha/eRfRwMbPoUvU5kmk+YfkrCxetGo=;
        b=eLz5pYGmqMUxRVWr3SvOwRgDbTVch01ias9Bqz6lN/Y8pYB7FCbUjuVOwW8X5qUpEu
         2cIkViktKJoZgpxnF5jBjqP1QVeM5gYWXcUsfbxBQg6may+cDxFbtWWASlmcTxT2N1TF
         P80Owzqoll3uyE4sijdCnT5i7qIdInDJi8XR2AYVfwnSLB7stPEKVoB87f8xDgl6Pk1v
         4ETkPhiU6hQMWnlpSneAtY5vfU/BykoVu2Ano7yz/2FM1dgg+tGuq6b94oqR4ohT9hgJ
         GslFvycltsZzwkKjGb8yyJJNB6sbnlPxffrHXpPFMwTheYirXi3My3zEvo1WhJmvsFaW
         5XOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=AJB4XMjx8N7mxha/eRfRwMbPoUvU5kmk+YfkrCxetGo=;
        b=m0U7yfTMY0u8NtE9RQCtEh/gZItLYXm590yC41kASNFrbwILPyHNfB5YBV9jFHhgC1
         Vf4RDHQgm2I9+v0/0ho9pKlZcAYWLpNyhLvQ2v+ris+MICxzgmG0MmAAoDY+MBhvZS1A
         uau9y9oG5i6OiqsC80JjUDQBOsIBZzrPip7udNj9Rfjh94gT8FzYFYZrbxD/clFnYPTW
         A0xt7Z31o0VxR/QuQ9CZJLHkf91Jop8I4a5kOTFusZJp7bCK5j3W5wHlYChjEYmoXLZH
         sQo1vic2ATFN38SNC8tgp5MEYpOuVzKGkXHraUabou7QiBKPeo1VvpTXrBsvVXcxkauT
         5DPg==
X-Gm-Message-State: AJIora+ihNjpPeL2jtF4POAprEq8EJF68er9RB/nX2VFc3tiaIoaYxRT
	xGig3+iqrl3M8JDMrm0ybHK2cQ==
X-Google-Smtp-Source: AGRyM1toh45jc3hLb+Tcn7tJOu1lC+sxr5r8HQC9Gpqg3nJSm1MWi8AXnpzO8kPqoU3vW2hRRHii5A==
X-Received: by 2002:a17:907:6ea8:b0:726:a8bb:5a3e with SMTP id sh40-20020a1709076ea800b00726a8bb5a3emr2801872ejc.753.1656321374723;
        Mon, 27 Jun 2022 02:16:14 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id gy10-20020a170906f24a00b006f3ef214e2csm4805395ejb.146.2022.06.27.02.16.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jun 2022 02:16:14 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
To: gregory.clement@bootlin.com,
	soc@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	andrew@lunn.ch,
	linux-kernel@vger.kernel.org,
	krzysztof.kozlowski@linaro.org,
	Arnd Bergmann <arnd@arndb.de>,
	krzysztof.kozlowski+dt@linaro.org,
	devicetree@vger.kernel.org,
	linux@armlinux.org.uk,
	arm@kernel.org,
	sebastian.hesselbarth@gmail.com,
	robh+dt@kernel.org,
	olof@lixom.net
Subject: Re: (subset) [PATCH v3 13/40] ARM: dts: marvell: align gpio-key node names with dtschema
Date: Mon, 27 Jun 2022 11:15:49 +0200
Message-Id: <165632135505.81841.17659876356619463285.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220616005333.18491-13-krzysztof.kozlowski@linaro.org>
References: <20220616005224.18391-1-krzysztof.kozlowski@linaro.org> <20220616005333.18491-13-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Wed, 15 Jun 2022 17:53:06 -0700, Krzysztof Kozlowski wrote:
> The node names should be generic and DT schema expects certain pattern
> (e.g. with key/button/switch).
> 
> 

Applied, thanks!

[13/40] ARM: dts: marvell: align gpio-key node names with dtschema
        https://git.kernel.org/krzk/linux/c/41340053cc72180e9095ca02418a5ab80794983c

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
