Return-Path: <SRS0=sX7s=WX=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8864EC43334
	for <soc@archiver.kernel.org>; Thu, 16 Jun 2022 20:48:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 7133EC3411C; Thu, 16 Jun 2022 20:48:02 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 91EAFC3411F
	for <soc@kernel.org>; Thu, 16 Jun 2022 20:48:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 91EAFC3411F
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f171.google.com with SMTP id o6so2197445plg.2
        for <soc@kernel.org>; Thu, 16 Jun 2022 13:48:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=5B/YPBqE1i3XYaE736ZQJ2S0S9D1ypIuY4zrve4dG1s=;
        b=TPYF5FmXJNP608UOhddPidwwhlgQwZqQcb5S/bcTJqHYWPar9mVox2HtlXJdbKjwUU
         RuVpNqBgeu3ym2EsTdZb1V+Ha2G8FK9KhLFUBgjMdIxwA/TJNkSFqIYPPYuxV0BtXS2r
         jRguzPoXEb8vmuIRGX1gv9h2+KOrESm2Gmo1jlTCyjBBya8CzXhr159MCFvtn30Yis7+
         dR+3zKb+lHnDtxfkDs6gvy9wM/9/8FVjcjJJX0x+esC8GAe6otnAj+EAiyukH4eIF/eM
         OVWbTpvfdRKDbfxQBiQpYaRzKGfYhHDwaQBgrVdeIbkBNZjpRy+9iZlVdVD2VldeTlMh
         45Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=5B/YPBqE1i3XYaE736ZQJ2S0S9D1ypIuY4zrve4dG1s=;
        b=zWnA4foZdGUMAVGkhbzG0sf7A0EqayKWKuyHnLE6s//7QiYZeq8yljkCabBtbzByEv
         fHsroOdyZuiNXE5qJfCjS+XSbnmWWukmle4mAktBnoPcz7PhLU0j3tsdw2s2w4HGqRCA
         lPEKUxIwTI9PT1J0q4DV3pJrjcrYUaKZc68ebUfVbBpP+qbvskcj0huwtlMVFvFvoKZu
         Ff/zMh5bfscaKc+SBZFT1oDKiBhhsVWxYdNCrKv50J3RdPKDstbVegykrbsOqQD2snSR
         xSVsk/iOr6KvXj5YFnvPYEOwuLmpMsNMDE8luJ3vlfMGViAY3eEHQ/B62GBZZn7A1lGI
         HtNg==
X-Gm-Message-State: AJIora9HEeuy8ydbtykTT4c8KK0TVQ19/H915kiyZ1QRE6gfcMyauCiy
	EWpDOyYocej6udDc71G3zPZvn4F3NNYk4A==
X-Google-Smtp-Source: AGRyM1sXiNVSP9UuwIb+c0Qc2nM5vMtaLbW6JXD81fUTqZePRAebivsREb7eIoGboiPjOHruHfiQqw==
X-Received: by 2002:a17:902:e80b:b0:168:b645:849e with SMTP id u11-20020a170902e80b00b00168b645849emr6157852plg.26.1655412480916;
        Thu, 16 Jun 2022 13:48:00 -0700 (PDT)
Received: from krzk-bin.. ([192.77.111.2])
        by smtp.gmail.com with ESMTPSA id 203-20020a6218d4000000b0051ba0ee30cbsm2165453pfy.128.2022.06.16.13.48.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jun 2022 13:48:00 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org,
	Viresh Kumar <vireshk@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	linux-kernel@vger.kernel.org,
	Shiraz Hashim <shiraz.linux.kernel@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	devicetree@vger.kernel.org
Subject: Re: [PATCH] ARM: dts: spear: adjust whitespace around '='
Date: Thu, 16 Jun 2022 13:47:22 -0700
Message-Id: <165541242280.9040.16469082540600574073.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220526203815.831383-1-krzysztof.kozlowski@linaro.org>
References: <20220526203815.831383-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Thu, 26 May 2022 22:38:15 +0200, Krzysztof Kozlowski wrote:
> Fix whitespace coding style: use single space instead of tabs or
> multiple spaces around '=' sign in property assignment.  No functional
> changes (same DTB).
> 
> 

Applied, thanks!

[1/1] ARM: dts: spear: adjust whitespace around '='
      https://git.kernel.org/krzk/linux/c/194f47c31ab6c37e4557eb60b382704296c10925

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
