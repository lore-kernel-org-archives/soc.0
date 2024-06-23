Return-Path: <SRS0=/6xr=NZ=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8590AC27C4F
	for <soc@archiver.kernel.org>; Sun, 23 Jun 2024 12:22:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 6B584C4AF0E; Sun, 23 Jun 2024 12:22:38 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 1ADE4C32782
	for <soc@kernel.org>; Sun, 23 Jun 2024 12:22:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 1ADE4C32782
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4217990f8baso30647415e9.2
        for <soc@kernel.org>; Sun, 23 Jun 2024 05:22:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719145355; x=1719750155; darn=kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fOMrIEL0MhxUAR/0v8yW1hxKjvgmHLLdsBRgChDfOiE=;
        b=wmsS/xLDCT09M+M1dpj7Kq5u3/8MqKojp+Y1pashi4XEHI0/5k8iFcoI5B74mIczqT
         aIF6WARpvq2T+yHjQcHCPRLtORup/I7TREUzy2XCN0pE91O+RVzuJgS2yFjJwL3P1FBW
         2zVhFEBLGpTdvo4UwH6u5gvFmCX6h56E3u9YIO50lTDQaVFK9cDbdF74zu/jOfPXdE/1
         /1o0KkR1/m+6LILi0OoMMCwzu+3NEqYCfktTWxqDWOCN5TFsnI5/g8cFGRkHru1ubGql
         VI3YFRlahlSgISptZ1nTT4LUCq4GZFyYAGI4xypuk8h4Ae2APzBMHS/5+K+ckGcYpC7X
         l0Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719145355; x=1719750155;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fOMrIEL0MhxUAR/0v8yW1hxKjvgmHLLdsBRgChDfOiE=;
        b=f1ysRphED4bOe+tmw6IgIOw291kgfZUcCX07ZVrKSoowFVcCAx40ty+vph3E6AdLCY
         o/NxyWz+IcJVPzb2ziSA3JA8xCc/FaVzJYpBlr8omEy6VSwVm7mvzusPziYTikFWQL87
         ve+Nu9BXgznQzqG4A8oA0vJI9phaFC1KBtRsrwz4/iivupEJ4dRqMBUi4sjvfrjhKrwU
         342sSu6Al+RHOZjlmCwjH2t4IbnMZh1G+gYZ+nmC6X9ehojD7lJy1HkexHBQ6Pq8VCvD
         UjZkJPH2xG7P64Ov9ER1C35v7aU5EnWpVCU+xSgF1SrpkggyBx4c1UQcUA5CwV+KmBWo
         Ecsg==
X-Forwarded-Encrypted: i=1; AJvYcCXvxzrUnnajpqYRPXlT5sAnUvZKYKK74DMzHcimbcpQy66LSaIwBQxkGCkB3eV0USyj1MZVLYH3alm24JvBWQ==
X-Gm-Message-State: AOJu0Yx4BRPEt3ZLv2lnRTNFf9LTbw5ZjmhKcE7L5bzQe1vRqM07FQXu
	oiQYPtJMVjDmWq+LvEoCaodHjz5bPCcPYFacjAxF7UoWnHranonDA156hYtXK3X132BncGJlqag
	a
X-Google-Smtp-Source: AGHT+IEvE94OtsFZofxgbIqys2D0deVC/6lNHjtWLqKY/YBn8di6oHuMsYKyljgRWyW0hjDE/F8OwA==
X-Received: by 2002:a05:600c:4853:b0:422:6765:2726 with SMTP id 5b1f17b1804b1-4248b9cb18dmr16494685e9.30.1719145355013;
        Sun, 23 Jun 2024 05:22:35 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4247d0be841sm136955455e9.20.2024.06.23.05.22.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Jun 2024 05:22:34 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
To: Alexey Charkov <alchark@gmail.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, arm@kernel.org, 
 soc@kernel.org, Arnd Bergmann <arnd@arndb.de>, 
 Olof Johansson <olof@lixom.net>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20240613064612.8589-1-krzysztof.kozlowski@linaro.org>
References: <20240613064612.8589-1-krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v2] MAINTAINERS: ARM: vt8500: add Alexey and Krzysztof
 as maintainers
Message-Id: <171914535352.46985.112856994022791159.b4-ty@linaro.org>
Date: Sun, 23 Jun 2024 14:22:33 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0


On Thu, 13 Jun 2024 08:46:12 +0200, Krzysztof Kozlowski wrote:
> The ARM VIA/WonderMedia VT8500 platform became orphaned in
> commit 8f1b7ba55c61 ("MAINTAINERS: ARM/VT8500, remove defunct e-mail")
> and clearly it is on the way out of the kernel.  However few folks send
> patches to it and it is nice to actually take them, till the platform is
> in the kernel.
> 
> Alexey Charkov still has VT8500 hardware and plans to work on upstream,
> so add Alexey as the maintainer.  Krzysztof will collect patches.
> 
> [...]

Applied, thanks!

[1/1] MAINTAINERS: ARM: vt8500: add Alexey and Krzysztof as maintainers
      https://git.kernel.org/krzk/linux-dt/c/084e77a12c3a1c255ea0e944e9d77d21c9d2247d

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

