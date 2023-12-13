Return-Path: <SRS0=3lSd=HY=gmail.com=robherring2@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A912C4332F
	for <soc@archiver.kernel.org>; Wed, 13 Dec 2023 14:32:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 4100FC433C9; Wed, 13 Dec 2023 14:32:47 +0000 (UTC)
Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 575B0C433C7;
	Wed, 13 Dec 2023 14:32:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 575B0C433C7
Authentication-Results: smtp.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f46.google.com with SMTP id 46e09a7af769-6d7fa93afe9so5178079a34.2;
        Wed, 13 Dec 2023 06:32:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702477965; x=1703082765;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z0kWneZU0gge6lamU79WOa8q8MUgTJ3s6CXlsPKbl1w=;
        b=k72wbZrgQPREHN5VxXZh66FhESzliWO7CGv26IAAUooul6CBzHZHpMMDienOEDFJRd
         Tl6BHJhNEjDvVh1vnggd27tZheZIKpFWxqWKdZu1QI+SkH26YA212y9K+0hE2TPf5m/Q
         cW6yoIBOLDS60v7fzcl4bGEN7gfyYYFfd1pH/dWVuO+oFXU+2iEChWdtRfizWG7jC1bU
         MYzxy8RA7M8k1GJ733uRvpPVPAeNub/BThyWNQpYirF++ZBI5Bs0m0gSrpZU/f42CSMh
         MOTSA10NgvNBSPsXtY8FzwxvDZT1grlJuEeOmkg31oNQ15627k5dMWFzvOXbUyX8h6Dd
         Lycw==
X-Gm-Message-State: AOJu0YwTlvQNCCJLm15oPYynn10sML/DL67ixmkk45T4utC19xgzC/7q
	BaNXmT1+fpnZKi2fopbWgA==
X-Google-Smtp-Source: AGHT+IFWkvHfseSXYTYT3uKdOPAB8K0URkVWZMX3xZ7xanO9ooySMDAjcPKjyJvnnmKaV3WR/fUj1g==
X-Received: by 2002:a05:6830:1b64:b0:6d9:da9f:ab2f with SMTP id d4-20020a0568301b6400b006d9da9fab2fmr7327230ote.27.1702477965392;
        Wed, 13 Dec 2023 06:32:45 -0800 (PST)
Received: from herring.priv (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id p26-20020a9d695a000000b006d85518ae62sm2776323oto.76.2023.12.13.06.32.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Dec 2023 06:32:44 -0800 (PST)
Received: (nullmailer pid 1093516 invoked by uid 1000);
	Wed, 13 Dec 2023 14:32:43 -0000
Date: Wed, 13 Dec 2023 08:32:42 -0600
From: Rob Herring <robh@kernel.org>
To: Peter Griffin <peter.griffin@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: linux-samsung-soc@vger.kernel.org, arnd@arndb.de, catalin.marinas@arm.com, s.nawrocki@samsung.com, willmcvicker@google.com, gregkh@linuxfoundation.org, linux@roeck-us.net, linux-arm-kernel@lists.infradead.org, kernel-team@android.com, olof@lixom.net, linux-watchdog@vger.kernel.org, linux-clk@vger.kernel.org, alim.akhtar@samsung.com, saravanak@google.com, will@kernel.org, cw00.choi@samsung.com, tudor.ambarus@linaro.org, linus.walleij@linaro.org, mturquette@baylibre.com, soc@kernel.org, conor+dt@kernel.org, wim@linux-watchdog.org, sboyd@kernel.org, robh+dt@kernel.org, devicetree@vger.kernel.org, linux-serial@vger.kernel.org, tomasz.figa@gmail.com, linux-gpio@vger.kernel.org, jirislaby@kernel.org, semen.protsenko@linaro.org, krzysztof.kozlowski+dt@linaro.org, andre.draszik@linaro.org
Subject: Re: [PATCH v7 02/16] dt-bindings: arm: google: Add bindings for
 Google ARM platforms
Message-ID: <170247795662.1093374.11352509671907840697.robh@kernel.org>
References: <20231211162331.435900-1-peter.griffin@linaro.org>
 <20231211162331.435900-3-peter.griffin@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231211162331.435900-3-peter.griffin@linaro.org>


On Mon, 11 Dec 2023 16:23:17 +0000, Peter Griffin wrote:
> This introduces bindings and dt-schema for the Google Tensor SoCs.
> Currently just gs101 and pixel 6 are supported.
> 
> Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>
> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> ---
> @RobH I removed your 'Reviewed-by: Rob Herring <robh@kernel.org>' tag
> as since you reviewed this I added the empty ect node. Can you please
> do the review again?
> 
> x# Please enter the commit message for your changes. Lines starting
> ---
>  .../devicetree/bindings/arm/google.yaml       | 53 +++++++++++++++++++
>  1 file changed, 53 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/arm/google.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>

