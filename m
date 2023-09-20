Return-Path: <SRS0=FoZ9=FE=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E733CCE79D1
	for <soc@archiver.kernel.org>; Wed, 20 Sep 2023 12:37:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id AD8E9C433CD; Wed, 20 Sep 2023 12:37:10 +0000 (UTC)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id B8C83C433CB
	for <soc@kernel.org>; Wed, 20 Sep 2023 12:37:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org B8C83C433CB
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-9ae22bf33a0so195397766b.0
        for <soc@kernel.org>; Wed, 20 Sep 2023 05:37:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695213428; x=1695818228; darn=kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UexnMi5oMmhAE5dFwT3NNBL/IAHUolyTmmXUsGhprA0=;
        b=qPHRc/gVhmNzNZp9E20hColaNZBMmypDs19+vgtUvfhGvsQ05nlNoq9jzBhdixoEED
         O1+DEJtJc8SiFhop4XhTcMn03PnqrnVgNQOB5tlSYFGzHP3+rLNSl9YlmhmlhnGC/GdU
         9ffA5uiPo85tqoMuX7IvhKHtbuAmvCftmWRz0t3QjPqIBfJtv76ytdV2vboQ4vhVoaR0
         SuxsqSvK6sqSJDC6tN2UcSL+0q3lZz+Ocwt/7CMK5yl7sn1gUFH5VYiur9gvNzOvH6dw
         SqWBx9xIjVK8SzYKvhtObsHVOYlxtgyyQqoplPROKYXHoBMuC04Khwht8MwRn8SUCrMS
         bo8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695213428; x=1695818228;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UexnMi5oMmhAE5dFwT3NNBL/IAHUolyTmmXUsGhprA0=;
        b=L8m2/Pk/Vrms7rtFCuEPD4DEeO1QGNNzOkHf87WchapilwUut/aI2smkBqutyH/ajw
         ppkY6iaLKPCRTrOofVIYpG0J4QW0r32vX85SI+vfxLFOAb96nguATccxY9Pc1g32pKBY
         3Ri9iDHrNJguCJgw+fNHTwIIh5BMEUwohrMohIg9LjkiSsDFNgaKXTuax5ZS8dFjGHnO
         J06eAEyTOQftdInmBC4usAnmvIEVk19K5mMsc5v7VRtYrh03GRaLwqXNq0Wyfu2N8y5N
         ToMNJc8TGBSQC6ZCvCYqFoK01+D7KCrZdtxitFOnanJaQQ5PmJhbTdcDa+WJa3XmLIkV
         gMRA==
X-Gm-Message-State: AOJu0YwonDjcCwIX3NDFo6B/3sS5vRI/zHGRCDNkuaKA/037YISKq3SR
	64xC0Vtr1RQ1M0ycNTiRAzls9w==
X-Google-Smtp-Source: AGHT+IEmMtyXrNNzSSn0HyiVCQ+Z5CoZ545SWjv06Pe9u9ELrbWcaGNwoswFbs0oC4SKP+a/Ov7VFw==
X-Received: by 2002:a17:907:7206:b0:9a5:c38d:6b75 with SMTP id dr6-20020a170907720600b009a5c38d6b75mr6982252ejc.15.1695213428032;
        Wed, 20 Sep 2023 05:37:08 -0700 (PDT)
Received: from [172.20.24.238] (static-212-193-78-212.thenetworkfactory.nl. [212.78.193.212])
        by smtp.gmail.com with ESMTPSA id xo23-20020a170907bb9700b0099290e2c163sm9140375ejc.204.2023.09.20.05.37.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 Sep 2023 05:37:07 -0700 (PDT)
Message-ID: <41e5dbe7-61e7-cf72-7479-c33c95e439df@linaro.org>
Date: Wed, 20 Sep 2023 14:37:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v2 1/7] dt-bindings: arm: add cznic,turris-omnia-mcu
 binding
Content-Language: en-US
List-Id: <soc.lore.kernel.org>
To: =?UTF-8?Q?Marek_Beh=c3=ban?= <kabel@kernel.org>,
 Gregory CLEMENT <gregory.clement@bootlin.com>, Arnd Bergmann
 <arnd@arndb.de>, soc@kernel.org, arm@kernel.org,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org
References: <20230919103815.16818-1-kabel@kernel.org>
 <20230919103815.16818-2-kabel@kernel.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230919103815.16818-2-kabel@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 19/09/2023 12:38, Marek Behún wrote:
> Add binding for cznic,turris-omnia-mcu, the device-tree node
> representing the system-controller features provided by the MCU on the
> Turris Omnia router.
> 
> Signed-off-by: Marek Behún <kabel@kernel.org>
> ---


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

