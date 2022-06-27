Return-Path: <SRS0=17+H=XC=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8B77CCA47E
	for <soc@archiver.kernel.org>; Mon, 27 Jun 2022 09:16:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 944ECC341CE; Mon, 27 Jun 2022 09:16:26 +0000 (UTC)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 0C65FC385A5
	for <soc@kernel.org>; Mon, 27 Jun 2022 09:16:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 0C65FC385A5
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f43.google.com with SMTP id z19so11993119edb.11
        for <soc@kernel.org>; Mon, 27 Jun 2022 02:16:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=+SlY4L0zpXi1uWd8Q0lEx1CkPHXXwoeqDNBkWx8yj5k=;
        b=lXErmffp8XsnGnoP3J5rP/4dSowFB+3rJS8QdysVEpQuXbnyrqMmW54jW8aMkZMpk9
         hV2lxzEYBNZIf/ZnuHq5wGT5BpxeFoS1a7O7P5h1EMd/NxS2yHYsfT10C6Cdo4QfMP8M
         mQmJeanjHZjdsS9F2Z7mIvTQh79UcXugr/T0FmGYNkB4o69+bEVoZ6iiqWTKiU4f+pmB
         Jv0ejIA3fihJN57DHyK0mkemi+T6O8bHjeA3EVzLuyunGIsjlI61yIqwQkp7FCj44ATD
         hAzerG3oehe6KFDrVrx04fOWcS53qNHEvrEPeHT6JWJB7xiRoJJEqcxZKorEaRs9f5Gj
         5cew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+SlY4L0zpXi1uWd8Q0lEx1CkPHXXwoeqDNBkWx8yj5k=;
        b=EWDFt4FBqfgWmY+VX7zfpXMiWD4EX7eJxWECZBLODtOZL1GwQFSo6kv+Wy+Sa05Zo9
         5WilM5wFyV/iMetLxYHhz2lGuhfYA8kuxnUytTQFjXi3us+/FJHo1TVEeNsSkYtFb1xu
         eLq4SUObfOlfffZ1piafLvi6pqebbRcBahCUosR5oUFtcDqA6mUoUxZeGMOVI4DlMXTd
         Ee0mjvzgBsDgTwcci7UokPqzBXEGjz6GBmIPhzcQzT76XzwnF0VOLGtLXOKQ2rjj1R1M
         e1vessZYvOHfflupepJrM/sXuaS154zVp3f5TAZ35V8UN2w+KHY1r+NUR7LI3CAAnvZc
         lrGw==
X-Gm-Message-State: AJIora+hdSFijAp0hZemuh9Q5nWuSdk6gcPc7wXLEQMO3HbyPnghAUmy
	Gkbfm82YITk3LtIC1dJY79nCDPcBewTn/w==
X-Google-Smtp-Source: AGRyM1v1cuOzIzfwAqqlsPqAvQNbtY0Bd1x/u26N7cLKyrYwNtRHfSv79bcJpnH/SezGELGkZKgLTw==
X-Received: by 2002:a05:6402:348e:b0:435:a912:355f with SMTP id v14-20020a056402348e00b00435a912355fmr14693980edc.326.1656321385411;
        Mon, 27 Jun 2022 02:16:25 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id gy10-20020a170906f24a00b006f3ef214e2csm4805395ejb.146.2022.06.27.02.16.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jun 2022 02:16:25 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	nicolas.ferre@microchip.com,
	claudiu.beznea@microchip.com,
	linux-kernel@vger.kernel.org,
	peda@axentia.se,
	krzysztof.kozlowski@linaro.org,
	Arnd Bergmann <arnd@arndb.de>,
	krzysztof.kozlowski+dt@linaro.org,
	devicetree@vger.kernel.org,
	arm@kernel.org,
	alexandre.belloni@bootlin.com,
	robh+dt@kernel.org,
	olof@lixom.net
Subject: Re: (subset) [PATCH v3 38/40] ARM: dts: at91: align gpio-key node names with dtschema
Date: Mon, 27 Jun 2022 11:15:58 +0200
Message-Id: <165632135506.81841.18171336719863836193.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220616005333.18491-38-krzysztof.kozlowski@linaro.org>
References: <20220616005224.18391-1-krzysztof.kozlowski@linaro.org> <20220616005333.18491-38-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Wed, 15 Jun 2022 17:53:31 -0700, Krzysztof Kozlowski wrote:
> The node names should be generic and DT schema expects certain pattern
> (e.g. with key/button/switch).
> 
> 

Applied, thanks!

[38/40] ARM: dts: at91: align gpio-key node names with dtschema
        https://git.kernel.org/krzk/linux/c/17413b15ed9398e5d7f01f0da0da6043bb8392c7

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
