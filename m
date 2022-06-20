Return-Path: <SRS0=5Cdg=W3=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C48D8C43334
	for <soc@archiver.kernel.org>; Mon, 20 Jun 2022 11:14:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 99135C341C6; Mon, 20 Jun 2022 11:14:42 +0000 (UTC)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 9119DC341C4
	for <soc@kernel.org>; Mon, 20 Jun 2022 11:14:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 9119DC341C4
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f44.google.com with SMTP id g25so20367003ejh.9
        for <soc@kernel.org>; Mon, 20 Jun 2022 04:14:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=o55VRGBgKVZI+BEVgAUvLDNLvJsbUGTBBuiWrNzmrso=;
        b=DzI+j2NG7eG8cjYB0T6jM7DB+lKRqpvUTvX0qtnYZPfP+ixiNCP1/A/79zEmgltJW6
         Vie8KSm+7oY724eICEDYhepWCqemDfdyGJ4MMaRVSlS3FfS1zG+JE440Q/+WMrTwWaZk
         qApYT/ARRcB9O07dwwUUKJPxIEotrFnN0U6+rxNa0Lndbm1l32pU6Jtza2yToDpzeWs3
         LqGx/Pgfj9PYw8SbGmaibO9Iyd5gWXAngginxgtGuksYWTEGQOdwCfBOEV/ntrr8Xx3r
         jk9o4/tmbVEXpYX23d9NhQ20l7Usp5GjEkR2AqFm6M2bdpirgsXhsppTUnCjgIDRuzqo
         eoMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=o55VRGBgKVZI+BEVgAUvLDNLvJsbUGTBBuiWrNzmrso=;
        b=igvVcmy/XrisyIxFzabXRO76kCMWzydUOTmGJNl3/F67CmYkLYnUz2s5jJmBVGy1Ol
         eBWmWihd6mpsdRF/RqmYtJgcSZzQowIrnpcpdtF0W1gnoOH3/l0AzwH+kedke9Y4FWQJ
         +Teb0YNMu5FA6CdFKCAcjrRkYnMX8U8Y4hIdGJjKx87XaVgdGweopTAJ4gO1hnSoCmSK
         B2tj2VGAd+hmLe4/e7grtTzFBFzOtJIUEj9Y7URJ03zHXfFb01oMcmBO6bNmrhq5DGjE
         QGSBEFnktywOUtDDzUUmPU3Vgek7sl5S/x6a4HAvZg0UWmY2FTHjefycYit1yzUEdPlw
         F7fQ==
X-Gm-Message-State: AJIora8DdPt0Oq8xpEbWaeMgHyF7WvLmMXS6Hk3VIsfUTdAsU3aVSxqn
	96B+YfXA9DoR7KdwhSNxrnOz3w==
X-Google-Smtp-Source: AGRyM1t2B2A4MQ/Jq/AFGhA8VOBClv4hX99uyL3KVUiSk5X3mbo+jilJlcCYF7yi43wGQtHOG7HhqQ==
X-Received: by 2002:a17:906:38d0:b0:715:8483:e01e with SMTP id r16-20020a17090638d000b007158483e01emr21137847ejd.265.1655723679868;
        Mon, 20 Jun 2022 04:14:39 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id c26-20020a170906171a00b006fed9a0eb17sm5699969eje.187.2022.06.20.04.14.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jun 2022 04:14:39 -0700 (PDT)
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
Subject: Re: (subset) [PATCH v3 06/40] arm64: dts: broadcom: align gpio-key node names with dtschema
Date: Mon, 20 Jun 2022 13:14:31 +0200
Message-Id: <165572367262.35195.14465437731239075361.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220616005333.18491-6-krzysztof.kozlowski@linaro.org>
References: <20220616005224.18391-1-krzysztof.kozlowski@linaro.org> <20220616005333.18491-6-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Wed, 15 Jun 2022 17:52:59 -0700, Krzysztof Kozlowski wrote:
> The node names should be generic and DT schema expects certain pattern
> (e.g. with key/button/switch).
> 
> 

Applied, thanks!

[06/40] arm64: dts: broadcom: align gpio-key node names with dtschema
        https://git.kernel.org/krzk/linux/c/ea559c81b61603d4044df6f826f10a832c42c98c

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
