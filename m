Return-Path: <SRS0=LbBh=XI=linaro.org=bjorn.andersson@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7BFFC433EF
	for <soc@archiver.kernel.org>; Sun,  3 Jul 2022 03:57:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id A11D2C341D2; Sun,  3 Jul 2022 03:57:36 +0000 (UTC)
Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com [209.85.167.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id EA279C341CF
	for <soc@kernel.org>; Sun,  3 Jul 2022 03:57:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org EA279C341CF
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-oi1-f176.google.com with SMTP id w83so8973340oiw.1
        for <soc@kernel.org>; Sat, 02 Jul 2022 20:57:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=wokBQ9oSEwUwrcHF6wAKwWoV89oOxGjTHUwzBoOGs24=;
        b=bL12LAB3rEQdAn2JQRCTf0LpRKpn+JzX3ieVgMtQT3UhMdxymbZld5z39AT1Y6okaE
         hbpRbj54K1PFl7wgqDaGqo5NZ2C+GxYbsMX7c1xwzXFG8Zo+5nG1pu0K6HKckDGn5OsY
         Z0nh8EJrHEblYv+5iY2cCnCMTz4r3pksGitrmtmyGJ4jbPAxqFvozDT9mDR6uqO7jH93
         50uB3kdGLbBcOV55kyIw9qeRcay1zxHL7T+QkUOIshcbvRXzXnFfaYTlLkeTkmOsk/zC
         F3SECl9ZxO2KnKL2d2+WEg1cJQqnz35RScCukaT4zu6sDMlWQjdhYmdIZnaNDerTOaYE
         v4vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=wokBQ9oSEwUwrcHF6wAKwWoV89oOxGjTHUwzBoOGs24=;
        b=dC38zZCWY+4Qfz69rRKsZR9cNtdMQg6NeEH8j08M3xGKTt4Wa9ZmxuQSQhItSTUsNt
         +Z7/xYTdHW1FcuoD9i/5QBHlWeyL6lsjcgMgY18h6AVsVoJKellHAIwItQ3++E0lQkho
         sXHI2fhIHmi9jgIxeBOz+DDZMlq92fuhz2Q8H825AkYV5RKurv2xPIa0miBtryCXDMhd
         l/BOjMvw70AEsVdrCSxmLHpuxjwXvrebcZBM7Ahjxw2Q4W9AZpyfEcXjVpqwihg59fyv
         z5MnMjrxFvN4wS4cG0lP8kD03lQjrCeZGQDYy1f+gOdSD9tH7Va/CAaGBwNgx1TEKXHS
         fNYA==
X-Gm-Message-State: AJIora97GR1wbuf3p+/ijKtxrXekJDvHoBGqwYUHYGLkuqVahuz3YFxe
	qWGmDQTznOu3D6HSHH6UGJOunQ==
X-Google-Smtp-Source: AGRyM1vuXUCA+tQfvJJg96GCfC+5BfENK66OKsnDvm3laAYX1gPBJjntoDg50GLsHL7ckr1ccrAkGA==
X-Received: by 2002:a05:6808:10c2:b0:335:c2a8:d1f7 with SMTP id s2-20020a05680810c200b00335c2a8d1f7mr9836599ois.123.1656820655646;
        Sat, 02 Jul 2022 20:57:35 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id 25-20020aca0f19000000b0032e5d0b5d5fsm12965910oip.58.2022.07.02.20.57.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Jul 2022 20:57:35 -0700 (PDT)
From: Bjorn Andersson <bjorn.andersson@linaro.org>
List-Id: <soc.lore.kernel.org>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	linux-arm-msm@vger.kernel.org,
	Andy Gross <agross@kernel.org>,
	Olof Johansson <olof@lixom.net>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	soc@kernel.org,
	arm@kernel.org,
	Arnd Bergmann <arnd@arndb.de>
Subject: Re: (subset) [PATCH v3 22/40] arm64: dts: qcom: correct gpio-keys properties
Date: Sat,  2 Jul 2022 22:56:29 -0500
Message-Id: <165682055968.445910.595101220376167281.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220616005333.18491-22-krzysztof.kozlowski@linaro.org>
References: <20220616005224.18391-1-krzysztof.kozlowski@linaro.org> <20220616005333.18491-22-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Wed, 15 Jun 2022 17:53:15 -0700, Krzysztof Kozlowski wrote:
> gpio-keys children do not use unit addresses.
> 
> 

Applied, thanks!

[22/40] arm64: dts: qcom: correct gpio-keys properties
        commit: 5a4b0b853a2914403746b0a1decab695202ff242

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>
