Return-Path: <SRS0=17+H=XC=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35249CCA473
	for <soc@archiver.kernel.org>; Mon, 27 Jun 2022 09:16:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 21C6FC341CB; Mon, 27 Jun 2022 09:16:29 +0000 (UTC)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 8541BC341C7
	for <soc@kernel.org>; Mon, 27 Jun 2022 09:16:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 8541BC341C7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f48.google.com with SMTP id fd6so12044186edb.5
        for <soc@kernel.org>; Mon, 27 Jun 2022 02:16:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=4yCp6aTXqUcXVsV0Np3Dwjlcr0jYRXR8pM5bj50a/ow=;
        b=A/AH+rqyBgloYrW3r5UfZDex8wxiYwvMlaBdRYE7DqkFvHJv1lz7pOR/uEcpmNDf9l
         zoKpIHNYtN3yFJ228uMZNAnlykPHvFa+gNngWSmW2m3U5tHGDjyFU4fCRgLVZzCX+7v7
         iR6YiT2ta/zahwUpgsriaTIUU8CowWzLoEqU2tRQxCpf26W4PdbMuwSkSY+07eDKgS1Y
         CFBaeepxTVduRlMysqV8xzkmf0E/oeTQ5QJ5f3Q3Kdyq/jkfsZTJsuuge1K+u3xnN+wo
         us/25Le2kjU2H/YI3g0DTEVpCEu+hydMJ5uDE9vI5MBrlPKjTo7RU45fA4UjsxPspsU3
         xwKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=4yCp6aTXqUcXVsV0Np3Dwjlcr0jYRXR8pM5bj50a/ow=;
        b=7bbqHiTJUTZGqdK9Rb0OyAS5Y5Q4Admr3VWGxemsbg2FuY6SgDdGi29g2vPIBq82wv
         10X+X0i6vfE2zvzV3CSr6nv6NNRKN41mBvK//6ksEuJFH5FgyakSu0FiPbyhKnTE2FnH
         zJZvVWI5XE+v4cP/6B+m1xC87Mp9b3u0MW6YUUWoaYoI8eh0luiB/j2zh0biW4QXVCmj
         rxrI3Fdf4hcYn6pNcnOS1mOazuucfgkpU6ErO1YJo/tWQPzjr0HfIc0Ij5gnbEV5rS0k
         aNqFs13qkvPU1oa8KIZndlNaa4OZw+66K4u2lvQEtKixig2UGD6OzbKEbBpwrWtq2c6H
         aCzQ==
X-Gm-Message-State: AJIora/teCWA9dqTd3QaPvYg2G2SW2nqXFMTGXq+/kJ4t+EBrwVLm/2G
	sgRguS8a8CAMaATdtoN+hK+g1pdeRQ9I7w==
X-Google-Smtp-Source: AGRyM1tGxNBHWOJWILt1IIISQWZABMsK2JgKp45IPF/kZntw7pMPmbIgZBPos3nCiw1YiVXFdIO6Nw==
X-Received: by 2002:a05:6402:2549:b0:437:788d:b363 with SMTP id l9-20020a056402254900b00437788db363mr10845669edb.406.1656321387840;
        Mon, 27 Jun 2022 02:16:27 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id gy10-20020a170906f24a00b006f3ef214e2csm4805395ejb.146.2022.06.27.02.16.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jun 2022 02:16:27 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	nicolas.ferre@microchip.com,
	claudiu.beznea@microchip.com,
	linux-kernel@vger.kernel.org,
	krzysztof.kozlowski@linaro.org,
	Arnd Bergmann <arnd@arndb.de>,
	krzysztof.kozlowski+dt@linaro.org,
	devicetree@vger.kernel.org,
	arm@kernel.org,
	alexandre.belloni@bootlin.com,
	robh+dt@kernel.org,
	olof@lixom.net
Subject: Re: (subset) [PATCH v3 40/40] ARM: dts: at91: drop unneeded status from gpio-keys
Date: Mon, 27 Jun 2022 11:16:00 +0200
Message-Id: <165632135506.81841.16359602083216967103.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220616005333.18491-40-krzysztof.kozlowski@linaro.org>
References: <20220616005224.18391-1-krzysztof.kozlowski@linaro.org> <20220616005333.18491-40-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Wed, 15 Jun 2022 17:53:33 -0700, Krzysztof Kozlowski wrote:
> Nodes do not need explicit status=okay.
> 
> 

Applied, thanks!

[40/40] ARM: dts: at91: drop unneeded status from gpio-keys
        https://git.kernel.org/krzk/linux/c/592feeea113553be142680a25a9c0850daae3567

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
