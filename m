Return-Path: <SRS0=5Cdg=W3=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1747AC433EF
	for <soc@archiver.kernel.org>; Mon, 20 Jun 2022 11:14:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 00E52C3411C; Mon, 20 Jun 2022 11:14:44 +0000 (UTC)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 4F4B4C3411B
	for <soc@kernel.org>; Mon, 20 Jun 2022 11:14:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 4F4B4C3411B
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f51.google.com with SMTP id me5so20415797ejb.2
        for <soc@kernel.org>; Mon, 20 Jun 2022 04:14:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=r1VUPW8HeQuAus0WR/qhUKBR3nAc6jn8bNOOeAD1qP8=;
        b=L1yo1JH/rvcvHc/Jbcu20cw3a/qNdXrtoauJZcUZ3IGQ94HyicsrikmMoh5BfIsq6c
         fwYLf2+/k3VJErueXETFvnMvxL4p7EFOEfAdYBPP4AWLyNXcWdstxzRlstQEqc3WgfVd
         TuLEhqh42z9V14I+bq7f9TYvvLmTidmPAGIyOB/8YjH7IZb+8kinjQ57yfjI6xXtVWln
         /HkXyN/HCcVOz8HPImnAmRGsxnizPXBtY4t6rpl2K9AC7uMTb4giLJrAZrUPnnwxOSeS
         AhYpn4K+FY3J75Q6wpKdunHYFkteZ0gLMaX1zgLAS+nc/05jmYMi85TyaU6UEKGBDjdB
         uMUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=r1VUPW8HeQuAus0WR/qhUKBR3nAc6jn8bNOOeAD1qP8=;
        b=QW6xb0sjBf0FK2EUR+1lmK/6FO8LUTckrcj90Kp4jslLS1BWHuw0sJKz4Zx3eg7D1b
         Ghv5bDMXH+Nbl5g6XFWslDgHkgtjaWAKMA0u5UkTMAGTTXgqR+Jo5eFKx4E+rnHkqxGN
         YzPLcn3tF860VcWQaTpxIGTPyu+AjkhN+r70mlarMzbtm9gZsvB14TcsVTakT8DWvm65
         y5rc2pG2OZSz2fpUt6sjTSrmhBiH/KEkI0LAyPZfAna0c+zL9YJDDBH6xwJX187PD1/1
         ABniAnAyEGljKa3oFjhdFYCPyB8nYF8v2eztsEg5vaI4T6AQf5SbgHlvcTwJukbwC8/S
         9tkA==
X-Gm-Message-State: AJIora/KxDIvu/XLyK+piNRD7YfWacc0ttO5Tq/7KnCEXrq6FtgGO1c3
	xKlrEQ1Bir1vZt7XqSahyNYWKQ==
X-Google-Smtp-Source: AGRyM1vlUrmNMDAT29z9DBns/Ohr0A7Gxvoprpz+ikUzMDSCm3GF3UoXp8wjIkfC6RfnJLvlZNe3eQ==
X-Received: by 2002:a17:906:824a:b0:70f:4c58:6ec6 with SMTP id f10-20020a170906824a00b0070f4c586ec6mr20480020ejx.648.1655723681574;
        Mon, 20 Jun 2022 04:14:41 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id c26-20020a170906171a00b006fed9a0eb17sm5699969eje.187.2022.06.20.04.14.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jun 2022 04:14:40 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	linux-kernel@vger.kernel.org,
	Olof Johansson <olof@lixom.net>,
	Rob Herring <robh+dt@kernel.org>,
	Wei Xu <xuwei5@hisilicon.com>,
	soc@kernel.org
Subject: Re: (subset) [PATCH v3 09/40] arm64: dts: hisilicon: align gpio-key node names with dtschema
Date: Mon, 20 Jun 2022 13:14:32 +0200
Message-Id: <165572367262.35195.16654742647500367074.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220616005333.18491-9-krzysztof.kozlowski@linaro.org>
References: <20220616005224.18391-1-krzysztof.kozlowski@linaro.org> <20220616005333.18491-9-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Wed, 15 Jun 2022 17:53:02 -0700, Krzysztof Kozlowski wrote:
> The node names should be generic and DT schema expects certain pattern
> (e.g. with key/button/switch).
> 
> 

Applied, thanks!

[09/40] arm64: dts: hisilicon: align gpio-key node names with dtschema
        https://git.kernel.org/krzk/linux/c/111b4da2c2fc2551ecfe466616089e1223dc7ac1

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
