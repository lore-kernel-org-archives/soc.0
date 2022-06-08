Return-Path: <SRS0=cZg1=WP=gmail.com=f.fainelli@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 435ACCCA47B
	for <soc@archiver.kernel.org>; Wed,  8 Jun 2022 09:10:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 11C0FC341C4; Wed,  8 Jun 2022 09:10:58 +0000 (UTC)
Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com [209.85.221.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 6DBEEC34116;
	Wed,  8 Jun 2022 09:10:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 6DBEEC34116
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f180.google.com with SMTP id e7so8742106vkh.2;
        Wed, 08 Jun 2022 02:10:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=dOhE7tBwUTzDHWJUqlLa6u3BtIc9nsfJZSTQNm4ba5s=;
        b=iJ8scK9JvwTKON3zTMv69x4wn3FhcGd2sCC/5gGerOZqlGfFz1safQNPxQF1mBLT5u
         Z1QauknMoPojSUEPi8EPes4qWFIsuq1204M2K1GKuC5cNSkBKxcSQStdt9VeFN/pmXlI
         JPVikob4kmQtEh3VQxF3XNpPGs6bHwl22MgMw//vX+PxVh2Gh3sytSxB2CTiohYvndoD
         4y2vHk4cE+gmH3xkXPkMsdpODnkLjVNzEkVjrTqKjjs6UN9jUIRwxyioEMmfFlwjOg7P
         JkuD4gAbI86R5Jvkx2igqOsQh/f1nrDBebofmfCZEJ3a0Y3TJhWHnbrqrssiwOv7RcZN
         qbyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=dOhE7tBwUTzDHWJUqlLa6u3BtIc9nsfJZSTQNm4ba5s=;
        b=noPEZxWDHWAWmGfS+M0dAbHG4bOrZMKMOlkaYnzN4i+we2tdc7K51rrqGfE2Y+H8N5
         36FSUi8aONAkT41lwpqs0UbkManZbhXWxdldttxBRKv1vzxEbjt8t1/PUG07r+MtM2bW
         Y6LBdT7TWCnNiexKLNiepy4m4OVb0qKCLPJC1R43yWMT/pbFdA8pFbLsASfWvcst19Pj
         BoLS5X7kWsXsRRvBCL+JP/W/HSCu3+6YLkEh91/uZ0ecsn160SgsuoSwIGdQozc6jXhc
         DlZbecGl/JKS+DMpseb8cnlOjSjEoM3V7XmYBGNaa9roY2Gaye0tZAAjyT+H1jtB+Cgf
         tYGw==
X-Gm-Message-State: AOAM530aC2EvQjNHko330UKaqk1HpJNIu2V2JU412L4T25DAuqZdFwVq
	MzGlapqAQRc7TLrbadf9MAC173qEIrB18w==
X-Google-Smtp-Source: ABdhPJzCXKta5zQGCjhIQCXPTCuWYd960sfiUBlkfcNP+PixBw4B5zF8JX2RhzfRKzdGn2YxPO8/Jg==
X-Received: by 2002:a1f:adc6:0:b0:35e:588:2ece with SMTP id w189-20020a1fadc6000000b0035e05882ecemr6492212vke.27.1654679456306;
        Wed, 08 Jun 2022 02:10:56 -0700 (PDT)
Received: from [10.230.29.214] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id q130-20020a1f5c88000000b00351bcf78967sm3461307vkb.9.2022.06.08.02.10.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Jun 2022 02:10:55 -0700 (PDT)
Message-ID: <98f4a12e-bcce-6cad-f976-a4313f9a8000@gmail.com>
Date: Wed, 8 Jun 2022 11:10:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v4 0/3] arm: bcmbca: add bcm6878 soc support
Content-Language: en-US
To: Anand Gore <anand.gore@broadcom.com>,
 Linux ARM List <linux-arm-kernel@lists.infradead.org>
List-Id: <soc.lore.kernel.org>
Cc: kursad.oney@broadcom.com, tomer.yacoby@broadcom.com,
 samyon.furman@broadcom.com, dan.beygelman@broadcom.com,
 William Zhang <william.zhang@broadcom.com>, joel.peshkin@broadcom.com,
 Arnd Bergmann <arnd@arndb.de>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Olof Johansson <olof@lixom.net>, Rob Herring <robh+dt@kernel.org>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, soc@kernel.org
References: <20220602221646.3127512-1-anand.gore@broadcom.com>
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <20220602221646.3127512-1-anand.gore@broadcom.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 6/3/2022 12:16 AM, Anand Gore wrote:
> 
> The initial support includes a bare-bone dts
> for dual core ARM v7  with a pl011 uart.
> 
> Changes in v4:
> - Fixed subject line
> 
> Changes in v3:
> - Simplify subject line
> 
> Changes in v2:
> - Fix psci, GIC dts entries
> - Remove extra empty lines
> 
> Anand Gore (3):
>    ARM: dts: add dts files for bcmbca soc 6878
>    dt-bindings: arm: add BCM6878 soc
>    MAINTAINERS: add bcm6878 to bcmbca arch entry

Series applied, thanks Anand!
-- 
Florian
