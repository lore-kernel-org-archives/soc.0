Return-Path: <SRS0=17+H=XC=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1CA2CCA473
	for <soc@archiver.kernel.org>; Mon, 27 Jun 2022 09:16:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 8B8FAC3411D; Mon, 27 Jun 2022 09:16:19 +0000 (UTC)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 11307C341C7
	for <soc@kernel.org>; Mon, 27 Jun 2022 09:16:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 11307C341C7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f43.google.com with SMTP id mf9so17891787ejb.0
        for <soc@kernel.org>; Mon, 27 Jun 2022 02:16:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=dnwgVpAbJCk5Y0HQ5/+yPejv4FlYS0Er713npeMnQc8=;
        b=gdnXEvThmlVanmnDgJF5kH1vYKVD+Ah/E45c754FapkvJDVVJ0qCihos+Q4r6bGUR9
         gk9Ne30rQy2aAgUHvqntoMUhhEcWLzO88pK33a5omJV6yfjVWA7FgCs7kpMJJoY7eZQq
         z1ix05EoytrOA9cjSdKrDECAAIMNFoQALOanRhSG9zq1N9XkA8Swuh6dACnVv1kJ9U2y
         4wCu8UITUFyzP4snwSw1dsJ/84HHj+LCHbO7cpM4lKjkLCW7pEJbMtWXNT7fYynLumCS
         T/NyS4xZ+JI44hlDyImGmR2yb0NjvcSliYOVNxzUQ9P07mo2FO7+6EcUIuXYA7Gnmzys
         q6oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=dnwgVpAbJCk5Y0HQ5/+yPejv4FlYS0Er713npeMnQc8=;
        b=qEGid6VFIgANGlpcRx/GjhmQOY3MjfOZyGpnswqSEZGlvzrx5yl12ewhkyiZm6IKFG
         /vOIkYCXiN1j1QlIN87mTksoGfJX63y2qHT5FLPZkU3Q5QnaY7M+N1nFUl0WFv3lK3OY
         sW70qjrxRWfZRvMfaXvgoHY6yOvO9ZAucY+uPxFfxTU7ATjJAgFa9idZmVLQIAEOa2Vy
         k5v9da41l3eids9QP+t9ukJltHlFLkoHbAfJn5wHMPEdY5+S+h0iFH/4IxmBffTr9PPI
         OoyTsCxDtNHQEaILesb1xzXmk1aSgOtIELUyfAME12sv575ZSZDmqgv7JP8dbuGXvedO
         LUEQ==
X-Gm-Message-State: AJIora8RuPzwxLYGZS6DgWAMwV5Mipb0UcQqQcIMtTElBtiM3LENc30w
	d0mNQipkBtPO4Dq+PY0iK5M6TKDAjVUazQ==
X-Google-Smtp-Source: AGRyM1v2enS+B3+GGR6dCC4IEVkGqOz4P4eE9RSKXkrea+0vqJaqo6CwmCj9/s0i3BxCLEvUwFM3Eg==
X-Received: by 2002:a17:906:7a0b:b0:722:dac6:a8ff with SMTP id d11-20020a1709067a0b00b00722dac6a8ffmr11614667ejo.593.1656321377053;
        Mon, 27 Jun 2022 02:16:17 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id gy10-20020a170906f24a00b006f3ef214e2csm4805395ejb.146.2022.06.27.02.16.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jun 2022 02:16:16 -0700 (PDT)
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
Subject: Re: (subset) [PATCH v3 21/40] arm64: dts: qcom: align gpio-key node names with dtschema
Date: Mon, 27 Jun 2022 11:15:51 +0200
Message-Id: <165632135505.81841.13615326187016120694.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220616005333.18491-21-krzysztof.kozlowski@linaro.org>
References: <20220616005224.18391-1-krzysztof.kozlowski@linaro.org> <20220616005333.18491-21-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Wed, 15 Jun 2022 17:53:14 -0700, Krzysztof Kozlowski wrote:
> The node names should be generic and DT schema expects certain pattern
> (e.g. with key/button/switch).
> 
> 

Applied, thanks!

[21/40] arm64: dts: qcom: align gpio-key node names with dtschema
        https://git.kernel.org/krzk/linux/c/f118c00637144d0cec0b862dda283f565413539b

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
