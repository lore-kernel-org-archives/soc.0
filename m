Return-Path: <SRS0=LbBh=XI=linaro.org=bjorn.andersson@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A58FCCA473
	for <soc@archiver.kernel.org>; Sun,  3 Jul 2022 03:57:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 4ACB5C341D1; Sun,  3 Jul 2022 03:57:36 +0000 (UTC)
Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com [209.85.160.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id E0E71C385A2
	for <soc@kernel.org>; Sun,  3 Jul 2022 03:57:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org E0E71C385A2
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-10bd4812c29so3083936fac.11
        for <soc@kernel.org>; Sat, 02 Jul 2022 20:57:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=u9N8NjI9RBrK1bB9eLmzIxfM+IEIjeSqvIr00rCFrxQ=;
        b=zU2DrGyy7lyOGwSFs8J7uDLDzJfFW/2EW1zwVcWQbXbPySwG0Ttk8+O0I5dGJtUgtq
         UIIm3THiA4zYc7K3x1sJgWBAWpL8yp7KO4PIpgV/h+TY+Fj7kg0dootOqXJAoC55CwuQ
         BRT/hoqU7neaTxjV0tXA+poq8yDWlDTCJxLMxo/ZGDG7S195YWcj5OmdVLtwkuDf7XLM
         gXwSgbmt4PZXBlTpQWxeGUKql2qhrAuhegxURu/8pUnFKs0SFBc50pLFLXxWTVEd7uCp
         s26zoYFy6FD8Q4EZKFyEFEt7aHGcQDZTehXKzTrSNwH95jST0mdhflFbsgdXS9f8DeaL
         muoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=u9N8NjI9RBrK1bB9eLmzIxfM+IEIjeSqvIr00rCFrxQ=;
        b=2ENwjpqeDiTsJK+HNC5OW5FMkFt1xb2URJXFfyrWP9ex8uI7fs8sQHV0OuebATWPyG
         MUeIXw9Br3PBRI7mMhvfMY57iT1IClDZv1xc3FgrljenJpI5lv3xP618mQ52N7Ivqfqv
         S/udpfQErGHIwh1FT+w70O6zZmQ2lHaaSovhMC6MdWUTrXTEW+vP6qQpZpRxUUyOoK3Y
         LeOVMXYpg+Jq8da9lgsLFLqmAV5S9u4iRgLsvbchwNKJb7GYz9WmNZANyfbH45gcb2wp
         1XBazNhHPM2WWS4gZEzgG7Dz0uFDVUiFXqcBBMn7soiPF2l60YZrXn+N8OO26Wt7yObp
         GwOQ==
X-Gm-Message-State: AJIora9JIr1TI+nbS/m8iDmvnsWlx4Cxjp8tgBx8nqL8h2FupZbxCdrY
	J7LW+WpJLu4E+tOIpXzFv31yMGnATcO+Qw==
X-Google-Smtp-Source: AGRyM1sCO2vgss9UERO0Jwo66AuRz/k9wQea3+pwnz8Osbr0h4IUvpUIsNmnDsYnrES8IjESIFLO+g==
X-Received: by 2002:a05:6870:ec91:b0:101:becc:467c with SMTP id eo17-20020a056870ec9100b00101becc467cmr13776664oab.186.1656820654633;
        Sat, 02 Jul 2022 20:57:34 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id 25-20020aca0f19000000b0032e5d0b5d5fsm12965910oip.58.2022.07.02.20.57.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Jul 2022 20:57:34 -0700 (PDT)
From: Bjorn Andersson <bjorn.andersson@linaro.org>
List-Id: <soc.lore.kernel.org>
To: Rob Herring <robh+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Olof Johansson <olof@lixom.net>,
	devicetree@vger.kernel.org,
	Andy Gross <agross@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	soc@kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	arm@kernel.org
Subject: Re: (subset) [PATCH v3 21/40] arm64: dts: qcom: align gpio-key node names with dtschema
Date: Sat,  2 Jul 2022 22:56:28 -0500
Message-Id: <165682055971.445910.10604625512115231111.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
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
        commit: b08f5cbd69dcd25f5ab2a0798fe3836a97a9d7c6

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>
