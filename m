Return-Path: <SRS0=sX7s=WX=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D8C3CCA47C
	for <soc@archiver.kernel.org>; Thu, 16 Jun 2022 20:47:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 84AD9C3411F; Thu, 16 Jun 2022 20:47:53 +0000 (UTC)
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id CEC97C341C5
	for <soc@kernel.org>; Thu, 16 Jun 2022 20:47:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org CEC97C341C5
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pj1-f46.google.com with SMTP id 73-20020a17090a0fcf00b001eaee69f600so2493946pjz.1
        for <soc@kernel.org>; Thu, 16 Jun 2022 13:47:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=HwpxIRU1YP5mS7rI722x2pEGkj9mnH3zkSIGF4XZfkw=;
        b=H+GEZ/oe8IQJ/JYfvS4J32+1xZWVlN42/Sof7T3f6SQnLjA4UioVEfZv2XNGnwY5ld
         HBCN2J06JdSnY66BOnK8GIig2rncTQDRrAtVkUq2BbKa4NNOMZiieuP50/5EOc+kwyyb
         E0ZWVFtJI9CMiTTztMqsbsijtJhKnG+JSAtnzLkIX16lVTd/5PEa9Y6fJNmkz6EzmxYK
         wAv5k8BoyAc9R7tNFWBaSjp/t1VCTwNE38E0i2LuTUZu7AjbpfbmzrYKKASxEahmNpRT
         2CW4GfcIH/sYLAKYWzb4nadM6fhpBUTEdbzhUuLnJ3mJLTzK1worzCc/Jbv4fmjfNCvd
         uUpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=HwpxIRU1YP5mS7rI722x2pEGkj9mnH3zkSIGF4XZfkw=;
        b=bWytLcDF8cUhjRXZJBiOGnMSi0vdDhn6hUhnBECy5/D9NX6AbQQSR48RLD4Rkd5S6x
         s9V//hYNvZ6OO4UhFdvEGGAv3lYHYranmHAXwqV0Z+HEcah+3M92jmc8boaL5xJWYCCZ
         yRAbLsaE6g1QgfcshrxGr/5YwC31v9E3B6n9DeuScWmomqcsiTqsdZb1wddtFjR+jcwN
         HmePDiQKleC5EYRua93MSVPcnHyll0HD4qKSn8PiaduloaDeRt3exoe3gbQmkkZJdXHO
         a7Pl94UOoJtT7Rk2MVVII8R1PRbvy5WV1lCBgt/L4ZIBp+zeV870XStKkC+oVylPE9kS
         XHbQ==
X-Gm-Message-State: AJIora/2XiSFd4Cu2m6hZhqPvP7inKo38V0zAzFVh5Cf4RFH9iRdLLu1
	Qo47NoapxlHPXQBawAVhqet/+A+cXjHs2Q==
X-Google-Smtp-Source: AGRyM1sr3digqWzsuQHcTLrp1uORT1LTuFJyjqrjB6rUq0i7WEUzZYw28ca4WoTNzfL00h0uYD102g==
X-Received: by 2002:a17:90b:1c86:b0:1ea:4ceb:2788 with SMTP id oo6-20020a17090b1c8600b001ea4ceb2788mr17942171pjb.16.1655412472175;
        Thu, 16 Jun 2022 13:47:52 -0700 (PDT)
Received: from krzk-bin.. ([192.77.111.2])
        by smtp.gmail.com with ESMTPSA id 203-20020a6218d4000000b0051ba0ee30cbsm2165453pfy.128.2022.06.16.13.47.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jun 2022 13:47:51 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org,
	Olof Johansson <olof@lixom.net>,
	arm@kernel.org,
	Chanho Min <chanho.min@lge.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Rob Herring <robh+dt@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	devicetree@vger.kernel.org
Subject: Re: (subset) [PATCH 5/5] arm64: dts: lg: adjust whitespace around '='
Date: Thu, 16 Jun 2022 13:47:12 -0700
Message-Id: <165541242280.9040.13928331829387540336.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220526204606.833054-5-krzysztof.kozlowski@linaro.org>
References: <20220526204606.833054-1-krzysztof.kozlowski@linaro.org> <20220526204606.833054-5-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Thu, 26 May 2022 22:46:06 +0200, Krzysztof Kozlowski wrote:
> Fix whitespace coding style: use single space instead of tabs or
> multiple spaces around '=' sign in property assignment.  No functional
> changes (same DTB).
> 
> 

Applied, thanks!

[5/5] arm64: dts: lg: adjust whitespace around '='
      https://git.kernel.org/krzk/linux/c/b88d11f84da6dd41dbbd4e20a889182aba634b95

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
