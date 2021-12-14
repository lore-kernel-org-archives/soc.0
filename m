Return-Path: <SRS0=TuKk=Q7=gmail.com=f.fainelli@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9174DC433EF
	for <soc@archiver.kernel.org>; Tue, 14 Dec 2021 17:13:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 5D8B1C34604; Tue, 14 Dec 2021 17:13:59 +0000 (UTC)
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id C4937C34601;
	Tue, 14 Dec 2021 17:13:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org C4937C34601
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f42.google.com with SMTP id n15-20020a17090a394f00b001b0f6d6468eso1275331pjf.3;
        Tue, 14 Dec 2021 09:13:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=tugJp5D5IpQgFg8l5QRIhJX6Y9Z0ioa0/7+gIlEz3qE=;
        b=pxsuNCJM+lU38EQM20+x9Zy1a4i80lkFsY5CK7WVgP5pX7QfaK/i6hoh62qCmZhUpt
         aQqlRTyUAuznwkwTMNd19JtdjUdmVC/uvr5cMY6tK06vfTQmNl22wBQdo9KNrEa7jHrY
         H3onaMNOuYtVNjDOKmnAqeO/G3LPQEuQaKzhe1baulW0D9n0pEaE1bYvjyjOPYc+4owY
         Ztk++SNpuRUhta7tnml+yIT52R1zHbyFLiClAiqm3oygZxCQB713/Q3Tt2RBpzotSkOe
         281nwvNxYIafT0ZqI3PqUWbXsaVXQ/KNituaHvOpNTwdKuHqEWUBMdB5JtS7YF62CBD/
         5kmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=tugJp5D5IpQgFg8l5QRIhJX6Y9Z0ioa0/7+gIlEz3qE=;
        b=uIj+nSiWNsyR/IyWUP6LJ5WiZybOP8Asl1EbjRwWfMqpKITaSJ0QvPH/iiDvFHPZoI
         U8+i+5Lmz8QUpb+4Bw4CGTw8c9tua1aSlbd3bH2rPj+5z/5ilyZW5ZxYGr/q9Egjn6Bc
         XymBzGKaDR4qe2t3WJJf970tDvHxriXEoRef9/31QNLEiYmJ4hrY//jRIWmxr2zR5JG4
         /aijeFCBcqw8H1O35877iaHQ2kSFj/UzHiUc/S2EKR/nBRKKcrl6U5/QxGIP8I24e2Xe
         bGSUZzydMTuyaECOHR8GTKmanwgnxD3RsbXH4EiVtGJJDDjas1zVSfThZOEVem+K5Qwa
         zYJw==
X-Gm-Message-State: AOAM531yDte/z12a0fnl/LUdhCSx1m/dKBax7IlqgMpTKqM3dqQq5JOl
	JdDIJKRbPOjIa+NG2sJw3AU=
X-Google-Smtp-Source: ABdhPJxpijNDMpsc1+N/NsvL3PaDQe4IvY9BU0G6YCxmaYtRdliXsYybikPTzbxuDaS5A0EHEsEdWQ==
X-Received: by 2002:a17:90a:e7d0:: with SMTP id kb16mr6963484pjb.22.1639502038302;
        Tue, 14 Dec 2021 09:13:58 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.googlemail.com with ESMTPSA id h15sm382938pfc.134.2021.12.14.09.13.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Dec 2021 09:13:57 -0800 (PST)
Subject: Re: [GIT PULL 1/1] Broadcom devicetree fixes for 5.16
List-Id: <soc.lore.kernel.org>
To: Florian Fainelli <f.fainelli@gmail.com>, soc@kernel.org
Cc: Phil Elwell <phil@raspberrypi.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Nicolas Saenz Julienne <nsaenz@kernel.org>,
 Stefan Wahren <stefan.wahren@i2se.com>,
 linux-arm-kernel@lists.infradead.org, arnd@arndb.de, olof@lixom.net,
 khilman@kernel.org, bcm-kernel-feedback-list@broadcom.com
References: <20211214033617.2979148-1-f.fainelli@gmail.com>
From: Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <e7f3edb9-4691-2136-7884-b7bea2ac892c@gmail.com>
Date: Tue, 14 Dec 2021 09:13:55 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211214033617.2979148-1-f.fainelli@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 12/13/21 7:36 PM, Florian Fainelli wrote:
> The following changes since commit 98481f3d72fb88cb5b973153434061015f094925:
> 
>   ARM: dts: bcm2711: Fix PCIe interrupts (2021-11-15 19:09:47 -0800)
> 
> are available in the Git repository at:
> 
>   https://github.com/Broadcom/stblinux.git tags/arm-soc/for-5.16/devicetree-fixes-part2
> 
> for you to fetch changes up to f1d8b8561e84c9caf3e01d726b874d80475b0ffe:
> 
>   Merge tag 'tags/bcm2835-dt-fixes-2021-12-13' into devicetree/fixes (2021-12-13 12:20:59 -0800)
> 
> ----------------------------------------------------------------
> This pull request contains Broadcom ARM-based SoCs Device Tree fixes for
> 5.16, please pull the following:
> 
> - Stefan removes a fallback compatible string for the VCIHCQ node in
>   preparation for allowing the VCIHCQ binding to be converted to YAML
> 
> - Phil fixes the GPIO expander labels for the Raspberry Pi 400 GPIO
>   expander and adds the missing 'gpio-ranges' property for the BCM283x and
>   BCM2711 Device Tree include files
> 
> ----------------------------------------------------------------
> Florian Fainelli (1):
>       Merge tag 'tags/bcm2835-dt-fixes-2021-12-13' into devicetree/fixes
> 
> Phil Elwell (2):
>       ARM: dts: bcm2711-rpi-400: Fix GPIO expander labels
>       ARM: dts: gpio-ranges property is now required

It looks like the change above needs to be accompanied by
pinctlr-bcm2835.c changes which have been applied into Linus W's tree.
Arnd, are you able to back out this pull request for the time being? I
don't believe any of those fixes are critical for v5.16.
-- 
Florian
