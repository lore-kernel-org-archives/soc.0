Return-Path: <SRS0=OfVw=BU=gmail.com=bagasdotme@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F222C7EE33
	for <soc@archiver.kernel.org>; Wed, 31 May 2023 12:22:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 0463BC433EF; Wed, 31 May 2023 12:22:40 +0000 (UTC)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 26F21C433B4;
	Wed, 31 May 2023 12:22:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 26F21C433B4
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-64d2f99c8c3so3887238b3a.0;
        Wed, 31 May 2023 05:22:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685535758; x=1688127758;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rN0bnH3gWYzBfmgMkHbIKEWC6DN7mRYY+LRbQfT+m8w=;
        b=HTmJDBodHXoupmovdSQqrWH23609whCbniyvjQt/8cgNZWj+AlndJgjNV6pZBTyCxS
         2HyCOEDkKDu5nXHoCF4XjKHHmk/JHP7mF2z/A3rJEHiAPchIBimoWPiGVb1yopKhJmsS
         GZV1NI8i317BxhnBWxKbjAJAHhRT0KseBRpMqDmQPfd4dKFWUqt8HCRI26SK8+KqvF/D
         sSExthJZjnn28lF73gjBhLDoV/FFpZy3dl8RJpP9l9PvqRqNGZ73lrGg1q5GO5+FOVNf
         sw0Pe5GEmU04pYQkSlG1h1L1euolw/rJV9oY842wSYllKxfZm1c/K2BXV1nKjEa/uGzj
         UHfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685535758; x=1688127758;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rN0bnH3gWYzBfmgMkHbIKEWC6DN7mRYY+LRbQfT+m8w=;
        b=XqP468R7bxPQGlqyWcgmEJYwWpZaZ+/mhKMox+VYZBc+xzQfke4I4kTyj9c7H7oEWC
         YruCLd9p5Ovt5OThWsma6Fhz8zacSfaV42nW2pP1kSAv2sVckkhu93p8+8zoLdrOy2yH
         6TboxmRTHxbFqxiKxj8V9ZY30HOAi1EMsa0woZW7AbbCFUlE8/LDsGKJs1ysgyvVlzgu
         59KmZOnvTxgXqJPwPzar6+Hgh1JKBqc0JpCqjjnq4FKExVxhDURWTLYxsY0HdHQAwev+
         0F0cvSCKc37CaRXDf/nCMs/d1r1x4CuzIW3A993+6CBDKWQospoQ/fBHia7FkyK/RNWF
         H8Mw==
X-Gm-Message-State: AC+VfDwnt+qkaP6TyQAG8jdDglUJaSY1vWU1Z4wVqhGUSRDgBz7fy1cq
	c0FlsiATw5UWh30uuCwgr8g=
X-Google-Smtp-Source: ACHHUZ7DfzLyM4oLMoKb5ptpGN1Rb4GOgWflTWWpLh7DmpnJMvRse3nfgP4G+6QmIdG3Jfb/v9UIAA==
X-Received: by 2002:a05:6a20:144d:b0:111:2f20:d48f with SMTP id a13-20020a056a20144d00b001112f20d48fmr5327442pzi.53.1685535758400;
        Wed, 31 May 2023 05:22:38 -0700 (PDT)
Received: from [192.168.43.80] (subs03-180-214-233-69.three.co.id. [180.214.233.69])
        by smtp.gmail.com with ESMTPSA id g2-20020a62e302000000b0064f39c6474fsm3261813pfh.56.2023.05.31.05.22.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 31 May 2023 05:22:37 -0700 (PDT)
Message-ID: <d07c5c29-e5ff-9469-80c7-c6ad54734e6c@gmail.com>
Date: Wed, 31 May 2023 19:22:30 +0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2] Documentation/process: add soc maintainer handbook
List-Id: <soc.lore.kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Conor Dooley <conor.dooley@microchip.com>, soc@kernel.org
Cc: conor@kernel.org, corbet@lwn.net, devicetree@vger.kernel.org,
 krzysztof.kozlowski+dt@linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, olof@lixom.net, palmer@dabbelt.com,
 robh+dt@kernel.org, arnd@arndb.de
References: <20230530-multiple-whooping-ee5706fceb67@wendy>
 <ZHbpb98Yn7SDZ4XZ@debian.me>
 <ed4c3564-4083-5568-f999-cfd7f02544a7@linaro.org>
Content-Language: en-US
From: Bagas Sanjaya <bagasdotme@gmail.com>
In-Reply-To: <ed4c3564-4083-5568-f999-cfd7f02544a7@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 5/31/23 13:51, Krzysztof Kozlowski wrote:
>> Sounds like passing `make dtbs` is a merging requirement.
> 
> And why shouldn't be?
> 

I don't have anything more to say here...

-- 
An old man doll... just what I always wanted! - Clara

