Return-Path: <SRS0=DmIV=73=gmail.com=robherring2@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2343C761A6
	for <soc@archiver.kernel.org>; Tue,  4 Apr 2023 13:39:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 69610C433D2; Tue,  4 Apr 2023 13:39:42 +0000 (UTC)
Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com [209.85.167.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 5B1F7C433EF;
	Tue,  4 Apr 2023 13:39:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 5B1F7C433EF
Authentication-Results: smtp.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oi1-f181.google.com with SMTP id bm2so24236783oib.4;
        Tue, 04 Apr 2023 06:39:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680615580;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G7+FIfysDlK27mvbP/FDHvEU65AaGIQG/L0oVJUh4mo=;
        b=W7GGRSVKgtmCR/tzzM6NIMunTWbFZHE5jMmNEry6xihmoeHrxZW0JVufCmLZNDWj5x
         bsEbi3K8X33sSktmB8e92VSI3Y3qropDT1VvpxTm5LzIZuQCljoXKwZtwqmbmyD3v7Te
         9GhY/Ve6SKeL9fp7DCmSsw3Od659FR3V/4wcLsF8Q2SwnnbRqluYDh73MeZlAHk7z9Jt
         yQEUIZPvJlkaSOFlvNFHqUPc9cwoSPeu4yatPabrs2L8B+ONkJReFciOrcmYzxFCnako
         WC40za8DDd2//lxx6eXGUgGIa/PLObpSvQ63A33hoAXBMj20Xzyem135nHtv9P5bhwtr
         k/UQ==
X-Gm-Message-State: AAQBX9eld9qnQgfqtqUX0kKcqBcVDPEtBoTZeeVozWLyLPqqELcYRjIm
	zhu6a8b8l5cosfvS0Kf/fQ==
X-Google-Smtp-Source: AKy350ZG2E1bESg38EVUvibwE63R0y7UVrNSPheX+M1dv7iyiVYcICOC9II7m/W276xxd/QZflsMrA==
X-Received: by 2002:a05:6808:220b:b0:387:24c1:bab2 with SMTP id bd11-20020a056808220b00b0038724c1bab2mr1559876oib.54.1680615578903;
        Tue, 04 Apr 2023 06:39:38 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id 2-20020a4a0302000000b005251f71250dsm5392573ooi.37.2023.04.04.06.39.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Apr 2023 06:39:38 -0700 (PDT)
Received: (nullmailer pid 3779371 invoked by uid 1000);
	Tue, 04 Apr 2023 13:39:37 -0000
Date: Tue, 4 Apr 2023 08:39:37 -0500
From: Rob Herring <robh@kernel.org>
To: Stefan Wahren <stefan.wahren@chargebyte.com>
List-Id: <soc.lore.kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, Evgeniy Polyakov <zbr@ioremap.net>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, linux-imx@nxp.com, soc@kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, stefan.wahren@i2se.com
Subject: Re: [PATCH V5 2/6] dt-bindings: w1: Add DS2482/DS2484 I2C to 1-W
 bridges
Message-ID: <20230404133937.GA3778861-robh@kernel.org>
References: <20230404080243.9613-1-stefan.wahren@chargebyte.com>
 <20230404080243.9613-3-stefan.wahren@chargebyte.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230404080243.9613-3-stefan.wahren@chargebyte.com>

On Tue, Apr 04, 2023 at 10:02:39AM +0200, Stefan Wahren wrote:
> This adds a dedicated devicetree binding for the Maxim DS2482/DS2484
> I2C to 1-W bridges, which can be extended later for further features
> (e.g. sleep mode control GPIO). Since one wire is a bus, child nodes
> needs to be allowed here.
> 
> Signed-off-by: Stefan Wahren <stefan.wahren@chargebyte.com>
> ---
>  .../devicetree/bindings/w1/maxim,ds2482.yaml  | 44 +++++++++++++++++++
>  1 file changed, 44 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/w1/maxim,ds2482.yaml

Reviewed-by: Rob Herring <robh@kernel.org>
