Return-Path: <SRS0=8gG2=EP=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CF58C83F14
	for <soc@archiver.kernel.org>; Wed, 30 Aug 2023 09:45:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 3C77DC433C7; Wed, 30 Aug 2023 09:45:33 +0000 (UTC)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 4274CC433C9
	for <soc@kernel.org>; Wed, 30 Aug 2023 09:45:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 4274CC433C9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-99de884ad25so723989166b.3
        for <soc@kernel.org>; Wed, 30 Aug 2023 02:45:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693388730; x=1693993530; darn=kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=suKY6OufGdFjOXeITy2SI/gqtW5sC+Q15RnB0RhvKmQ=;
        b=ENUk6Kf1JJwtyuXDk5v9iSYW3OMtjBUubqU7AHWjxxTHmg8Fe6YvDZRgUzEtB49bGU
         f3wQT+mlnqjaI4g0ICYQhVdrY4Kw2ilNPMibUq1uV4suRSrmNc9BpRWCPnC0GG7FOahM
         Wwsa2wDlZxWm0sbUQWrpBQRb3rjE+EvHMZr6Yt3DWKKXEnJBGEm99YbyZITtY1NsS0cm
         YI0emvP8J0ZxxC95/G7kwlPteMuP+VMe3LgHJ3biLYdmD2JQ+X6/FnJnOB6crw01Ig1P
         MWDDoTjM26Liwz+oh1JTbBrGltVrwTEUTSmrb3/4wGiaQs7Y/oy5JAuX+fOBk6WB9nGK
         9xXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693388730; x=1693993530;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=suKY6OufGdFjOXeITy2SI/gqtW5sC+Q15RnB0RhvKmQ=;
        b=YvcqQVSOeiH8f32N+85UHMWLG7hQMc3mdZ0zwIRAs0WmbprKl4ca/9Gpvgz5qix7FJ
         G49/1lNWeIP9xcm1Gj+IHjV/byGLxcE6/wKVaySXNe0oYIy3tp4mOi8KKLMScgmg7aYp
         FsG2DtbxD2cZkT+Ue1Z0R0syTe8e5gh/wEf7S31blS9dsL9i9dzoEEwdX4sIYB94GJKW
         Fx2w6VnIgkUvjRw47aPkxOfBF6AQNNorPKkV7fgNOC6MQvSz1kqgP1LzYEKAYVPIxZB4
         IxpU7vGN6ZTPb2Zhjho7iH5aa02J3J419EeYumwlKTjrr9Yi3DOUMjiGSuBEQAjeAEI4
         r1DQ==
X-Gm-Message-State: AOJu0Yz26EVtH8mUZ7YptNzmR8d4WeeWOmIexZxuvOsHbmMZFzLGInvw
	OgZEKkFbb5bjM2qWD5gGzSlsKw==
X-Google-Smtp-Source: AGHT+IEJc1E1Orxis2sVRcoNfH2DjYDXEvgRu8kKboCKIIWJBA0TxFoly1iyx8MPZDRkDacSyA528g==
X-Received: by 2002:a17:906:3d22:b0:9a1:bb8f:17de with SMTP id l2-20020a1709063d2200b009a1bb8f17demr1526973ejf.35.1693388730278;
        Wed, 30 Aug 2023 02:45:30 -0700 (PDT)
Received: from [192.168.0.22] (77-252-46-238.static.ip.netia.com.pl. [77.252.46.238])
        by smtp.gmail.com with ESMTPSA id w24-20020a17090649d800b009930308425csm6973974ejv.31.2023.08.30.02.45.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Aug 2023 02:45:29 -0700 (PDT)
Message-ID: <1d531692-5455-fbfd-0775-50856bf0fbc7@linaro.org>
Date: Wed, 30 Aug 2023 11:45:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH v4 2/2] dt-bindings: arm: aspeed: add Meta Minerva board
Content-Language: en-US
List-Id: <soc.lore.kernel.org>
To: peteryin <peteryin.openbmc@gmail.com>, patrick@stwcx.xyz,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
 soc@kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Cc: cosmo.chou@quantatw.com, potin.lai@quantatw.com, daniel-hsu@quantatw.com
References: <20230830090212.3880559-1-peteryin.openbmc@gmail.com>
 <20230830090212.3880559-3-peteryin.openbmc@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230830090212.3880559-3-peteryin.openbmc@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 30/08/2023 11:02, peteryin wrote:
> Document the new compatibles used on Meta Minerva.
> 
> Signed-off-by: peteryin <peteryin.openbmc@gmail.com>
> ---
>  Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
> index 6b0a6683ccae..b681bbf960d1 100644
> --- a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
> +++ b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
> @@ -80,6 +80,7 @@ properties:
>                - facebook,fuji-bmc
>                - facebook,greatlakes-bmc
>                - facebook,yosemite4-bmc
> +              - facebook,minerva-bmc

m is not after y. Keep things sorted, I already wrote this in your v2.

Best regards,
Krzysztof

