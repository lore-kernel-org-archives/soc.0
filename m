Return-Path: <SRS0=xSpP=5V=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AF7AC25B4E
	for <soc@archiver.kernel.org>; Tue, 24 Jan 2023 10:36:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 3EFA9C433EF; Tue, 24 Jan 2023 10:36:46 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 476EAC433A0
	for <soc@kernel.org>; Tue, 24 Jan 2023 10:36:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 476EAC433A0
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f54.google.com with SMTP id d2so13400726wrp.8
        for <soc@kernel.org>; Tue, 24 Jan 2023 02:36:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ozuy8c1uprzAYFuNopgrW2eAY/B5tIGZz6v2gE4dvkM=;
        b=qk4hiCl6a5gxx4NYtVXmwGE614aw/yJGlkAE0YFyMyBwpxP5uI5bkeYuLnUW3W2d+o
         +GfBpWZuCheRX/yRo8S9KPAUdRL3658Xb9iG6bsOplwHouq6QGZx21R31RoT5GmDZm2/
         5r10RjUgUY7gOhVZPeOE20CBb57XWMdtzXCz/F66ihzwcRffrL8C/4jMHAZjDHQZpMON
         Q5E9Zzk8W5yym22S3gjQx4oRJk7aXyGBit5PPu4RfbM060bnW9fzYjWW/WrEt+vOMuEb
         OYHa77qnkbWNEqGMdMghSYCsBd3Y/UNGYIcrW0FsKTIdKHxB5tIS5gJvY4oXGkTh67dZ
         Li0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ozuy8c1uprzAYFuNopgrW2eAY/B5tIGZz6v2gE4dvkM=;
        b=mYZXl0yiQxFbfhzlAuEjzT/um1X16o9ovIEhiFfTv3Ce3+AsMF/ee0+srn/62qiCwO
         HlGG2AsRtT7rEVZwHTgGUXlrVJHYM2L2Pf+AG6PfgsJS/Fkv9JZhj6diaqUY0SwlB99j
         UYyVtGnukFXCBpk5Tx6FFngHINGkrS+E+B87IPF+rzS/cdkK8f0LSFMJnTIOVufb3Rcu
         MbqvIEexYs9JMx4A0WEH/MSBFoQ3hK4e0u8hl2Y7EqyG62ZldAMEPZkJfkevuS7Tbnw9
         fH/ulcpCYgJKm5K6u3P+JLfWxP5PCMsWwBckMP4u/ag7ilsXAO1P+F8C73AcvNybySLp
         5hVA==
X-Gm-Message-State: AFqh2kp9wK9S3oig/iQ4CnP1/mDl7xtxzgrnZ5224v1HQoEO+oE53qvF
	Qf5EKUMEHSbZW7fMDiEZrISjww==
X-Google-Smtp-Source: AMrXdXvXUIP7k0jOS/1sd5MRA3PAUIs8khFM+PrSYZyQw40T+C544df9OdxD8I9cHl0tbKM2lxv0Og==
X-Received: by 2002:adf:e18c:0:b0:2be:493f:3b34 with SMTP id az12-20020adfe18c000000b002be493f3b34mr21537207wrb.26.1674556603612;
        Tue, 24 Jan 2023 02:36:43 -0800 (PST)
Received: from krzk-bin.. ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id x4-20020adff644000000b002bdeb0cf706sm1559196wrp.65.2023.01.24.02.36.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jan 2023 02:36:43 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: linux-kernel@vger.kernel.org,
	Markuss Broks <markuss.broks@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	soc@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Olof Johansson <olof@lixom.net>,
	linux-samsung-soc@vger.kernel.org,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Mark Brown <broonie@kernel.org>,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v3 0/2] Add support for Samsung Galaxy S5 (Exynos)
Date: Tue, 24 Jan 2023 11:36:38 +0100
Message-Id: <167455658659.245058.14105028305276435215.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230123222329.13994-1-markuss.broks@gmail.com>
References: <20230123222329.13994-1-markuss.broks@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Tue, 24 Jan 2023 00:23:26 +0200, Markuss Broks wrote:
> Samsung Galaxy S5 (Exynos) is a mobile phone released in 2014.
> It has an Exynos5422 platform. This version of Galaxy S5 is only
> capable of 3G communication using the Intel modem, while the
> LTE version of the device (klte) has a Qualcomm Snapdragon SoC.
> 
> Currently, internal eMMC, USB, regulators on a PMIC, and touchscreen
> are enabled in the device-tree.
> 
> [...]

Applied, thanks!

[1/2] dt-bindings: arm: samsung: Add compatible for Samsung Galaxy S5 (SM-G900H)
      https://git.kernel.org/krzk/linux/c/5f8d9a0c2ee2d2fe2d59135261a0835a0a688fa5
[2/2] arm: dts: exynos5422: Add device-tree for Samsung Galaxy S5 (SM-G900H)
      https://git.kernel.org/krzk/linux/c/75b976c46cbe13dc8accc1173ceee6faddb83112

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
