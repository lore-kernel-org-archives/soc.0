Return-Path: <SRS0=VGpV=D3=gmail.com=ychuang570808@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D86ADC001DE
	for <soc@archiver.kernel.org>; Thu, 10 Aug 2023 08:26:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id A142BC433C8; Thu, 10 Aug 2023 08:26:22 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id A13BDC433C7;
	Thu, 10 Aug 2023 08:26:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org A13BDC433C7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-1bc6bfc4b58so5238495ad.1;
        Thu, 10 Aug 2023 01:26:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691655981; x=1692260781;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YyYLtAiSPm/jR0Yq/J8XmIODN3EVvM9jc+bkni7Ghjg=;
        b=NcpclQmFc674BU9xqAEWd/Z9vv/QSngKSmt48UMEkeI+EUgaRrDHiYr3+PN7NFxmMI
         C1Z9B4OiWQL43DpFVoOEufXz5IgGx3avNFjyi7uOiQTOhhrpeNfCP1yVYX0QMLaBh/Bv
         gwu6T9KjIqFuolYw4GGP7ZINz3flI6rG3fFmdn/yU0IUh/ri98FDyVf1RCVaS9s7KDHe
         L7AIP2NwQvpG/ZIe2CUVsacr39zul3HOTo87EPFLyjenf+waoPsZo9UZ/zicR4/MrUjy
         R+d2H6U9NugqUvHbsQF2E1xvq10QmG7bjF/dpTaaSZ9gJcn2uWByMz0K29FxyU19Ub3A
         Po1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691655981; x=1692260781;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YyYLtAiSPm/jR0Yq/J8XmIODN3EVvM9jc+bkni7Ghjg=;
        b=UbzZk+d5aj/pK9DinyDc7z+ft6QRcmfxv9vMfriGIGUFzt27dYRLdPRHPSqpuep9Vq
         0b+HCsRWIONfxf3bGbaBy1i9+3DzOdbUYcdaQoZwJ+SvVS6XfPvKS6Gn54cT2a7UDHeE
         pCfIf9e0j1UeW/E9Hz5Dn7xo8bCUjFfKVYy4Nyab/OxAEeRKz7/SYP1SRWLYZKC9tt0x
         fL+pacV7OQrwpGyqA4iN8MyPjIIDBHqsEEH2E8eNt4sfXxZWk9w8MkYev4WVN3FNCMqr
         UqJTn4cxpFkDjzDIe/bRqVAXGEwS50u0J4zJ8JtC6Ayh+97oLqLAGNolLbSa7uTbw7EM
         Ru+g==
X-Gm-Message-State: AOJu0YyjNN7jnPpgucpMlWPeZqQ5rHstNhJI0gWbwYxDRA2ocvfo9G/D
	sTr710Ne3FI3tfDQ0CETh+U=
X-Google-Smtp-Source: AGHT+IFEOBb7J2YylGCtStfggHdcYQr2dmrb4aRn5BcqslpwODeGItvSG6+rqAUioEWA5RCqAKGXVw==
X-Received: by 2002:a17:902:ecc1:b0:1bb:a367:a77 with SMTP id a1-20020a170902ecc100b001bba3670a77mr1735345plh.31.1691655980854;
        Thu, 10 Aug 2023 01:26:20 -0700 (PDT)
Received: from [172.19.1.47] (60-250-192-107.hinet-ip.hinet.net. [60.250.192.107])
        by smtp.gmail.com with ESMTPSA id jc3-20020a17090325c300b001b86492d724sm1053650plb.223.2023.08.10.01.26.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Aug 2023 01:26:20 -0700 (PDT)
Message-ID: <fe38eff9-dff6-3128-3110-33739d8c1280@gmail.com>
Date: Thu, 10 Aug 2023 16:26:16 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [RESEND PATCH v2 3/3] rtc: Add driver for Nuvoton ma35d1 rtc
 controller
Content-Language: en-US
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
List-Id: <soc.lore.kernel.org>
Cc: a.zummo@towertech.it, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 soc@kernel.org, mjchen@nuvoton.com, schung@nuvoton.com,
 Jacky Huang <ychuang3@nuvoton.com>
References: <20230809011542.429945-1-ychuang570808@gmail.com>
 <20230809011542.429945-4-ychuang570808@gmail.com>
 <20230809021025a7c0daec@mail.local>
 <426130f6-7b8a-91f9-559b-afc5afdc656e@gmail.com>
 <2023080922515326db190e@mail.local>
 <347cf148-bda8-852b-768c-fa2b57ce5bcb@gmail.com>
 <20230810073015d5545903@mail.local>
From: Jacky Huang <ychuang570808@gmail.com>
In-Reply-To: <20230810073015d5545903@mail.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 2023/8/10 下午 03:30, Alexandre Belloni wrote:
> On 10/08/2023 15:21:47+0800, Jacky Huang wrote:
>>>>>> +	return 0;
>>>>>> +}
>>>>>> +
>>>>>> +static int ma35d1_rtc_suspend(struct platform_device *pdev, pm_message_t state)
>>>>>> +{
>>>>>> +	struct ma35_rtc *rtc = platform_get_drvdata(pdev);
>>>>>> +	u32 regval;
>>>>>> +
>>>>>> +	if (device_may_wakeup(&pdev->dev))
>>>>>> +		enable_irq_wake(rtc->irq_num);
>>>>>> +
>>>>>> +	regval = rtc_reg_read(rtc, MA35_REG_RTC_INTEN);
>>>>>> +	regval &= ~RTC_INTEN_TICKIEN;
>>>>>> +	rtc_reg_write(rtc, MA35_REG_RTC_INTEN, regval);
>>>>> This is not what the user is asking, don't do this. Also, how was this
>>>>> tested?
>>>> Sure, I will remove these three lines of code.
>>>>
>>>> We test it with "echo mem > /sys/power/state".
>>>>
>>> Yes, my point is that if UIE is enabled, then the user wants to be woken
>>> up every second. If this is not what is wanted, then UIE has to be
>>> disabled before going to suspend.
>>>
>>> My question is why are you enabling RTC_INTEN_TICKIEN in probe? I don't
>>> expect anyone to use an actual hardware tick interrupt, unless the alarm
>>> is broken and can't be set every second. This is why I questioned the
>>> RTC_UF path because I don't expect it to be taken at all.
>> Yes, we will remove TICKIEN from probe and modify ma35d1_alarm_irq_enable().
>> TICKIEN will be enabled only if UIE is enabled.
>>
>> static int ma35d1_alarm_irq_enable(struct device *dev, unsigned int enabled)
>> {
>>      struct ma35d1_rtc *rtc = dev_get_drvdata(dev);
>>
>>      if (enabled) {
>>          if (rtc->rtc->uie_rtctimer.enabled)
>>              rtc_reg_write(rtc, NVT_RTC_INTEN,
>>                        (rtc_reg_read(rtc,
>> NVT_RTC_INTEN)|(RTC_INTEN_TICKIEN)));
>
> Don't do that unless the regular alarm can't be set every second. Simply
> always use ALMIEN, then check rtctest is passing properly.

OK, I got it. I will drop the TICKINT and use ALMIEN only.

MA35D1 RTC has an alarm mask register which supports alarm mask for 
seconds, minutes, and hours.
We will use the alarm mask to have RTC generate an alarm interrupt per 
second, and make sure
the driver can pass rtctest.

>>          if (rtc->rtc->aie_timer.enabled)
>>              rtc_reg_write(rtc, NVT_RTC_INTEN,
>>                        (rtc_reg_read(rtc,
>> NVT_RTC_INTEN)|(RTC_INTEN_ALMIEN)));
>>      } else {
>>          if (rtc->rtc->uie_rtctimer.enabled)
>>              rtc_reg_write(rtc, NVT_RTC_INTEN,
>>                        (rtc_reg_read(rtc, NVT_RTC_INTEN) &
>> (~RTC_INTEN_TICKIEN)));
>>          if (rtc->rtc->aie_timer.enabled)
>>              rtc_reg_write(rtc, NVT_RTC_INTEN,
>>                        (rtc_reg_read(rtc, NVT_RTC_INTEN) &
>> (~RTC_INTEN_ALMIEN)));
>>      }
>>      return 0;
>> }
>>


Best Regards,
Jacky Huang

