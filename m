Return-Path: <SRS0=17+H=XC=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0883CCA473
	for <soc@archiver.kernel.org>; Mon, 27 Jun 2022 09:16:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id AA76BC3411D; Mon, 27 Jun 2022 09:16:21 +0000 (UTC)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 278F1C341CB
	for <soc@kernel.org>; Mon, 27 Jun 2022 09:16:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 278F1C341CB
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f50.google.com with SMTP id mf9so17890241ejb.0
        for <soc@kernel.org>; Mon, 27 Jun 2022 02:16:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=2Fqyg9C0YVFzyK1iMgVUn7n3ab05J1+6/AOtaaEs2lo=;
        b=BLQB6PAt3wDY+OC/w8s4493IlGzY/KsudGbyfBjPFbbgzAN8ZEXS9zIPttVQQGpVsR
         uTjVVNHnC3gugqjPUCG7YGXwh1WUkMEanidhBYU7j9WM1mMd8/CVX5NhT0+2SDWcRMcf
         ugruGVhZKfe7xr4Q8j4Gj7XPksXGzutTApWgUhCtjrXZ3NxsvoxSbi21girOBol9Rizo
         yCeUHo/0QIdOGuRUkXhrlpE3XocbsMa1QSiTLG8DyoNVB65MoBF4Gu8qMiN9LeqYBEl9
         oUxoV/b2a0bqFYHMw/DMKo9Z6Np5tr650bA40EbAYyF4DDQPZOYuw/GeftOv+3o5wTMq
         3yRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=2Fqyg9C0YVFzyK1iMgVUn7n3ab05J1+6/AOtaaEs2lo=;
        b=X7V7pvUHR3ZCV1oEln7WrpvNc3dQoC2R7+94ria9dPfFWjQ0PKA2rZqMjwLiXoKVZl
         OxQm7H2SxZIt0n22u9Wupw0TSfe8ciD83D5JFBABFa9Uno29Rwx+vcSWKIcxVCpwehbt
         X50FEX0Qi5rbK1zIuo1LWzdmv1gUuB44vxOz44ocNANiTIn5uXg9sq5wWKHX9CbLJjB0
         6Crd+9XBpQAE1Qx8W0v/x0OS8rulqmX6GfR8JGeNJGpijWWvmao/MGyZyFD7VH/H1cQq
         Ba7lUFP2SzsKcC6vruhtIEFAYUJs3RsgVL+IqQxntY8/cHMbCeAj4+oogji4xXUoA1h0
         PSCw==
X-Gm-Message-State: AJIora8eaPz2UJ59KMkYbJx816uxjf53turF/YScAQG1BhcT5wfJk6TO
	6EFG/nuirEM5Hu5haG+OUU27v3unmnBAgw==
X-Google-Smtp-Source: AGRyM1ve80Csa3fctAzzt6e06uZVxxk20Y9k2+j9/VcyLhE1hqdWUtICp2LkmhKpII7QnT3IxcayBA==
X-Received: by 2002:a17:907:3e11:b0:726:372b:6c32 with SMTP id hp17-20020a1709073e1100b00726372b6c32mr11930678ejc.157.1656321380448;
        Mon, 27 Jun 2022 02:16:20 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id gy10-20020a170906f24a00b006f3ef214e2csm4805395ejb.146.2022.06.27.02.16.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jun 2022 02:16:20 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org,
	robh+dt@kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	agross@kernel.org,
	krzysztof.kozlowski@linaro.org,
	Arnd Bergmann <arnd@arndb.de>,
	krzysztof.kozlowski+dt@linaro.org,
	devicetree@vger.kernel.org,
	arm@kernel.org,
	bjorn.andersson@linaro.org,
	olof@lixom.net
Subject: Re: (subset) [PATCH v3 24/40] arm64: dts: qcom: align led node names with dtschema
Date: Mon, 27 Jun 2022 11:15:54 +0200
Message-Id: <165632135505.81841.3254747322278026841.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220616005333.18491-24-krzysztof.kozlowski@linaro.org>
References: <20220616005224.18391-1-krzysztof.kozlowski@linaro.org> <20220616005333.18491-24-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Wed, 15 Jun 2022 17:53:17 -0700, Krzysztof Kozlowski wrote:
> The node names should be generic and DT schema expects certain pattern
> with 'led'.
> 
> 

Applied, thanks!

[24/40] arm64: dts: qcom: align led node names with dtschema
        https://git.kernel.org/krzk/linux/c/365f7c26080fefc78a6d76ee4ba29e33a5a270d5

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
