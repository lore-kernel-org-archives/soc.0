Return-Path: <SRS0=sX7s=WX=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AE6EC43334
	for <soc@archiver.kernel.org>; Thu, 16 Jun 2022 00:48:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 0CB09C3411F; Thu, 16 Jun 2022 00:48:27 +0000 (UTC)
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 6523CC341C0
	for <soc@kernel.org>; Thu, 16 Jun 2022 00:48:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 6523CC341C0
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pf1-f177.google.com with SMTP id e11so99917pfj.5
        for <soc@kernel.org>; Wed, 15 Jun 2022 17:48:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=qp3edhQcRtMcVJoA9hlhbeV2zjC7yml5vSoU96PZRCs=;
        b=L+UOgh6JQRaNTE/JReN21PZAoB/6nnToA8fEWd5A+dV/kER0XwItK85xWljunHAbTj
         gOaYlkoLs9AiT21Vx1wjmuduTErEd1/98fh87mBOcBvIwRDs7OMQg+T9OkjjR38w5sga
         LmpXul/uvGcZVf+0MZIjD0IOMj5eNX1KXKh9uEOiRQP1MphFTgqUEf/wocXBm9tkhGOs
         3oVI5BeEmbGRlqhvnxG5msKYLs4O6Y39pClLn2jaUo+RbTZoTSNpakdN7Wus8OCgGfgP
         /RTmsCBnKxT9chsIAsIQHwGGdaZs/ySBEqpyKS8SMvKvTZZUxNMPQI63L5K188AIDF2J
         i1GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=qp3edhQcRtMcVJoA9hlhbeV2zjC7yml5vSoU96PZRCs=;
        b=mRDT9EVCPnledDcKz+8RrohAoSPw+Y6xWwFI16iXPy75SgVFlc4x07c3UGMqBZETrO
         cRGH1ODLTtlqRlsqyjt/x639PGwLgsH8EGkTpmukuz5gdfhoXsT6xIHbLflMZItluzR+
         NBVUWeEfyp1oAWH9q6ZKbhLRI5k4A97HOpERvOi0LZ5YeMYmsqmGzAzP1lEKWTvxYE73
         tzGY57AE8QRCG6Fq9GoKUUHIGgHEITwZzL1F1wPAw89gPqETRBlm6Ag538+pgnpTQZYy
         N9/O8gEDjgMlqEkHk1mWKTb45Jw34Uq6x8/Lqn0d+Mvv3CwZFi+8XBDeNwwwBBxEIlEz
         yMBg==
X-Gm-Message-State: AJIora/FNxdnxIMXMpw/edPdNTlf41diuBQG9mXpSquwWzpRTgc7mKoM
	qTONFDyIAiDpU1bX42OaH+Efrw==
X-Google-Smtp-Source: AGRyM1ueSK+tw3uFtmBZQL6kWbqp7RpDDRh7PzZWAcZOgdQZukfyMUyAAaRPhzF5ukPOnTqzdqLexw==
X-Received: by 2002:a63:6f0b:0:b0:408:b8d9:f491 with SMTP id k11-20020a636f0b000000b00408b8d9f491mr2152776pgc.496.1655340505789;
        Wed, 15 Jun 2022 17:48:25 -0700 (PDT)
Received: from krzk-bin.. ([192.77.111.2])
        by smtp.gmail.com with ESMTPSA id f11-20020a170902684b00b001635c9e7f77sm253518pln.57.2022.06.15.17.48.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jun 2022 17:48:25 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
To: linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	devicetree@vger.kernel.org,
	arm@kernel.org,
	Olof Johansson <olof@lixom.net>,
	linux-arm-kernel@lists.infradead.org,
	Arnd Bergmann <arnd@arndb.de>,
	linux-samsung-soc@vger.kernel.org,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	soc@kernel.org
Subject: Re: (subset) [PATCH v2 48/48] ARM: dts: s5pv210: align gpio-key node names with dtschema
Date: Wed, 15 Jun 2022 17:48:22 -0700
Message-Id: <165534049853.17040.18012306290229997818.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220609114047.380793-9-krzysztof.kozlowski@linaro.org>
References: <20220609113721.379932-1-krzysztof.kozlowski@linaro.org> <20220609114047.380793-9-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Thu, 9 Jun 2022 13:40:47 +0200, Krzysztof Kozlowski wrote:
> The node names should be generic and DT schema expects certain pattern
> (e.g. with key/button/switch).
> 
> 

Applied, thanks!

[48/48] ARM: dts: s5pv210: align gpio-key node names with dtschema
        https://git.kernel.org/krzk/linux/c/8b86f733c0e512f92e43a9db1559498ef64d244e

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
