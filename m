Return-Path: <SRS0=XNjI=ZS=gmail.com=f.fainelli@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A180ECAAA1
	for <soc@archiver.kernel.org>; Thu, 15 Sep 2022 20:52:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 3BC4CC433B5; Thu, 15 Sep 2022 20:52:20 +0000 (UTC)
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id AF1D2C433D7;
	Thu, 15 Sep 2022 20:52:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org AF1D2C433D7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f44.google.com with SMTP id m9so15178345qvv.7;
        Thu, 15 Sep 2022 13:52:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=h6GP7OMr98DgtTyeApOsh0thg3e2Q1uN92gwxmTHO34=;
        b=E8Ap1REycdzFe39/XRMw1m1jAGKPXO/Uq4k6BR2syVJGth1OWVrqSyDtMVnyFx6j1P
         RrlIKjS/XINphFZXfY7elpDMuu55ePnAnFjoo7gmStlr/a/7ugzN2xA4/kdxBPcIePYU
         4RdkcoDZZ42InaqgiRbungzUAuoKNt+MBEaKxUag6+VZ7zHRdmTfROd+nIaup5CVeHVW
         FzrEHpQZWhj9gF/leIwJm57jv/Jka26UbRJUjc70GE7PJsFVgr34cXtvZ2i3Np35ZMnH
         s4RdZfH4kUSdVD5wV/rqixuKJeL7VmG3rmhpi85EhcaP58MPFvJHQivgoD9LV+K29xSJ
         nC3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=h6GP7OMr98DgtTyeApOsh0thg3e2Q1uN92gwxmTHO34=;
        b=Zf/8adZJHN3Ie+xfegho3QfLoSjCHBJCYOJrRuQnR86NDaoHxhUdU5Boz/uU2IiCKo
         sX4ir9WjYK2ySf5GK0knyhoeEJqQ9i8lB47m2GuAV0HBV2FVpG6mcyfiXwSR2leA02KU
         3QX+iywIF5OnN425HAYtOXOBGzF+vgOYc5ckxQ4rsWnxN2wWhaEVg+nraoC0b+yfpiqW
         X7X9i/RFPW6DwZQFjtYWQY3MHHJfRvpboVZddKaRoDjWtnzzD74Bk5SIxuy6FYGb45IA
         s89mtRQ6W3U8BI8Dg7rErQtGAxWi16kgLiemHBjgu/X+Z6/aLWCzil6VgOZfKOiMU2Y6
         VfjQ==
X-Gm-Message-State: ACrzQf0BTJHJWief8E/RzQmtWVcEma1H58kpQ24AAAN6Py2oy5YRNeGD
	jaO1HuxVSCFuI6A6jc8yMy0=
X-Google-Smtp-Source: AMsMyM4Z5cKWgJDetP3HbLHXQcRthknzjqVa+UA9gJLy0QHWAFQ+GqDV40URFEaPLuktx3ogjxJ7Hg==
X-Received: by 2002:ad4:5ae8:0:b0:4aa:af21:b43c with SMTP id c8-20020ad45ae8000000b004aaaf21b43cmr1266892qvh.36.1663275137671;
        Thu, 15 Sep 2022 13:52:17 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.googlemail.com with ESMTPSA id w8-20020a05620a424800b006ce5fe31c2dsm5069897qko.65.2022.09.15.13.52.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Sep 2022 13:52:17 -0700 (PDT)
Message-ID: <3dc9d86d-7b98-33ab-880e-a9584b8fac4b@gmail.com>
Date: Thu, 15 Sep 2022 13:52:12 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 2/2] arm64: Kconfig.platforms: Group NXP platforms
 together
Content-Language: en-US
To: Olof Johansson <olof@lixom.net>
List-Id: <soc.lore.kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, soc@kernel.org,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 open list <linux-kernel@vger.kernel.org>, krzysztof.kozlowski@linaro.org,
 arnd@arndb.de, Geert Uytterhoeven <geert@linux-m68k.org>,
 william.zhang@broadcom.com, anand.gore@broadcom.com
References: <20220829173830.3567047-1-f.fainelli@gmail.com>
 <20220829173830.3567047-3-f.fainelli@gmail.com> <YyNN/IZgOAlbSHnF@lx2k>
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <YyNN/IZgOAlbSHnF@lx2k>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/15/22 09:08, Olof Johansson wrote:
> On Mon, Aug 29, 2022 at 10:38:29AM -0700, Florian Fainelli wrote:
>> Group the three NXP platforms under an ARCH_NXP menuconfig symbol to
>> make make selection of similar vendor SoCs visually nicer.
>>
>> Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
> 
> Hi,
> 
> While these are convenient if they're done right from the beginning, the result
> of adding a new dependency like this is that old defconfigs stop working if you
> just go with the default.
> 
> Was there a reason to group these now and cause this config churn for
> downstream users?

No reason to cause churn, and no specific reason other than visually and 
logically group options from the same vendors. I had clearly not 
anticipated the defconfig breakage, too bad that Kconfig does not allow 
menuconfig items to be enabled by default, or does it?
-- 
Florian
