Return-Path: <SRS0=tWYm=5Y=gmail.com=jernej.skrabec@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2C67C38142
	for <soc@archiver.kernel.org>; Fri, 27 Jan 2023 20:22:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id B6A33C4339B; Fri, 27 Jan 2023 20:22:13 +0000 (UTC)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id CF4AFC433D2;
	Fri, 27 Jan 2023 20:22:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org CF4AFC433D2
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f51.google.com with SMTP id y11so5748001edd.6;
        Fri, 27 Jan 2023 12:22:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Mqf3tpDJNX5sIiyTeIYmTr7VbjdNQeu0rlBoqz1e+Q0=;
        b=KjwD47Qr6iZP/O9PFJhqPa4DXwn1l74X3nfx6kTwt+q9S7DkJW1ctaL1SAg+HarvRo
         E8mVvJB8G0aM4EzQmGTh0uF45yjqn+nDVC0/6eAe57kksR2S6u2qqOIwcSZgWdFW3Ic+
         ppvwB8u8v0YZuLJ/M88zYnWPZDekyWFImeo5gxaj3lMv1qmVWE33IHZYMQ8JX0vjY640
         2FRiGOVg4AjznpAz8uS+VyysPYvPVhD9Uo/KGFEpLBFv3PmdhrOKmeNOTasLzM2Qmb4L
         fqVMz85pS9/47JF/mmoSYodYM0xJpTbVeWczW1yEX5X21Ww0sQpz4eoYcNIdbzTf+3fs
         QRvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Mqf3tpDJNX5sIiyTeIYmTr7VbjdNQeu0rlBoqz1e+Q0=;
        b=OyLKsButKUlvvZhGuWJtJNNOpYPmR6TqgFKzLSC/oazf4I3r7YBHpxPg+RfrzaDMFW
         dvSaF/uPzT0+muM1qVKV64UBV5fXCPR/69h6/YQwZ0hGam3eJGqpx9UZOCJh1R954Gjk
         GwYBzE2xuef0fcjISAi4DYR4gEHuNYF9wWjwzVN7BJv21G8Y5CB+H2oIZcoQQgizDeq8
         28P2Y2xgzRxA0KMXQ4MSjcML9R8xEBn6kTJaV9z6dwGmf30dCSOP5FB3IfBovwnbi9ow
         6E9tmv/m70iUivl7wSu0eWTciAnfLANT1JeOiFUhcb/MXKwpFEXnOS0+k7zHwgxS+eur
         hCKw==
X-Gm-Message-State: AFqh2krdaaRt6rcFrgyYajiutx/1vmDB8kfZfaaJDmc7ZwRLX4MsP6KF
	xhxlh8mJojyqF0o6+Psa+/s=
X-Google-Smtp-Source: AMrXdXslchCqGmh70f80P2YbvDJBdxIzu+HfPexB7WQFcZPWKwYNQ5BuM/fuJwEdI0F73cI7vK1NlA==
X-Received: by 2002:a05:6402:28c6:b0:49b:98be:c38 with SMTP id ef6-20020a05640228c600b0049b98be0c38mr44822085edb.11.1674850931014;
        Fri, 27 Jan 2023 12:22:11 -0800 (PST)
Received: from jernej-laptop.localnet (82-149-19-102.dynamic.telemach.net. [82.149.19.102])
        by smtp.gmail.com with ESMTPSA id f5-20020a056402068500b0046dd0c2a08esm2861517edy.36.2023.01.27.12.22.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jan 2023 12:22:10 -0800 (PST)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Bin Liu <b-liu@ti.com>, Andre Przywara <andre.przywara@arm.com>
List-Id: <soc.lore.kernel.org>
Cc: Icenowy Zheng <uwu@icenowy.me>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, devicetree@vger.kernel.org,
 soc@kernel.org, linux-usb@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH v5 03/11] usb: musb: sunxi: Introduce config struct
Date: Fri, 27 Jan 2023 21:22:08 +0100
Message-ID: <12138531.O9o76ZdvQC@jernej-laptop>
In-Reply-To: <20230111015332.172021-4-andre.przywara@arm.com>
References:
 <20230111015332.172021-1-andre.przywara@arm.com>
 <20230111015332.172021-4-andre.przywara@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne sreda, 11. januar 2023 ob 02:53:24 CET je Andre Przywara napisal(a):
> Currently the probe routine explicitly compares the compatible string of
> the device node to figure out which features and quirks a certain
> Allwinner MUSB model requires. This gets harder to maintain for new
> SoCs.
> 
> Add a struct sunxi_musb_cfg that names the features and quirks
> explicitly, and create instances of this struct for every type of MUSB
> device we support. Then bind this to the compatible strings via the OF
> data feature.
> 
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


