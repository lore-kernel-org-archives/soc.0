Return-Path: <SRS0=0I20=2N=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4F10C4332F
	for <soc@archiver.kernel.org>; Wed, 12 Oct 2022 13:11:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 9B48CC433D7; Wed, 12 Oct 2022 13:11:49 +0000 (UTC)
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id A246DC433D6
	for <soc@kernel.org>; Wed, 12 Oct 2022 13:11:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org A246DC433D6
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-qk1-f171.google.com with SMTP id m6so5275454qkm.4
        for <soc@kernel.org>; Wed, 12 Oct 2022 06:11:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bSuVtxQGTyseURL7iIpqoWMIO787v64Us5vsJhx+Oqw=;
        b=m1+rxYNLiHD2G9lUxA+Q95eLdJFGk0q6Sq8J52YqKJbiaNQLieBLBpfNLJ9XUFZyYh
         BFUVMKWsoLanUwjefLRwM2mSIYd/DncQfo31RRuP1vxK+Kihs86O5rSPOtfXXu6JTr/w
         cj97doNfAZFipxpsOeqOapJBssPtA2wR9kuuOumxyc77u2/GgHRWYIAU4ktpAUWVMYpL
         n0b4W6eq7ReIyGLdtFtXxmqNd42EeiV1XDviro3LEWWtW5L0Z30b81WNHbXZkazdzPSl
         8PgdWWWjXvqm+2jHCWzUDHKdxJgdL6LHwKqu3B+cAP6XBC4v9YrPhBUuVLsGUbUBCDQ0
         TB7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bSuVtxQGTyseURL7iIpqoWMIO787v64Us5vsJhx+Oqw=;
        b=qW7N9gfEKD831pBgTkjaEv2WlGsqZ4OE3QrEkvbbn65QOTw0+qV7GQH+FJfgTH/TYL
         nfZMJ98UbERmFAI8pDeywsKt/rHFUPurxVPR07P0HFfE5XPuqLbizwVuozTzwmOVfMCE
         T6L/YYR7Ml6DeKJLBqFJCwiz1THYP8qerH+j3GfCRqQKFaYEH142ZVbOKkEUjf9k73Ky
         ZJgAMWeCrq0w/nwoJzJDUKGH1uvSfiX42o4/q88cE6HWmHn/lJSYKrIDsyFoqPpxAzC1
         7wjetZFJ30Hm1kuH9hlMppQfLBWLEkktXSUTg8SjQKkNhdvrKtbL1UYhiCFTF4yZflaV
         c9tw==
X-Gm-Message-State: ACrzQf2yUzmmV4/THT6B6yAydAOgFz6V+q9p6ms5DpTvDCmQG+ggd1yp
	VIIvI8FeGUIkd5FqzngLJg6Ffw==
X-Google-Smtp-Source: AMsMyM7SUhR3PVQDSvUa9yBhsfUnrnqqFXcAMd3v99I4PTx3kh5i4oD+kuf+3P8urNimrRb5d/BSqw==
X-Received: by 2002:a05:620a:178b:b0:6ce:7f8e:63b4 with SMTP id ay11-20020a05620a178b00b006ce7f8e63b4mr18978626qkb.686.1665580307679;
        Wed, 12 Oct 2022 06:11:47 -0700 (PDT)
Received: from [192.168.1.57] (cpe-72-225-192-120.nyc.res.rr.com. [72.225.192.120])
        by smtp.gmail.com with ESMTPSA id f11-20020ac8068b000000b0039853b7b771sm9334123qth.80.2022.10.12.06.11.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Oct 2022 06:11:47 -0700 (PDT)
Message-ID: <5496481d-99b8-3ffb-2e90-85b959083c7a@linaro.org>
Date: Wed, 12 Oct 2022 09:09:35 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.2
Subject: Re: [PATCH v2 09/10] dt-binding: arm: sunxi: add compatible strings
 for PopStick v1.1
Content-Language: en-US
To: Icenowy Zheng <uwu@icenowy.me>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Andre Przywara <andre.przywara@arm.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-phy@lists.infradead.org, linux-usb@vger.kernel.org
References: <20221012055602.1544944-1-uwu@icenowy.me>
 <20221012055602.1544944-10-uwu@icenowy.me>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221012055602.1544944-10-uwu@icenowy.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12/10/2022 01:56, Icenowy Zheng wrote:
> SourceParts PopStick is a F1C200s-based stick-shaped SBC.
> 
> Add a compatible string list for its v1.1 version (the first public
> one).
> 
> Signed-off-by: Icenowy Zheng <uwu@icenowy.me>
> ---
> New patch introduced in v2.
> 


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

