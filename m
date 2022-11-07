Return-Path: <SRS0=ZBZI=3H=gmail.com=jernej.skrabec@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E639C43217
	for <soc@archiver.kernel.org>; Mon,  7 Nov 2022 17:19:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 5251FC433B5; Mon,  7 Nov 2022 17:19:32 +0000 (UTC)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 72264C433C1;
	Mon,  7 Nov 2022 17:19:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 72264C433C1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f44.google.com with SMTP id b2so31988223eja.6;
        Mon, 07 Nov 2022 09:19:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qu2FEOZRSY9IYT6eXjzTtKMMNTggAYYqVs1ygedKPq8=;
        b=eP5ltGXdVJCTEnfFtucRNeoiDO5ISElM4ZgzkK3SF43MMp6aAHv4/ErdPHVGtlA/k+
         fVY5bwSwb2xnDbU7WgI0MzBFD2e0CfvwXjQvJ8PF0YAxl3187R+6KDI6cfhDgP0ORfVY
         3R6PFcO2XHWhAXPMASTCWpAKIcOHU885WW0tkCW5Ru9//iZw1EohBjJJlCeb2X0Bk+OI
         eKJkTRWaQd9GPAybx3k9MUln2IJG9A63ws42uE3087CsVN4nu+MzvbQcnN/TSLVMIQjy
         rDzJIgswPG4pItlOEbw6HXDD6jeBUrK4WWx+T+1Qdozru/hxX769+VXqQ4nWwlqWWN/h
         /kGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qu2FEOZRSY9IYT6eXjzTtKMMNTggAYYqVs1ygedKPq8=;
        b=yw6U9z0zJpIPn91MZI+UI1wa25+UoaXDOn5enFbOu98NWSP4DIXYSkrrKJ4qrw+tZk
         l508CepU0GzYEaIi4wd5PJbcBsXzBvo4XdLi7b98m7hhyuddDWjpS76hc05N990nIO7d
         2GauicgiHmur4sTFfV+e7d7pHu+OeQkBxiiWXMibbMP0R54+m9qCjgmqoXEg2glsmYtX
         d8Q9RpuR9BCSov09/dmq4evVfHa1/5VjbzTKEH8MDoJ74UE9trsMz8jNNgiB47DNDLaf
         7MktfS336fRZpfJSfJomttZZRZPM0w0rv6DAQUbmtA8OHg9sPfdg7cnxOAKUDfm2rLeV
         sxxg==
X-Gm-Message-State: ACrzQf1tkud5fvLWCLnF/TeAkDPdrjdw5DgCVUnUv7xpiXHQEcKm+12B
	1e//UHt78B31fn1uL5n9T2I=
X-Google-Smtp-Source: AMsMyM6LCBPpdH5Hhccy3tvFaUxUzv+rtYf8WatcRANMUVqlYQrqC2RObFbO+iRqfgVOlcqQlUZMnQ==
X-Received: by 2002:a17:907:1c01:b0:79d:637c:7848 with SMTP id nc1-20020a1709071c0100b0079d637c7848mr49606542ejc.513.1667841569716;
        Mon, 07 Nov 2022 09:19:29 -0800 (PST)
Received: from kista.localnet (82-149-19-102.dynamic.telemach.net. [82.149.19.102])
        by smtp.gmail.com with ESMTPSA id r24-20020aa7da18000000b004643f1524f3sm4485651eds.44.2022.11.07.09.19.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Nov 2022 09:19:29 -0800 (PST)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Icenowy Zheng <uwu@icenowy.me>, Andre Przywara <andre.przywara@arm.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, linux-phy@lists.infradead.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH v3 06/11] ARM: dts: suniv: licheepi-nano: enable USB
Date: Mon, 07 Nov 2022 18:19:27 +0100
Message-ID: <4780198.31r3eYUQgx@kista>
In-Reply-To: <20221106154826.6687-7-andre.przywara@arm.com>
References: <20221106154826.6687-1-andre.przywara@arm.com> <20221106154826.6687-7-andre.przywara@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne nedelja, 06. november 2022 ob 16:48:21 CET je Andre Przywara napisal(a):
> From: Icenowy Zheng <uwu@icenowy.me>
> 
> Lichee Pi Nano has a Micro-USB connector, with its D+, D- pins connected
> to the USB pins of the SoC and ID pin connected to PE2 GPIO.
> 
> Enable the USB functionality.
> 
> Signed-off-by: Icenowy Zheng <uwu@icenowy.me>
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


