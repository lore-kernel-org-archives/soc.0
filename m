Return-Path: <SRS0=H9dK=3J=gmail.com=joel.stan@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D67C8C433FE
	for <soc@archiver.kernel.org>; Wed,  9 Nov 2022 23:55:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 960BAC43470; Wed,  9 Nov 2022 23:55:35 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 60071C433D7;
	Wed,  9 Nov 2022 23:55:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 60071C433D7
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f46.google.com with SMTP id l39-20020a05600c1d2700b003cf93c8156dso120661wms.4;
        Wed, 09 Nov 2022 15:55:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=j51pcpmAt7rygikiVDfge95qbdKBtRf/PjFzkYZrMnc=;
        b=Wd6ppp30utQntCUqz+qW2cMWBmwMs+rr95pprrQ4BHDRQxjd30vD6E/xLK0J4s5ygs
         XFdDT1RYyNMEv8ooKTwg21fWqx4yPRayjTX94hEsCfgP+jITqGcRlT5SkL5BNMlzhTL4
         KN621bpyhvV2Z759F5e+QYGQ6fKGmRLziziwM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j51pcpmAt7rygikiVDfge95qbdKBtRf/PjFzkYZrMnc=;
        b=3miBnFZsy3ZFw9VxaVJ4PpPw2ZAGgIe54LGCROB9wSOPhX1DRAe9OBpxJToI23ZcLt
         ntzH9/LksovGtlC6kQAN1FdveYyNLyk4GjZs3/NNALpW10wbWjbLKoiRKRXGQt2PPu/C
         tiPovB89IP60bPzE0mDyo/lDyF+O0XF+CNpvvQaV49LsVbBT+m46+LxKXvu6bZ4q2YXT
         3aWfTkCVcFgc7JD69b1kq7GiDk3vUiHLEEhNkP4bSNkM3w47XG+Q6txG0fIzZmhM2pC0
         +uCgxqBSqsibV01GYPfFaIx9Kv2xQuXtDSUB/WfFp5RsofzT4LNqCVmufC+COyiLRCnk
         zzCA==
X-Gm-Message-State: ACrzQf3OOCY1bXs0oIAnZIcg3h/xoaqpj0pCa7B11ZZr57Po3lvaUsoi
	1CBvPYhDwJ+IRKznnb/9qbEiHs5/3IcDP5MVKqE=
X-Google-Smtp-Source: AMsMyM633cR3aqFZIJs92t3FJDeCnj/48LR9q/mCiFCWUWAAUvWB71S7IrPEET1nrwzBbJA7zpjBPNFK4ve3y4WY6Cg=
X-Received: by 2002:a05:600c:a46:b0:3b9:9b97:9304 with SMTP id
 c6-20020a05600c0a4600b003b99b979304mr41506443wmq.34.1668038131488; Wed, 09
 Nov 2022 15:55:31 -0800 (PST)
MIME-Version: 1.0
References: <20221108001551.18175-1-zev@bewilderbeest.net>
In-Reply-To: <20221108001551.18175-1-zev@bewilderbeest.net>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 9 Nov 2022 23:55:19 +0000
Message-ID: <CACPK8XeKA+rFwOGCZam2XZh9v8OndyZeE2sk4-3nb-rKdNeDBA@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] ARM: dts: aspeed: Add Delta AHE-50DC BMC
To: Zev Weiss <zev@bewilderbeest.net>
List-Id: <soc.lore.kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
	soc@kernel.org, Andrew Jeffery <andrew@aj.id.au>, Arnd Bergmann <arnd@arndb.de>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Olof Johansson <olof@lixom.net>, 
	Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 8 Nov 2022 at 00:16, Zev Weiss <zev@bewilderbeest.net> wrote:
>
> Hello,
>
> This series adds a device-tree for the BMCs of the Delta AHE-50DC
> Open19 power shelf.  The first patch adds a compat entry to the Aspeed
> bindings; the second adds the device-tree itself.
>
> Changes since v1 [0]:
>  - rearranged patch 2 with macros to reduce boilerplate
>  - added ack from Krzysztof on patch 1

Looks good to me, I've put it in the aspeed tree for 6.2.

>
> Thanks,
> Zev
>
> [0] https://lore.kernel.org/lkml/20221105013321.2719-1-zev@bewilderbeest.net/T/
>
> Zev Weiss (2):
>   dt-bindings: arm: aspeed: document Delta AHE-50DC BMC
>   ARM: dts: aspeed: Add Delta AHE-50DC BMC
>
>  .../bindings/arm/aspeed/aspeed.yaml           |   1 +
>  arch/arm/boot/dts/Makefile                    |   1 +
>  .../arm/boot/dts/aspeed-bmc-delta-ahe50dc.dts | 418 ++++++++++++++++++
>  3 files changed, 420 insertions(+)
>  create mode 100644 arch/arm/boot/dts/aspeed-bmc-delta-ahe50dc.dts
>
> --
> 2.38.1
>
