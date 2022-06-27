Return-Path: <SRS0=17+H=XC=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3365BC433EF
	for <soc@archiver.kernel.org>; Mon, 27 Jun 2022 09:16:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id E3284C3411D; Mon, 27 Jun 2022 09:16:06 +0000 (UTC)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 256B4C341CB
	for <soc@kernel.org>; Mon, 27 Jun 2022 09:16:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 256B4C341CB
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f49.google.com with SMTP id sb34so17707640ejc.11
        for <soc@kernel.org>; Mon, 27 Jun 2022 02:16:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=QSv6xQ8WCWyYpbNh9MlnIWdHbx051KDSUBuTE6Wgst8=;
        b=b00vrVmrXxj36/zstZp722l6sKh/Y7VqFRVlNrJHgiZPk5qqgr0Go6f/XgwMUrB+mV
         h8Z3ps6lZj5hSXBkYZ5uAUbLKwu8x9mlambgUe/ozy9iH0vTZuSpMHhJrRDshZ75F9Hi
         vnH2GaNb8nBbrwVPvMFNU3usHcfyBM70/Rj9Wjgf7J06pQU2WTPWn/9OvyWpVQ19RNHm
         YYisNowTOwpcUcDI5VZrnEqKyVQP2L5bC0jPLEt9QDG5WQfqTlPaDP7zcyWBeZocr+40
         Mdu8LSKp8cItKsu7cKiuxD4RVmIXP3wRjQS+r1TYoJaoxG5LmuZS3aItpiNpwhpk2Uj6
         tw2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=QSv6xQ8WCWyYpbNh9MlnIWdHbx051KDSUBuTE6Wgst8=;
        b=UXBGfQ5gZJLKBk2G43R6fr0f8epAwp1HCUpwS8mQ/+yQEvFCOHVT8/7WuWaFWNNnCx
         wGlFEZeTyc6BVePQsKpCKntJjGWY3dUmFUAczlaOA5TXhcqbzm/qkb7V/6nbQYUGAb6d
         DF/tRx8D3jIbHCwauJmQh3YOOJf/lhANXc6TZ5PxbAt+r/KabZb+9N1klh65eyCkOS5Q
         n5ONGF/zNOJ3SrtKQjB9VW7JWoiU6GK1esUpNJJJmUXhigoqMxakzI+Wd8lqerzw8tuv
         /iL5LWBuAbKjujjux8AfEXRreOzibb+kilu0RB5NaPaL1JrLpyH7FHJuyVWXnB8KqtIp
         MBNw==
X-Gm-Message-State: AJIora+IJSnYgBhwRMsUpbt3mlEEb3lifu9vwcP2linRbYpOZ2w9QObw
	kJW6BjnsP8om1sy8N8NVQAr1G16DT/tcDA==
X-Google-Smtp-Source: AGRyM1skpry58hKIWk5E212f9OqDipMQc1zah2fbDJhA655IB0+JwOFCmlO9bu+OoK/xJ5ECN24HEA==
X-Received: by 2002:a17:906:db:b0:718:d986:d3d7 with SMTP id 27-20020a17090600db00b00718d986d3d7mr11775858eji.532.1656321363245;
        Mon, 27 Jun 2022 02:16:03 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id gy10-20020a170906f24a00b006f3ef214e2csm4805395ejb.146.2022.06.27.02.16.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jun 2022 02:16:02 -0700 (PDT)
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
Subject: Re: (subset) [PATCH 1/2] arm64: dts: qcom: adjust whitespace around '='
Date: Mon, 27 Jun 2022 11:15:39 +0200
Message-Id: <165632135503.81841.18219351379301079402.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220526204248.832139-1-krzysztof.kozlowski@linaro.org>
References: <20220526204248.832139-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Thu, 26 May 2022 22:42:47 +0200, Krzysztof Kozlowski wrote:
> Fix whitespace coding style: use single space instead of tabs or
> multiple spaces around '=' sign in property assignment.  No functional
> changes (same DTB).
> 
> 

Applied, thanks!

[1/2] arm64: dts: qcom: adjust whitespace around '='
      https://git.kernel.org/krzk/linux/c/603d2d30bfefc2c5c1abdc2bab0256ffa9ffe3ca

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
