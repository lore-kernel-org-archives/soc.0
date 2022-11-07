Return-Path: <SRS0=ZBZI=3H=gmail.com=jernej.skrabec@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F54AC433FE
	for <soc@archiver.kernel.org>; Mon,  7 Nov 2022 17:19:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id EEE49C433C1; Mon,  7 Nov 2022 17:19:07 +0000 (UTC)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id E42E2C433D6;
	Mon,  7 Nov 2022 17:19:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org E42E2C433D6
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f50.google.com with SMTP id s12so9061525edd.5;
        Mon, 07 Nov 2022 09:19:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WABWUxZUHt8M//n3pzxOX7MgxD/7jpIO4F4+cpbuU8Q=;
        b=cpl9IXvObpPpjDH3q0oTFikx4eVLJa54BcB/VF0a60o7zdTUxUZjVIJCeZu8YGuHkd
         amLM3TtYK/VXTOi1Ex9hUPMTvVoRB36Nm6yAMunAenrqLerTNX8L1TvFt2mxvodyttp2
         ZGuky8vhB+yro3tgFDE38RD+V3wDU+eTW8Lmz3XeS+W0oIfEwcwYIkjg3MOeSjgHZZlQ
         Nav/8phCbPoH7E6RoJv4xH4jtV3IViXN+pxzSMBkQSol8Zt5PVE7pGXJmmSlGqAyW/Rz
         PIPEyRWHpePO6Cx0T8nawzfcZCFn5wHF1gcheffTNhyB1m998KTAvmVxcYbVK3iUHTwT
         njfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WABWUxZUHt8M//n3pzxOX7MgxD/7jpIO4F4+cpbuU8Q=;
        b=laa+SshyyhCCTmRJ2WIcxIyZ5fiGLohMYl+PSwqPHnwD3M1AYzXPfu3ilBWgK8Df5f
         ozVjU6nuZogKca+tSY6WNMY5kIFqyPXLQqAecGKfLBhzsIHmjyQUGzC9oluRVgpMbOl/
         bhPO9wwIcBj+oabvPk43/o84OiEMxenHwpM+lrxHurYkW3Vs5SMM7nOQp1hBxWC4KS+P
         o8ZRtKmYi5QQ0Z5zaLn+bf5l282Z3KJeOveSJLt1St2tUgsx7d1kIRwBgdd+zSXgAXqW
         EvDHFmjA5jZGMN2qyOKwnVLMUqvpOoo134WXROSbobKfb7dZjhxMvHDFpRGd0MIF31pH
         77sw==
X-Gm-Message-State: ACrzQf1AuLn/jZ+I0shvJR2ah2S210cS2j6p5PVbz4+TmoPd2bJzCAc/
	zd2HXA2Ob6V2TsDvNw4/EXpg5vtOzQk=
X-Google-Smtp-Source: AMsMyM5VWvezBWyZBcC5CBPMjq7W4wsBETjGxm7Jxg6eDUizPN9CQhdCoHHadTq4T1yOhrqyQQBoUQ==
X-Received: by 2002:aa7:cfda:0:b0:461:9d22:3484 with SMTP id r26-20020aa7cfda000000b004619d223484mr53028888edy.142.1667841545234;
        Mon, 07 Nov 2022 09:19:05 -0800 (PST)
Received: from kista.localnet (82-149-19-102.dynamic.telemach.net. [82.149.19.102])
        by smtp.gmail.com with ESMTPSA id eh9-20020a0564020f8900b004587f9d3ce8sm4471906edb.56.2022.11.07.09.19.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Nov 2022 09:19:04 -0800 (PST)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Icenowy Zheng <uwu@icenowy.me>, Andre Przywara <andre.przywara@arm.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, linux-phy@lists.infradead.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH v3 05/11] ARM: dts: suniv: add USB-related device nodes
Date: Mon, 07 Nov 2022 18:19:03 +0100
Message-ID: <5616911.DvuYhMxLoT@kista>
In-Reply-To: <20221106154826.6687-6-andre.przywara@arm.com>
References: <20221106154826.6687-1-andre.przywara@arm.com> <20221106154826.6687-6-andre.przywara@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne nedelja, 06. november 2022 ob 16:48:20 CET je Andre Przywara napisal(a):
> From: Icenowy Zheng <uwu@icenowy.me>
> 
> The suniv SoC has a USB OTG controller and a USB PHY like other
> Allwinner SoCs.
> 
> Add their device tree node.
> 
> Signed-off-by: Icenowy Zheng <uwu@icenowy.me>
> Reviewed-by: Andre Przywara <andre.przywara@arm.com>
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


