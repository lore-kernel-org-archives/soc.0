Return-Path: <SRS0=17+H=XC=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2718CCA473
	for <soc@archiver.kernel.org>; Mon, 27 Jun 2022 09:16:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id BBDFEC341C7; Mon, 27 Jun 2022 09:16:16 +0000 (UTC)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 1E517C3411D
	for <soc@kernel.org>; Mon, 27 Jun 2022 09:16:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 1E517C3411D
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f46.google.com with SMTP id d2so6013503ejy.1
        for <soc@kernel.org>; Mon, 27 Jun 2022 02:16:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=smmwNGmUXsCa92fGpwEoty8rEolknH2O6aTGzJhLQMg=;
        b=aNtE9OtuA8bLYEkNplbQ0YykPTb9NDTmDYIvP/NdzIMgyitUVU+KB3kHmC9ZAP7QSF
         avgzZjuYA5+mdHKtzSMAtSeHrE00CuHalgol33BsDFnDKE/Wp/Yucf1zSfEJtTzHhPpI
         085uvHht4emZucRPBRsZ40LIRh1SSv1XP6I3aeXRKEKERPKm/S6I3iMGK2JaW5Ld/ucA
         3Szou6aPWGJxIPXhI4w/Yt6+byVJ/8xpcE9+de4BiKPo6FnTk1AeRG1hBdsDHyeQTP+Y
         DbDWPkwTUC4Df8d4SM/Xy+rO3Vh2tRRm5I0PkaWgcEJNb9/cwDQk24SJiR1SiqJu0O1c
         s5UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=smmwNGmUXsCa92fGpwEoty8rEolknH2O6aTGzJhLQMg=;
        b=CJN4CYgO/RNZm0UCJveVZA156EAnAgfFubJAg06lT+KfD7mjFwzi3rAgp0BexDwvEN
         JoEBGwBIeU+x0hgHsXyB3xFRiik3B7B93ZqB3P3WMIXj1dHZWQ1XQTYKvKF3Fa/KReYE
         sQjOBdK1ImC+niuQCUt1scGyAlWe3CdvQZSHNiWV2u0vsgmu6DdZYrTorxT860zp5B6B
         ZYody+9iUPr3s1vcNmDC0t/hcm/9aQ+83XIX2PAd99TsQIJPuIwSHalp+lUVzeSvmpGI
         dxCEKJ5Cv3PqcEFCJVUD0ivSXhQ+J6jfPO1d7BtvICBiMHtNUfcbNQQ0qlMQpO7L/M6E
         HIMw==
X-Gm-Message-State: AJIora82vuaZZ362ZCpj63QmG7sWPg7IdfL57R/s1gd/Icbiqv3jc982
	aUwVg/mLIR7WEsQpt3MKeMYXdw==
X-Google-Smtp-Source: AGRyM1sDNGNOV4ayuZr7c+UjYlt9z2D3MBwBlQVgI4EFdhElj+/ICeFNPCHfJAt9Ps43C5hC7M1eeQ==
X-Received: by 2002:a17:906:2088:b0:711:f512:837a with SMTP id 8-20020a170906208800b00711f512837amr11727626ejq.113.1656321373384;
        Mon, 27 Jun 2022 02:16:13 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id gy10-20020a170906f24a00b006f3ef214e2csm4805395ejb.146.2022.06.27.02.16.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jun 2022 02:16:12 -0700 (PDT)
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
	arm@kernel.org,
	sebastian.hesselbarth@gmail.com,
	robh+dt@kernel.org,
	olof@lixom.net
Subject: Re: (subset) [PATCH v3 12/40] arm64: dts: marvell: armada-3720: align lednode names with dtschema
Date: Mon, 27 Jun 2022 11:15:48 +0200
Message-Id: <165632135505.81841.1881294272439246471.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220616005333.18491-12-krzysztof.kozlowski@linaro.org>
References: <20220616005224.18391-1-krzysztof.kozlowski@linaro.org> <20220616005333.18491-12-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Wed, 15 Jun 2022 17:53:05 -0700, Krzysztof Kozlowski wrote:
> The node names should be generic and DT schema expects certain pattern
> with 'led'.
> 
> 

Applied, thanks!

[12/40] arm64: dts: marvell: armada-3720: align lednode names with dtschema
        https://git.kernel.org/krzk/linux/c/2b090180dced85ccf27f276c1b6c9521d4c4120e

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
