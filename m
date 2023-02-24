Return-Path: <SRS0=JI4/=6U=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23172C677F1
	for <soc@archiver.kernel.org>; Fri, 24 Feb 2023 08:42:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id E264BC4339E; Fri, 24 Feb 2023 08:42:24 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 48AF6C433D2
	for <soc@kernel.org>; Fri, 24 Feb 2023 08:42:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 48AF6C433D2
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f51.google.com with SMTP id r7so12944609wrz.6
        for <soc@kernel.org>; Fri, 24 Feb 2023 00:42:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vBx9UiFMgKx7MHfRBNSO2Ju8FpSd91OMyvhN2TPtMOk=;
        b=VTNmmztNn6X7ALS6Sx0lpZfz5QE5Kb5S+TspEibgAIE/iT0cP1vAID5pwQNIWRd/dO
         B9/hZhd8GFtCoZsxM1YVEkNdxOWyv1DbEStHtFDf1b9YixNoUBPA3QZK8S5IYfZoo2Kz
         FVNi/V3u4kXlqO2oimZTA3Mm0tfYnuqpazRZBrR1ycB+cbDgKXtmjkXT3+OnPqvC/phq
         v3EkuX4cKtvgyCpGvzIlsfxJBHO4C/HQPMY4pPDpxz4McM1CZiLeLqZM5Ma4vUQhoAHQ
         2CNq1v5CklsoYIyUzpB6Mv+XXYlobR+TUrT1H2S3s7ti8Pz497m0MQKmBY8calgUj44O
         59CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vBx9UiFMgKx7MHfRBNSO2Ju8FpSd91OMyvhN2TPtMOk=;
        b=HdqCMH4rEdIdkj2+xqRSa9p0zP7nPss1hV2Kq7iheYuvI2NGipjApONYx1Jd2UHH01
         CRZgmoQ+9/adK9e16s2uIM3+sqk3hnVwRtZEw32Xr4uzzTKa9JELgQmvp6oKBdds7/wr
         C1GpxOmSd4SpeOkmurHeyCixSUvEFrD/GZnfuP6I6MX2lCCCI7nm5WooaQ2ItqBxsXTF
         Lf9JGEKC6iPC8PS0Ks8RZ8RgqbcUhzKWqyHFIpZc9IpjtTbROgfUOY2AO/mIEyjewzk6
         gcqjdrk0Jch+MO2SmvG5Oy61KBUSkWPxnWea7wxQaIOIMSNOkAWUYHewZp8ZMWaDLjjE
         v7qg==
X-Gm-Message-State: AO0yUKUmOdDouhOBppx+n79GKEvFvwFO9oQubIOr/mRm7OHlMwVEojLf
	IVyDCxuhI/hsV25qAwJGNqhv5Q==
X-Google-Smtp-Source: AK7set/65mnX3b6cw7jED41bV+vyvQWAktq4fQUhk3c70Aomjf0BMQi4v0uEJqBaftt77pGW8E8t6Q==
X-Received: by 2002:a5d:4dd1:0:b0:2c7:a39:6e30 with SMTP id f17-20020a5d4dd1000000b002c70a396e30mr7203011wru.38.1677228141463;
        Fri, 24 Feb 2023 00:42:21 -0800 (PST)
Received: from [192.168.1.20] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id a16-20020adffb90000000b002c54c92e125sm11258156wrr.46.2023.02.24.00.42.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Feb 2023 00:42:19 -0800 (PST)
Message-ID: <24d1b652-e3bc-5638-facb-231a4bcaf9c6@linaro.org>
Date: Fri, 24 Feb 2023 09:42:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH RESEND 1/8] dt-bindings: leds: register-bit-led: Add
 active-low property
Content-Language: en-US
To: Linus Walleij <linus.walleij@linaro.org>, =?UTF-8?Q?Pali_Roh=c3=a1r?=
 <pali@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Rob Herring <robh+dt@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: Lee Jones <lee@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 soc@kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20221226123630.6515-1-pali@kernel.org>
 <20221226123630.6515-2-pali@kernel.org> <Y9OycfvJEZ3tX/xm@google.com>
 <Y/d2vNUeuQTwQ2VG@google.com> <20230223164833.bsaqwgevphnsenal@pali>
 <CACRpkda8QQZrUkcKKvQ1z1u9X-uOrL-VAVgfkrgU3E+ihJ-YDA@mail.gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <CACRpkda8QQZrUkcKKvQ1z1u9X-uOrL-VAVgfkrgU3E+ihJ-YDA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 23/02/2023 21:59, Linus Walleij wrote:
> On Thu, Feb 23, 2023 at 5:48 PM Pali Rohár <pali@kernel.org> wrote:
>> On Thursday 23 February 2023 14:22:52 Lee Jones wrote:
>>> On Fri, 27 Jan 2023, Lee Jones wrote:
>>>
>>>> On Mon, 26 Dec 2022, Pali Rohár wrote:
>>>>
>>>>> Allow to define inverted logic (0 - enable LED, 1 - disable LED) via
>>>>> active-low property.
>>>>>
>>>>> Signed-off-by: Pali Rohár <pali@kernel.org>
>>>>> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
>>>>> ---
>>>>>  Documentation/devicetree/bindings/leds/register-bit-led.yaml | 5 +++++
>>>>>  1 file changed, 5 insertions(+)
>>>>
>>>> Needs a DT Ack (now Cc:ed)
>>>
>>> I can't do anything with this set until we have a DT Ack.
>>>
>>> If you don't receive one soon, I'd suggest resending the set again with
>>> all of the DT people on Cc that it should have been sent to in the first
>>> place.
>>
>> (Re)Sending one email multiple times is against email etiquette,
>> moreover it is spam technique and reason for marking sender on the
>> blacklist.
> 
> No problem on the kernel mailing lists actually, we love to mail
> bomb each other here. Yeah maybe we are a bit weird :/
> 
>> Moreover I have already sent it more than one time. DT people are known
>> to not respond to patches and pull requests and I have no motivation to
>> send reminder emails for them for more than half of year.

Is this a joke? You got here response within one day!

Sent: 18th of August
Reviewed-by: 19th of August

https://lore.kernel.org/all/f635d5a7-6817-cd62-e395-63e346775716@linaro.org/

You ignored the tag and then ignored the process and not Cc'ed us. Yet
you complain that someone did not respond to your emails. Really?


>>
>> So I would suggest to not send emails to people who just do not want to
>> receive or read emails. It is logical reaction.
>>
>> This patch is here for more than 6 months, so I do not see reason why to
>> wait for Godot. Rather move forward than stepping at the same position.
> 
> I understand that it is annoying.
> 
> In my experience Krzysztof and Rob (now added on To) are usually
> quite responsive and helpful, so something must have made them
> miss it I think.
> 
> As subsystem maintainer, if the DT reviewers haven't said anything
> in ~2 weeks I tend to sanity check the binding as best I can and then
> merge it. The bigger and more complex it is the more hesitant I get to
> do this...

Yeah... this patch was never sent to us, thus regardless how hard we
work, it would be quite difficult to answer emails which we never received.

Best regards,
Krzysztof

