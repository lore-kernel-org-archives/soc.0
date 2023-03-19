Return-Path: <SRS0=S7z/=7L=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B471C7618A
	for <soc@archiver.kernel.org>; Sun, 19 Mar 2023 12:40:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id C6DB0C4339E; Sun, 19 Mar 2023 12:40:54 +0000 (UTC)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 0DEF4C433EF
	for <soc@kernel.org>; Sun, 19 Mar 2023 12:40:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 0DEF4C433EF
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f48.google.com with SMTP id cy23so36866038edb.12
        for <soc@kernel.org>; Sun, 19 Mar 2023 05:40:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679229651;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oolnoui9bwD72saRuWz2eUL7PghL9zZD0Mg8CNmPTv8=;
        b=TU4fToK9xe5RwL9b/rKxUGlthV1NWIQ7hzk1PZnj0tao9+WMFpR0JmIU36YK0ECFK2
         GeR1qwIQI5eWG+OlHulbySE96Q9h3EcUUD5+TYc6NgCMu0G7ZkH3CAh6hwYXDERGtBAq
         Eb/275avjh10RRenfGcJZrR7mq0L2V1ix0oONTR+CliZ1/ZomY0lToOcTsPvzZYP6G9I
         sogM+TaTXZd1ODii5kGR6C/tk5RfHV5dBf8tpmcUNLm1WDTKUOGF5REN8Xk+HVHq1/fH
         dW3A41ot2SpKd0T/W50dYuL+Vhq4Vhl4g0kKImCvxixBgiWEglqWy6+CGHYECic3020U
         iQLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679229651;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oolnoui9bwD72saRuWz2eUL7PghL9zZD0Mg8CNmPTv8=;
        b=Otyo5RxFlJy+2xSLnOYxmmrdq1MPar0WTsdo1TO9V7n1izW4k+YuUn4F4twlQcNf8A
         Gunmji0DZ13p7QfIlCptm489dX+wAVfavdfAYBbrN+g8MqRRNy4eDe7amZRd7SXo60eF
         vzRoR5f26CWDLytP4w7O02gA8zI/PWh1LEKnV2GznoN/+caFiS74odU0JjPgfVnzqhZt
         bgg6AQfHsAjOqubc551Nqb/CE1vjXNPOgyKVOa/9yk0U3GCVPTB82sxfckD2baGnhg/J
         yslvdrqVHFCyd/IESGj7joxuzWID+dDDF7jd0Fhl5Pv1jg+ItCtwud/qkVQ19Og4Lwlf
         NL7Q==
X-Gm-Message-State: AO0yUKUg434HAP9t3hwQZCOfaHq/H3h85SG0OWHeaYiDRe4UVj8p/8Cf
	JyJM3qG4cKtjJ558RQWQ2Fu6Zg==
X-Google-Smtp-Source: AK7set8no1xdwXSt61q0acLXah4PhkPn/qpNih1kHxFoOM8Dm3h51+p3tGWlnneauNyuCVN/2xpqkQ==
X-Received: by 2002:aa7:cac8:0:b0:500:4c0e:cb8d with SMTP id l8-20020aa7cac8000000b005004c0ecb8dmr6412475edt.5.1679229651181;
        Sun, 19 Mar 2023 05:40:51 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:5b5f:f22b:a0b:559d? ([2a02:810d:15c0:828:5b5f:f22b:a0b:559d])
        by smtp.gmail.com with ESMTPSA id u4-20020a17090626c400b00924916f9c21sm3182394ejc.87.2023.03.19.05.40.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 19 Mar 2023 05:40:50 -0700 (PDT)
Message-ID: <708b63c9-d2b6-c65f-0112-8f50173c0bca@linaro.org>
Date: Sun, 19 Mar 2023 13:40:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH V2 4/8] dt-bindings: iio: st-sensors: Add IIS328DQ
 accelerometer
To: Jonathan Cameron <jic23@kernel.org>,
 Stefan Wahren <stefan.wahren@chargebyte.com>
List-Id: <soc.lore.kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Lars-Peter Clausen <lars@metafoo.de>, Arnd Bergmann <arnd@arndb.de>,
 Olof Johansson <olof@lixom.net>, Evgeniy Polyakov <zbr@ioremap.net>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, linux-imx@nxp.com,
 Li Yang <leoyang.li@nxp.com>, Denis Ciocca <denis.ciocca@st.com>,
 soc@kernel.org, linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, stefan.wahren@i2se.com
References: <20230317103323.7741-1-stefan.wahren@chargebyte.com>
 <20230317103323.7741-5-stefan.wahren@chargebyte.com>
 <20230318155534.16b47583@jic23-huawei>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230318155534.16b47583@jic23-huawei>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 18/03/2023 16:55, Jonathan Cameron wrote:
> On Fri, 17 Mar 2023 11:33:19 +0100
> Stefan Wahren <stefan.wahren@chargebyte.com> wrote:
> 
>> The ST IIS328DQ is an accelerometer sensor, which is compatible with
>> the already supported ST H3LIS331DL. So add the new compatible
>> with a fallback to the ST sensor binding.
>>
>> Link: https://lore.kernel.org/linux-iio/2bac9ecf-9d2e-967e-9020-1c950487d781@i2se.com/
>> Suggested-by: Jonathan Cameron <jic23@kernel.org>
>> Signed-off-by: Stefan Wahren <stefan.wahren@chargebyte.com>	
>> ---
>>  Documentation/devicetree/bindings/iio/st,st-sensors.yaml | 3 +++
>>  1 file changed, 3 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/iio/st,st-sensors.yaml b/Documentation/devicetree/bindings/iio/st,st-sensors.yaml
>> index c6201976378f..5eb71b24a7cb 100644
>> --- a/Documentation/devicetree/bindings/iio/st,st-sensors.yaml
>> +++ b/Documentation/devicetree/bindings/iio/st,st-sensors.yaml
>> @@ -48,6 +48,9 @@ properties:
>>            - st,lsm330d-accel
>>            - st,lsm330dl-accel
>>            - st,lsm330dlc-accel
>> +      - items:
>> +          - const: st,iis328dq
>> +          - const: st,h3lis331dl-accel
> 
> Hmm. So this separates the particular 'oneOf' group from the description
> associated with the ST accelerometers.
> 
> DT experts, is there a better way to do this?  Ideally we'd also associate
> other similar groups going forwards so it might become less and less obvious
> how the groupings work. (bit late for the many groups that exist
> already in that list above this point).

If by "grouping" you mean how the oneOf items are organized with
descriptions, I wouldn't put too much attention to it. You can add some
'#' comments to separate the groups, but for me this is still readable.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

