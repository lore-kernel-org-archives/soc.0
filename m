Return-Path: <SRS0=/6xr=NZ=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3AF1C2BBCA
	for <soc@archiver.kernel.org>; Sun, 23 Jun 2024 12:22:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 76DA5C32782; Sun, 23 Jun 2024 12:22:36 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 7AEC2C4AF09
	for <soc@kernel.org>; Sun, 23 Jun 2024 12:22:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 7AEC2C4AF09
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-421d32fda86so38216905e9.0
        for <soc@kernel.org>; Sun, 23 Jun 2024 05:22:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719145353; x=1719750153; darn=kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uCngDWXR5xLT7dNGS6wKeQXz34zWbBoZqNqT6a3rtyM=;
        b=xW11UuFexU5HkXKkcCu4Imbas0h6Mf5HTVPM/cxFKSfYSlFV5BUEYCjasgBE+cMkXb
         tKhCogevnlvtTLROC/fQ8Z813YB4zL7G4TwLnrz9fax7WryDhiwJNPG3Dsy3LAkgbxdm
         5HRdmpzAfEjutP2v5iKLhkM2soy9hgWbNeCMqPBasGTmoxmZ/U1ykmsyAnC5vxLpy6i6
         BHMRh37Zrgl3bF5M23xd87RpwRH6gl/GIF8R3cFMDOQMwBRjMXZ33ResGdFXEfAnlecS
         PRZKXgzJlEprbP2aIkufpynu6Ld/QjuhrOQGVeSxgZpdtGyQZIjKGv6zVYRRq2srwiC+
         QfPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719145353; x=1719750153;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uCngDWXR5xLT7dNGS6wKeQXz34zWbBoZqNqT6a3rtyM=;
        b=Mo3eGgSN8PYbiIFxW8LCM1YnYtBJx/VG47k60IHInk/qsKaQwuTaGtv4mCqMee2mV2
         5GXN+SnmUY8xL0jccDmq+c9FwpGwwS1gHahGEPIBIl3Y9ltvz/eiWaJo5IvcE+kkYvV8
         EW+m0Z0nPsHDqeXqlx5jROz4IPbKiBDyLr8JO3p3pKASkIjOq09+YDJlGq0wrwLKhSCv
         bsMmOv//pf70bVn8KKVbbBY3uf+Cr5CpsWFj/FZi30JPuZ7fsSaVkZVG0SLnxxyOrpGE
         OAWLi5FWT0FU9MDxp71U0Grrrc5nL2+LJePqt0fcDpC7JcSjCnj6CNVfzt1Gw+kMMVdF
         9H2Q==
X-Forwarded-Encrypted: i=1; AJvYcCVIQUiKyraepbAUkOnuR1RaMCWp/XyHDk5ECDZYyM4qDneVWWnraEB1FJOntbkqTnX6uog3tqEqhzYXNmMsWA==
X-Gm-Message-State: AOJu0YzJGh9wxiFnLtaA5LgDd3rm+HdQbVd3xU3GnMrhffLTt45kodNZ
	u4e7ANMR2HPFK3SGZt4KSbg8E+XZ3WvugsClJ+ZZ0aQT1z+haSQ1OEc0kokacKOg/9o7hLIXtBI
	u
X-Google-Smtp-Source: AGHT+IG1ajDJwHzlbEYhg6OIEi3VvA/YKrK5c/OvtnDMI+KP/GPDROApZPX+ndF9eQ6DUcTbb2FxCg==
X-Received: by 2002:a05:600c:3146:b0:422:6755:17de with SMTP id 5b1f17b1804b1-4248cc73dd6mr18288105e9.41.1719145353394;
        Sun, 23 Jun 2024 05:22:33 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4247d0be841sm136955455e9.20.2024.06.23.05.22.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Jun 2024 05:22:32 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org, soc@kernel.org, Arnd Bergmann <arnd@arndb.de>, 
 Olof Johansson <olof@lixom.net>, Krzysztof Kozlowski <krzk@kernel.org>, 
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20240613134910.7862-1-krzysztof.kozlowski@linaro.org>
References: <20240613134910.7862-1-krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH] MAINTAINERS: ARM: axm: add Krzysztof Kozlowski as
 maintainer
Message-Id: <171914535207.46985.16943803331169294823.b4-ty@linaro.org>
Date: Sun, 23 Jun 2024 14:22:32 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0


On Thu, 13 Jun 2024 15:49:10 +0200, Krzysztof Kozlowski wrote:
> There is no maintainers entry for the ARM LSI AXM SoC, thus patches end
> up nowhere.  Add such entry, because even if platform is orphaned and on
> its way out of the kernel, it is nice to take patches if someone sends
> something.
> 
> I do not plan to actively support/maintain AXM but I can take odd fixes
> now and then.
> 
> [...]

Applied, thanks!

[1/1] MAINTAINERS: ARM: axm: add Krzysztof Kozlowski as maintainer
      https://git.kernel.org/krzk/linux-dt/c/296c0bb50e31f9077c391e57bf43f3e23a73835e

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

