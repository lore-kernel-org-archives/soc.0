Return-Path: <SRS0=5Cdg=W3=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C636C433EF
	for <soc@archiver.kernel.org>; Mon, 20 Jun 2022 11:14:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 25773C341C6; Mon, 20 Jun 2022 11:14:41 +0000 (UTC)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 5069BC341C4
	for <soc@kernel.org>; Mon, 20 Jun 2022 11:14:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 5069BC341C4
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f51.google.com with SMTP id es26so12926096edb.4
        for <soc@kernel.org>; Mon, 20 Jun 2022 04:14:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=iWwP3zKNoSqn/looa8tOJbszWzl+PDltFYRXBTBOfTg=;
        b=end+xJ9biihBZnDNcX/1VK/y/FN7ogO3n+AOf6D9B9nTJQkxSu8OYn8YXO54X8t7PB
         itM4i7iWxLeehpof5kgMwHc8qk3u6+E50XF95jSdPJCMdJJpl5wm0WjdXcHxrMB5SfkD
         swuODviPhK9Wes16lxER2oI7AoU79EsArQQkfBce9AyZFadEXAheI26nV6WNRxzSCB8s
         E6v3t/QwM6+QRitsrnxRr2akDsMJV91c+Q8O5I3+Y5xq6luUfeAUpfWDBTBarAN89Iy/
         kbl5q73LX3KvFVy/zI6o0rrJn8aYvxHv5ftIESak0JD48R+uZBGf3dmzSo25Pf2wmpPf
         ZNrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=iWwP3zKNoSqn/looa8tOJbszWzl+PDltFYRXBTBOfTg=;
        b=ilI2sEN2Dq6+Y5wxRFeICsDKst2JeEwdNMQc2NAv8pvojklrCCRYMqqReipx03+fwA
         XCUuShkl9avDUNfPdHkYef6nBlv0yCqaY91Uojw+D7lUcU4s3A3pZyShoP+kLEKVfwAA
         rWzbK3lUimNEAOB56xrhOQipXQbescOiK4HXZieA4CDVzKmVNvGBgEvboyiynfw98kEm
         nQVJ2MuE2+mXG+Q1BF2mc7Pck1I4Xo+a61mIGHUkHLWMPG5YaZdGv1OLTXbyOoAvrLIF
         676Pk5DncbwWk6V1sUu/vAD8lFp230gPHA2cvD7u5NSRUCn116evbSu+leEQNcvBizx8
         QeJQ==
X-Gm-Message-State: AJIora8Z4nRq+YHgpqqm5yzMQVXSccd0B2hGWxSPTaiNRdIHbANvib0D
	7mS/Npi2B5nNfcfV+mct/es1tw==
X-Google-Smtp-Source: AGRyM1sPhRF6oSOa0bOLQMm48PjJI9vwGrtl85GlrcbcCeuZnaouaI26t4q4ISjcpRl8IczIAN9dIg==
X-Received: by 2002:a05:6402:510b:b0:42d:d18d:2080 with SMTP id m11-20020a056402510b00b0042dd18d2080mr28545619edd.263.1655723678550;
        Mon, 20 Jun 2022 04:14:38 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id c26-20020a170906171a00b006fed9a0eb17sm5699969eje.187.2022.06.20.04.14.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jun 2022 04:14:37 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Khuong Dinh <khuong@os.amperecomputing.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Olof Johansson <olof@lixom.net>,
	Rob Herring <robh+dt@kernel.org>,
	linux-kernel@vger.kernel.org,
	soc@kernel.org
Subject: Re: (subset) [PATCH v3 05/40] arm64: dts: apm: correct gpio-keys properties
Date: Mon, 20 Jun 2022 13:14:30 +0200
Message-Id: <165572367262.35195.10191660870044749180.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220616005333.18491-5-krzysztof.kozlowski@linaro.org>
References: <20220616005224.18391-1-krzysztof.kozlowski@linaro.org> <20220616005333.18491-5-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Wed, 15 Jun 2022 17:52:58 -0700, Krzysztof Kozlowski wrote:
> gpio-keys children do not use unit addresses.
> 
> 

Applied, thanks!

[05/40] arm64: dts: apm: correct gpio-keys properties
        https://git.kernel.org/krzk/linux/c/2453119fe6eed92ae88baac14ed28425a2b9f95e

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
