Return-Path: <SRS0=h569=UG=gmail.com=mr.bossman075@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6288CC433EF
	for <soc@archiver.kernel.org>; Sun, 27 Mar 2022 19:37:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 22082C34111; Sun, 27 Mar 2022 19:37:27 +0000 (UTC)
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 6C6DEC340EC;
	Sun, 27 Mar 2022 19:37:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 6C6DEC340EC
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f51.google.com with SMTP id gi14so10424711qvb.0;
        Sun, 27 Mar 2022 12:37:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=3LGWRyBg498oI15siqEI2qDGC/+DOtozsBR92XCmBsU=;
        b=HvR2BdqDuXoDn7s/RJaxGRdDiQ8s7ibNyBlLGVT/2mRnuxbocB5kCwWbn2XrfkDj0e
         UvRO7GCfe7sm/iFJj4PUgMeewwoGk6cYkvL1Z2LliGL7WOuct7Fw2Kp1bvEXKzNrKbwS
         eRtSqWyihkatQCxMYRbgo8DULW6mJFFXMkYNdzkt2x+5jOS7xR+xY9yZlQVXls76RSlE
         DrzxirTZJmfhMgWjnjL11ZjCLqQZ6/i7eHiPsd/3uaN7BJs+00drEf6T/AzR/sL25hGw
         dnxAVLacJ1154l4zbfkGFZV3WrphXSO0LXgKIJ76J/funtKRFnPWYzEv6wWQNe+w/bzd
         LNUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=3LGWRyBg498oI15siqEI2qDGC/+DOtozsBR92XCmBsU=;
        b=5GL/3kVE6av8Iu8FOdFKODTCf041LaxMCSCXQ+Z6ffSn0Xl63e5I/j+K/cO1ahZYYF
         n35E36MTWLEjPyprY9iGnQ9Udmi5S9w+KG+8n6XXAq8uYun4QX7AUPq7Os0jKmjj7R4v
         RaCf5RwbWnwkuX9v9V/sO6Jn1ZtN9PzrQDKfswj8ds73BBm3cMS1G5HI8Wg/UlflFLC3
         Y41XscnCNOPM4ba0GoLWnN8D/RUSTqEi/gqhWceXi0a5HrVxLkR3n+fN5W8qFnYRObYO
         ggp9Kn+HI2VbkAZMgz/LToiPfvSVWAgatfB1fJ/oDuHepNtd3uoQhoxbgsQ96gAtEDe+
         SeXQ==
X-Gm-Message-State: AOAM532evzGoFd1DPfNLTc7JDuBaSm9rd5tKD1DpbC18vKiHDSTKDOEq
	hbbZLZzZFVrcmdr2PKT2h1knHAw5kENaQA==
X-Google-Smtp-Source: ABdhPJxd6tqj7Og+iyIogF+nY04/PBPZLgwZ92dFQF0iQiPdoq9V/v5yEytWmy8V14oOdtBm7HkfIQ==
X-Received: by 2002:ad4:5dec:0:b0:441:5ffb:450e with SMTP id jn12-20020ad45dec000000b004415ffb450emr18123790qvb.28.1648409845172;
        Sun, 27 Mar 2022 12:37:25 -0700 (PDT)
Received: from [10.4.10.38] (146-115-144-188.s4282.c3-0.nwt-cbr1.sbo-nwt.ma.cable.rcncustomer.com. [146.115.144.188])
        by smtp.gmail.com with ESMTPSA id r21-20020a37a815000000b0067d15afb9ebsm7188902qke.90.2022.03.27.12.37.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 27 Mar 2022 12:37:24 -0700 (PDT)
Message-ID: <88b18cf2-1fa6-ec0b-7ff1-bbc2ffe0d235@gmail.com>
Date: Sun, 27 Mar 2022 15:37:19 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v1 12/12] ARM: imxrt_defconfig: Add i.MXRT1170
Content-Language: en-US
To: Krzysztof Kozlowski <krzk@kernel.org>, linux-imx@nxp.com
List-Id: <soc.lore.kernel.org>
Cc: robh+dt@kernel.org, mturquette@baylibre.com, sboyd@kernel.org,
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, aisheng.dong@nxp.com, stefan@agner.ch,
 linus.walleij@linaro.org, daniel.lezcano@linaro.org, tglx@linutronix.de,
 arnd@arndb.de, olof@lixom.net, soc@kernel.org, linux@armlinux.org.uk,
 abel.vesa@nxp.com, dev@lynxeye.de, marcel.ziswiler@toradex.com,
 tharvey@gateworks.com, leoyang.li@nxp.com, sebastian.reichel@collabora.com,
 cniedermaier@dh-electronics.com, clin@suse.com,
 giulio.benetti@benettiengineering.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org
References: <20220326144313.673549-1-Mr.Bossman075@gmail.com>
 <20220326144313.673549-13-Mr.Bossman075@gmail.com>
 <0ed1a650-d3e3-6ee1-05db-b3760b3cd245@kernel.org>
From: Jesse Taube <mr.bossman075@gmail.com>
In-Reply-To: <0ed1a650-d3e3-6ee1-05db-b3760b3cd245@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 3/27/22 15:23, Krzysztof Kozlowski wrote:
> On 26/03/2022 15:43, Jesse Taube wrote:
>> Add i.MXRT1170 pinctrl, clocks and USB to imxrt_defconfig.
> 
> You add many more i.IMX unrelated functions, like USB gadgets. Please
> explain in commit msg why do you need them.
CONFIG_USB_CONFIGFS selects them because it has OTG support.
I used CONFIG_USB_MASS_STORAGE to test.
I can remove them.
> 
> Best regards,
> Krzysztof
