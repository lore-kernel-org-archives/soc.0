Return-Path: <SRS0=WaDK=AA=gmail.com=musashino.open@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E01DC77B61
	for <soc@archiver.kernel.org>; Sun,  9 Apr 2023 05:13:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 1CB8DC433D2; Sun,  9 Apr 2023 05:13:38 +0000 (UTC)
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 2CA5BC433EF;
	Sun,  9 Apr 2023 05:13:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 2CA5BC433EF
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f42.google.com with SMTP id w11so1962854pjh.5;
        Sat, 08 Apr 2023 22:13:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1681017216; x=1683609216;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LRhfT/jJt56gQonvPXvx6IVAYr5d71sWEwaXQOdTWt0=;
        b=isiRT4JSi/nUXDJfYQyWktqVz8AQfSNpmeKeScWMXr8OIsOGpAGG4P9p0E0N1Ann/3
         pxBUknP/n1E/Z95Cep6IFmKkVcNPpYCvvy0XjUbCdM1hA8MWtWraRiM6vIz151sPx3Rc
         5VKPbB4PCzUBYQ3LAxJIBZ+uDCCMVnHKAD7uxoI1rqaBS4PqHRzZYCmqEkRenyOE7IiX
         KWq8gee0JSMDCmTo7o/m0zP/NiERRLXXKl/FWALL5u10f2MJ9tIoAmbmIJ5fBsBKPHXI
         W/F6Jvq/HZUQROhEDha4rbHmDSW55UZtWFgxpY/o7TweouuJQ5mo9yAsEjAMoHBIFUY5
         zrYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681017216; x=1683609216;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LRhfT/jJt56gQonvPXvx6IVAYr5d71sWEwaXQOdTWt0=;
        b=TaZnnRXlgAdTzmnO0iezA7QxTrG+SCtuRn60iowVP8lTMcJAiDuSCj/6MxfMkPMlo0
         haoa39Q6icPT1T7OqPCqHX2HjwtKZfR+8d13Y0tiVt135NTNhkcRuJS5ySyn7wjLssxW
         HmAEgnVIrI4QAuDvbIIzmgPQv5SYV8OChAa9CXq7qzsVAWxeJmn1XYpHjpRTMSEK3Jfc
         YaKbjriZvRponIKk70X4dD3xtKrUe8SqX+Sm9KapZk61wpVvQhEO6TjrlTYB3eUDwxMH
         8yRT6QZB4D2V1dyd7EVrYCaTSDbkcKHyE/S7dB7wgqlkdbvLvnqNxM8p1qOJ68eeei2b
         gAqA==
X-Gm-Message-State: AAQBX9dfcpk2iQDSVhHdsBJHGrK/lWfmP9joagaz/L4SQcnZM1EOJav7
	k2uoVaU5AeDZ8J3RBhy2Igw=
X-Google-Smtp-Source: AKy350bjXZ6cnnsqNjdK1bVngXxF5K96JNo6lECfmQ6cO6XmA8K8KYeIGEzbDhRfSxCe/pVR7u2e5A==
X-Received: by 2002:a17:902:f0d2:b0:1a5:150f:8553 with SMTP id v18-20020a170902f0d200b001a5150f8553mr4097650pla.0.1681017216477;
        Sat, 08 Apr 2023 22:13:36 -0700 (PDT)
Received: from [192.168.1.39] (M014008005000.v4.enabler.ne.jp. [14.8.5.0])
        by smtp.gmail.com with ESMTPSA id jo18-20020a170903055200b0019a70a85e8fsm5294960plb.220.2023.04.08.22.13.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 08 Apr 2023 22:13:36 -0700 (PDT)
Message-ID: <64b5504d-c81d-f77e-da67-c6d9e76aedd6@gmail.com>
Date: Sun, 9 Apr 2023 14:13:11 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 2/2] ARM: dts: mvebu: add device tree for IIJ SA-W2
 appliance
To: Gregory CLEMENT <gregory.clement@bootlin.com>,
 Andrew Lunn <andrew@lunn.ch>
List-Id: <soc.lore.kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, sebastian.hesselbarth@gmail.com,
 arnd@arndb.de, olof@lixom.net, soc@kernel.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org
References: <20230223132502.2045-1-musashino.open@gmail.com>
 <20230223132502.2045-2-musashino.open@gmail.com> <Y/d7gjqQCKKXMHqj@lunn.ch>
 <7d4a218d-8b8a-5a1d-eff8-e154bfde69be@gmail.com> <87jzyn3dv9.fsf@BL-laptop>
Content-Language: en-US
From: INAGAKI Hiroshi <musashino.open@gmail.com>
In-Reply-To: <87jzyn3dv9.fsf@BL-laptop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hello Gregory CLEMENT,

On 2023/04/08 0:34, Gregory CLEMENT wrote:
> Hello INAGAKI Hiroshi,
>
> do you plan to send a v2 soon based on the reviews you got ?

Yes, I'm planning to send the next series.
But I don't know the details about "documenting the board compatibles" 
suggested by Krzysztof Kozlowski and I don't know what to do for it, 
so I'm pausing this contribution...

>
> Or if you already sent it, I missed it, in this case could you resend it
> with me in CC ?
>
> Thanks,
>
> Gregory
>

Regards,
Hiroshi
