Return-Path: <SRS0=aCAB=V2=gmail.com=f.fainelli@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AE8EC433EF
	for <soc@archiver.kernel.org>; Wed, 18 May 2022 19:52:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 224CCC34113; Wed, 18 May 2022 19:52:09 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 66374C385A5;
	Wed, 18 May 2022 19:52:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 66374C385A5
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f171.google.com with SMTP id q4so2751195plr.11;
        Wed, 18 May 2022 12:52:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=GxedodxFdhzBp/djqzdFc+iR49snd3BMQcMfxH7E1es=;
        b=oGW30oQA8EfMQTWzEn0KKd/uxqPc/Adj+fl4afn9rjC4o60ZKMKqyikXU6hFqpkvJu
         LywN+CZa7sdKbi/gzXt/o02bkpcgutJcXQ5bn5OvBBu3JDUHzTO8iGsXEtfv9nmUj5bj
         oq293MIfLn0yuer2iqwK9D27KLAVNhrRlbkk+J1dnA2QKciUivHbQVJNvnjfTIGedp43
         mdD6nEBo5eecG7isM6Bern8ehdnRHC54gGXZXOjGtxGn8Diuj+dH5JJ/L1CShDWEEUDG
         jPgzYEvMTHE4nJ3Zj8tO72t8xuXlXVh4AUKEsy3pFLO3tfzpsXKwDjDSVjzWuZAk+oaa
         hN5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=GxedodxFdhzBp/djqzdFc+iR49snd3BMQcMfxH7E1es=;
        b=GpAfWFi4GO9n5bkSWs0eIeVp1jsTzPmwo5Gly3exovd1DIFVECtKDOtVFF6XbtBBUL
         CsjXWUA6lPNt46Cuid2VND22nLoi3aEtVARXgULlKWQeuF/MMLEM7JU4A2G4Ir4OkDm/
         4Q5ZR6R5eTlJj94ZZjclhfZ05rT0Y73I7AHwRK2+D8F+k3JcdSBuLYAAW3sT2Oeg8QNS
         yAZGYqN1rA2KvEGDBEBzm00vMocrJA8t7kA3JKNaw1PL/0G9eIXMmxcIZmOw6yU4WeCc
         0s2L8csp2CbR7gizN3cLo+BFqI9wdwboFTUyZrOv5WoS0DiM8hTNJPtGLj74nx3iWv/z
         YkkA==
X-Gm-Message-State: AOAM530F6iMILqxsdl/Zt3SY4tZu41PJgjCQaro7DFzQfqmtWIramgOU
	X3UcQVrVVVNHyqXdDlDM7vM=
X-Google-Smtp-Source: ABdhPJwlTrFcINrBaDMLYRh7G8hnJCLplthRg9PYNGxxRUQ1yNoXG+hHIs7A3NfPM4OYbdiygLUJHg==
X-Received: by 2002:a17:90b:3851:b0:1dc:4f70:1cb with SMTP id nl17-20020a17090b385100b001dc4f7001cbmr1652449pjb.167.1652903527767;
        Wed, 18 May 2022 12:52:07 -0700 (PDT)
Received: from [192.168.1.3] (ip72-194-116-95.oc.oc.cox.net. [72.194.116.95])
        by smtp.gmail.com with ESMTPSA id e14-20020a17090301ce00b0016194c1df58sm2171449plh.105.2022.05.18.12.52.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 May 2022 12:52:06 -0700 (PDT)
Message-ID: <2cfbf1a0-2cef-057d-dce4-13ee50c626d7@gmail.com>
Date: Wed, 18 May 2022 12:52:04 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH RESEND 0/2] arm/arm64: dts: Enable device-tree overlay
 support for RPi devices
Content-Language: en-US
To: Aurelien Jarno <aurelien@aurel32.net>, Arnd Bergmann <arnd@arndb.de>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Olof Johansson <olof@lixom.net>,
 Rob Herring <robh+dt@kernel.org>, bcm-kernel-feedback-list@broadcom.com
List-Id: <soc.lore.kernel.org>
Cc: Stefan Wahren <stefan.wahren@i2se.com>,
 Nicolas Saenz Julienne <nsaenz@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>, devicetree@vger.kernel.org,
 Phil Elwell <phil@raspberrypi.com>, linux-arm-kernel@lists.infradead.org,
 linux-rpi-kernel@lists.infradead.org, soc@kernel.org
References: <20220427233607.1225419-1-aurelien@aurel32.net>
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <20220427233607.1225419-1-aurelien@aurel32.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 4/27/2022 4:36 PM, Aurelien Jarno wrote:
> This patchset changes the generation of the Raspberry Pi devices DTB
> files to improve the support for out-of-tree device-tree overlays, like
> it has recently been done for the Nvidia SoCs.
> 
> I personally only need that for arm64, but I have added a similar patch
> to do the same on arm.

This looks good to me, Rob, does that approach work for you?
-- 
Florian
