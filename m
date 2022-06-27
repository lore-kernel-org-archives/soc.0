Return-Path: <SRS0=17+H=XC=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5AADCCA483
	for <soc@archiver.kernel.org>; Mon, 27 Jun 2022 09:16:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id D020EC341CE; Mon, 27 Jun 2022 09:16:14 +0000 (UTC)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 01204C341CB
	for <soc@kernel.org>; Mon, 27 Jun 2022 09:16:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 01204C341CB
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f50.google.com with SMTP id o10so12075124edi.1
        for <soc@kernel.org>; Mon, 27 Jun 2022 02:16:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=8AGcZ+2eVzx8CQxwRFiOnjpZff3Qrmt80tq4f3m10qA=;
        b=EY/FsAZ9MUqu2tmQKlrqeL3MQtb2qow9UjGy1oQFy8Ta6/pKLVDbLWlmTHHd95AjkL
         Cdg0ah3rIYh43TJ+gAD77PcoH5lx2rltLT3rN30TRcIoCwz+HRC6Oj0lhGTjm1sfJjw7
         ffjJjtHr5+1Cv3JduMVi5Zxy7Mp+Q4j1d/iA3btcPuJ5oKsfTtOEcFof2aUXP5DxCYGs
         hRcbf//f1v7Lsr0U3tSL0qtLmsBesAVhhY2Gog4mOVs3HLRYYSbYs/cH1uIbhklNnMIn
         WmT8AMjh+D/HIsCDlexjRJTBEGYFl1ZEB3YAOoRxbO2LT8v62XF7+p2mSMyYb3C0aHd0
         +Alw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=8AGcZ+2eVzx8CQxwRFiOnjpZff3Qrmt80tq4f3m10qA=;
        b=A5mbNhUixlpQi/QzzwzvLwtHFxRxSu1N8SgJWw5fdsvF5C/UAITbPTJmyAuqZC2erH
         AlN7vWh25WmcAcOXFzv/4CaS1Ir7HxcMtT6JzPHw3WQ14OxrbLDt40xl74Li3qyuW5Aq
         MLtXyCj8rYZGK8/WgMfJyY6ce26wNNLoJtfyxHnPNZgLzYCIE7cfiXHjWn3IAUDHK4aC
         KoU/nyQ2KLbPfBgzu7ucnYHitOD8xoSmoxkyGRmzFaqE4PTB7nzkzEyD+1NJriYSvzsi
         u04GhQpgnAPhTiEib6nhhqW+SWFqBmUN+z4FrXpb14qYD1yQOT8Nj/Yd+pMEnhdy/EOZ
         R8Nw==
X-Gm-Message-State: AJIora9Ujmb2umxUKSD9JE3yPrw7FTJmEI6MJ0vbqCp8hqZMlQZRVdic
	w/wqrlpzgYntGhYzbtxPLKHtYw==
X-Google-Smtp-Source: AGRyM1vwOzRQhpL/5CfLml8f3UY+LuxdyTcYTCwppkE/+TVpqVtwXJLrxAGV0NEPNB+mvswe6ACKJA==
X-Received: by 2002:a05:6402:1941:b0:435:5972:7811 with SMTP id f1-20020a056402194100b0043559727811mr15053978edz.234.1656321372321;
        Mon, 27 Jun 2022 02:16:12 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id gy10-20020a170906f24a00b006f3ef214e2csm4805395ejb.146.2022.06.27.02.16.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jun 2022 02:16:11 -0700 (PDT)
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
Subject: Re: (subset) [PATCH v3 11/40] arm64: dts: marvell: align gpio-key node names with dtschema
Date: Mon, 27 Jun 2022 11:15:47 +0200
Message-Id: <165632135505.81841.15489151456935534847.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220616005333.18491-11-krzysztof.kozlowski@linaro.org>
References: <20220616005224.18391-1-krzysztof.kozlowski@linaro.org> <20220616005333.18491-11-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Wed, 15 Jun 2022 17:53:04 -0700, Krzysztof Kozlowski wrote:
> The node names should be generic and DT schema expects certain pattern
> (e.g. with key/button/switch).
> 
> 

Applied, thanks!

[11/40] arm64: dts: marvell: align gpio-key node names with dtschema
        https://git.kernel.org/krzk/linux/c/ebb8ba54950a1c6382647e573ab597e2b7b4af1b

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
