Return-Path: <SRS0=5Cdg=W3=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79D71CCA47F
	for <soc@archiver.kernel.org>; Mon, 20 Jun 2022 11:14:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 36C14C3411B; Mon, 20 Jun 2022 11:14:48 +0000 (UTC)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 07CB9C341C5
	for <soc@kernel.org>; Mon, 20 Jun 2022 11:14:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 07CB9C341C5
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f45.google.com with SMTP id h23so20359936ejj.12
        for <soc@kernel.org>; Mon, 20 Jun 2022 04:14:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=PDUPEADjTysO+mW0NL3TVvFn5QhAfrPz/k4jnYFPPL4=;
        b=b/z7JDzP1ZHw1+DzWr/EyZeOFJkdVKikKEgc3wt2UpYOIFubbji8i8a8J0zNnRxe9i
         2QTDhaOF03EXnqMgmuh84GJimTuehwzuCjchSBPQcL1hIDe3fq6wEQ48duVWb575Zpc2
         5VEsKHFMA2eBa23zI3Gat3Q+uIRadXBwYwiVJob32wjSUKq7K3pPdSETRDRg/DTkkrWR
         vXN90/cIpc7QXa+o7GHKuCdru1CHouycAlGxQDQvtWm11Lthyl71DW2zlsIMZRzOykRP
         DL88UqKyc6q8iXDvOFmg7khjhwNcYp9bQvEy2RhwDDpOk3iIcJ9jicEE/lck2KyxeDLX
         oDbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=PDUPEADjTysO+mW0NL3TVvFn5QhAfrPz/k4jnYFPPL4=;
        b=vhFpo+BA0VAunHdYmsZcbp4O3MN0pmrQImqHRnhgKLOie/gvv+b9jNk2Re2L57n9Ov
         nfm23Ws/zixRXzMbuQKIKbQpWdfX2x3yqLXsyDJ2+c8wwmbHIuN8dB2GxdWx8IceTdhE
         Dqzt9Mu2nlvsdGZXXOEe5kwDOlivGd89FKNcizZIG5MUn6bVxOsJJ/B/dAsSFRNeLEvG
         N8mXNRAZPHl2YQiTBCBe6QfEiE45moRFNzVluQI9f6TQ6EHfxyOlRZNa/WtymL8xSZeM
         epK4yxSyZdtBatP3n2c5MvJ+TeViONZiEOJMbd/GWDBA1V2CSj+DDOzPj8Nh87TmKCN2
         xphw==
X-Gm-Message-State: AJIora8vkPisY/JJcGKcmDuP4ahif1nyZmH/D3FoFo+dkR5hqopVei/T
	LdZ/Sj1YEHTdbD4OvRNSvb+G3w==
X-Google-Smtp-Source: AGRyM1v7ZEhn+sHHE30xE0qp6cQYFhsxB5lZl+gTtKPHBci6iRtfZiEpDw2heV4H54LXjhOZcxHIIg==
X-Received: by 2002:a17:907:7da8:b0:722:ca29:b58e with SMTP id oz40-20020a1709077da800b00722ca29b58emr2407642ejc.732.1655723685269;
        Mon, 20 Jun 2022 04:14:45 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id c26-20020a170906171a00b006fed9a0eb17sm5699969eje.187.2022.06.20.04.14.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jun 2022 04:14:44 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>,
	arm@kernel.org,
	devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Olof Johansson <olof@lixom.net>,
	Rob Herring <robh+dt@kernel.org>,
	linux-kernel@vger.kernel.org,
	soc@kernel.org
Subject: Re: (subset) [PATCH v3 34/40] ARM: dts: animeo: align gpio-key node names with dtschema
Date: Mon, 20 Jun 2022 13:14:34 +0200
Message-Id: <165572367262.35195.3555641087941353753.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220616005333.18491-34-krzysztof.kozlowski@linaro.org>
References: <20220616005224.18391-1-krzysztof.kozlowski@linaro.org> <20220616005333.18491-34-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Wed, 15 Jun 2022 17:53:27 -0700, Krzysztof Kozlowski wrote:
> The node names should be generic and DT schema expects certain pattern
> (e.g. with key/button/switch).
> 
> 

Applied, thanks!

[34/40] ARM: dts: animeo: align gpio-key node names with dtschema
        https://git.kernel.org/krzk/linux/c/523b53bb750d91148222297c3857bbde7c7483a8

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
