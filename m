Return-Path: <SRS0=sX7s=WX=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCFE4C43334
	for <soc@archiver.kernel.org>; Thu, 16 Jun 2022 20:47:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id B3B59C3411F; Thu, 16 Jun 2022 20:47:52 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id E05A0C341C5
	for <soc@kernel.org>; Thu, 16 Jun 2022 20:47:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org E05A0C341C5
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f174.google.com with SMTP id t2so2191009pld.4
        for <soc@kernel.org>; Thu, 16 Jun 2022 13:47:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=yUT12NimfSVxM1vXKEVoh3l1sSHT4i0/7W+Lzsy3qfU=;
        b=jAjhIgCqZS0WdZhuO5o8Wv8KaZh3USMck9BM9t0zeFoDE+7PJj+335s0L+SjMAtHct
         cRTA9U6KYYJ2HqIQyuADAfBnbeIHv7ZL0nKY8G31R6Uja6fKosCqAzWQlRVbPCLd0R2n
         L5CsjA76V7Dj8jlz740Nf6CggZNRG/XyRWZG5Wu2ErDJ+ccSKrASnlVL4huYSYQ/y3LV
         8RUiOHKdrGg+dOIQwe30hlspE+WW9wn1UfcFzDfVzA3/Fa0ywD3f7cxOIuG28EgKar9M
         iSedGHkdYP8IojJoAzkxNjzh67DowLc4QPIt1kpoakJ8BcF5U1Eq8J4VcEvNaTXIViEx
         W6QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=yUT12NimfSVxM1vXKEVoh3l1sSHT4i0/7W+Lzsy3qfU=;
        b=p31J2XE98sq28CPHw+nAAJQ7f2FXuXGSQdhyu1e8gAeeLDnuFwCh5SHvdwso6V4WGr
         N+Ufbt6NpZiXDbDxdlVfZpF2zVaBn3FrEANXOh2vI1iC19o4XEppz8gqysYjmtyr0hlT
         kkMRUhvOvkZyfSFK0+c9h73qFfRz4m4XzOcmf8hwtx8iQDVjh2Q4VmslnZRNz8i2vYNS
         Y4SJvuus/+T3iPDYf6uSEKzLbDIPo2bOH2LvMg8+byTfpT9bIRKFJMKki7TNo8INwBFP
         OpemzaQ2iK1JDfSr4JN2JdzDmXi/FAfYZd/7EfvhKG+DYNd6NP2/ykzqqn0AFGRjm4gX
         VZ2Q==
X-Gm-Message-State: AJIora+H9EL+zm3NpnbkGn6KkmFapsX/AnvxsC6zqyTRJ8sFVVt1oaPH
	ZG3SO8dOYEDIK1Pc9HrTEM9KLg==
X-Google-Smtp-Source: AGRyM1vGMUJykCffSieo+KG9Kp9I4qtTDoyFIcjZuSRpxKr47F2zSqYhefxpprMNRLzX4BnlSHeSMg==
X-Received: by 2002:a17:903:40c4:b0:163:df09:904e with SMTP id t4-20020a17090340c400b00163df09904emr6234179pld.155.1655412471343;
        Thu, 16 Jun 2022 13:47:51 -0700 (PDT)
Received: from krzk-bin.. ([192.77.111.2])
        by smtp.gmail.com with ESMTPSA id 203-20020a6218d4000000b0051ba0ee30cbsm2165453pfy.128.2022.06.16.13.47.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jun 2022 13:47:51 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
To: Khuong Dinh <khuong@os.amperecomputing.com>,
	Olof Johansson <olof@lixom.net>,
	soc@kernel.org,
	arm@kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Rob Herring <robh+dt@kernel.org>,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	devicetree@vger.kernel.org
Subject: Re: (subset) [PATCH 3/5] arm64: dts: apm: adjust whitespace around '='
Date: Thu, 16 Jun 2022 13:47:11 -0700
Message-Id: <165541242280.9040.8399919480828171223.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220526204606.833054-3-krzysztof.kozlowski@linaro.org>
References: <20220526204606.833054-1-krzysztof.kozlowski@linaro.org> <20220526204606.833054-3-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Thu, 26 May 2022 22:46:04 +0200, Krzysztof Kozlowski wrote:
> Fix whitespace coding style: use single space instead of tabs or
> multiple spaces around '=' sign in property assignment.  No functional
> changes (same DTB).
> 
> 

Applied, thanks!

[3/5] arm64: dts: apm: adjust whitespace around '='
      https://git.kernel.org/krzk/linux/c/d57cc3b903db4524c556325008071a7223690083

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
