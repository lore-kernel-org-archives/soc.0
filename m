Return-Path: <SRS0=LbBh=XI=linaro.org=bjorn.andersson@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCA2CC433EF
	for <soc@archiver.kernel.org>; Sun,  3 Jul 2022 03:57:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id A4121C341CA; Sun,  3 Jul 2022 03:57:25 +0000 (UTC)
Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com [209.85.160.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 11BFAC341CF
	for <soc@kernel.org>; Sun,  3 Jul 2022 03:57:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 11BFAC341CF
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-10be7325c29so1566225fac.0
        for <soc@kernel.org>; Sat, 02 Jul 2022 20:57:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=xRhocNAhDvGNwbuuItnMrHDN2U1jOPRZlUplDvj9+fU=;
        b=B0FoFz3STbRhR+wfQKhQb8u6UNKQJDH2biXHjVyUR/rRXMJ5I4iNhaX6kA6vZu3T5u
         K1dQeJaTrdP7RB8ND4hzSw2gYvwC38RSeYCFywKeAI1G57dC9OsQZ41Hj+85ngxgu0Qp
         bKB92vtCe5+PANT8coIZnFQPSaoYIFyDYe5uO2LutofJ3TXE8HzSZ6ODQ4EisIWQDN2+
         Z9pJkdkahu4XjCIGlQTeE2GSpZeg6y0Xt3FWRQydpFNOzY3pzpVOjtFe05vs269L5lyn
         qT8Hr7BBBjg8XE834ETA3O18cUhYAugFAzKW+DfSxRRoI+YmMtjzpJ10GsEdts74S4+Y
         d7PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=xRhocNAhDvGNwbuuItnMrHDN2U1jOPRZlUplDvj9+fU=;
        b=k3AngrktleDs/p6qfBeyNJEoudueL4EzXgHaZufOGOWczaKCYUIbS0LcwHariz3t91
         aS72JruonOCY6sCALgdKhzc1phoQiQqgvgORZ/2wQyKG5z5j2hQkPYfpmnCvpcF/BrRR
         XutzLMQ43TJk8I/ZqxNDWOWrCFVGnsOcrGz3OUa3ne8AZggjPhKrOJBhJ42nazO4kk6r
         JsoCnutCedigl/beFt+iGUmOVtpgaIdLsXF0uNyxqzVEcP3aYPjaPgq9UZKJoMi/sXhQ
         Ez3njELJOjWOhY8IcOHzcAQe6bIm4bHEXXypAQEDaHzs0V7UVZd3IWNA0JdBSJ4YgNxy
         obeQ==
X-Gm-Message-State: AJIora8VPC+/fS1pu1BqmFmgYD2I9bEITMTmW7T4XHZEwZdK/A+UI/Cz
	Dp8sf/0HWTjK1aT9WrnX1lIdWw==
X-Google-Smtp-Source: AGRyM1tzVHnXpUJwG3aHQGPDqY5g2l++X28JpJtExJQqRsISoTpveNiU5IL99YxtxfDYg2m/kjPLJA==
X-Received: by 2002:a05:6870:d6a3:b0:10b:df7d:8243 with SMTP id z35-20020a056870d6a300b0010bdf7d8243mr2077326oap.68.1656820644160;
        Sat, 02 Jul 2022 20:57:24 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id 25-20020aca0f19000000b0032e5d0b5d5fsm12965910oip.58.2022.07.02.20.57.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Jul 2022 20:57:23 -0700 (PDT)
From: Bjorn Andersson <bjorn.andersson@linaro.org>
List-Id: <soc.lore.kernel.org>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Andy Gross <agross@kernel.org>,
	linux-kernel@vger.kernel.org,
	Olof Johansson <olof@lixom.net>,
	devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	soc@kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	arm@kernel.org
Subject: Re: (subset) [PATCH 1/2] arm64: dts: qcom: adjust whitespace around '='
Date: Sat,  2 Jul 2022 22:56:20 -0500
Message-Id: <165682055968.445910.11189872964487810084.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220526204248.832139-1-krzysztof.kozlowski@linaro.org>
References: <20220526204248.832139-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Thu, 26 May 2022 22:42:47 +0200, Krzysztof Kozlowski wrote:
> Fix whitespace coding style: use single space instead of tabs or
> multiple spaces around '=' sign in property assignment.  No functional
> changes (same DTB).
> 
> 

Applied, thanks!

[1/2] arm64: dts: qcom: adjust whitespace around '='
      commit: 372cf591acbca3bd9a729742ea4c81d7f99f1b6e

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>
