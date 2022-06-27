Return-Path: <SRS0=17+H=XC=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79466C43334
	for <soc@archiver.kernel.org>; Mon, 27 Jun 2022 09:16:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 4471FC3411D; Mon, 27 Jun 2022 09:16:08 +0000 (UTC)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 98E65C341CD
	for <soc@kernel.org>; Mon, 27 Jun 2022 09:16:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 98E65C341CD
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f48.google.com with SMTP id ay16so17782389ejb.6
        for <soc@kernel.org>; Mon, 27 Jun 2022 02:16:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=9RjJmpdi75XU5nQH3QpJfABUbyHeqC/FsIwtMKjT65A=;
        b=XecNMchFJE25hOmqMMMB1a95gDdS++CB2DUXhD2k9NoUZ1xgQyJJPo/wAolnwQ4iRL
         I2sqJNzTYY3ZcUrr0rsdwzmF49C50+wZO5HCSaXfn4/wPxeoDzEVNiT2lzvSEBzECgXc
         s3SvZfl8voiZuSfrqXL+5CiUMx7p3vefsmpI7kuiL/vEB6H0v0/lZcRtUOzzOg60Jkzy
         kIkGxPUatVGgA7NLJTPZidWDTHaiZxgmUJ4pqXEusTr8zgihHFO5hnferK13xveh85zp
         G+yePO97nV5mZWLZ7zFtGWuxUTjIPqVXj1dAtd1gHVYi3KUYWW3XvN42gjQ9L4TkCQlX
         ocAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9RjJmpdi75XU5nQH3QpJfABUbyHeqC/FsIwtMKjT65A=;
        b=uwlOe5c9+fLBve5c7eAVtYfFiy6KR1BpcZ88PSziYKI/Y+Nia3joTWhXWsXJGyRZKi
         SPbBADc+JIuzS7F0Wl0ud3z5LFqW+6oTfZyqwhhWWeRq7L5SRslZsu8Ijn+2XiHfwE4s
         yb4VqCkEeoHSQ7KGx7iAjwPcDRXLXoODQ+xuwEHnXGNHZyJSg18oZW7xnTYY5eY7Mbst
         qHo35zJgjMDMbPA0Nzy1dIP+HnalQUbj/xSNCAEFvlmKCKizzx8mY3Np90stkvUPabdM
         zSHdGesHhUMCKC8OLXbSGbvxBpQSYyh0NeHAetbSvF3O0lpTjAGesKSwV7wcVlZOleCF
         xBew==
X-Gm-Message-State: AJIora+Ppgn95GzjJQ+xfIrBlLyMZqTGWDJJ/VZO6Vi8fvAFj7CVjBwp
	m+p6KCcS1lXi+2pcjMIVfzBXMl9nAntfdQ==
X-Google-Smtp-Source: AGRyM1vTcV6WemKEqD1IEIBFFEkpIMDDsqFPThnRxnBMbopZ9CxTvHpeieDyOhaz88+0CloU87boAg==
X-Received: by 2002:a17:906:9b86:b0:6f8:24e7:af7d with SMTP id dd6-20020a1709069b8600b006f824e7af7dmr11933823ejc.295.1656321365593;
        Mon, 27 Jun 2022 02:16:05 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id gy10-20020a170906f24a00b006f3ef214e2csm4805395ejb.146.2022.06.27.02.16.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jun 2022 02:16:05 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	agross@kernel.org,
	krzysztof.kozlowski@linaro.org,
	Arnd Bergmann <arnd@arndb.de>,
	krzysztof.kozlowski+dt@linaro.org,
	devicetree@vger.kernel.org,
	arm@kernel.org,
	robh+dt@kernel.org,
	olof@lixom.net,
	bjorn.andersson@linaro.org
Subject: Re: (subset) [PATCH 2/2] ARM: dts: qcom: adjust whitespace around '='
Date: Mon, 27 Jun 2022 11:15:41 +0200
Message-Id: <165632135503.81841.10181896314870862528.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220526204248.832139-2-krzysztof.kozlowski@linaro.org>
References: <20220526204248.832139-1-krzysztof.kozlowski@linaro.org> <20220526204248.832139-2-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Thu, 26 May 2022 22:42:48 +0200, Krzysztof Kozlowski wrote:
> Fix whitespace coding style: use single space instead of tabs or
> multiple spaces around '=' sign in property assignment.  No functional
> changes (same DTB).
> 
> 

Applied, thanks!

[2/2] ARM: dts: qcom: adjust whitespace around '='
      https://git.kernel.org/krzk/linux/c/bc98d95e00ebc708dc4e29d340a11e06aa3e9d2e

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
