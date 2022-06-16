Return-Path: <SRS0=sX7s=WX=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E5F9C433EF
	for <soc@archiver.kernel.org>; Thu, 16 Jun 2022 20:47:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 84411C341C7; Thu, 16 Jun 2022 20:47:54 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 9BA7DC341C6
	for <soc@kernel.org>; Thu, 16 Jun 2022 20:47:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 9BA7DC341C6
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f178.google.com with SMTP id a17so217131pls.6
        for <soc@kernel.org>; Thu, 16 Jun 2022 13:47:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=l23GN/U2DrIJrN/6AEssfMKzsUHbsd5fPbDMrm48ijg=;
        b=Hlhlfrt/BJXdyf2w8kNa+QzSqO8cQj4lod7jTR2Ma07k8drLJ7tyJdl/R1YMZkIsDr
         y5njbGkxTrgiaAevYqgykQxDCCo+8D1ds4Wcvzy88/kTMrq3J3WHmHN8le+Qd1+GzDxR
         +/XdD9/gFkq5ktys+ZaLzxDVJboC2+1dLyZa1iX5aLnkDYMLRorGDXIPM+EsnITuAm/h
         d4fcbn5xBna0jpES0gnwB98SYs8GI3XsDZEpfVU2PXujg8B8Xcb63PojcdsbXJj8oB4y
         qNqUtJEbyhPGaBJvagvlYs5RhtTNO2lV9EILkWL6rHgdUFFKMZNbCbU5R6Vr+/pwYzPs
         XK5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=l23GN/U2DrIJrN/6AEssfMKzsUHbsd5fPbDMrm48ijg=;
        b=jFmM2/1oL8jl58o1YGtuO4u5740CDt7bFsVLbhXIMR9uacXI7oYos4l2elWZ5JzM+5
         lK8DCwIuNBS8KSsXRTyTyZTEu15boO3I8/FTCweYQeMYlQdfHCXET9OJpwsD7P9Ycv4H
         ddG+I1nVUmWAUh34/ez7maPHDleVCI+cSf/VX0UVvSKMOboe10OyK3lOU4kz5kuZDOd8
         TXy6pFXjV8W65DsfX0R3Haong9wl5IIDHfEut2QS30tC9nAZQkidTqo2LlTla+rYsKZ/
         S5jo7dgtkmjsjjLNH5glQ5quBroEdlxTvKbqWCrbeQnqco7KFRCtSr3TmRoUaiFcvpaA
         f/dw==
X-Gm-Message-State: AJIora9ipPJ6LWg+wHcZxuuWozcZd5jI8uQz3w2ikqDIY4bBUEyVRQNh
	9Z1+VUEDRc0NG4nlxSGMzQn1jM/OMIvFqA==
X-Google-Smtp-Source: AGRyM1sGQFKhrRTWYkWHrvqeQMdQ//vcR5llvQ5SaH3z0VWqOAf04UfgsXRSWIQ6CWv0tnyQGtdkAw==
X-Received: by 2002:a17:902:efc6:b0:167:8177:60a7 with SMTP id ja6-20020a170902efc600b00167817760a7mr6252404plb.110.1655412473000;
        Thu, 16 Jun 2022 13:47:53 -0700 (PDT)
Received: from krzk-bin.. ([192.77.111.2])
        by smtp.gmail.com with ESMTPSA id 203-20020a6218d4000000b0051ba0ee30cbsm2165453pfy.128.2022.06.16.13.47.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jun 2022 13:47:52 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org,
	Wei Xu <xuwei5@hisilicon.com>,
	Olof Johansson <olof@lixom.net>,
	arm@kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Rob Herring <robh+dt@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	devicetree@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: hisilicon: adjust whitespace around '='
Date: Thu, 16 Jun 2022 13:47:13 -0700
Message-Id: <165541242280.9040.2541894516124804642.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220526204453.832681-1-krzysztof.kozlowski@linaro.org>
References: <20220526204453.832681-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Thu, 26 May 2022 22:44:53 +0200, Krzysztof Kozlowski wrote:
> Fix whitespace coding style: use single space instead of tabs or
> multiple spaces around '=' sign in property assignment.  No functional
> changes (same DTB).
> 
> 

Applied, thanks!

[1/1] arm64: dts: hisilicon: adjust whitespace around '='
      https://git.kernel.org/krzk/linux/c/11357f103f2e641e2744d527886ff248dbef13d8

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
