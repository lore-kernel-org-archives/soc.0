Return-Path: <SRS0=lBHs=XK=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04539C43334
	for <soc@archiver.kernel.org>; Tue,  5 Jul 2022 11:45:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id BCFD5C341CF; Tue,  5 Jul 2022 11:45:48 +0000 (UTC)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 3025CC341C7
	for <soc@kernel.org>; Tue,  5 Jul 2022 11:45:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 3025CC341C7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f45.google.com with SMTP id z25so2518378lfr.2
        for <soc@kernel.org>; Tue, 05 Jul 2022 04:45:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=r/4T324lD8keVZQ5PYxI+TWmPc+ll7mlIbj/tyFipEg=;
        b=URNJuoOpk11cwvlncuWTNnZWX81XgDdSq2sk4ggVSqyshGUOyttDiBZMAMrUZ53cdS
         UxEdb5yao8x82Cg67KkBx3UBW2EOZZwnfULw31Cb5x1mfD0LiE8DszQYOLDpI0djx6gx
         qGb+FfCvIeu17sB4bz3twfxNlnsuI0jkWr24PA38Lmyyb3Y2lszeV+ZVOekbRZRYxOYA
         /g5VVucsOKKGkttArP7gS0ROtvWAtTC3UghlCgsVbvNB8BXEaihcyZ6KEHR6dZa0OhmX
         w3uCjaYyUcDT71MZbTYAxiDn4Jux2e1iVVgp+ZOl35ENoD8WBqUOZPoj64XKEL5apYgs
         zy3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=r/4T324lD8keVZQ5PYxI+TWmPc+ll7mlIbj/tyFipEg=;
        b=DXPQl7hlQ3Gf1NG2y9aKMRfGwNN1n3S/C35JuObhtVmXXFmNpHltiCOhswpnRDlnEj
         hUjCkh0/8Odv/usXlT0CwXUbVytrobIGUz2GMgafxXQSdfzVx4wpX3n9IyY1p5medRyI
         9WkGg0HXIUOR/DBY71j+4KBlpApqUouGdERFd2SrMWIxh0sSBNAt6cTRyceJE/FDFegO
         fjZxh7fPF5MPWtYSNVdZQ2svJTT3UGMzNPd2V6G6PrXND9Q8VmMVE7OZe40rU4tEs7k4
         EnjcU6Ni6zwP0j22QKbg4KAGeMjMH9X8lgx1TRhvUr4JuC9af3DcG/MDPh7GXLQzdpOn
         KH4Q==
X-Gm-Message-State: AJIora/4gCb8VZ9aYj79/eA+2CxnIQ94Iqjsc+12Q8QzBKNIHipWsFl+
	guuaRDsCv0S/1SREIb9WmvHmmg==
X-Google-Smtp-Source: AGRyM1t2xrKflh6+ZDUqgZrUw23+6BNtmn1uXO9uRraUJ8CvQFIBVL3fJqJJsi41XYxhjs43M9wogw==
X-Received: by 2002:ac2:4c56:0:b0:481:16b8:637c with SMTP id o22-20020ac24c56000000b0048116b8637cmr22631447lfk.87.1657021545341;
        Tue, 05 Jul 2022 04:45:45 -0700 (PDT)
Received: from krzk-bin.home ([84.20.121.239])
        by smtp.gmail.com with ESMTPSA id a12-20020a056512374c00b0048137a6486bsm3543694lfs.228.2022.07.05.04.45.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Jul 2022 04:45:44 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
To: olof@lixom.net,
	krzysztof.kozlowski@linaro.org,
	arm@kernel.org,
	andrew@aj.id.au,
	soc@kernel.org,
	joel@jms.id.au,
	Arnd Bergmann <arnd@arndb.de>,
	linux-kernel@vger.kernel.org,
	robh+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	krzysztof.kozlowski+dt@linaro.org,
	devicetree@vger.kernel.org
Subject: Re: (subset) [PATCH v3 36/40] ARM: dts: aspeed: align gpio-key node names with dtschema
Date: Tue,  5 Jul 2022 13:45:42 +0200
Message-Id: <165702154046.92998.7201310803196878513.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220616005333.18491-36-krzysztof.kozlowski@linaro.org>
References: <20220616005224.18391-1-krzysztof.kozlowski@linaro.org> <20220616005333.18491-36-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Wed, 15 Jun 2022 17:53:29 -0700, Krzysztof Kozlowski wrote:
> The node names should be generic and DT schema expects certain pattern
> (e.g. with key/button/switch).
> 
> 

Applied, thanks!

[36/40] ARM: dts: aspeed: align gpio-key node names with dtschema
        https://git.kernel.org/krzk/linux/c/7bd809eee4290ae7277f4fb20f270fcedd74737b

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
