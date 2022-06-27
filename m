Return-Path: <SRS0=17+H=XC=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 556CFCCA473
	for <soc@archiver.kernel.org>; Mon, 27 Jun 2022 09:16:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 3FF0FC341C8; Mon, 27 Jun 2022 09:16:24 +0000 (UTC)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id BB81FC341C7
	for <soc@kernel.org>; Mon, 27 Jun 2022 09:16:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org BB81FC341C7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f50.google.com with SMTP id o10so12075124edi.1
        for <soc@kernel.org>; Mon, 27 Jun 2022 02:16:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=NHgGW5edOR2CgTMI2Iq9qtcnI3kzpEo3OIucbrYS0j4=;
        b=bbdj0sGZygZ1i3i9rc/6f6PRYHhFHR7Fh4ajnfc74Ga0xBST4p9hU1Oj2pdmYQg/F4
         jwqP85bNgxlA/996u7fSL9v6NKQ8Rgr3s2hye8H3/HLkSt7V9S8CvKr4THM8+HjJQv14
         fVUKyeKy32NpHGiWbCJ34CfZPxv5pCISGJxDJjWcbn4OcS6TbgTkUzQj4KZJ462q5NLX
         IMaefnFvImUqRmZaNrJeChnNbddWxUnO4FdCLcG0Na4f6KEHbpGRU74GYOgGPY1WGdIl
         FhA+QUozJI2vuJagSTb6gB9c7VMsVe9qVRf9OCbWQ+TaApzmmu+PCNslxMEJhTm1iJHb
         tNDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=NHgGW5edOR2CgTMI2Iq9qtcnI3kzpEo3OIucbrYS0j4=;
        b=KoWP7yG2lLML2z5ldbAq6AsKs95i2JsOjJtFkXL4yTZSoApZx3+R/fHXwj/Cvc8uwx
         LRUn+QnHnsJC+mCG1CKqlrum3d6onnam+AdvWFhSWfdoZe8mJVOgR2voZOe6Zi7ptoTk
         Nvg8ZuywAdylPB4L38erPqvbJ4ylCpXuRIeRj0JnxwHRZrR5ogeW3211g/ctJmWTBMfb
         JOpSnT3bl56gHX5H8QgpmRYomPNLqCUgjcDvUBUhx93UMd49IlBz88fX6SIDhsSHUZYo
         FC5L+CTYVN63wonwOY1ktCaT3gsE7PGurZN0fvjWwjyhRBvsuWC8wXTmV493a2Ym+tMi
         Yoqw==
X-Gm-Message-State: AJIora8lcoAOBTplQeTNoBy7G/M/ZVUQDFEV2qaEHXd/WWn1yXl2yyrp
	QNDnbEYrofCh2r3KUltrVdF/lScBZ1WhIQ==
X-Google-Smtp-Source: AGRyM1smXEMqtUlES9A9cuuQUJna0IWCyJPA214I44tZM6cHanCEhB/oj1VRKSoH04d7t5gR07LvLQ==
X-Received: by 2002:a05:6402:2554:b0:435:a3fb:9ab4 with SMTP id l20-20020a056402255400b00435a3fb9ab4mr15118091edb.5.1656321382890;
        Mon, 27 Jun 2022 02:16:22 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id gy10-20020a170906f24a00b006f3ef214e2csm4805395ejb.146.2022.06.27.02.16.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jun 2022 02:16:22 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org,
	tony@atomide.com,
	linux-omap@vger.kernel.org,
	bcousson@baylibre.com,
	linux-kernel@vger.kernel.org,
	krzysztof.kozlowski@linaro.org,
	Arnd Bergmann <arnd@arndb.de>,
	krzysztof.kozlowski+dt@linaro.org,
	devicetree@vger.kernel.org,
	arm@kernel.org,
	robh+dt@kernel.org,
	olof@lixom.net
Subject: Re: (subset) [PATCH v3 32/40] ARM: dts: omap: align gpio-key node names with dtschema
Date: Mon, 27 Jun 2022 11:15:56 +0200
Message-Id: <165632135505.81841.7728354247662450860.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220616005333.18491-32-krzysztof.kozlowski@linaro.org>
References: <20220616005224.18391-1-krzysztof.kozlowski@linaro.org> <20220616005333.18491-32-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Wed, 15 Jun 2022 17:53:25 -0700, Krzysztof Kozlowski wrote:
> The node names should be generic and DT schema expects certain pattern
> (e.g. with key/button/switch).
> 
> 

Applied, thanks!

[32/40] ARM: dts: omap: align gpio-key node names with dtschema
        https://git.kernel.org/krzk/linux/c/b1c9af5fec442b164849dc6802ec3bdb4b0c4768

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
