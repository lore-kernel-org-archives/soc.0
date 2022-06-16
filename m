Return-Path: <SRS0=sX7s=WX=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 317E7C43334
	for <soc@archiver.kernel.org>; Thu, 16 Jun 2022 20:47:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 163FFC34114; Thu, 16 Jun 2022 20:47:55 +0000 (UTC)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 43A75C341C0
	for <soc@kernel.org>; Thu, 16 Jun 2022 20:47:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 43A75C341C0
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pj1-f49.google.com with SMTP id hv24-20020a17090ae41800b001e33eebdb5dso6186476pjb.0
        for <soc@kernel.org>; Thu, 16 Jun 2022 13:47:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=5v2GHFZcfC7tWGp0/Up8UArokJ3Id1eqwbB/UFI3a+A=;
        b=IOYT59dHwTZZhf0BQH52cFoBw+SOqpWmEOWSg0X9Xcp2U8KaHYAGpnVq2wuvPyNuAj
         QnL+trAcPJUFxMduhexzpqzS3MJwf9bUi2T3Ck0GlC7nKkKe3lmbpqn5brxcCcL9i25K
         D7fQpG/8GOGEH1c6VOn9oMKY6tv7impuLR/7tW/RQiE4t0YyF4fdFApa3EAeYNfVdVVp
         hAbDjBEZd0+i1pJjnLKhelk7EZi4EzuVqk5sVHp1LX41SLiWosNIEKSFwmKag8iyAG8g
         Efhd/sB67PRE8EfuCA+qMz4PxMWzj7ngTpmFkKqQ/S5eNojA0EW3MsZMV8TRT/TyGK8v
         vqcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=5v2GHFZcfC7tWGp0/Up8UArokJ3Id1eqwbB/UFI3a+A=;
        b=rh2WjzGtaK6EhBmJnBISywip49Kew/PFCSVqKsIUnM1046mBbQjxYP536uJi0wMF77
         cvMemUSkbPWMHtOwzqOMzHBaefOu2nwvvl9YJQOlxXEWmBWHU438fJTdzk6WSxAT5EYq
         56x1g7bWk19ztFnKTjD6FUmWRKR/el4ZdsDmdgW+EEcV0HG5Gi4ton/znWe4Asbyczry
         xfYoeWq5aHA6a8loOAmowqgeqWMbUapVmKkG91hHC4oN2Eo2LvbuzKScPhMyO6QDp6bS
         RjC7e5ApbYCpjZRzBgx6jMYh3iHaqImlpqQkppMvv7iaGtiM23KTv516/NSQEK/O1d2O
         0mKQ==
X-Gm-Message-State: AJIora/8il25FenLHkMmKRYqvUTRHk+gdn67eT4ehtX1dkiiT1on3SBU
	B3VoDREkIsRhkzRur92sPdXx+Q==
X-Google-Smtp-Source: AGRyM1ushZiM09a3mKNdXCqRFwNPLDff3+dermk/HgL7TWqS9tRuI7++DJxamLjcFaEiQ9SoiqP8zQ==
X-Received: by 2002:a17:902:d716:b0:169:78a:11d4 with SMTP id w22-20020a170902d71600b00169078a11d4mr4197409ply.90.1655412473973;
        Thu, 16 Jun 2022 13:47:53 -0700 (PDT)
Received: from krzk-bin.. ([192.77.111.2])
        by smtp.gmail.com with ESMTPSA id 203-20020a6218d4000000b0051ba0ee30cbsm2165453pfy.128.2022.06.16.13.47.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jun 2022 13:47:53 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
To: Olof Johansson <olof@lixom.net>,
	Orson Zhai <orsonzhai@gmail.com>,
	soc@kernel.org,
	Chunyan Zhang <zhang.lyra@gmail.com>,
	arm@kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Rob Herring <robh+dt@kernel.org>,
	linux-kernel@vger.kernel.org,
	Baolin Wang <baolin.wang7@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	devicetree@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: sprd: adjust whitespace around '='
Date: Thu, 16 Jun 2022 13:47:14 -0700
Message-Id: <165541242280.9040.15171374886189266159.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220526204152.831948-1-krzysztof.kozlowski@linaro.org>
References: <20220526204152.831948-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Thu, 26 May 2022 22:41:52 +0200, Krzysztof Kozlowski wrote:
> Fix whitespace coding style: use single space instead of tabs or
> multiple spaces around '=' sign in property assignment.  No functional
> changes (same DTB).
> 
> 

Applied, thanks!

[1/1] arm64: dts: sprd: adjust whitespace around '='
      https://git.kernel.org/krzk/linux/c/f028328f60bd33cbdc4b65dac2efa98ed6ca26b7

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
